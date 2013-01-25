# coding: utf-8
require 'csv'

namespace :dbmainte do
  desc "静的初期データを最新に更新"

  task :drop => :environment do
    Theme.delete_all
    Setofsubyear.delete_all
    Question.delete_all
  end

  task :init => :environment do

    def csv2theme(csv)
      CSV.foreach(csv,headers: true) do |row|
        Theme.create(themecode: row[0], maintheme:row[1], subtheme:row[2])
      end
    end

    def csv2question(csv)
      CSV.foreach(csv,headers: true) do |row|
        Question.create(
          subject: row[0], year: row[1], number: row[2],
          subquestion:row[3], themecode:row[4], selectioncount:row[5],
          answer:row[6], svg:row[7], pdf:row[8], png:row[9]
        ) 
      end
    end

    def csv2setofsubyear(csv)
      CSV.foreach(csv,headers: true) do |row|
        Setofsubyear.create(subject: row[0], year:row[1], available:row[2])
      end
    end

    csv2setofsubyear('db/setofsubyear.csv')
    csv2question('db/b1ji2012.csv')
    csv2question('db/b1ji2011.csv')
    csv2question('db/b1ji2010.csv')
    csv2question('db/a1ji2012.csv')
    csv2question('db/c1ji2012.csv')
    csv2theme('db/theme_keizai.csv')
    csv2theme('db/theme_zaimu.csv')
    csv2theme('db/theme_keiei.csv')
    csv2theme('db/theme_unei.csv')

  end
end
