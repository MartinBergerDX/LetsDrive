//
//  ViewController.swift
//  DriverSearch
//
//  Created by Martin on 11/13/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request: BackendGetTaxiRequest! = BackendGetTaxiRequest.init(point: "Point")
        request.success = { (taxis: [Any]?) -> Void in
            if let taxis: [Taxi] = taxis as? [Taxi] {
                print(taxis)
            }
        }
        ProductionServiceRegistry.instance.backend.execute(request)
    }
}

