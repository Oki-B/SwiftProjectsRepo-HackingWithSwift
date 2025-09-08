//
//  Order.swift
//  CupcakeCorner
//
//  Created by Syaoki Biek on 07/09/25.
//

import Foundation

// Wrap Up Challenge 1. Improve the validation to make sure a string of pure whitespace is invalid.
extension String {
    var isEmptyOrWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

// buat struct untuk mempermudah Address variable grouping
struct Address: Codable {
    var name: String
    var streetAddress: String
    var city: String
    var zip: String
}

@Observable
class Order: Codable {
    // when we working with real server we're gonna need some custom Coding Keys to adjust our response and request for hit and get something from the server
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _address = "address"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var address: Address = Address(name: "", streetAddress: "", city: "", zip: "")
    
    init() {
        load()
    }
    
    var hasValidAddress: Bool {
        // change .isEmpty with new ext func created foro checking White Space
        !address.name.isEmptyOrWhitespace && !address.streetAddress.isEmptyOrWhitespace && !address.city.isEmptyOrWhitespace && !address.zip.isEmptyOrWhitespace
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}

extension Order {
    func save() {
        if let encoded = try? JSONEncoder().encode(address) { // encode hanya address saja sesuai dengan kebutuhan
            UserDefaults.standard.set(encoded, forKey: "Address")
        }
    }
    
    func load() {
        if let savedAddress = UserDefaults.standard.data(forKey: "Address") {
            if let decoded = try? JSONDecoder().decode(Address.self, from: savedAddress) {
                self.address = decoded
                return
            }
        }
    }

}
