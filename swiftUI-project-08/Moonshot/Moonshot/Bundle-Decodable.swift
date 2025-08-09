//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Syaoki Biek on 09/08/25.
//

import Foundation

extension Bundle {
//    func decode(_ file: String) -> [String: Astronaut] {
    func decode<T: Codable>(_ file: String) -> T { // create generic parameter to build reusable function
        // look for the file inside on the bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Fail to locate \(file) in bundle.")
        }
        
        // load the file from the bundle
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load \(file) from bundle.")
        }
        
        // decode data from the file
        let decoder = JSONDecoder()
        
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Fail to decode \(file) from bundle.")
//        }
//        
//        // return the loaded data
//        return loaded
        
        // creating code for troubleshooting error more specific
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError( "Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Faield to decode \(file) from bundle: \(error.localizedDescription)")
        }
        
        
    }
}
