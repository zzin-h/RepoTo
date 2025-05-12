//
//  MailCompose.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI
import MessageUI

struct MailCompose: UIViewControllerRepresentable {
    @ObservedObject var viewModel: ReportViewModel
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = context.coordinator
        mailComposeVC.setToRecipients(["jelly09@postech.ac.kr"])
        
        let bodyText: String
        
        switch viewModel.source {
        case .inApp:
            bodyText = viewModel.reportMessage
        case .link:
            bodyText = viewModel.reportMessage
        @unknown default:
            bodyText = "Unknown Content"
        }
        
        mailComposeVC.setSubject(bodyText)
        mailComposeVC.setMessageBody(bodyText, isHTML: false)
        
        return mailComposeVC
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailCompose
        
        init(parent: MailCompose) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            
            parent.presentationMode.wrappedValue.dismiss()
            
            if result == .sent {
                DispatchQueue.main.async {
                    self.parent.viewModel.isShowingAlert = true
                    
                }
            }
        }
    }
}
