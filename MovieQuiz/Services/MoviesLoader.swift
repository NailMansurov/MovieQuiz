//
//  MoviesLoader.swift
//  MovieQuiz
//
//  Created by Наиль Мансуров on 04.03.2025.
//

import Foundation

protocol MoviesLoading {
    func loadMovies(
        handler: @escaping (
            Result<MostPopularMovies, Error>
        ) -> Void
    )
}

struct MoviesLoader: MoviesLoading {
    // MARK: - NetworkClient
    private let networkClient = NetworkClient()
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    // MARK: -URL
    private var mostPopularMoviesURL: URL {
        guard let url = URL(string: "https://tv-api.com/en/API/Top250Movies/k_zcuw1ytf") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        return url
    }
    
    func loadMovies(
        handler: @escaping (Result<MostPopularMovies, Error>) -> Void
    ) {
        networkClient.fetch(url: mostPopularMoviesURL) { result in
            switch result {
            case .success(let data):
                do {
                    let mostPopularMovies = try self.jsonDecoder.decode(
                        MostPopularMovies.self,
                        from: data
                    )
                    handler(.success(mostPopularMovies))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
