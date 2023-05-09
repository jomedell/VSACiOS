#!/bin/sh

#  appcenter-post-build.sh
#  VSAC
#
#  Created by Jorge Medellin on 4/23/18.
#  Copyright © 2018 Microsoft. All rights reserved.

#!/usr/bin/env bash
#
# For Xamarin, run all NUnit test projects that have "Test" in the name.
# The script will build, run and display the results in the build logs.
#

set -e

echo "******************************************************"
echo "Pre Build Script"
echo "******************************************************"

( set -o posix ; set ) | less

#echo "scheme"
#
#cat $APPCENTER_XCODE_SCHEME

#echo "xcode project"
#cat $APPCENTER_XCODE_PROJECT

INFO_PLIST_FILE=$APPCENTER_SOURCE_DIRECTORY/VSAC/Info.plist


echo "File content:"
cat $INFO_PLIST_FILE


echo "Origianl CustomVariable"
echo $CustomVariable
echo "CustomVariable update"
CustomVariable="changedVariable"
echo $CustomVariable
echo "Finished updating variable"

echo $Secret_environmet
echo "printer secret variable"

echo $Secret_PWDPublicKey
echo "print Secret_PWDPublicKey"









echo "*******************************"
echo "Pre Build Script Complete"
echo "*******************************"







