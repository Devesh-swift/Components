//
//  AlamofireCient.swift
//  Components
//
//  Created by Devesh on 03/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest: NetworkRequest {
    // to typecast datRequest to netwrk request
}


class AlamofireCient: NetworkClient {
    let sessionManager: SessionManager
    let settings: Settings
    let serverTrustPolicyManager: ServerTrustPolicyManager
    
    init(settings: Settings) {
        self.settings = settings
        
        if self.settings.enV.sslPinningEnable {
            let pathToCerts = Bundle.main.path(forResource: "xyz_cert", ofType: "der")
            let localCertificate:NSData = NSData(contentsOfFile: pathToCerts!)!
            let serverTrustPolicies:[String:ServerTrustPolicy]  = ["https://myweb.xyz/abc/asdf": ServerTrustPolicy.pinCertificates(certificates: [SecCertificateCreateWithData(nil, localCertificate)!], validateCertificateChain: true, validateHost: true)]
            self.serverTrustPolicyManager = ServerTrustPolicyManager(policies: serverTrustPolicies)
        } else {
             self.serverTrustPolicyManager = ServerTrustPolicyManager(policies: ["aa.bb.cc.z" : ServerTrustPolicy.disableEvaluation , "xx.yy.zz.a":ServerTrustPolicy.disableEvaluation])
        }
        
        let configuration = URLSessionConfiguration.default
        sessionManager = SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: serverTrustPolicyManager)
    }
    
    func request(_ service: ServiceType, params: [String : Any]?)-> NetworkRequest {
        let params = params ?? [:]
        let request = sessionManager.request(settings.enV.baseUrl, method: HTTPMethod.post, parameters: params)
        
        print("request: \(service) - \(request)")
        print("params: \(params)")
        return request
    }
}
