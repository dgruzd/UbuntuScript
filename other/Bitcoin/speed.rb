#!/usr/bin/env ruby
require 'net/http'
require 'json'
url = "http://pool.itzod.ru/apiex.php?act=getuserstats&username=nyaa"
resp = Net::HTTP.get_response(URI.parse(url))
data = resp.body
object = JSON.parse(data)
speed = object["user_speed"].to_i
puts "#{speed} Mhash"
url = "http://deepbit.net/api/4dd35d9681619786e7000007_7561586659"
resp = Net::HTTP.get_response(URI.parse(url))
data = resp.body
object = JSON.parse(data)
speed2 = object["hashrate"].to_i
puts "#{speed2} Mhash"
puts "Result: #{speed + speed2} Mhash"
