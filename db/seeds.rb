# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'csv'

def csv2theme(csv)
  CSV.foreach(csv,headers: true) do |row|
    Theme.create(themecode: row[0], maintheme:row[1], subtheme:row[2])
    #puts("themecode: #{row[0]}, maintheme:#{row[1]}, subtheme:#{row[2]}")
  end
end

def csv2question(csv)
  CSV.foreach(csv,headers: true) do |row|
    Question.create(
      subject: row[0],
      year: row[1],
      number: row[2],
      subquestion:row[3],
      themecode:row[4],
      selectioncount:row[5],
      answer:row[6],
      svg:row[7],
      pdf:row[8],
      png:row[9]
    ) if true
    puts("
    number: #{row[0]},
                  subquestion:#{row[1]},
                  themecode:#{row[2]},
                  selectioncount:#{row[3]},
                  answer:#{row[4]},
                  svg:#{row[5]},
                 pdf:#{row[6]},
                  png:#{row[7]}") if false
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
csv2theme('db/theme_keizai.csv')
csv2theme('db/theme_zaimu.csv')
csv2theme('db/theme_keiei.csv')

