//
//  LikedMoviesView.swift
//  ProyectoMovies
//
//  Created by Paulina on 21/05/23.
//

import Foundation
import SwiftUI
struct LikedMoviesView: View {
    @State private var likedMovies: [Movie2] = []

    var body: some View {
        List(likedMovies, id: \.title) { movie in
            Text(movie.title)
        }
    }
}
