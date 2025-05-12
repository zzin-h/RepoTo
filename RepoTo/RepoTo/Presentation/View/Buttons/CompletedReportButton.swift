//
//  CompletedReportButton.swift
//  RepoTo
//
//  Created by Haejin Park on 5/13/25.
//

import SwiftUI

struct CompletedReportButton: View {
    @ObservedObject var viewModel: ReportViewModel
    
    @State private var isCompleted: Bool = false
    
    var body: some View {
        let route = viewModel.reportRoute?.alert ?? ""
        
        VStack(alignment: .center) {
            Text(route)
                .font(.headline)
                .padding(.top, 16)
                .padding(.bottom, 8)
            
            Divider()
            
            HStack {
                Spacer()
                
                Button(action: {
                    resetAlert()
                }) {
                    Text(NSLocalizedString("retry_button", comment: ""))
                        .foregroundStyle(.gray)
                        .bold()
                }
                
                Spacer()
                
                Divider()
                
                Spacer()
                
                Button(action: {
                    isCompleted = true
                    resetAlert()
                }) {
                    Text(NSLocalizedString("complete_button", comment: ""))
                        .foregroundStyle(.blue)
                        .bold()
                }
                
                Spacer()
            }
        }
    }
    
    private func resetAlert() {
        viewModel.isShowingAlert = false
        viewModel.resetDatas()
        
        if isCompleted {
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        }
    }
}
