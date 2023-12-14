//
//  MovieJsonRecoerdView.swift
//  PopularMovies
//
//  Created by Saqib Siddique on 13/12/2023.
//

import SwiftUI

extension Movie {
    
    static var MovieJsonRecord: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "popular")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        MovieJsonRecord[0]
    }
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}
