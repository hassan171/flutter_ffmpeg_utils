import 'package:ffmpeg_utils/ffmpeg_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Execute FFmpeg Command
  Future<void> runFFmpegCommand(List<String> command) async {
    try {
      final String result = await FfmpegUtils().executeFFmpeg(command);
      print('FFmpeg Result: $result');
    } catch (e) {
      print('Error executing FFmpeg: $e');
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
