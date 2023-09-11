//
//  Articles.swift
//  StocksApp
//
//  Created by Snehal Firodia on 08/09/23.
//

import Foundation
import SwiftUI

struct Article: Decodable {
    let title: String
    let publication: String
}


extension Date {
    
    static func formatDateForTitle() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        return formatter.string(from: Date())
    }
    
}
