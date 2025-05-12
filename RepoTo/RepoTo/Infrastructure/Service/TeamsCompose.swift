//
//  TeamsCompose.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

struct TeamsCompose {
    @ObservedObject var viewModel: ReportViewModel
    
    func openTeamsChat() {
        let email = "jelly09@postech.ac.kr"
        var message: String
        
        switch viewModel.source {
        case .inApp:
            message = viewModel.reportMessage
        case .link:
            message = viewModel.reportMessage
        @unknown default:
            message = "Unknown Error"
        }
        
        let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://teams.microsoft.com/l/chat/0/0?users=\(email)&message=\(encodedMessage)"
        
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url) { success in
                if success {
                    DispatchQueue.main.async {
                        viewModel.isShowingAlert = true
                    }
                } else {
                    print("Teams 앱을 열 수 없습니다.")
                }
            }
        } else {
            print("Teams 앱 오류")
        }
    }
}
