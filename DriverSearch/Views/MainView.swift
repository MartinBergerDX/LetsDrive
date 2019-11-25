//
//  FleetSearch.swift
//  DriverSearch
//
//  Created by Martin on 11/18/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import SwiftUI
import MapKit

struct MainView: View {
    @ObservedObject var viewModel = TaxiListViewModel()
    
    var body: some View {
        VStack {
            MapView(taxis:$viewModel.taxiModels, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees.init(53.551086), longitude: CLLocationDegrees.init(9.993682)))
            .environmentObject(viewModel)
            .frame(height: 280)
            
            List {
             ForEach(viewModel.taxis) { taxi in
                    TaxiRow(taxi: taxi)
                }
                .listRowInsets(EdgeInsets())
            }
            .onAppear {
                self.viewModel.load()
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: TaxiListViewModel.sample())
    }
}
