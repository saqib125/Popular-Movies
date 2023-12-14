//
//  MovieRecordMainCard.swift
//  PopularMovies
//
//  Created by Saqib Siddique on 13/12/2023.
//

import SwiftUI

struct MovieRecordMainCard: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    @State private var isDetailViewActive = false
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(
                destination: MovieDetailView(movieId: movie.id),
                isActive: $isDetailViewActive
            ) {
                EmptyView()
            }
            .hidden()
            
            Button(action: {
                self.isDetailViewActive = true
            }, label: {
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                    if self.imageLoader.image != nil {
                        Image(uiImage: self.imageLoader.image!)
                            .resizable()
                    }
                }
                .aspectRatio(16/9, contentMode: .fit)
                .cornerRadius(8)
                .shadow(radius: 4)
            })
            Text(movie.title)
                .font(.system(size: 15,weight: .bold))
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}


#Preview {
    MovieRecordMainCard(movie: Movie.stubbedMovie)
}

