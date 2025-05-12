//
//  ReportContentView.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

struct ReportContentView: View {
    @ObservedObject var viewModel: ReportViewModel
    
    var body: some View {
        var isLink: Bool {
            viewModel.source == .link
        }
        
        ZStack {
            VStack(alignment: .leading) {
                HeaderView(viewModel: viewModel, isLink: isLink)
                
                if isLink {
                    ToiletMapImage(viewModel: viewModel)
                } else {
                    ToiletMapButton(viewModel: viewModel)
                }
                
                SelectReportContent(viewModel: viewModel)
                
                SelectReportRoute(viewModel: viewModel)
            }
            .padding(.leading, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if viewModel.isShowingAlert {
                CompletedReportAlert(viewModel: viewModel)
            }
        }
    }
}

private struct HeaderView: View {
    @ObservedObject var viewModel: ReportViewModel
    
    var isLink: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            if isLink {
                Text(viewModel.selectedLocation?.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.headline)
                    .padding(.vertical, 10)
            }
            
            Divider()
                .foregroundStyle(.gray)
                .padding(.leading, -16)
                .padding(.bottom, 16)
            
            Text(NSLocalizedString("location_title", comment: ""))
                .font(.title2.bold())
                .padding(.bottom, 10)
            
            Text(NSLocalizedString("location_notice", comment: ""))
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding(.bottom, 16)
    }
}

private struct ToiletMapImage: View {
    @ObservedObject var viewModel: ReportViewModel
    
    var body: some View {
        Image(viewModel.selectedReportLocation.rawValue)
            .resizable()
            .scaledToFit()
            .edgesIgnoringSafeArea(.all)
            .padding(.trailing, 16)
            .padding(.bottom, 16)
    }
}

private struct SelectReportContent: View {
    @ObservedObject var viewModel: ReportViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("report_content_title", comment: ""))
                .font(.title2.bold())
                .padding(.bottom, 10)
            
            HStack {
                ReportContentButton(viewModel: viewModel, reportContent: .clog)
                ReportContentButton(viewModel: viewModel, reportContent: .paper)
                ReportContentButton(viewModel: viewModel, reportContent: .sos)
            }
            .frame(height: 170)
            .padding(.trailing, 16)
        }
    }
}

private struct SelectReportRoute: View {
    @ObservedObject var viewModel: ReportViewModel
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        let teams = TeamsCompose(viewModel: viewModel)
        
        VStack {
            HStack {
                ReportRouteButton(viewModel: viewModel, route: .teams, onTap: { viewModel.reportRoute = .teams; teams.openTeamsChat(); })
                ReportRouteButton(viewModel: viewModel, route: .mail, onTap: { viewModel.reportRoute = .mail; isPresented = true; })
            }
            .padding(.trailing, 16)
        }
        .sheet(isPresented: $isPresented) {
            MailCompose(viewModel: viewModel)
        }
    }
}

#Preview {
    ReportContentView(viewModel: ReportViewModel())
}
