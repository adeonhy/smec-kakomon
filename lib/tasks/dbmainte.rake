# coding: utf-8
require 'csv'

namespace :dbmainte do
  desc "静的初期データを最新に更新"

  task :drop => :environment do
    puts 'delete Theme'
    Theme.delete_all
    puts 'delete Setofsubyear'
    Setofsubyear.delete_all
    puts 'delete Question'
    Question.delete_all
  end

  task :init => :environment do

    def csv2theme(csv)
      if File.exist? csv
        puts "#{csv} is found."
        CSV.foreach(csv,headers: true) do |row|
          Theme.where(
            themecode: row[0],
            maintheme:row[1],
            subtheme:row[2]
          ).first_or_create

        end
      else
        puts "#{csv} is not found skip."
      end
    end

    def csv2question(csv)
      if File.exist? csv
        puts "#{csv} is found."
        CSV.foreach(csv,headers: true) do |row|
          Question.where(
            subject: row[0], year: row[1], number: row[2],
            subquestion:row[3], themecode:row[4], selectioncount:row[5],
            answer:row[6], svg:row[7], pdf:row[8], png:row[9]
          ).first_or_create 
        end
      else
        puts "#{csv} is not found skip."
      end
    end

    def csv2setofsubyear(csv)
      CSV.foreach(csv,headers: true) do |row|
        available = (row[2] =~ /true/i ? true : false)
        Setofsubyear.where(
          subject: row[0], year:row[1].to_i, available: available
        ).first_or_create
      end
    end

    csv2setofsubyear('db/setofsubyear.csv')
    csv2question('db/a1ji2012.csv')
    csv2question('db/a1ji2011.csv')
    csv2question('db/a1ji2010.csv')
    csv2question('db/a1ji2009.csv')
    csv2question('db/a1ji2008.csv')
    csv2question('db/b1ji2012.csv')
    csv2question('db/b1ji2011.csv')
    csv2question('db/b1ji2010.csv')
    csv2question('db/b1ji2009.csv')
    csv2question('db/b1ji2008.csv')
    csv2question('db/c1ji2012.csv')
    csv2question('db/c1ji2011.csv')
    csv2question('db/c1ji2010.csv')
    csv2question('db/c1ji2009.csv')
    csv2question('db/c1ji2008.csv')
    csv2question('db/e1ji2012.csv')
    csv2question('db/e1ji2011.csv')
    csv2question('db/e1ji2010.csv')
    csv2question('db/e1ji2009.csv')
    csv2question('db/e1ji2008.csv')
    csv2question('db/f1ji2012.csv')
    csv2question('db/f1ji2011.csv')
    csv2question('db/f1ji2010.csv')
    csv2question('db/f1ji2009.csv')
    csv2question('db/f1ji2008.csv')
    csv2question('db/g1ji2012.csv')
    csv2question('db/g1ji2011.csv')
    csv2question('db/g1ji2010.csv')
    csv2question('db/g1ji2009.csv')
    csv2question('db/g1ji2008.csv')
    csv2theme('db/theme_keizai.csv')
    csv2theme('db/theme_zaimu.csv')
    csv2theme('db/theme_keiei.csv')
    csv2theme('db/theme_unei.csv')
    csv2theme('db/theme_homu.csv')
    csv2theme('db/theme_joho.csv')
    csv2theme('db/theme_chusho.csv')

  end
end
