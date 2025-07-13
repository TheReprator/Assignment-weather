## Getting Started

# Requirements
    First run the app via VSCode Run and Debug to set the envrioment variables or else
     Set the key 'https://api.open-meteo.com/v1/' direclty to 'baseUrl' inside NetworkModule.dart

# define enviorment variable
    flutter run --dart-define API_URL= https://api.open-meteo.com/v1/
    or
    flutter run --dart-define-from-file= env/secret_constant.json

# Injectable generation
    flutter packages pub run build_runner watch --delete-conflicting-outputs

# Translation generation 
    flutter gen-l10n
    
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
