//
//  CityViewModel.swift
//  DemoK
//
//  Created by Karan Sarvaiya on 27/01/25.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var arrCities: [CityModelData] = []
    @Published var statesKeyValuePair: [String: [CityModelData]] = [:]
    @Published var isReversed: Bool = false
    
    var sortedStates: [String] {
        let stateKeys = Array(statesKeyValuePair.keys)
        return isReversed ? stateKeys.sorted().reversed() : stateKeys.sorted()
    }
    
    init(){
        getAllCities()
    }
    
    private func getAllCities(){
        guard let url = Bundle.main.url(forResource: "au_cities", withExtension: "json") else {
            print("Failed to locate au_cities.json in bundle.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedCities = try JSONDecoder().decode([CityModelData].self, from: data)
            self.arrCities = decodedCities
            self.statesKeyValuePair = Dictionary(grouping: decodedCities, by: { $0.admin_name })
        } catch {
            print("Error loading or decoding JSON: \(error)")
        }
    }
    
    func toggleReversedOrder(){
        self.isReversed.toggle()
    }
}
