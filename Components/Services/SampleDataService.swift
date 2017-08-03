//
//  SampleDataService.swift
//  Components
//
//  Created by Devesh on 03/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation
import ObjectMapper
import PromiseKit

class SampleDataService {
    
    let network:Network
    
    init(network:Network = NetworkManager.sharedInstance) {
        self.network = network
    }
    
    func getDataFromServer(params:[String:Any]) -> Promise<SampleData> {
        return network.execute(service: .getData, params: params)
    }
}
