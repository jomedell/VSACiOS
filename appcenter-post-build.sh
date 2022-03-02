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
echo "Post Build Script"
echo "******************************************************"

echo "Origianl CustomVariable"
echo $CustomVariable
echo "CustomVariable update"
CustomVariable="changedVariable"
echo $CustomVariable
echo "Finished updating variable"



appCenterAPItoken=$AppCenterToken
appName="VSAC-Organization/VSACiOS"
devices="VSAC-Organization/iphoneset"
testSeries="ScriptTest"

echo ""
echo "Start XCUITest"
echo "App Name: $appName"
echo "Device Set: $devices"
echo "Test Series: $testSeries"
echo ""

echo "Run npm command"

#npm install -g appcenter-cli

echo ""

echo "Build UI Test"

#rm -rf DerivedData
#xcrun xcodebuild build-for-testing \
#-configuration Debug \
#-workspace $APPCENTER_SOURCE_DIRECTORY/VSAC.xcworkspace \
#-sdk iphoneos \
#-scheme VSAC \
#-derivedDataPath DerivedData \
#-allowProvisioningUpdates
#
#


echo "scheme list"
#ls xcrun xcodebuild -list

echo ""

echo "list files in APPCENTER_OUTPUT_DIRECTORY"
#ls $APPCENTER_OUTPUT_DIRECTORY

echo "list files in DerivedData SOURCE_DIRECTORY"
#ls $APPCENTER_SOURCE_DIRECTORY/DerivedData

echo "list files in DerivedData Debug-iphoneeos"
#ls $APPCENTER_SOURCE_DIRECTORY/DerivedData/Build/Products/Debug-iphoneos

echo "Run UI test CLI command"
#appcenter login --token appCenterAPItoken

#appcenter test run xcuitest --app $appName --devices $devices --test-series $testSeries --locale "en_US" --build-dir $APPCENTER_SOURCE_DIRECTORY/DerivedData/Build/Products/Debug-iphoneos --debug

#--app-path $APPCENTER_OUTPUT_DIRECTORY/*.ipa

echo "*******************************"
echo "Post Build Script Complete"
echo "*******************************"

#--uitest-tools-dir $APPCENTER_SOURCE_DIRECTORY/packages/*/tools












#
#
#
######### UI Tests (Android)
#
#echo "Found Xamarin.UITest project:"
#find $APPCENTER_SOURCE_DIRECTORY -regex '.*UITests.*\.csproj' -exec echo {} \;
#echo
#echo "Building Xamarin.UITest project:"
#find $APPCENTER_SOURCE_DIRECTORY -regex '.*UITests.*\.csproj' -exec msbuild {} \;
#echo
#echo "Compiled projects to run NUnit tests:"
#find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*UITests.*\.dll' -exec echo {} \;
#echo


