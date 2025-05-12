//
//  ReportRouteButton.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

struct ReportRouteButton: View {
    @ObservedObject var viewModel: ReportViewModel
    
    let route: ReportRoute
    let onTap: () -> Void
    
    private var isValid: Bool {
        if viewModel.selectedLocation == nil ||
            viewModel.selectedReportLocation == .toilet0 ||
            viewModel.selectedReportContent == nil { false }
        else { true }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Spacer()
                
                Button(action: {
                    onTap()
                }) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isValid ? route.color : Color(.systemGray3))
                        .frame(height: 60)
                        .overlay(
                            Text(route.title)
                                .font(.headline)
                                .bold()
                                .foregroundStyle(.white)
                        )
                }
                .disabled(!isValid)
                
                Spacer()
            }
            .frame(height: geometry.size.height)
        }
    }
}
