//
//  YJNativeViewFactory.swift
//  Runner
//
//  Created by denglibing on 2023/10/30.
//

import Flutter
import UIKit

class YJNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    
    private var message: FlutterBinaryMessenger
    init(message: FlutterBinaryMessenger) {
        self.message = message
        super.init()
        
        print("init message: \(message)")
    }
    
    // step1
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        print("createArgsCodec")
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
    // step2
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        print("create view: \(viewId) \(String(describing: args))")
        return YJNativeView(frame: frame, viewId: viewId, args: args, message: message)
    }
}

class YJNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    // step3
    init(frame: CGRect, viewId: Int64, args: Any?, message: FlutterBinaryMessenger) {
        print("YJNativeView viewId: \(viewId)")
        _view = UIView()
        super.init();
        createNativeView(view: _view)
    }
  
    // step4
    func createNativeView(view _view: UIView) {
        _view.backgroundColor = .blue
        print("frame: \(_view.frame)")
        let nativeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 40))
        nativeLabel.text = "Native Text from iOS ..."
        nativeLabel.textColor = .white
        nativeLabel.textAlignment = .center
        _view.addSubview(nativeLabel)
    }
    
    // step5
    func view() -> UIView {
        print("YJNativeView view: \(_view)")
        return _view
    }
}
