//
//  ReportRoute.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

enum ReportRoute: String, CaseIterable, Identifiable {
    case teams, mail
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .teams:
            return String(format: NSLocalizedString("report_route", comment: ""), String(localized: "teams"))
        case .mail:
            return String(format: NSLocalizedString("report_route", comment: ""), String(localized: "mail"))
        }
    }
    
    var alert: String {
        switch self {
        case .teams:
            return String(format: NSLocalizedString("alert_title", comment: ""), String(localized: "teams"))
        case .mail:
            return String(format: NSLocalizedString("alert_title", comment: ""), String(localized: "mail"))
        }
    }
    
    var color: Color {
        switch self {
        case .teams:
            return .indigo
        case .mail:
            return .blue
        }
    }
}
