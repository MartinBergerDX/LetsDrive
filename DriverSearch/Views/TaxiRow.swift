//
//  TaxiRow.swift
//  DriverSearch
//
//  Created by Martin on 11/18/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation
import SwiftUI

struct TaxiRow: View {
    @ObservedObject var taxi: TaxiViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(taxi.fleetType.rawValue)
            Text(taxi.identifier)
                .foregroundColor(.primary)
                .font(.caption)
            Text(taxi.coordinate.description)
            Text(taxi.heading)
        }
        .padding(.leading, 15)
    }
}

struct TaxiRow_Previews: PreviewProvider {
    static var previews: some View {
        return TaxiRow(taxi: TaxiViewModel(with: taxiData[0]))
    }
}
