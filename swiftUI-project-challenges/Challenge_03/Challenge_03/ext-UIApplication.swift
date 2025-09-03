//
//  ext-UIApplication.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 03/09/25.
//

import Foundation
import UIKit

extension UIApplication {
    func dismissKeyboard() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
