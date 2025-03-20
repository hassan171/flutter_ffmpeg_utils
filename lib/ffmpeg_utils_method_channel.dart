import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ffmpeg_utils_platform_interface.dart';

/// An implementation of [FfmpegUtilsPlatform] that uses method channels.
class MethodChannelFfmpegUtils extends FfmpegUtilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ffmpeg_utils');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
