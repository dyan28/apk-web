#!/bin/bash

init() {
  echo "Init: pub get and generates files..."
  flutter pub get
  flutter pub run build_runner build --delete-conflicting-outputs
  flutter pub run intl_utils:generate
  fluttergen -c pubspec.yaml
}

build_dev() {
  echo "Running build-dev..."
	flutter build web -t lib/main/main_development.dart
}

build() {
	echo "Running build production..."
 	flutter build web -t lib/main/main_production.dart
}

# Display menu and take user input
echo "Select an option:"
echo "1. Pub get, gen models, localizations and assets"
echo "2. build for development"
echo "3. build for production"
read -p "Enter your choice (1, 2, or 3): " choice

# Execute the corresponding function based on user choice
case "$choice" in
  "1")
    init
    ;;
  "2")
    build_dev
    ;;
  "3")
    build
    ;;
  *)
    echo "Invalid choice. Please enter 1, 2, or 3."
    exit 1
    ;;
esac

exit 0