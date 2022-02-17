import Flutter
import UIKit
import GPUImage

public class SwiftFlutterBeautyPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_beauty", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterBeautyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "setupOriginImage"{
            guard let imageBase64 = call.arguments as? String else {
                result("setupFailed")
                return
            }
            guard let image = imageBase64.convert2UIImage() else {
                result("setupFailed")
                return
            }
            FilterHelper.shared.setupOriginImage(image: image)
            result("init success")
        }else if call.method == "setFilter"{
            let imageBase64 = FilterHelper.shared.renderFilter(dict: call.arguments as? NSDictionary)
            result(imageBase64)
        }
    }
}
