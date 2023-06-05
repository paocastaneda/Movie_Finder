//
//  Movie.swift
//  ProyectoMovies
//
//  Created by Paulina on 18/05/23.
//



import Foundation

struct Movie: Identifiable, Decodable
{
    let adult: Bool
    let id: Int
    let poster_path: String?
    let title: String
    let overview: String
    let vote_average: Float
    let backdrop_path: String?
    
    var backdropURL: URL?
    {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    
    var postThumbnail: URL?
    {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    var poster: URL?
    {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    
    init(adult: Bool, id: Int, poster_path: String?, title: String, overview: String, vote_average: Float, backdrop_path: String?) {
        self.adult = adult
        self.id = id
        self.poster_path = poster_path
        self.title = title
        self.overview = overview
        self.vote_average = vote_average
        self.backdrop_path = backdrop_path
    }
    
    static var preview: Movie
    {
        return Movie(adult: false,
                     id: 23834,
                     poster_path: "https://image.tmdb.org/t/p/w300",
                     title: "Free Guy",
                     overview: "demo text",
                     vote_average: 5.5,
                     backdrop_path: "https://image.tmdb.org/t/p/w300")
    }
}

struct Movie2: Identifiable, Codable
{
    let adult: Bool
    let id: Int
    let poster_path: String?
    let title: String
    let overview: String
    let vote_average: Float
    let backdrop_path: String?
    var backdropURL: URL?
    {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    
    var postThumbnail: URL?
    {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    var poster: URL?
    {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    
    init(adult: Bool, id: Int, poster_path: String?, title: String, overview: String, vote_average: Float, backdrop_path: String?) {
        self.adult = adult
        self.id = id
        self.poster_path = poster_path
        self.title = title
        self.overview = overview
        self.vote_average = vote_average
        self.backdrop_path = backdrop_path
    }
    
    static var preview: Movie2
    {
        return Movie2(adult: false,
                     id: 23834,
                     poster_path: "https://image.tmdb.org/t/p/w300",
                     title: "Free Guy",
                     overview: "demo text",
                     vote_average: 5.5,
                     backdrop_path: "https://image.tmdb.org/t/p/w300")
    }

}

struct MovieResponse: Codable
{
    let results: [Movie2]
}
