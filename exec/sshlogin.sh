#!/usr/bin/env ruby

require 'net/https'
require 'json'



uri = URI.parse("https://hooks.slack.com/services/XXXXXXXXXXXXXXXX")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

msg = (ARGV[0] + " が " + ARGV[1] + " から " + ARGV[2] + " にログインしました。")

request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type' => 'application/json'})
request.body = {
  "channel"    => "#server",
  "username"   => "EC2 XXXXXXログイン",
  "text"       => msg,
  "icon_emoji" => ":ghost:"
}.to_json

response = http.request(request)
puts response.body

