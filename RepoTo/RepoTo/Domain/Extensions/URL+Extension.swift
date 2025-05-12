//
//  URL+Extension.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import Foundation

extension URL {
    func extractQueryParameters() -> [String: String] {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else { return [:] }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        return parameters
    }
}
