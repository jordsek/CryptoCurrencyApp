//
//  ImageCache.swift
//  NitendoAmibo
//
//  Created by Jordan Isac on 19/05/2023.
//

import Foundation
import UIKit
class ImageCache {
    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()

    private init() {}

    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
