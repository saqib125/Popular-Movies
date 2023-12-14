//
//  MoviePresMainView.swift
//  PopularMovies
//
//  Created by Saqib Siddique on 13/12/2023.
//

import SwiftUI

struct MoviePresMainView: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(self.movies) { movie in
                        MovieRecordMainCard(movie: movie)
                            .frame(width: 272, height: 200)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    MoviePresMainView(title: "Latest", movies: Movie.MovieJsonRecord)
}
