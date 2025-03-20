import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ffmpeg_utils_method_channel.dart';

abstract class FfmpegUtilsPlatform extends PlatformInterface {
  /// Constructs a FfmpegUtilsPlatform.
  FfmpegUtilsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FfmpegUtilsPlatform _instance = MethodChannelFfmpegUtils();

  /// The default instance of [FfmpegUtilsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFfmpegUtils].
  static FfmpegUtilsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FfmpegUtilsPlatform] when
  /// they register themselves.
  static set instance(FfmpegUtilsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
