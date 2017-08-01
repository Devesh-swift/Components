//
//  Singleton.swift
//  Components
//
//  Created by Devesh on 01/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation

class Singleton {
    static let sharedInstance = Singleton() //  sharedInstance
    private init() { } // private init to prevent object creation from out side
}
