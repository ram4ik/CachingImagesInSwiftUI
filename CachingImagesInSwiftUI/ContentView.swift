//
//  ContentView.swift
//  CachingImagesInSwiftUI
//
//  Created by Ramill Ibragimov on 04.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var photoListVM = PhotoListViewModel()
    
    var body: some View {
        NavigationView {
            List(photoListVM.photos) { photo in
                HStack {
                    AsyncImage(url: photo.thumbnailUrl)
                    Text(photo.title)
                }
                .task {
                    await photoListVM.populatePhotos()
                }
            }
            .navigationTitle("Photos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
