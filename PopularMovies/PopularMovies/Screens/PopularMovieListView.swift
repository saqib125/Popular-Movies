//
//  PopularMovieListView.swift
//  PopularMovies
//
//  Created by Saqib Siddique on 13/12/2023.
//

import SwiftUI

struct PopularMovieListView: View {
    
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        NavigationView {
            if popularState.movies != nil {
                MoviePresMainView(title: "Popular Movies", movies: popularState.movies!)
            } else {
                LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                    self.popularState.loadMovies(with: .popular)
                }
            }
        }
        .onAppear {
            self.popularState.loadMovies(with: .popular)
        }
        
    }
}

#Preview {
    PopularMovieListView()
}
