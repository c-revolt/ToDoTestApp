//
//  LocationTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 24.01.2023.
//

import XCTest
import CoreLocation
@testable import ToDoTestApp

final class LocationTests: XCTestCase {

    func testInitSetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func testInitSetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
}
