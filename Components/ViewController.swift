//
//  ViewController.swift
//  Components
//
//  Created by Devesh on 26/07/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
    }
    
    func getDataFromServer() {
        SampleDataService().getDataFromServer(params: ["key":"value"]).then { sampleData -> () in
            print(sampleData)
        }.catch { (error) in
            print(error)
        }
    }
}

