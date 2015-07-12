#!/usr/bin/ruby

require "json"
require "net/http"
require "uri"

## WebIOPi https://code.google.com/p/webiopi/

def on
 request = Net::HTTP::Post.new("/GPIO/5/value/1")
 puts "LED ON"
 gpio(request)
end


def off
 request = Net::HTTP::Post.new("/GPIO/5/value/0")
 puts "LED OFF"
 gpio(request)
end

def blink
 5400.times do
### 30.times do
  on
  sleep 0.8
  off
  sleep 0.8
 end
end

def gpio(request)
 request.basic_auth 'webiopi', 'raspberry'
 res = Net::HTTP.start("localhost", 8000) {|http|
  http.request(request)
 }
end


uri=URI.parse("http://weather.livedoor.com/forecast/webservice/json/v1?city=270000")
json = Net::HTTP.get(uri)
result = JSON.parse(json)

telop = result["forecasts"][0]["telop"]

off

###print(telop)
###print("--->")

##case
##when telop.include?("雪") then
##  print("3")
##when telop.include?("雨") then
##  print("2")
##when telop.include?("曇") then
##  print("1")
##  blink
##when "晴" then
##  print("0")
##else
##  puts "bad argument"
##end

if telop.include?("雪") ||  telop.include?("雨") then
####if telop.include?("曇") ||  telop.include?("雨") then
 blink
end

