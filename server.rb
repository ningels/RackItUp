#------------------------------
# web interface is the local host, i.e:  http://localhost:8080
#
#-------------------------------

require 'rack'
require 'pry'
require_relative 'samuel'
require_relative 'fillerama'
require_relative 'hipster'

app = Proc.new do |env|
  # Finds the num of paragraphs requested, or sets it to 1
  num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "")
  num = 1 if num.to_i.zero?

  path = env["REQUEST_PATH"]
  text_array=[]
  status = '200'
  num = num.to_i
  

  if path.downcase.start_with?("/lipsums")
     text_array = [  "Please format request such as '/type/number' \n\n",
                     "where valid types are: samuel, fillerama, hipster.\n\n",
                     "Number represents the number of paragraphs you would like to see."]
  elsif path.downcase.start_with?("/samuel")
     text_array = Samuel.call(num)
  elsif path.downcase.start_with?("/fillerama")
     text_array = Fillerama.call(num)
  elsif path.downcase.start_with?("/hipster")
     text_array = Hipster.call(num)
  else
     text_array = ["We're sorry. We couldn't that."]
     status = '404'
  end

  [status, {'Content-Type' => 'text/html'}, text_array]

end


Rack::Handler::WEBrick.run app
