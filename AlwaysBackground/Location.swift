//
//  Location.swift
//  AlwaysBackground
//
//  Created by hiroky on 2020/01/25.
//  Copyright © 2020 htanaka. All rights reserved.
//

import Foundation
import CoreLocation
import CurrentLocationTime

var location: CLLocationManager!
var fileURL: URL?

func initLocation() {    
    let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileName = "AlwaysBackground.txt"
    fileURL = docUrl.appendingPathComponent(fileName)
}

func startLocation() {
    location.startUpdatingLocation()
}

func stopLocation() {
    location.stopUpdatingLocation()
}

func changeType() {
    location.startMonitoringSignificantLocationChanges()
}


