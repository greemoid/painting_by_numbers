br:
	fvm dart run build_runner build --delete-conflicting-outputs
watch:
	fvm dart run build_runner watch
get:
	fvm flutter pub get
prepare:
	fvm flutter pub get
	fvm dart run build_runner build --delete-conflicting-outputs
	fvm dart run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir ./assets/translations --output-dir ./lib/resources/gen

locale:
	fvm dart run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir ./assets/translations --output-dir ./lib/resources/gen

apk:
	fvm flutter build apk --flavor prod --target-platform android-arm64