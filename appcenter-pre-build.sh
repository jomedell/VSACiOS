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

echo "Also Print with Grep"

( set -o posix ; set ) | grep ^nota | less

#echo "scheme"
#
#cat $APPCENTER_XCODE_SCHEME

#echo "xcode project"
#cat $APPCENTER_XCODE_PROJECT


INFO_PLIST_FILE=$APPCENTER_SOURCE_DIRECTORY/VSAC/Info.plist
echo "plist file content before updating:"
cat $INFO_PLIST_FILE

VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${APPCENTER_SOURCE_DIRECTORY}/VSAC/Info.plist")
echo "current version to $VERSION"

VERSION=$((APPCENTER_BUILD_ID + 1))
echo "current version APPCENTER_BUILD_ID + 1 to $VERSION"

#VERSION_ENV_VAR is an evironmental variable set up in the branch configuration in App Center
VERSION=$((VERSION_ENV_VAR + APPCENTER_BUILD_ID))
echo "current version to env variable + BUILD ID $VERSION"

fi
if [ -e "$INFO_PLIST_FILE" ]
then
    echo "Updating version name to $VERSION_NAME in Info.plist"
    plutil -replace CFBundleVersion -string $VERSION $INFO_PLIST_FILE
    #plutil -replace CFBundleShortVersionString -string $VERSION_SHORT $INFO_PLIST_FILE

    echo "plist ile content after updating both version and short tring version:"
    cat $INFO_PLIST_FILE
fi


echo "*******************************"
echo "Pre Build Script Complete"
echo "*******************************"







