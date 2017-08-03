//
//  SampleData.swift
//  Components
//
//  Created by Devesh on 03/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation
import ObjectMapper

class SampleData: BaseResponse {
    var name:String!
    
    
    required init?(map: Map) {
        super.init(map: map)
        self.name = ""
      }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        name <- map["name"]
    }
    
}
