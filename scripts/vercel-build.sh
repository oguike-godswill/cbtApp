#!/usr/bin/env bash
set -e

if [ ! -d "flutter-sdk" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 flutter-sdk
fi

export PATH="$PWD/flutter-sdk/bin:$PATH"
flutter config --enable-web
flutter pub get
flutter build web --release
