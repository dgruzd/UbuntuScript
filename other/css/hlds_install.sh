#!/bin/sh
#http://faq.cs2.ru/readarticle.php?article_id=400
#http://forum.csmania.ru/viewtopic.php?f=28&t=3794
mkdir -pv /tmp/hlds
cd /tmp/hlds
#wget -N http://www.steampowered.com/download/hldsupdatetool.bin
#chmod +x hldsupdatetool.bin
#./hldsupdatetool.bin
#rm hldsupdatetool.bin

wget -N http://dl.dropbox.com/u/9175582/steam
chmod +x steam
echo "#!/bin/sh" >> update-css.sh
echo "./steam -command update -game 'Counter-Strike Source' -dir ." >> update-css.sh
chmod +x update-css.sh

echo "#!/bin/sh" >> update-tf.sh
echo "./steam -command update -game tf -dir ." >> update-tf.sh
chmod +x update-tf.sh

#./steam -command list
echo "#!/bin/sh" >> css-launch.sh
echo "screen -A -m -d -S css-server ./css/srcds_run -game cstrike +maxplayers 16 +map de_dust +sv_lan 1 -insecure" >> css-launch.sh
echo "#version stats exit" >> css-launch.sh
chmod +x css-launch.sh

echo "#!/bin/sh" >> tf-launch.sh
echo "./orangebox/srcds_run -game tf +map cp_badlands" >> tf-launch.sh

./steam
