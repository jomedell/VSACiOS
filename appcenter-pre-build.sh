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

echo "Print ENV Var:"
( set -o posix ; set ) | less

echo "******************************************************"
echo "******************************************************"
echo "******************************************************"
echo "******************************************************"

#echo "scheme"
#
#cat $APPCENTER_XCODE_SCHEME

#echo "xcode project"
#cat $APPCENTER_XCODE_PROJECT



INFO_PLIST_FILE=$APPCENTER_SOURCE_DIRECTORY/VSAC/Info.plist
echo "plist file content before updating:"
cat $INFO_PLIST_FILE

#This sets the current version and short version
VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${APPCENTER_SOURCE_DIRECTORY}/VSAC/Info.plist")
VERSION_SHORT=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${APPCENTER_SOURCE_DIRECTORY}/VSAC/Info.plist")
echo "plist current version $VERSION"
echo "plist current short version $VERSION_SHORT"

#Option 1: This changes the version using the pipeline env variable $APPCENTER_BUILD_ID + 1
VERSION_USING_APPCENTER_BUILD_ID=$((APPCENTER_BUILD_ID + 1))
echo "changed version to APPCENTER_BUILD_ID + 1 to $VERSION_USING_APPCENTER_BUILD_ID"

#Option 2: This changes the version using a Const env variable configured in the branch configuration in App Center portal $VERSION_ENV_VAR = 2 + APPCENTER_BUILD_ID
VERSION=$((VERSION_ENV_VAR + APPCENTER_BUILD_ID))
echo "changed version to env variable + BUILD ID $VERSION"

#Option 2: This changes the short version using a Const env variable configured in the branch configuration in App Center portal $VERSION_SHORT_ENV_VAR = 5 + 1
VERSION_SHORT=$((VERSION_SHORT_ENV_VAR + 1))
echo "changed short version to env variable + BUILD ID $VERSION_SHORT"


if [ -e "$INFO_PLIST_FILE" ]
then
    echo "Updating short version and version to $VERSION_SHORT $VERSION in Info.plist"
    plutil -replace CFBundleVersion -string $VERSION $INFO_PLIST_FILE
    plutil -replace CFBundleShortVersionString -string $VERSION_SHORT $INFO_PLIST_FILE

    echo "plist ile content after updating both version and short tring version:"
    cat $INFO_PLIST_FILE
fi


echo "*******************************"
echo "Pre Build Script Complete"
echo "*******************************"







