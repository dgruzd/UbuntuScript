#!/usr/bin/env ruby
require 'net/http'
require 'json'
url = "http://pool.itzod.ru/apiex.php?act=getuserstats&username=nyaa"
resp = Net::HTTP.get_response(URI.parse(url))
data = resp.body
object = JSON.parse(data)
speed = object["user_speed"]
print speed
puts " Mhash"
