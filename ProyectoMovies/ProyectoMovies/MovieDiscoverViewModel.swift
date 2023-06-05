//
//  MovieDiscoverViewModel.swift
//  ProyectoMovies
//
//  Created by Paulina on 18/05/23.
//

import Foundation
import SwiftUI

class MovieDiscoverViewModel: ObservableObject
{
    @Published var trending: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    static let apiKey = "3e651fe0e8197f2e1418517704bbdf67"
    static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZTY1MWZlMGU4MTk3ZjJlMTQxODUxNzcwNGJiZGY2NyIsInN1YiI6IjY0NjEzNjA3OGM0NGI5MDE3MDZmMzk3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XeQNOYsDaIY7oeV1z1FwkWOb06LHqJjRJ9jLYnu4u_k"
    
  
/*https://api.themoviedb.org/3/movie/550?api_key=3e651fe0e8197f2e1418517704bbdf67
https://api.themoviedb.org/3/trending/movie/day?api_key=3e651fe0e8197f2e1418517704bbdf67*/
    
    func loadTrending()
    {
        Task
        {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDiscoverViewModel.apiKey)")!
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                trending = trendingResults.results
            }
            catch
            {
                
                print(error.localizedDescription)
            }
        }
    }
    func search(term: String)
    {
        Task
        {
//        https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDiscoverViewModel.apiKey)&language=en-US&page=1&include_adult=false&query=\(term) ".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                searchResults = trendingResults.results
            }
            catch
            {
                
                print(error.localizedDescription)
            }
            
        }
    }
    
   
}


