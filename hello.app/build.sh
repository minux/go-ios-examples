#!/bin/sh

set -e

# Prerequisites:
# 1. Apple developer certificate, and an enrolled test iDevice (1GB or more memory is better).
# 2. Install https://github.com/phonegap/ios-deploy to run the application.
# 3. Go with iOS support, see $GOROOT/misc/ios/README on how to set it up.

cd `dirname $0`

# build the program
CGO_ENABLED=1 GOARCH=arm go build -o hello helloworld.go
# sign the executable using your developer certificate
codesign -f -s "iPhone Developer" --entitlements Entitlements.plist hello

# run the program inside lldb on iDevice, run `ios-deploy` for more # command options
echo "You can now issue 'ios-deploy --debug --uninstall --bundle `pwd` to run it on your iDevice."
echo 'Depending on your ios-deploy version, you might need to enter "run" into lldb to run your program, and its output will be shown by lldb.'
