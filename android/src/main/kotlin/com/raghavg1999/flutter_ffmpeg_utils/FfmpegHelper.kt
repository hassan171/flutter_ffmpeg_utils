package com.raghavg1999.flutter_ffmpeg_utils

import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

import com.arthenica.ffmpegkit.FFmpegKit
import com.arthenica.ffmpegkit.FFmpegSession
import com.arthenica.ffmpegkit.ReturnCode


class FfmpegHelper {
    companion object {
        private const val TAG = "FfmpegHelper"

        fun executeFFmpeg(command: List<String>, result: MethodChannel.Result) {
            CoroutineScope(Dispatchers.IO).launch {
                val command = command.joinToString(" ")
                val session: FFmpegSession = FFmpegKit.execute(command)


                // Send the result back to Flutter on the main thread
                Handler(Looper.getMainLooper()).post {
                    if (ReturnCode.isSuccess(session.returnCode)) {
                        result.success("FFmpeg command executed successfully!")
                    } else {
                        result.error(
                            "FFMPEG_ERROR",
                            "Error executing FFmpeg command.",
                            "Exit code: ${session.returnCode?.toString()}"
                        )
                    }
                }
            }
        }
    }
}
