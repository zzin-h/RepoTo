//
//  RepoToApp.swift
//  RepoTo
//
//  Created by Haejin Park on 5/11/25.
//

import SwiftUI

@main
struct RepotoApp: App {
    @StateObject private var viewModel = ReportViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if viewModel.source == .inApp {
                    MainView(viewModel: viewModel)
                } else {
                    ReportContentView(viewModel: viewModel)
                }
            }
            .onOpenURL { url in
                URLHandler(viewModel: viewModel).urlHandler(url)
            }
        }
    }
}
