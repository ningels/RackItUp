#------------------------------
# web interface is the local host, i.e:  http://localhost:8080
#
#-------------------------------
require_relative 'samuel'

require 'rack'
require 'pry'
require_relative 'samuel'
require_relative 'fillerama'
require_relative 'hipster'

app = Proc.new do |env|
  # Finds the num of paragraphs requested, or sets it to 1
  num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "")
  num = 1 if num.to_i.zero?

  # Replace the code below with your code (and remove this comment)
  # ['200', {'Content-Type' => 'text/html'}, [env.inspect]]


        path = env["REQUEST_PATH"]
        text_array=[]

        num = num.to_i
        if path.start_with?("/lipsums")
          text_array = [  "Please format request such as '/type/number' \n\n",
                          "where valid types are: samuel, fillerama, hipster\n\n",
                          "and number represents the number of paragraphs you would like to see."]
          ['200', {'Content-Type' => 'text/html'}, text_array]

        elsif path.start_with?("/samuel")
          puts "baby steps Samuel"
          text_array = Samuel.call(num)
          ['200', {'Content-Type' => 'text/html'}, text_array]
        elsif path.start_with?("/fillerama")
          puts "baby steps fillerama"
          text_array = Fillerama.call(num)
          ['200', {'Content-Type' => 'text/html'}, text_array]
        elsif path.start_with?("/hipster")
          puts "baby steps hipster"
          text_array = Hipster.call(num)
          ['200', {'Content-Type' => 'text/html'}, text_array]
        else
          puts "don't cry yet"
          ['404', {'Content-Type' => 'text/html'}, ["Big Girls Don't Cry".inspect]]
        end

    end

Rack::Handler::WEBrick.run app





# #!/usr/bin/env ruby
# text= ARGV[0]
# times = ARGV[1]
#
#
# #-------------------------------------
# #-  Sample texts
# #-------------------------------------
# old_fashioned = "Old Fashioned: Lorem ipsum dolor sit amet, consectetur adipiscing elit."
# #-------------------------------------
# hipster = "Hipster: Mustache forage trust fund, austin cold-pressed man bun"
# #-------------------------------------
# samuel = "Samuel: The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. "
# #-------------------------------------
# fillerama = "fillerama:  Oh dear! She's stuck in an infinite loop, and he's an idiot!"
# #-------------------------------------
# notLoremlpsum = "notLoremlpsum: Welcome to the website of the Cafe on the Corner."
#
# def puts_paragraph (type, count)
#   count.times do
#     puts type
#   end
# end
# times = ARGV[1].to_i
# times = 1 if times == 0
# puts times
# puts text
#
#
# case text
# when "The Old Fashioned"
#   puts_paragraph(old_fashioned, times)
# when "Hipster"
#   puts_paragraph(hipster, times)
# when "Samuel L. lpsum"
#   puts_paragraph(samuel, times)
# when "Fillerama"
#   puts_paragraph(fillerama, times)
# when "notLoremlpsum"
#   puts_paragraph(notLoremlpsum, times)
# else
#   puts "Please choose one of the following options:"
#   puts "  1) The Old Fashioned"
#   puts "  2) Hipster"
#   puts "  3) Samuel L. lpsum"
#   puts "  4) Fillerama"
#   puts "  5) NotLoremlpsum"
# end
