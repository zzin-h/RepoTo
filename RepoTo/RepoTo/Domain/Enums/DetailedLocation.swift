//
//  DetailedLocation.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

enum DetailedLocation: String, Identifiable {
    case toilet, washbasin
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .toilet:
            return String(localized: "toilet")
        case .washbasin:
            return String(localized: "washbasin")
        }
    }
}
