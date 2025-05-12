//
//  AppDelegate.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        NotificationCenter.default.post(name: .handleOpenURL, object: url)
        return true
    }
}
