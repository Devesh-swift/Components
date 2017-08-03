//
//  NetworkManager.swift
//  Components
//
//  Created by Devesh on 01/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation
import PromiseKit
import ObjectMapper

protocol Network {
    func execute(service:ServiceType, params:[String:Any]) -> Promise<[String:Any]>
    func execute<T>(service:ServiceType, params:[String:Any]) -> Promise<T> where T:Mappable

}

extension Network {
    func execute(service:ServiceType, params:[String:Any] = [:]) -> Promise<[String:Any]> {
        return execute(service: service, params: params)
    }
    
    func execute<T>(service:ServiceType, params:[String:Any] = [:] ) -> Promise<T> where T:Mappable {
        return execute(service: service, params: params)
    }

}

class NetworkManager: Network {
    static let sharedInstance = NetworkManager()
    let settings:Settings
    let networkClient:NetworkClient
    
    init(settings:Settings = SharedSettings.shareInstance, networkClient:NetworkClient? = nil) {
        self.settings = settings
        if let networkClient = networkClient {
            self.networkClient = networkClient
        } else  {
            self.networkClient = AlamofireCient(settings: settings)
        }
    }
    
    @discardableResult
    func execute(service: ServiceType, params: [String : Any])-> Promise<[String:Any]> {
        return Promise { fullFilled , reject in
            networkClient.request(service, params: params).responseJSON { response in
                print(response.value ?? "empty")
                switch response.result {
                case .success:
                    
                    if let response = response.value as? [String : Any]  {
                        fullFilled(response)
                    } else {
                        reject(NetworkError.unknown)
                    }
                case .failure:
                    reject(NetworkError.requestFailed)
                }
            }
        }
    }
    
    
    @discardableResult
    func execute<T>(service:ServiceType, params:[String:Any]) -> Promise<T> where T:Mappable {
        return Promise { fullfill, reject in
            networkClient.request(service, params: params).responseJSON { response in
                
                switch response.result {
                case .success:
                    let dictResponse = Mapper<BaseResponse>.parseJSONStringIntoDictionary(JSONString: response.value as! String)
                    let context = MappingContext()
                    if   let result = Mapper<T>(context: context).map(JSONObject: dictResponse) {
                        fullfill(result)
                    } else {
                        reject(NetworkError.unknown)
                    }
                case .failure:
                    reject(NetworkError.requestFailed)
                }
            }
        }
    }
}
