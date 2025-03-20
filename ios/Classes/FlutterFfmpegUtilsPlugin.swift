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
   if let commandList = call.arguments as? [String] {
                
                // ✅ Join the List<String> into a single command string
                let command = commandList.joined(separator: " ")

                print("Executing FFmpeg command: \(command)")  // Debug log

                // ✅ Execute FFmpeg command using ffmpeg-kit
                FFmpegKit.executeAsync(command) { session in
                    guard let returnCode = session?.getReturnCode() else {
                        result(FlutterError(code: "FFMPEG_ERROR", message: "Unknown error occurred", details: nil))
                        return
                    }

                    if returnCode.isValueSuccess() {
                        result("Success")
                    } else {
                        let returnCodeValue = returnCode.getValue()
                        result(FlutterError(code: "FFMPEG_ERROR", message: "FFmpeg execution failed with code: \(returnCodeValue)", details: nil))
                    }
                }

            } else {
                // ❌ If command is not a list, throw error
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Command must be a List<String>", details: nil))
            }
    
    default:
      result(FlutterMethodNotImplemented)
    }
  
}
}
