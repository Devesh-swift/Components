//
//  NetworkClient.swift
//  Components
//
//  Created by Devesh on 03/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation
import Alamofire
protocol NetworkClient {
    func request(_ service:ServiceType, params: [String:Any]?) -> NetworkRequest
}

protocol NetworkRequest {
 func   responseJSON(queue: DispatchQueue?, options: JSONSerialization.ReadingOptions, completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self
    
}

extension NetworkRequest {
    @discardableResult
    func   responseJSON(completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
      return  responseJSON(queue: nil, options: .allowFragments, completionHandler: completionHandler)
    }
}
