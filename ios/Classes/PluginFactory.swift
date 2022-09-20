//
//  PluginFactory.swift
//  video_player_rtmp_ext
//
//  Created by ldd on 2022/9/17.
//

import SwiftUI


class PluginFactory: NSObject,FlutterPlatformViewFactory {

    var flutterPluginRegistrar: FlutterPluginRegistrar
    init(flutterPluginRegistrar: FlutterPluginRegistrar){
        self.flutterPluginRegistrar = flutterPluginRegistrar
    }
    
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return PluginView(flutterPluginRegistrar: flutterPluginRegistrar,viewId: viewId,fram: frame)
    }
    
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
}
