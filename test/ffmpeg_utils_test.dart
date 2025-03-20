import 'package:flutter_test/flutter_test.dart';
import 'package:ffmpeg_utils/ffmpeg_utils.dart';
import 'package:ffmpeg_utils/ffmpeg_utils_platform_interface.dart';
import 'package:ffmpeg_utils/ffmpeg_utils_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFfmpegUtilsPlatform
    with MockPlatformInterfaceMixin
    implements FfmpegUtilsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FfmpegUtilsPlatform initialPlatform = FfmpegUtilsPlatform.instance;

  test('$MethodChannelFfmpegUtils is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFfmpegUtils>());
  });

  test('getPlatformVersion', () async {
    FfmpegUtils ffmpegUtilsPlugin = FfmpegUtils();
    MockFfmpegUtilsPlatform fakePlatform = MockFfmpegUtilsPlatform();
    FfmpegUtilsPlatform.instance = fakePlatform;

    expect(await ffmpegUtilsPlugin.getPlatformVersion(), '42');
  });
}
