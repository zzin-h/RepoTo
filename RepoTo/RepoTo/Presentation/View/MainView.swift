//
//  MainView.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: ReportViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HeaderView()
                
                LocationSelectorView(viewModel: viewModel, floor: 6)
                LocationSelectorView(viewModel: viewModel, floor: 5)
            }
            .padding(.leading, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            .navigationDestination(item: $viewModel.selectedLocation) { location in
                ReportContentView(viewModel: viewModel)
                    .navigationTitle(viewModel.selectedLocation?.title ?? "")
                    .onDisappear {
                        viewModel.resetDatas()
                    }
            }
        }
    }
}

private struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("report_title", comment: ""))
                .font(.largeTitle.bold())
                .padding(.bottom, 10)
            
            Text(NSLocalizedString("report_notice", comment: ""))
                .font(.headline)
                .fontWeight(.regular)
        }
        .padding(.bottom, 16)
    }
}

private struct LocationSelectorView: View {
    @ObservedObject var viewModel: ReportViewModel
    let floor: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(String(format: NSLocalizedString("floor", comment: ""), floor))
                .font(.title2.bold())
                .padding(.vertical, 16)
            
            HStack {
                GenderButton(viewModel: viewModel, gender: .male, floor: floor)
                GenderButton(viewModel: viewModel, gender: .female, floor: floor)
            }
            .padding(.trailing)
        }
    }
}

#Preview {
    MainView(viewModel: ReportViewModel())
}
