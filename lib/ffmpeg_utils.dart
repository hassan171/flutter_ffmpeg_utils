import 'package:flutter/services.dart';

class FfmpegUtils {
  static const MethodChannel _channel = MethodChannel('ffmpeg_utils');

  static Future<String> executeFFmpeg(List<String> command) async {
    final String result = await _channel.invokeMethod('executeFFmpeg', command);
    return result;
  }
}
