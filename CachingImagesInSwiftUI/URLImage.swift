//
//  URLImage.swift
//  CachingImagesInSwiftUI
//
//  Created by Ramill Ibragimov on 04.01.2022.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    let url: URL?
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        VStack {
            if let uiImage = imageLoader.uiImage {
                Image(uiImage: uiImage)
            } else {
                ProgressView("Loading...")
            }
        }
        .task {
            await downloadImage()
        }
    }
    
    private func downloadImage() async {
        do {
            try await imageLoader.fetchImage(url)
        } catch {
            print(error)
        }
    }
}
