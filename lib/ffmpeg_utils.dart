import 'package:flutter/services.dart';

class FfmpegUtils {
  final MethodChannel _channel = MethodChannel('ffmpeg_utils');

  Future<String> executeFFmpeg(List<String> command) async {
    final String result = await _channel.invokeMethod('executeFFmpeg', command);
    return result;
  }
}
