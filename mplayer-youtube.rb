#!/usr/bin/env ruby
#quality
# 22 - 720p
# 18 - 480p

cookie_file='/var/tmp/youtube-dl-cookies.txt'

require 'URI'
code = Hash[URI.parse(ARGV[0]).query.split('&').map{ |q| q.split('=') }]['v']
url = "http://www.youtube.com/watch?v=#{code}"
puts url

exec "mplayer -fs  -cache 100000 -cache-min 5 -cookies -cookies-file #{cookie_file} $(youtube-dl --max-quality=22 -g --cookies #{cookie_file} #{url})"
