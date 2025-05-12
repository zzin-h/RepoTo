//
//  ToiletMapButton.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

struct ToiletMapButton: View {
    @ObservedObject var viewModel: ReportViewModel
    
    var body: some View {
        ZStack {
            Image(viewModel.selectedReportLocation.rawValue)
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .padding(.trailing, 16)
            
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width / 2.3)
                    TouchArea(viewModel: viewModel, reportLocation: .washbasin1)
                    TouchArea(viewModel: viewModel, reportLocation: .washbasin2)
                }
                
                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width / 4.5)
                    TouchArea(viewModel: viewModel, reportLocation: .toilet3)
                    TouchArea(viewModel: viewModel, reportLocation: .toilet4)
                    TouchArea(viewModel: viewModel, reportLocation: .toilet5)
                }
            }
        }
    }
}

private struct TouchArea: View {
    @ObservedObject var viewModel: ReportViewModel
    
    let reportLocation: ReportLocationType
    
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.selectedReportLocation = reportLocation
                detailedLocation()
            }
    }
    
    private func detailedLocation() {
        if reportLocation == .washbasin1 || reportLocation == .washbasin2 {
            viewModel.detailedLocation = .washbasin
        } else {
            viewModel.detailedLocation = .toilet
        }
    }
}
