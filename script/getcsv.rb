require "rubygems"
require "google_drive"

csv_files = [
  ['db/setofsubyear.csv', '0AnANDRug_3F2dHZGeENIRzNYd25sUU1TODhjZGxwWmc', 0],
  ['db/b1ji2012.csv', '0AnANDRug_3F2dGdVeXNwOHBkY1NxTmdvRUdlV0U3MXc', 0],
  ['db/b1ji2011.csv', '0AnANDRug_3F2dGdVeXNwOHBkY1NxTmdvRUdlV0U3MXc', 1],
  ['db/b1ji2010.csv', '0AnANDRug_3F2dGdVeXNwOHBkY1NxTmdvRUdlV0U3MXc', 2],
  ['db/a1ji2012.csv', '0AnANDRug_3F2dDI3YVpPWmlIbmI2WmJPanN2X2tRR0E', 0],
  ['db/c1ji2012.csv', '0AnANDRug_3F2dFBrT0wxN29TU3g2VmdZcWo0c1VaMnc', 0],
  ['db/theme_keizai.csv', '0AnANDRug_3F2dFljTkt0anViRFQzOHJWNWhCb3BkaVE', 0],
  ['db/theme_zaimu.csv', '0AnANDRug_3F2dFljTkt0anViRFQzOHJWNWhCb3BkaVE', 1],
  ['db/theme_keiei.csv', '0AnANDRug_3F2dFljTkt0anViRFQzOHJWNWhCb3BkaVE', 3],
]


print("Google Password > ")
passwd = gets().chomp

session = GoogleDrive.login("adeonhy@gmail.com", passwd)

csv_files.each do |r|
  file, key, id = r
  puts "getting #{file} from #{key} of #{id}"
  ws = session.spreadsheet_by_key(key)
  ws.export_as_file(file, "csv", id)
end
