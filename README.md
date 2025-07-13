## The app will only work, when you press the submit button
    1) Search on click of submit button
    2) Load the previous successfull session data on app relaunch

## Setup instructions(via MakeFile).
    just run command 
        -> make dev-macos (To run macos app)
        -> make dev-android (To run android app)

# Setup Requirements(Manual setup)
     First run the app via VSCode Run and Debug to set the envrioment variables or else
     Set the key 'https://api.open-meteo.com/v1/' direclty to 'baseUrl' inside NetworkModule.dart

    # define enviorment variable
        flutter run --dart-define API_URL= https://api.open-meteo.com/v1/
            or
        flutter run --dart-define-from-file= env/secret_constant.json

# Localization
    https://docs.flutter.dev/release/breaking-changes/flutter-generate-i10n-source
    flutter gen-l10n

# Injectable generation
    flutter packages pub run build_runner watch --delete-conflicting-outputs
    
# annoation generation 
    # dart
    dart pub run build_runner build

    # flutter	
    flutter pub run build_runner build

# Clear the Pub Cache
    flutter pub cache clean

# Clean build
    flutter clean

# Rebuild
    flutter pub get
    flutter run 

# Rebuild Macos/IOs 
    go into ios folder
    delete the Podfile.lock file
    rm -rf Pods
    pod cache clean --all
    pod deintegrate
    pod setup
    pod install
