//
//  ReportLocationType.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import Foundation

enum ReportLocationType: String, CaseIterable, Identifiable {
    case toilet0, washbasin1, washbasin2, toilet3, toilet4, toilet5
    
    var id: String { rawValue }
    
    init?(reloc: Int) {
        switch reloc {
        case 1: self = .washbasin1
        case 2: self = .washbasin2
        case 3: self = .toilet3
        case 4: self = .toilet4
        case 5: self = .toilet5
        default: return nil
        }
    }
    
    var title: String {
        switch self {
        case .toilet0: return String(localized: "male_toilet")
        case .washbasin1: return String(localized: "door_side_washbasin")
        case .washbasin2: return String(localized: "wall_side_washbasin")
        case .toilet3: return String(localized: "door_side_toilet")
        case .toilet4: return String(localized: "middle_side_toilet")
        case .toilet5: return String(localized: "wall_side_toilet")
        }
    }
}
