#!/usr/bin/ruby
arr = [] 
f = File.open("/home/nyaa/Script/Ruby/production.log", "r")
flog = File.open("/home/nyaa/Script/Ruby/log.html", "w")

lines = f.readlines
buffer = ""
counter = 0
lines.each do|line|
  line.gsub!(/[<>]/,"*")
  if /\S/ !~ line
    counter +=1
  else
    buffer += line += "<br>"
  end
  if counter >= 3
    counter = 0
    arr << buffer
    buffer = ""
  end
end

flog.puts "<html>"
flog.puts "<body>"
flog.puts "<div>"

arr.each do |a|
  flog.puts a
  flog.puts "<hr>"
end
flog.puts "</div>"
flog.puts "</body>"
flog.puts "</html>"

flog.close
