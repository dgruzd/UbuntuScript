#!/bin/bash
#
# 
# Provided under the GNU General Public License version 2 or later or the GNU Free Documentation License version 1.2 or later, at your option.
# See http://www.gnu.org/copyleft/gpl.html for the Warranty Disclaimer.

# This script upgrades ALSA on Ubuntu and Linux Mint systems from 2.6.24-28 (non)-ubuntu kernels onwards and is not following 
# official Ubuntu/Debian package handling rules

# This script is not compliant to Ubuntu official .deb package handling. This script overwrites the existing files and modules.
# You won't see any changes on the revisions if you run e.g. synaptics..
# If there are official ALSA updates supplied by Ubuntu repositories or kernel changes, these will overwrite your manual ALSA upgrade - 
# you need to re-run this script in this case.
# You can check the Alsa revision by typing "cat /proc/asound/version" or "alsactl --version" or the utils by "aplay --version" 
#
# Note: As usual  I'd like to recommend that you make a backup of your drive first. I don't guarantee for anything!
#
# The script compiles all drivers by default.
#
# The official thread connected to this script you'll find at: http://ubuntuforums.org/showthread.php?t=962695   
# 
# You might want to go through the script and try to understand what it is doing. It's not rocket science. It's not a must though. 
#
#  Changelog:
#
#  Rev: 1.00  01-01-2008 Temujin   initial idea
#  Rev: 1.01  09-05-2008 soundcheck Changelog: Complete rewrite, bugfixes/cleanup
#  Rev: 1.02  09-22-2008 soundcheck Changelog: A bit of cleanup/Intro of revison handling/Install drivers before libs/2.6.27 support/multiple alsa-rev support
#  Rev: 1.03  10-04-2008 soundcheck Changelog: PackageUpdate AlsaLib 1.0.17a
#  Rev: 1.04  10-05-2008 soundcheck Changelog: Output to logfile/different installation modes selectable/different alsa revisions stored on drive
#  Rev: 1.05  10-16-2008 soundcheck Changelog: Bugfix typo "sequencer"
#  Rev: 1.06  10-16-2008 soundcheck Changelog: introducing snddevices script, separate configure&make from make
#                                        install, to avoid corrupt installations if one module compilation/installation fails    
#  Rev: 1.07  10-17-2008 soundcheck Changelog: Using specific kernel headers for driver compilation, taking out soundevices
#  Rev: 1.08  10-17-2008 soundcheck Changelog: script cleanup and introduction of "compile only" (dry run) option, take out kernel-headers option in driver config
#  Rev: 1.09  10-25-2008 soundcheck Changelog: Added libasound2-dev to the package list. It seems that alsalib won't compile properly without it.
#  Rev: 1.11  10-29-2008 soundcheck Changelog: run "make install" on lib befoe compiling alsa-utils 
#  Rev: 1.12  11-12-2008 soundcheck Changelog: alsa-driver 1.018a changelog http://www.alsa-project.org/main/index.php/Changes_v1.0.18_v1.0.18a
#  Rev: 1.13-beta  11-30-2008 soundcheck Changelog: chmod of /devices; 2.6.28 kernel support, restore option, prepared for alsa-tools install
#  Rev: 1.14  12-15-2008 soundcheck Changelog: introduction of latest alsa-driver snapshot-install (option -snap), introduction of help menu, clean up
#  Rev: 1.15  12-16-2008 soundcheck Changelog: added asound.state workaround to get mixer-settings restored 
#  Rev: 1.16  01-21-2009 soundcheck Changelog: added kernel-headers compile option to alsa-driver/ support of 1.0.19
#  Rev: 1.17  05-10-2009 soundcheck Changelog: Added 1.0.20 support, added 2.6.29 support
#  Rev: 1.0.21-1 09-13-2009 soundcheck Changelog: Added 1.0.21 support, Kernel support up to 2.6.31, cosmetics
#  Rev: 1.0.21-2 09-15-2009 soundcheck Changelog: minor corrections, scripts exits now if not all Packages can be loaded 
#  Rev: 1.0.21-3 09-15-2009 soundcheck Changelog: dependency libncursesw5-dev added 
#  Rev: 1.0.21-4 09-16-2009 soundcheck Changelog: dependency libavutil49 added 
#  Rev: 1.0.22.1-1 01-05-2010 soundcheck Changelog: 1.0.22.1 support, 2.6.32 support, change in workflows and cleanup, tools compile added, firmware copied to /lib/firmware, intro of libfltk-dev as dependency for hdsploader, improved dialogs, more easy selectable drivers, added linux-sound base to the alsa packages 
#  Rev: 1.0.22.1-1 01-06-2010 soundcheck Changelog: removed libavutil49 and python-dev-all from dependency list
#  Rev: 1.0.23-1 05-10-2010 soundcheck Changelog: added 1.0.23 support , automatic update /upgrade removed, a little maintenance
#  Rev: 1.0.23-2 05-11-2010 soundcheck Changelog: added cleanup function which removes the source code and other utilites required for compiling Alsa, xmlto installs now without recommends
#  Rev: 1.0.24-1 02-04-2011: ALSA 1.0.24, put source in /opt to better comply with Debian policy.
#  Rev: 1.0.24-2 02-07-2011: use --with-oss=no on Maverick or later
##--------------------------------------------------------------------------------------------------------------------------------------
# Below package variables need to be adapted according to available package ids at  http://www.alsa-project.org/main/index.php/Download 
# otherwise the script execution will fail!
##--------------------------------------------------------------------------------------------------------------------------------------

PACKAGE=1.0.24

setpack () {
DRIVER=alsa-driver-1.0.24
FIRMWARE=alsa-firmware-1.0.24.1
LIB=alsa-lib-1.0.24.1
PLUGINS=alsa-plugins-1.0.24
UTILS=alsa-utils-1.0.24.2
TOOLS=alsa-tools-1.0.24.1
OSS=alsa-oss-1.0.17
}

#### edit tools array if required
#TOOLSLIST =( ac3dec as10k1 envy24control hdsploader hdspconf hdspmixer \
#	      mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
#	     us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 )
#
#Example RME cards: TOOLSLIST=( hdsploader hdspconf hdspmixer )

TOOLSLIST=( )


###Drivers: to improve the compilation time you might want to compile the driver required for your system
###         Change below variable accordingly: Default: CARDS="all"
###         Stripped down example: CARDS="usb-audio,hda-intel,hdsp,hrtimer,rtctimer"

CARDS="all"
#CARDS="usb-audio,hda-intel,hdsp,hrtimer,rtctimer"

#####################################################################################################################################################
#------------Usually NO Changes to be done below this line-----------------------------------------------------------------------------------------
#####################################################################################################################################################

# script revision
REV="$PACKAGE-2"

SRCDIR=/opt         # Sources will be stored here
ALSASRCDIR=${SRCDIR}/alsa  # Packages will be stored here
NOW=`date '+%m%d%y-%H.%M'`
DATE=`date`
LOGFILE=/var/log/AlsaUpgradeRev-$REV-$NOW.log
KERNEL=`uname -r` 
CURRENTPACKAGE=`cat /proc/asound/version | grep "Sound" | awk '{ print $7 }'`
KERNELPACKS=( `dpkg -l |  awk '{print $2}' | grep -e ${KERNEL}` )

ALSAPACKS=( linux-sound-base alsa-base alsa-utils libasound2 alsa-firmware  alsa-firmware-loaders alsa-oss alsa-tools alsa-tools-gui libasound2-plugins aconnectgui libpulse0  )
TOOLPACKS=(  build-essential module-assistant  gettext  xmlto  bzip2 )
DEVPACKS=( alsa-source python-dev libasound2-dev libsysfs-dev libncurses5-dev libncursesw5-dev libpulse-dev libspeex-dev libavcodec-dev libavformat-dev libavutil-dev libmpeg4ip-dev liba52-0.7.4-dev libsamplerate0-dev libfltk1.1-dev linux-headers-$KERNEL )
CLEANUPPACKS=( python-dev libasound2-dev libsysfs-dev libncurses5-dev libncursesw5-dev libpulse-dev libspeex-dev libavcodec-dev libavformat-dev libavutil-dev libmpeg4ip-dev liba52-0.7.4-dev libsamplerate0-dev libfltk1.1-dev )


#---------------------------------------------------------------------------------------------------------------------------------

#---You need to have root permissions to run the script----

if [ "$UID" -ne 0  ]
 then
 echo "Must be root to run this script..."
 exit 0
fi  

package () {
echo -n "Continue to $1 $PACKAGE [y/n]: " 
   read yesno
   case $yesno in
       		y* | Y*  	) setpack ;;
       		n* | N*         ) header "Nothing changed! " ; exit 0  ;;
       		*	        ) header "Nothing changed! " ; exit 0  ;;
esac

ALSASRCDIR=${SRCDIR}/Alsa-${PACKAGE}
clear
}



header () {
echo "
***************************************************************************
*  ${1}
***************************************************************************"
}

die () {
  header "$1"
  exit 1 #error
}

greet () {
clear
echo "
**$NOW****Alsa-Upgrade-Script-$REV *********************
*
* You'll be upgraded from Alsa $CURRENTPACKAGE to $PACKAGE
*
* Run -h option for further help and to look up the workflows
*
* Note1: Alsa won't be upgraded before you run the
*        installation option "-i"!! 
*        The upgrade procedure shouldn't have any effect on Alsa 
*        until then. However - see Note2
*
* Note2: Do not delete the Alsa Source Directory under /usr/src!
*        When starting the script the 2nd time with -d,
*        the Alsa source dir will be deleted automatically!
*        You won't have sound until you're done with that installation
* 
* DISCLAIMER: Use this script at your own risk. I do not take any 
*             responsibility for any problems caused by running 
*             this script. Before running this script I strongly 
*             advise you to make a backup of your system.
*             You might enter problems restoring the system to its
*             original status when running the restore function 
*             supplied by the script.  
*                            
*  
***************************************************************************

"
}


prep () {

header "Working on following Alsa packages..."
echo "Driver: $DRIVER"
echo "Library: $LIB"
echo "Plugins: $PLUGINS"
echo "Utils: $UTILS"
echo "Firmware: $FIRMWARE"
echo "OSS: $OSS"
echo "Installing tools: $TOOLS"

#installation of sources and dependencies required for compilation


header "Checking availability of Alsa packages. Missing packages will be installed..."

for k in "${ALSAPACKS[@]}" ; do 
    if [ "$( dpkg -l  | grep "ii" | grep "$k" )" = "" ] ; then
         header "$k will be installed" 
         apt-get -y install $k
    else echo "$k already installed..."
    fi
done

header "Checking availability of supporting packages. Missing packages will be installed..."

for z in "${TOOLPACKS[@]}" ; do 
  if [ "$( dpkg -l  | grep "ii" | grep "$z" )" = "" ] ; then
    header "$z will be installed" 
    if [ "$z" = "xmlto" ] ; then 
         apt-get -y install --no-install-recommends $z
    else
         apt-get -y install $z
    fi
  else echo "$z already installed..."
  fi
done

header "Checking availability of packages. Missing packages will be installed..."

for y in "${DEVPACKS[@]}" ; do 
  if [ "$( dpkg -l  | grep "ii" | grep "$y" )" = "" ] ; then
    header "Package $y will be installed" 
    apt-get -y install $y
    else echo "$y already installed..."
  fi
done

}

cleanup () {

# This function will clean up the built environment

header "Removing  supporting and source-code packages ..."

for p in "${CLEANUPPACKS[@]}" ; do 
  if [ "$( dpkg -l  | grep "ii" | grep "$p" )" != "" ] ; then
    header "Package $p will be removed..." 
    apt-get -y remove $p
    header  "Removal of $p done..."
  else echo "Removal of $p failed, seems not to be installed anymore..."
  fi
done



echo "Done..."

# TODO check impact of below action
#header "Removing unused libraries - apt-get autoremove" 
#apt-get -y autoremove

}

restorealsa () {

if [ "$( dpkg -l  | grep "ii" | grep  'alsa-source' )" = "" ] ; then
    header "Package alsa-source will be installed first..." 
    apt-get -y install alsa-source
fi

for z in "${KERNELPACKS[@]}" ; do
header "Package $z will be reinstalled" 
apt-get -y --reinstall install $z
done

for k in "${ALSAPACKS[@]}" ; do 
header "Package $k will be reinstalled" 
apt-get -y --reinstall install $k
done

####after restore of packages problems with some modules ( no soundcard ) therefore compilation of modules did the trick in my case

header "Compiling Alsa kernel modules to restore old setup"
module-assistant -f -t -q a-i alsa-source 

#header "Reseting old setup"
#/etc/init.d/alsa-utils reset

depmod -a

}




download () {

cd $SRCDIR

header "Downloading and extracting ALSA packages..."
wget ftp://ftp.alsa-project.org/pub/driver/$DRIVER.tar.bz2 && tar -xjf $DRIVER.tar.bz2 
wget ftp://ftp.alsa-project.org/pub/firmware/$FIRMWARE.tar.bz2 && tar -xjf $FIRMWARE.tar.bz2 
wget ftp://ftp.alsa-project.org/pub/lib/$LIB.tar.bz2 && tar -xjf $LIB.tar.bz2 
wget ftp://ftp.alsa-project.org/pub/plugins/$PLUGINS.tar.bz2 && tar -xvf $PLUGINS.tar.bz2 
wget ftp://ftp.alsa-project.org/pub/utils/$UTILS.tar.bz2 && tar -xjf $UTILS.tar.bz2 
wget ftp://ftp.alsa-project.org/pub/tools/$TOOLS.tar.bz2 && tar -xjf $TOOLS.tar.bz2 
wget ftp://ftp.alsa-project.org/pub/oss-lib/$OSS.tar.bz2 && tar -xvf $OSS.tar.bz2 

rm alsa*.tar.bz2
rm -rf $ALSASRCDIR         # old sources will be deleted in any case if download gets started, Alsa won't work with deleted source-dir
mkdir -p $ALSASRCDIR && mv alsa-* $ALSASRCDIR

}


compile () {

header "Prepare for compilation and installation..."

test -d $ALSASRCDIR || die "$ALSASRCDIR not found - nothing to compile! Run download -d option first"

cd $ALSASRCDIR

test -d $DRIVER || die "$DRIVER  not found"
test -d $FIRMWARE || die "$FIRMWARE not found"
test -d $LIB || die "$LIB not found"
test -d $PLUGINS || die "$PLUGINS not found"
test -d $UTILS || die "$UTILS not found" 
test -d $TOOLS || die "$TOOLS not found"
test -d $OSS || die "$OSS not found"


#alsa-driver Note: Drivers to be installed before library#####################################################################################
header "Compiling drivers..."
cd $ALSASRCDIR/$DRIVER
make clean
./configure --with-kernel=/usr/src/linux-headers-$KERNEL --with-cards=$CARDS --with-card-options=all --with-sequencer=yes --with-oss=no --prefix=/usr || die "$DRIVER configure failed"
make || die "$DRIVER make failed"

#alsa-lib#####################################################################################################################################
header "Compiling library..."
cd $ALSASRCDIR/$LIB
make clean
./configure --prefix=/usr || die "$LIB configure failed"
make || die "$LIB make failed"

#alsa-plugins#################################################################################################################################
header "Compiling plugins..."
cd $ALSASRCDIR/$PLUGINS
make clean
./configure  --prefix=/usr || die "$PLUGINS configure failed"
make || die "$PLUGINS make failed"

#alsa-firmware###############################################################################################################################
header "Compiling firmware..."
cd $ALSASRCDIR/$FIRMWARE
make clean
./configure --prefix=/usr || die "$FIRMWARE configure failed"
make || die "$FIRMWARE make failed"

## utils will be compiled and installed later on, since lib needs to be installed first

#alsa-oss####################################################################################################################################
header "Compiling OSS..."
cd $ALSASRCDIR/$OSS
make clean
./configure --prefix=/usr || die "$OSS configure failed"
make || die "$OSS make failed"

}


installation () {

test -d $ALSASRCDIR || die "$ALSASRCDIR not found - nothing to install! Run download -d option first"

header "Installing all packages..."

header "Installing driver..."
cd $ALSASRCDIR/$DRIVER
make install || die "Nothing to install! Run compile -c option first"
header "Installing library..."
cd $ALSASRCDIR/$LIB
make install
header "Installing plugins..."
cd $ALSASRCDIR/$PLUGINS
make install
header "Installing firmware..."
cd $ALSASRCDIR/$FIRMWARE
make install
cp -rf /usr/share/alsa/firmware/* /lib/firmware # workaround !!!
header "Installing OSS..."
cd $ALSASRCDIR/$OSS
make install


#alsa-utils need to be compiled after lib installation!!#############################################################################
header "Compiling utils..."
cd $ALSASRCDIR/$UTILS
make clean
./configure --prefix=/usr || die "$UTILS configure failed"
make || die "$UTILS make failed"
header "Installing utils..."
make install

#copy modules to respective kernel modules directory!! Note: Only the currently booted  kernel will be upgraded.

cd ${ALSASRCDIR}/${DRIVER}/
find ./ -name ''*.ko'' > /tmp/alsa_modules

header "Copy modules to target directories..."
if [ "`uname -a| grep "2.6.24"`" != "" ] ; then
 tar -cv -T /tmp/alsa_modules -f /lib/modules/`uname -r`/ubuntu/sound/alsa-driver/${DRIVER}.tar
 cd /lib/modules/`uname -r`/ubuntu/sound/alsa-driver
 else 
 tar -cv -T /tmp/alsa_modules -f /lib/modules/`uname -r`/kernel/sound/${DRIVER}.tar
 cd /lib/modules/`uname -r`/kernel/sound/
fi
#Extract new modules, overwriting old ones
tar -xvf ${DRIVER}.tar
rm *.tar

depmod -a

chmod a+rw /dev/dsp /dev/mixer /dev/sequencer /dev/midi /dev/snd/*

####alsa-utils patch for asound.state to avoid patching alsa-utils, see below debian patch - ####
##http://svn.debian.org/wsvn/pkg-alsa/trunk/alsa-utils/debian/patches/move_asound_state_to_var.patch?op=file&rev=0&sc=0

cd /var/lib/alsa
rm asound.state
ln -s /etc/asound.state asound.state

}

toolsinstall () {

test -d $ALSASRCDIR || die "$ALSASRCDIR not found - nothing to install! Run download -d option first"

if [ "${TOOLSLIST[*]}" == "" ] ; then 
   echo "Please define your tools-list (edit list inside script) first!" 
   exit 2
fi

cd $ALSASRCDIR/$TOOLS
for i in "${TOOLSLIST[@]}" ; do
cd  $ALSASRCDIR/$TOOLS/$i
 if [ -x ./configure ]; then 
 make clean   
 ./configure --prefix=/usr ||  die "$Tools $i configure failed"
  make ||  die "$Tools $i make failed"
 fi
done

cd $ALSASRCDIR/$TOOLS
for j in "${TOOLSLIST[@]}" ; do
 cd  $ALSASRCDIR/$TOOLS/$j
  header "Installing tool $j"
  make install
 done
}



downloadsnapshot () {

test -d $ALSASRCDIR || die "$ALSASRCDIR not found! Run download -d option first"

cd $ALSASRCDIR
test -d $DRIVER || die "$DRIVER  not found"
mv $DRIVER $DRIVER.old
wget ftp://ftp.kernel.org/pub/linux/kernel/people/tiwai/snapshot/alsa-driver-snapshot.tar.gz
test -f  alsa-driver-snapshot.tar.gz || die "Download of snapshot didn't work"
tar xvvf alsa-driver-snapshot.tar.gz
mv alsa-driver $DRIVER
rm alsa-driver-snapshot.tar.gz

}


usage() {
    echo "

Alsa Upgrade Script $REV

Usage: $0 [OPTION-one at a time] 

Available options:

   -d     Download the packages. The required dependencies will also be loaded and installed at this stage
   -s     Download the very latest ALSA driver snapshot (Optional)
          (The driver snapshot is taken from the development tree!! - Unstable!)
   -c     Configuration and Compilation 
          Configure and Compile your Alsa packages (all drivers will be compiled by default)
   -i     Installation of Alsa packages
          Installs compiled Alsa packages 
   -t     Compiles and installs the alsa-tools (Optional) 
          Define (inside script) your tools, download, compile and install Alsa first 
   -x     Cleans up the built environment and source code as much as possible to free up space 
   -r     Restore ALSA  (I'd recomend to do a quick restore of your backup at this stage!!)
          The Alsa kernel packages incl. modules and all ALSA relevant Ubuntu packages will be reinstalled
          Note: This won't work on custom kernels!!!
   -h     Help - this page 

   The normal workfĺow is:                   -d > -c > -i > reboot
   The optional driver snapshot workflow is: -d > -s > -c > -i > reboot
   The cleanup:                              -x
   The restore:                              -r > reboot
   The tools:                                 edit list of tools inside the script first > -t

   Before running the script I recommend to update/upgrade and reboot your system.

Feedback @:  http://ubuntuforums.org/showthread.php?t=962695 

DISCLAIMER: Use this script at your own risk. I do not take any responsability for any problems 
            caused by running this script. In any case - make a backup first!

"
    exit 1;
}


#--- main ----------------------------------------------------------------------------------

case "$1" in

  -d)   greet
        package "prepare the environment and download"
        header "Packages will be downloaded"
        prep
        download    
        header "Alsa packages sucessfully downloaded - run compilation -c next"
        ;;

  -s)   greet
        package "download the latest driver snapshot of" 
        header "The latest Alsa-driver snapshot will be downloaded,compiled and installed"
        downloadsnapshot
        header "Alsa driver snapshot sucessfully downloaded - run compilation -c next"
        ;;

  -c)   greet
        package "configure and compile"
        header "Alsa packages(drivers/lib/util/firmware/oss) will be compiled"
        compile
        header "Alsa packages sucessfully compiled - run installation -i next"
        ;;

  -i)   greet
        package "install the compiled sources of"
        header "Alsa packages (drivers/lib/util/firmware/oss) will be installed"
        installation
        header "Alsa packages sucessfully installed - reboot your system now"
        ;;

  -t)   greet
        package "compile and install the tools of"
        header "Alsa package tools will be compiled and installed"
        toolsinstall
        header "Alsa tools sucessfully installed - no reboot rquired"
        ;;

  -x)   greet
        package "to remove the Alsa built-environment to free up space"
        header "Built-environment and source code of dependencies will be removed"
        cleanup
        header "Built-environment and source code sucessfully removed"
        ;;  

  -r)   greet
        package "restore to the package state prior to the upgrade to"
        header "Alsa and related packages will be restored from Ubuntu repositories"
        restorealsa
        header "Alsa packages sucessfully restored - reboot your system now"
        ;;

  -h)
        usage
        exit 1
        ;;
  *)
        usage
        exit 1
        ;;
esac

exit 0


##----script End --------------------------------------------------------------------------------------------------------------------

