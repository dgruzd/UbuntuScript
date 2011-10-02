#!/usr/bin/env ruby
#https://github.com/ai/environment/blob/master/scripts/background_to_login
# Выставляет у экрана входа такой же фон, как в текущией системе

current = `gsettings get org.gnome.desktop.background picture-uri`.strip
current.sub! 'file://', ''

system = "/usr/share/backgrounds/#{ENV['USER']}-background"
`sudo cp #{current} #{system}`

config = '/etc/lightdm/unity-greeter.conf'

puts "sudo sed -i -e \"s/^background=.*$/background=#{system.gsub('/', '\/')}/" #{config}"
`sudo sed -i -e "s/^background=.*$/background=#{system.gsub('/', '\/')}/" #{config}`
