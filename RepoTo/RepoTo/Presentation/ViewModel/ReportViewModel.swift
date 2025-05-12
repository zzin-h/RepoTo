//
//  ReportViewModel.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

final class ReportViewModel: ObservableObject {
    @Published var source: ReportSource = .inApp
    
    @Published var selectedLocation: LocationType? = nil
    @Published var selectedReportLocation: ReportLocationType = .toilet0
    @Published var detailedLocation: DetailedLocation = .toilet
    @Published var selectedReportContent: ReportContentType? = nil
    @Published var reportRoute: ReportRoute? = nil
    
    @Published var isShowingAlert: Bool = false
    
    func resetDatas() {
        selectedLocation = nil
        selectedReportLocation = .toilet0
        selectedReportContent = nil
        reportRoute = nil
    }
    
    var reportMessage: String {
        guard let location = selectedLocation else { return "" }
        let reportLocation = selectedReportLocation
        let detailedLocation = detailedLocation
        guard let reportContent = selectedReportContent else { return "" }
        
        let reportMessage = String(format: NSLocalizedString("full_message", comment: ""), location.title, reportLocation.title, reportContent.message(for: detailedLocation))
        
        return reportMessage
    }
}
