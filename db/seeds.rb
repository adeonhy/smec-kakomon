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
                 pdf:#{row[6]},
                  png:#{row[7]}") if false
end

setofsubyears = Setofsubyear.create([
           {subject:'経済学・経済政策', year:'H24', available:false},
           {subject:'経済学・経済政策', year:'H23', available:false},
           {subject:'経済学・経済政策', year:'H22', available:false},
           {subject:'経済学・経済政策', year:'H21', available:false},
           {subject:'経済学・経済政策', year:'H20', available:false},
           {subject:'財務・会計', year:'H24', available:true},
           {subject:'財務・会計', year:'H23', available:false},
           {subject:'財務・会計', year:'H22', available:false},
           {subject:'財務・会計', year:'H21', available:false},
           {subject:'財務・会計', year:'H20', available:false},
           {subject:'企業経営理論', year:'H24', available:false},
           {subject:'企業経営理論', year:'H23', available:false},
           {subject:'企業経営理論', year:'H22', available:false},
           {subject:'企業経営理論', year:'H21', available:false},
           {subject:'企業経営理論', year:'H20', available:false},
           {subject:'運営管理', year:'H24', available:false},
           {subject:'運営管理', year:'H23', available:false},
           {subject:'運営管理', year:'H22', available:false},
           {subject:'運営管理', year:'H21', available:false},
           {subject:'運営管理', year:'H20', available:false},
           {subject:'経営法務', year:'H24', available:false},
           {subject:'経営法務', year:'H23', available:false},
           {subject:'経営法務', year:'H22', available:false},
           {subject:'経営法務', year:'H21', available:false},
           {subject:'経営法務', year:'H20', available:false},
           {subject:'経営情報システム', year:'H24', available:false},
           {subject:'経営情報システム', year:'H23', available:false},
           {subject:'経営情報システム', year:'H22', available:false},
           {subject:'経営情報システム', year:'H21', available:false},
           {subject:'経営情報システム', year:'H20', available:false},
           {subject:'中小企業経営・政策', year:'H24', available:false},
           {subject:'中小企業経営・政策', year:'H23', available:false},
           {subject:'中小企業経営・政策', year:'H22', available:false},
           {subject:'中小企業経営・政策', year:'H21', available:false},
           {subject:'中小企業経営・政策', year:'H20', available:false},
])

CSV.foreach('db/theme_zaimu.csv',headers: true) do |row|
  Theme.create(themecode: row[0], maintheme:row[1], subtheme:row[2])
  #puts("themecode: #{row[0]}, maintheme:#{row[1]}, subtheme:#{row[2]}")
end
