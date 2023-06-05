//
//  TrendingResults.swift
//  ProyectoMovies
//
//  Created by Paulina on 18/05/23.
//


import Foundation
struct TrendingResults: Decodable
{
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
