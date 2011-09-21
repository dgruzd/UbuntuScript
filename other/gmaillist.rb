#!/usr/bin/env ruby
login = "sample".gsub(/[.]/, '' )
email = login + "@gmail.com"
arr = []


#for i in 0...login.length-1
#  lg = login.clone
#  lg.insert(i+1,".")
#  lg2 = lg.clone
#  puts lg
#    for x in 1...login.length-1
#      lg2.insert(x*2+1,".")
#      puts lg2
#    end
#end

for i in 0..10000
  lg = ""
  login.each_char do |l|
    lg << l
    if rand(5) == 1
    lg << "."
    end
  end
  arr << lg + "@gmail.com" unless lg[-1]=="."
end
arr.uniq!
arr.each do |a|
  puts "#{a},,,,,,,,,,,,,,,,,,,,,,,,,* My Contacts,* Home,#{a}"
end
