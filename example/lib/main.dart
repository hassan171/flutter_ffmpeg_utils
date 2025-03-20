import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg_utils/flutter_ffmpeg_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Execute FFmpeg Command
  Future<void> runFFmpegCommand(List<String> command) async {
    try {
      final String result = await FlutterFfmpegUtils().executeFFmpeg(command);
      developer.log('FFmpeg Result: $result', name: 'FlutterFfmpegUtils');
    } catch (e, stackTrace) {
      developer.log(
        'Error executing FFmpeg: $e',
        name: 'FlutterFfmpegUtils',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('FFmpeg command execution failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FFmpeg Plugin Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // FFmpeg Command to Scale Video
              runFFmpegCommand([
                "-i",
                "input.mp4",
                "-vf",
                "scale=640:480",
                "output.mp4",
              ]);
            },
            child: const Text('Run FFmpeg Command'),
          ),
        ),
      ),
    );
  }
}
