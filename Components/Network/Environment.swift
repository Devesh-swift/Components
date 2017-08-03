//
//  Environment.swift
//  Components
//
//  Created by Devesh on 03/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation

struct Environment {
    var baseUrl = ""
    var sslPinningEnable = false
    
    init() {
    }
    
    init(baseUrl:String, sslPinningEnable:Bool? = false ) {
        self.baseUrl = baseUrl
        self.sslPinningEnable = sslPinningEnable ?? false
    }
}
