//
//  LocationType.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import Foundation

enum LocationType: String, Identifiable {
    case male5, female5, male6, female6
    
    init?(floor: Int, gender: String) {
        switch (floor, gender.lowercased()) {
        case (5, "male"): self = .male5
        case (5, "female"): self = .female5
        case (6, "male"): self = .male6
        case (6, "female"): self = .female6
        default: return nil
        }
    }
    
    init?(loc: Int) {
        switch loc {
        case 1: self = .male6
        case 2: self = .female6
        case 3: self = .male5
        case 4: self = .female5
        default: return nil
        }
    }
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .male5:
            return String(format: NSLocalizedString("floor", comment: ""), 5) + String(localized: "male_toilet")
        case .female5:
            return String(format: NSLocalizedString("floor", comment: ""), 5) + String(localized: "female_toilet")
        case .male6:
            return String(format: NSLocalizedString("floor", comment: ""), 6) + String(localized: "male_toilet")
        case .female6:
            return String(format: NSLocalizedString("floor", comment: ""), 6) + String(localized: "female_toilet")
        }
    }
}
