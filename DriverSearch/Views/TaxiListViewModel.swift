//
//  TaxiViewModel.swift
//  DriverSearch
//
//  Created by Martin on 11/19/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Combine
import SwiftUI

class TaxiListViewModel: ObservableObject {
    
    @Published var taxis: [TaxiViewModel] = []
    @Published var taxiModels: [Taxi] = []
    private var boundingBox: BoundingBox! = BoundingBox.init()
    
    func update(boundingBox: BoundingBox) {
        self.boundingBox = boundingBox
        load()
    }
    
    func load() {
        let request: BackendGetTaxiRequest! = BackendGetTaxiRequest.init(northEast: boundingBox.northEast, southWest: boundingBox.sounthWest)
        request.success = { [unowned self] (receivedTaxis: [Any]?) -> Void in
            if let objcTaxis: [ReceivedTaxi] = receivedTaxis as? [ReceivedTaxi] {
                let taxis = objcTaxis.map { Taxi.init(from: $0) }
                self.taxiModels = taxis                
                self.taxis = taxis.map { TaxiViewModel(with: $0) }
            }
        }
        request.failure = { (error: Error?) -> Void in
            if let error = error {
                print(error)
            }
        }
        ProductionServiceRegistry.instance.backend.execute(request)
    }
}

extension TaxiListViewModel {
    static func sample() -> TaxiListViewModel {
        let viewModel = TaxiListViewModel.init()
        viewModel.taxis = taxiData.map { TaxiViewModel(with: $0) }
        return viewModel
    }
}
