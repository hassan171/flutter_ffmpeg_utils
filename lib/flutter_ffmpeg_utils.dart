import 'package:flutter/services.dart';

/// A Flutter plugin for executing raw FFmpeg commands on Android and iOS.
class FlutterFfmpegUtils {
  /// Method channel for communicating with native code.
  final MethodChannel _channel = MethodChannel('flutter_ffmpeg_utils');

  /// Executes an FFmpeg command on the native platform.
  ///
  /// The [command] should be a list of strings representing the FFmpeg command.
  /// Returns a [Future] that completes with the result of the execution.
  ///
  /// Example:
  /// ```dart
  /// final result = await FlutterFfmpegUtils.executeFFmpeg(['-i', 'input.mp4', 'output.mp4']);
  /// ```
  Future<String> executeFFmpeg(List<String> command) async {
    if (command.isEmpty) {
      throw ArgumentError('Command list cannot be empty');
    }

    final String result = await _channel.invokeMethod('executeFFmpeg', command);
    return result;
  }
}
