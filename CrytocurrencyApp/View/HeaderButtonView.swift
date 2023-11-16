//
//  HeaderButtonView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 15/11/2023.
//

import SwiftUI

struct HeaderButtonView: View {
    //MARK: - properties
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.black)
            .frame(width: 40, height: 35)
            .background(
                Circle()
                    .foregroundStyle(Color.BG)
            )
            .shadow(
                color: Color.black.opacity(0.25),
                radius: 10, x: 0, y: 0)
    }
}

#Preview {
    HeaderButtonView(iconName: "slider.horizontal.3")
    
}
//iconName: "slider.horizontal.3"
