//
//  ImageLoader.swift
//  Neumorphism
//
//  Created by Anatolii Zavialov on 03.03.2020.
//  Copyright © 2020 Anatolii Zavialov. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    private var cancellableTask: AnyCancellable?
    @Published var downloadedImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        cancellableTask = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.downloadedImage, on: self)
    }
    
    func cancel() {
        cancellableTask?.cancel()
    }
}

