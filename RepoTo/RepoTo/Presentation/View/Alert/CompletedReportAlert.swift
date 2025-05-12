//
//  CompletedReportAlert.swift
//  RepoTo
//
//  Created by Haejin Park on 5/13/25.
//

import SwiftUI

struct CompletedReportAlert: View {
    @ObservedObject var viewModel: ReportViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.2)
                
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white)
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.15)
                    .shadow(radius: 10)
                    .overlay(
                        CompletedReportButton(viewModel: viewModel)
                    )
            }
            .frame(height: geometry.size.height * 1.2)
            .padding(.top, -geometry.size.height * 0.15)
        }
    }
}

#Preview {
    CompletedReportAlert(viewModel: ReportViewModel())
}
