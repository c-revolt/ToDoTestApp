//
//  Location.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 24.01.2023.
//

import Foundation
import CoreLocation

struct Location {
    let name: String?
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String?, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard
            rhs.coordinate?.latitude == lhs.coordinate?.latitude &&
                lhs.coordinate?.longitude == rhs.coordinate?.longitude &&
                rhs.name == lhs.name else { return false }
        return true
    }
    
    
}
