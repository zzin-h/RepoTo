//
//  GenderButton.swift
//  RepoTo
//
//  Created by Haejin Park on 5/12/25.
//

import SwiftUI

struct GenderButton: View {
    @ObservedObject var viewModel: ReportViewModel
    
    let gender: Gender
    let floor: Int
    
    var body: some View {
        GeometryReader { geometry in
            if let location = LocationType(floor: floor, gender: gender.rawValue) {
                Button(action: {
                    viewModel.selectedLocation = location
                }) {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(viewModel.selectedLocation == location ? .blue : Color(.systemGray3),
                                style: StrokeStyle(lineWidth: viewModel.selectedLocation == location ? 3 : 1))
                        .overlay {
                            VStack {
                                Spacer()
                                Spacer()
                                
                                Image("\(gender.rawValue)")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: geometry.size.height * 0.58)
                                
                                Spacer()
                                
                                Text(NSLocalizedString("\(gender.rawValue)_button", comment: ""))
                                    .font(.title2.bold())
                                
                                Spacer()
                            }
                            .foregroundStyle(viewModel.selectedLocation == location ? .blue : Color(.systemGray3))
                        }
                }
            }
        }
    }
}
