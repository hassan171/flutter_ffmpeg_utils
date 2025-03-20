import 'package:flutter/services.dart';

class FlutterFfmpegUtils {
  final MethodChannel _channel = MethodChannel('flutter_ffmpeg_utils');

  Future<String> executeFFmpeg(List<String> command) async {
    final String result = await _channel.invokeMethod('executeFFmpeg', command);
    return result;
  }
}
