# === CONFIG ===
DART_DEFINE_FILE=env/secret_constant.json
FLUTTER=flutter

# === File globs to delete ===
GENERATED_GLOBS=\
  "*.g.dart" \
  "*.freezed.dart" \
  "*.gr.dart" \
  "*.chopper.dart" \
  "*.mapper.dart" \
  "*.config.dart" \
  "lib/i18n/app_localizations.dart" \
  "lib/i18n/app_localizations_en.dart" \
  "lib/i18n/app_localizations_hi.dart"

# === TARGETS ===

# Clean Flutter and generated files
clean:
	@echo "Cleaning Flutter build..."
	$(FLUTTER) clean
	@echo "Deleting generated files..."
	@for pattern in $(GENERATED_GLOBS); do \
		find lib -type f -name "$$pattern" -exec rm -v {} +; \
	done

# Build codegen
build:
	@echo "Running build_runner..."
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs

# Run on macOS with config
run-macos:
	@echo "Running app on macOS..."
	$(FLUTTER) run -d macos --dart-define-from-file=$(DART_DEFINE_FILE)

# Run on Android emulator
run-android:
	@echo "Running app on Android emulator..."
	$(FLUTTER) run -d emulator-5554 --dart-define-from-file=$(DART_DEFINE_FILE)

# Remove local install
clean-macos:
	rm -rf build/
	rm -rf macos/Flutter/ephemeral
	rm -rf /Applications/Weather.app
	rm -rf ~/Library/Preferences/com.example.weather.plist
	rm -rf ~/Library/Application\ Support/com.example.weather
	rm -rf ~/Library/Containers/com.example.weather
	rm -rf ~/Library/Caches/com.example.weather

# Combined pipelines
dev-macos: clean build run-macos
dev-android: clean build run-android
