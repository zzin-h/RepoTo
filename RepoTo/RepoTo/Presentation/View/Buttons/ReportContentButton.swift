//
//  ReportContentButton.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

struct ReportContentButton: View {
    @ObservedObject var viewModel: ReportViewModel
    
    let reportContent: ReportContentType
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                viewModel.selectedReportContent = reportContent
            }) {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(viewModel.selectedReportContent == reportContent ? .blue : Color(.systemGray3),
                            style: StrokeStyle(lineWidth: viewModel.selectedReportContent == reportContent ? 3 : 1))
                    .overlay {
                        VStack {
                            Spacer()
                            
                            Image("\(reportContent.image(for: viewModel.detailedLocation))")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.5)
                            
                            Spacer()
                            
                            Text(reportContent.title(for: viewModel.detailedLocation))
                                .font(.title2.bold())
                                .lineLimit(nil)
                                .padding(.bottom, 16)
                        }
                        .foregroundStyle(viewModel.selectedReportContent == reportContent ? .blue : Color(.systemGray3))
                    }
            }
        }
    }
}
