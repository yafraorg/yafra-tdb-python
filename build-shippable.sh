#!/bin/sh
#
# used for CI services like Jenkins, Shippable, Travis-CI
#
# variables must be set by CI service
#export ANDROID_HOME=/work/adt/sdk
#export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

echo "Build tdb python project"

echo "Make sure the environment is loaded!"

#
# setup general paths
#
export BASENODE=/home/shippable/workspace/src/github.com/yafra-tdb-python
export WORKNODE=/work/yafra-runtime
export SYSADM=/work/repos/yafra/org.yafra.sysadm
export YAFRATOOLS=$SYSADM/defaults
export YAFRABIN=$SYSADM/defaults/scripts
export YAFRADOC=$WORKNODE/doc
export YAFRAMAN=$WORKNODE/man
export YAFRAEXE=$WORKNODE/bin
    
export PATH=$PATH:$YAFRABIN:$YAFRAEXE


#
# setup system
#
export PS_TARGET=`$YAFRABIN/gettarget`
export PS_OSTYPE=`$YAFRABIN/getostype`
export PS_OS=`$YAFRABIN/getos`
export PS_OSVER=`$YAFRABIN/getosver`
export PS_COMPTYPE=$PS_OSTYPE
export PS_HW=`$YAFRABIN/gethardware`
export PS_HOSTNAME=`$YAFRABIN/getserver`
export HARDWARE=$PS_HW

#
# make sure the generic profile is loaded and you have enough permissions!!
#
if [ ! -d $SYSADM/defaults ]
then
	echo "Environment not loaded - install first !"
	exit
fi

#
# create dirs
#
echo "Creating directories now\n"
mkdir -p $WORKNODE
mkdir -p $YAFRADOC
mkdir -p $YAFRAMAN
mkdir -p $YAFRAEXE
test -d $TDBO || mkdir -p $TDBO
test -d $WORKNODE/apps || mkdir $WORKNODE/apps
test -d $WORKNODE/yafra-dist || mkdir $WORKNODE/yafra-dist

#
# setup some variables
#
TIMESTAMP="$(date +%y%m%d)"
VERREL="$YAFRAVER.$YAFRAREL-$YAFRABUILD"
echo "-> settings for release $VERREL with basenode $BASENODE on $TIMESTAMP"
echo "-> build number $YAFRABUILD"
#

#copy python app to worknode
test -d $WORKNODE/apps/tdbpyadmin || mkdir $WORKNODE/apps/tdbpyadmin
cp $TDBNODE/org.yafra.tdb.admin-ui/* $WORKNODE/apps/tdbpyadmin/

chmod 755 $WORKNODE/apps/tdbpyadmin/main.py


echo "done - save in /work"
