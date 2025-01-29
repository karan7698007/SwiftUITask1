//
//  CityModelData.swift
//  DemoK
//
//  Created by Karan Sarvaiya on 27/01/25.
//

import Foundation

struct CityModelData: Identifiable, Decodable {
    var id = UUID()
    let city: String
    let lat: String
    let lng: String
    let country: String
    let iso2: String
    let admin_name: String
    let capital: String
    let population: String
    let population_proper: String
    
    
    enum CodingKeys: String, CodingKey {
        case city
        case lat
        case lng
        case country
        case iso2
        case admin_name
        case capital
        case population
        case population_proper
    }
    
    init(city: String,lat: String, lng: String, country: String, iso2: String, admin_name: String, capital: String,population: String, population_proper: String,id: UUID = UUID()) {
        self.id = id
        self.city = city
        self.lat = lat
        self.lng = lng
        self.country = country
        self.iso2 = iso2
        self.admin_name = admin_name
        self.capital = capital
        self.population = population
        self.population_proper = population_proper
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(String.self, forKey: .city)
        self.lat = try container.decode(String.self, forKey: .lat)
        self.lng = try container.decode(String.self, forKey: .lng)
        self.country = try container.decode(String.self, forKey: .country)
        self.iso2 = try container.decode(String.self, forKey: .iso2)
        self.admin_name = try container.decode(String.self, forKey: .admin_name)
        self.capital = try container.decode(String.self, forKey: .capital)
        self.population = try container.decode(String.self, forKey: .population)
        self.population_proper = try container.decode(String.self, forKey: .population_proper)
    }
}
