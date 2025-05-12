//
//  URLHandler.swift
//  RepoTo
//
//  Created by Haejin Park on 5/13/25.
//

import SwiftUI

struct URLHandler {
    @ObservedObject var viewModel: ReportViewModel
    
    func urlHandler(_ url: URL) {
        let parameters = url.extractQueryParameters()
        let loc = parameters["loc"].flatMap{ Int($0) }
        let reloc = Int(parameters["reloc"] ?? "") ?? 0
        
        viewModel.source = .link
        viewModel.selectedLocation = LocationType(loc: loc ?? 0)
        viewModel.selectedReportLocation = ReportLocationType(reloc: reloc) ?? .toilet0
    }
}
