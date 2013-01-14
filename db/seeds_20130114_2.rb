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
CSV.foreach('db/theme_zaimu.csv',headers: true) do |row|
  Theme.create(themecode: row[0], maintheme:row[1], subtheme:row[2])
  #puts("themecode: #{row[0]}, maintheme:#{row[1]}, subtheme:#{row[2]}")
end
