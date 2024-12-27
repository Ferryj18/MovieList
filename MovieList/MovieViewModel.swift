//
//  File.swift
//  MovieList
//
//  Created by Ferry jati on 23/12/24.
//

import Foundation

class MovieViewModel {
    private var apiCaller: APICaller
    private var titles: [Title] = []

    // Initialize with an instance of the API
    init(apiCaller: APICaller = .shared) {
        self.apiCaller = apiCaller
    }

    func fetchTrendingMovies(completion: @escaping () -> Void) {
        apiCaller.getTrendingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
            completion()
        }
    }

    func fetchPopularMovies(completion: @escaping () -> Void) {
        apiCaller.getPopular { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
            completion()
        }
    }

    func getTitles() -> [Title] {
        return titles
    }
}
