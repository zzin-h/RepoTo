//
//  ReportContentType.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import Foundation

enum ReportContentType: String, CaseIterable, Identifiable {
    case clog, paper, sos
    
    var id: String { rawValue }
    
    func image(for location: DetailedLocation) -> String {
        switch self {
        case .clog:
            return location.rawValue + "clog"
        case .paper:
            return "paper"
        case .sos:
            return "sos"
        }
    }
    
    func title(for location: DetailedLocation) -> String {
        switch self {
        case .clog:
            return String(format: NSLocalizedString("report_clog", comment: ""), location.title)
        case .paper:
            return String(localized: "report_paper")
        case .sos:
            return String(localized: "report_sos")
        }
    }
    
    func message(for location: DetailedLocation) -> String {
        switch self {
        case .clog:
            return String(format: NSLocalizedString("report_clog_message", comment: ""), location.title)
        case .paper:
            return String(localized: "report_paper_message")
        case .sos:
            return String(localized: "report_sos_message")
        }
    }
}
