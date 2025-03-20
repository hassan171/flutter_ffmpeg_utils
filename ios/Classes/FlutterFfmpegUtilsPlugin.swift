import Flutter
import UIKit
import ffmpegkit

public class FlutterFfmpegUtilsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ffmpeg_utils", binaryMessenger: registrar.messenger())
    let instance = FlutterFfmpegUtilsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "executeFFmpeg":
      if let args = call.arguments as? [String] {
        executeFFmpegCommand(args, result: result)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Command list not provided", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
}

 private func executeFFmpegCommand(_ command: [String], result: @escaping FlutterResult) {
    DispatchQueue.global(qos: .background).async {
      let joinedCommand = command.joined(separator: " ")
      
      FFmpegKit.executeAsync(joinedCommand) { session in
    // Get the return code properly
    let returnCode = session?.getReturnCode()?.getValue()

    // Ensure result is returned on the main thread
    DispatchQueue.main.async {
        if returnCode == 0 {
            result("FFmpeg command executed successfully!")
        } else {
            result(FlutterError(
                code: "FFMPEG_ERROR",
                message: "Error executing FFmpeg command.",
                details: "Exit code: \(String(describing: returnCode))"
            ))
        }
    }
}
    }
}
}
