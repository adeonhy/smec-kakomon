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
CSV.foreach('db/b1ji2012.csv',headers: true) do |row|
  Question.create(number: row[0],
                  subquestion:row[1],
                  themecode:row[2],
                  selectioncount:row[3],
                  answer:row[4],
                  svg:row[5],
                  pdf:row[6],
                  png:row[7]
                 ) if true
  puts("number: #{row[0]},
                  subquestion:#{row[1]},
                  themecode:#{row[2]},
                  selectioncount:#{row[3]},
                  answer:#{row[4]},
                  svg:#{row[5]},
:                 pdf:#{row[6]},
                  png:#{row[7]}"
                 ) if false
end
