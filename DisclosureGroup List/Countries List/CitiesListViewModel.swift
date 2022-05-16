//
// Created for DisclosureGroup List
// by Stewart Lynch on 2022-04-26
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation

class CountriesListViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var countries: [Country] = []

    var countriesDict: [Country: [City]] {
        Dictionary(grouping: cities) { $0.country}
    }

    func loadCitiesAndCountries() {
        // Sorting by tuples video reference: https://youtu.be/4ochXtdrd70
        cities = Bundle.main.decode([City].self, from: "Cities.json")
            .sorted(by: {($0.country.name, $0.name ) < ($1.country.name, $1.name)})
        
        countries = cities.map { $0.country}
        countries = Array(Set(countries)).sorted(by: { $0.name < $1.name})
    }
    
    func expand(_ expand:Bool) {
        countries.indices.forEach {
            countries[$0].open = expand
        }
    }
    
    var allExpanded: Bool {
        countries.allSatisfy { $0.open}
    }
    
    var allCollapsed: Bool {
        countries.allSatisfy { !$0.open}
    }
}

