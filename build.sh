#!/bin/bash

set -o pipefail && xcodebuild -project MeteoLVProvider.xcodeproj -scheme MeteoLVProvider-iOS -destination 'platform=iOS Simulator,name=iPhone XS' CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO clean test build | xcpretty
set -o pipefail && xcodebuild -project MeteoLVProvider.xcodeproj -scheme MeteoLVProvider-tvOS CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO clean build | xcpretty
set -o pipefail && xcodebuild -project MeteoLVProvider.xcodeproj -scheme MeteoLVProvider-watchOS CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO clean build | xcpretty
set -o pipefail && xcodebuild -project MeteoLVProvider.xcodeproj -scheme MeteoLVProvider-macOS CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO clean build | xcpretty
