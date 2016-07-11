//
//  Cloudy_NineTests.swift
//  Cloudy NineTests
//
//  Created by William on 7/6/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import XCTest
@testable import Cloudy_Nine

class Cloudy_NineTests: XCTestCase {
    
    var weatherData: [WeatherData] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOWMAPIClientResults(){
        let location = Location(lat: 29.7, lon: 95.4, city: nil)
        
        
        OWMAPIClient.shared.getWeather(location, success: { weatherData in
            self.weatherData = weatherData
        })
        
        XCTAssert(true)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
