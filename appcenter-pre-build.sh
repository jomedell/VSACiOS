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

echo "Origianl CustomVariable"
echo $CustomVariable
echo "CustomVariable update"
CustomVariable="changedVariable"
echo $CustomVariable
echo "Finished updating variable"

echo $Secret_environmet
echo "printer secret variable"

echo $Secret_PWDPublicKey
echo "print testingEnv"



echo "*******************************"
echo "Pre Build Script Complete"
echo "*******************************"







