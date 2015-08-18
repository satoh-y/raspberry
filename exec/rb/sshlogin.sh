#!/usr/bin/env ruby

require 'net/https'
require 'json'
require_relative './uri'


http = Net::HTTP.new($uri.host, $uri.port)
http.use_ssl = true

msg = (ARGV[0] + " から " + ARGV[1] + " が " + ARGV[2] + " にログインしました。")

request = Net::HTTP::Post.new($uri.request_uri, {'Content-Type' => 'application/json'})
request.body = {
  "channel"    => "#server",
  "username"   => "AWS ログイン",
  "text"       => msg,
  "icon_emoji" => ":eyes:"
 }.to_json

response = http.request(request)
uts response.body
