## 1.0.3 - 2025-03-22
- Reduced APK size by eliminating unused native libraries and assets.
- Improved build speed by disabling unnecessary build variants.
- Updated dependencies to use smaller or optimized versions where possible.


## 1.0.2
- Added coroutine support for running FFmpeg commands concurrently on Android.
- Improved background execution with async/DispatchQueue for iOS.
- Fixed potential UI blocking by executing commands in the background.
- Enhanced error handling and return code consistency for both platforms.


## 1.0.1
- Renamed package to `flutter_ffmpeg_utils` and updated all references.
- Added proper DartDoc comments to public API to meet pub.dev standards.
- Replaced `print()` statements with `dart:developer.log` for improved logging.
- Fixed argument handling for `executeFFmpeg` method.
- Updated podspec to ensure correct iOS plugin linking.


## 1.0.0
- Initial release with raw FFmpeg command execution support for Android and iOS.