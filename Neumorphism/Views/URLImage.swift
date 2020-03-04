//
//  URLImage.swift
//  Neumorphism
//
//  Created by Anatolii Zavialov on 03.03.2020.
//  Copyright © 2020 Anatolii Zavialov. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImage: View {
    @ObservedObject private var imageLoader = ImageLoader()
    private var urlString: String
    var placeholder: Image
    
    init(url: String, placeholder: Image = Image("placeholder")) {
        self.urlString = url
        self.placeholder = placeholder
    }
    
    var body: some View {
        if let uiImage = imageLoader.downloadedImage {
            return Image(uiImage: uiImage)
            .onAppear {}
            .onDisappear {}
        } else {
            return placeholder
                .onAppear {
                    self.imageLoader.load(url: self.urlString)
            }
            .onDisappear {
                self.imageLoader.cancel()
            }
        }
    }
    
}
