#!/bin/sh
#http://faq.cs2.ru/readarticle.php?article_id=400i
#http://forum.csmania.ru/viewtopic.php?f=28&t=3794
mkdir -pv /tmp/hlds
cd /tmp/hlds
wget -N http://www.steampowered.com/download/hldsupdatetool.bin
chmod +x hldsupdatetool.bin
./hldsupdatetool.bin
rm hldsupdatetool.bin
chmod +x steam
echo "#!/bin/sh" >> update.sh
echo "./steam -command update -game 'Counter-Strike Source' -dir ." >> update.sh
chmod +x update.sh
#./steam -command list
echo "#!/bin/sh" >> launch.sh
echo "screen -A -m -d -S css-server ./css/srcds_run -game cstrike +maxplayers 16 +map de_dust +sv_lan 1 -insecure" >> launch.sh
echo "#version stats exit" >> launch.sh
chmod +x launch.sh

./steam
./steam -command update -game "Counter-Strike Source" -dir .
