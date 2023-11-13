//
//  RemoteImage.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import SwiftUI

struct RemoteImage: View {
    //MARK: -properties
    @ObservedObject var imageLoader: ImageLoader

    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .renderingMode(.original)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

#Preview {
    RemoteImage(url: "")
}
