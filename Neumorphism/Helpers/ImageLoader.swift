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
    private var dataTask: URLSessionTask?
    var downloadedImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }

        dataTask = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                     self.didChange.send(nil)
                }
                return
            }
            
            self.downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
            
        }
        dataTask?.resume()
    }
    
    func cancel() {
        if let task = dataTask {
            task.cancel()
        }
    }
}
