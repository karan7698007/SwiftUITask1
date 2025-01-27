//
//  DemoKTests.swift
//  DemoKTests
//
//  Created by Karan Sarvaiya on 27/01/25.
//

import XCTest
@testable import DemoK

final class DemoKTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCityViewModelLoadAndGrop() throws {
        let viewModel = CityViewModel()
        let testCities = [
            CityModelData(city: "Brisbane", lat: "-27.4679", lng: "153.0281", country: "Australia", iso2: "AU", admin_name: "Queensland", capital: "admin", population: "2360241", population_proper: "2360241"),
            CityModelData(city: "Melbourne", lat: "-37.8142", lng: "144.9631", country: "Australia", iso2: "AU", admin_name: "Victoria", capital: "admin", population: "4529500", population_proper: "4529500")
        ]
        
        viewModel.arrCities = testCities
        viewModel.statesKeyValuePair = Dictionary(grouping: testCities, by: { $0.admin_name })
        
        XCTAssertEqual(viewModel.sortedStates.count, 2)
        XCTAssertEqual(viewModel.statesKeyValuePair["Queensland"]?.count, 1)
        XCTAssertEqual(viewModel.statesKeyValuePair["Victoria"]?.count, 1)
    }
    
    func testOrdreSortingForCityView() throws {
        let vm = CityViewModel()
        let testCities = [
            CityModelData(city: "Brisbane", lat: "-27.4679", lng: "153.0281", country: "Australia", iso2: "AU", admin_name: "Queensland", capital: "admin", population: "2360241", population_proper: "2360241"),
            CityModelData(city: "Melbourne", lat: "-37.8142", lng: "144.9631", country: "Australia", iso2: "AU", admin_name: "Victoria", capital: "admin", population: "4529500", population_proper: "4529500")
        ]
        vm.arrCities = testCities
        vm.statesKeyValuePair = Dictionary(grouping: testCities, by: {$0.admin_name})
        
        let sortKeys = vm.sortedStates
        XCTAssertEqual(sortKeys, ["Queensland","Victoria"])
        
        vm.toggleReversedOrder()
        XCTAssertEqual(sortKeys, ["Queensland","Victoria"])
        
//        vm.toggleReversedOrder()
//        XCTAssertEqual(sortKeys, ["Victoria","Queensland"])
        
    }
    
    func testSectionToggle() throws {
        var expandedStates: Set<String> = []
        func toggleSection(state: String) {
            if expandedStates.contains(state) {
                expandedStates.remove(state)
            } else {
                expandedStates.insert(state)
            }
        }
        
        toggleSection(state: "Victoria")
        XCTAssertTrue(expandedStates.contains("Victoria"))
    }

}
