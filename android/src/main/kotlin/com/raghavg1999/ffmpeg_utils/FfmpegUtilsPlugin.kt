package com.raghavg1999.ffmpeg_utils

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import com.arthenica.ffmpegkit.FFmpegKit
import com.arthenica.ffmpegkit.FFmpegSession
import com.arthenica.ffmpegkit.ReturnCode

/** FfmpegUtilsPlugin */
class FfmpegUtilsPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ffmpeg_utils")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "executeFFmpeg") {
      val arguments = call.arguments as List<String>
            val exitCode =     executeFFmpeg(arguments)
            if (exitCode == 0) {
                result.success("FFmpeg command executed successfully!")
            } else {
                result.error("FFMPEG_ERROR", "FFmpeg command failed with exit code $exitCode", null)
            }
    } else {
      result.notImplemented()
    }
  }

   private fun executeFFmpeg(commandList: List<String>): Int {
        // Join the command list into a single string
        val command = commandList.joinToString(" ")

        // Execute the FFmpeg command (blocking call)
        val session: FFmpegSession = FFmpegKit.execute(command)

        // Check the return code to see if the command was successful
        when {
            ReturnCode.isSuccess(session.returnCode) -> {
                println("✅ FFmpeg command executed successfully.")
                return 0;
            }
            ReturnCode.isCancel(session.returnCode) -> {
                println("⚠️ FFmpeg command was cancelled.")
                return -1;
            }
            else -> {
                println("❌ FFmpeg command failed with return code: ${session.returnCode}")
                println("Output: ${session.output}")
                println("Error: ${session.failStackTrace}")
                return -1;
            }
        }
    }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
