# coding: utf-8
namespace :res do
  desc "問題データリソース管理"

#   task :gzipsvg => :environment do
#     DIR = "app/assets/images/svg"
#     SRC = FileList["#{DIR}/*.svg"]
#     CC = 'gzip' # svg to svg.gz

#     SRC.each do |t|
#       dst = t.ext('svg.gz')

#       if File.exist? dst
#         puts "#{dst} is Already exists."
#       else
#         cmd =  "#{CC} -t #{t} -s 700 -o #{DIR}"
#         cmd =  "#{CC} #{t}"
#         puts "compressing #{t}"
#         sh cmd
#       end

#     end

#   end # task

  task :createpng => :environment do
    DIR = "app/assets/images/svg"
    SRC = FileList["#{DIR}/*.svg"]
    # CC = 'qlmanage' # svg to png converter
    CC = 'rsvg-convert'

    SRC.each do |t|
      dst = t.ext('png')

      if File.exist? dst
        puts "#{dst} is Already exists."
      else
        # cmd =  "#{CC} -t #{t} -s 700 -o #{DIR}"
        cmd =  "#{CC} #{t} --format=png -w 700 --output=#{dst}"
        # puts cmd
        sh cmd

        # puts "renaming to #{dst}"
        # mv "#{t}.png", dst 
      end

    end

  end # task
end
