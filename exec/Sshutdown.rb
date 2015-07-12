#!/usr/bin/ruby

require "net/http"
require "uri"

def gpio(request)
 request.basic_auth 'webiopi', 'raspberry'
 res = Net::HTTP.start("localhost", 8000) {|http|
  http.request(request)
 }
end

def status 
 request = Net::HTTP::Get.new("/GPIO/6/value")
 gpio(request)
end

##puts status.body

while true
 cnt = 0 
 while cnt < 5 
  if status.body == "1"
   cnt += 1
   sleep(0.5)
  else 
   cnt += 0
   sleep(0.5)
  end
end
###puts "End"
exec("sudo /Script/exec/shutdown.sh")
end
