//
//  SharedSettings.swift
//  Components
//
//  Created by Devesh on 03/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation

protocol Settings {
    var enV: Environment {get set}
    var appId: String {get}
    var appName: String {get}
    var appVersion:String {get}
}

class SharedSettings: Settings {
    static let shareInstance = SharedSettings()
    
    var enV: Environment = Environment()
    var appId: String
    var appName: String
    var appVersion:String

  private  init() {
        self.appId = "appID"
        self.appName = "appName"
        self.appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
}
