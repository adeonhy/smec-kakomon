class User < ActiveRecord::Base
  attr_accessible :config, :name, :provider, :set, :uid
  has_many :answer_logs, order: 'created_at desc'
  has_many :comments

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = (auth['user_info']||auth['info'])['name']
      user.config = {mail: (auth['user_info']||auth['info'])['email'] }.to_json

    end
  end

  def study_log(from_date = nil, to_date = nil)
    timeformat = "%Y-%m-%d"
    subtable = %w(a b c d e f g)
    log = []
    t = Date.today
    from_date ||= t - 1.month
    to_date   ||= t
    (from_date..to_date).each do |day| # each day
      daystr = day.strftime("%Y-%m-%d")
      daycount = self.answer_logs.group_by{|l|l.created_at.strftime timeformat}[daystr]
      subcount = [0,0,0,0,0,0,0]
      if daycount
        subgroup = daycount.group_by{|l| Question.find(l.question_id).subject}
        (0..6).each do |subject|
          subcount[subject] = subgroup[subtable[subject]].count if subgroup[subtable[subject]]
        end
      end
      log << [daystr] + subcount
    end
    log
  end

  def self.all_study_log(from_date = nil, to_date = nil)
    timeformat = "%Y-%m-%d"
    subtable = %w(a b c d e f g)
    log = []
    t = Date.today
    from_date ||= t - 1.month
    to_date   ||= t
    (from_date..to_date).each do |day| # each day
      daystr = day.strftime("%Y-%m-%d")
      daycount = AnswerLog.all.group_by{|l|l.created_at.strftime timeformat}[daystr]
      subcount = [0,0,0,0,0,0,0]
      if daycount
        subgroup = daycount.group_by{|l| Question.find(l.question_id).subject}
        (0..6).each do |subject|
          subcount[subject] = subgroup[subtable[subject]].count if subgroup[subtable[subject]]
        end
      end
      log << [daystr] + subcount
    end
    log
  end

  def review_list # 復習リスト
    timing = {
      1 => 1.days.ago,
      2 => 1.weeks.ago,
      3 => 2.weeks.ago,
      4 => 1.month.ago,
    }
    
    list = self.answer_logs.inject([]) do |acc,l|
      t = timing[l.times]
      if l.correct
        acc
      elsif t && l.created_at < t
        acc + [l]
      else
        acc
      end
    end

    list.reverse
  end

end
