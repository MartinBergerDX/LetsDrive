//
//  PreviewData.swift
//  DriverSearch
//
//  Created by Martin on 11/18/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation

import Foundation
import CoreLocation
import SwiftUI

let taxiData: [Taxi] = JsonLoader.load("taxiData.json")

class JsonLoader {
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
