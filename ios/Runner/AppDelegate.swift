import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      
      if let controller: FlutterViewController = window?.rootViewController as? FlutterViewController {
          let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery", binaryMessenger: controller.binaryMessenger)
          batteryChannel.setMethodCallHandler { call, result in
              if call.method == "getBatteryLevel" {
                  self.receiveBatteryLevel(result: result)
                  return
              }
              result(FlutterMethodNotImplemented)
          }
      }
      
      if let register = registrar(forPlugin: "native-view-plugin") {
          let factory = YJNativeViewFactory(message: register.messenger())
          registrar(forPlugin: "<native-view-plugin>")!.register(factory, withId: "platform-view-example")

      }
      
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func receiveBatteryLevel(result: FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == .unknown {
            result(FlutterError(code: "UNAVAILABLE", message: "Battery level not available", details: nil))
        }
        else {
            result(Int(Int(device.batteryLevel) * 100 + Int(arc4random() % 1000)))
        }
    }
}


