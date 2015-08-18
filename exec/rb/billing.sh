#!/usr/bin/env ruby

require 'net/https'
require 'json'
require 'date'
require_relative './uri'


# 今日の日付
d = Time.now

# 昨日の 00:00:00 ~ 23:59:59 の間のデータを利用して
yesterday = Date.new(d.year, d.month, d.day) - 1

start_time = yesterday.to_s + "T00:00:00"
end_time = yesterday.to_s + "T23:59:59"

# Billingのデータを持ってくる
num = `aws cloudwatch --region us-east-1 get-metric-statistics \
 --namespace 'AWS/Billing' \
 --dimensions "Name=Currency,Value=USD" \
 --metric-name EstimatedCharges \
 --start-time #{start_time} \
 --end-time #{end_time} \
 --period 86400 --statistics 'Maximum' \
 | jq '.Datapoints[].Maximum'`


strings = "昨日までのAWSの利用料金(月毎)になります\n"
strings << "```\n"
strings << "EstimatedCharges : $ #{num}"
strings << "```\n"
strings << 'ご確認をよろしくお願いいたします'


http = Net::HTTP.new($uri.host, $uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new($uri.request_uri, {'Content-Type' => 'application/json'})
request.body = {
  "channel"    => "#server",
  "username"   => "AWS 料金",
  "text"       => strings,
  "icon_emoji" => ":moneybag:"
}.to_json

response = http.request(request)
puts response.body

