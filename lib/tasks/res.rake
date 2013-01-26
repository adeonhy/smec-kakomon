# coding: utf-8
namespace :res do
  desc "問題データリソース管理"

  task :createpng => :environment do
    DIR = "app/assets/images/svg"
    SRC = FileList["#{DIR}/*.svg"]
    CC = 'qlmanage' # svg to png converter

    SRC.each do |t|
      dst = t.ext('png')

      if File.exist? dst
        puts "#{dst} is Already exists."
      else
        cmd =  "#{CC} -t #{t} -s 700 -o #{DIR}"
        # puts cmd
        sh cmd

        # puts "renaming to #{dst}"
        mv "#{t}.png", dst 
      end

    end

  end # task
end
