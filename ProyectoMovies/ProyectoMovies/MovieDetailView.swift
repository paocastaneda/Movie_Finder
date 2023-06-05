//
//  MovieDetailView.swift
//  ProyectoMovies
//
//  Created by Paulina on 18/05/23.
//

import Foundation
import SwiftUI

struct MovieDetailView: View
{
    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    @State private var isLiked = false
    @State private var likedMovies: [Movie] = []
    let movie: Movie
    let headerHeight: CGFloat = 400
    var body: some View
    {
        ZStack
        {
            Color(red: 39/255, green:40/255, blue: 59/255)
            GeometryReader
            {
                geo in
                VStack
                {
                    AsyncImage(url: movie.backdropURL)
                    {
                        image in image .resizable().scaledToFill().frame(maxWidth: geo.size.width, maxHeight: headerHeight).clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
            }
            ScrollView
            {
                VStack (spacing: 12)
                {
                    Spacer().frame(height: headerHeight)
                    
                    HStack{
                        Text(movie.title).font(.title2).fontWeight(.heavy).foregroundColor(.white)
                        Spacer()
                    }
                    
                    HStack
                    {
//                        agregado
                    Spacer()
                    Button(action: {
                    isLiked.toggle()
                    if isLiked
                        {
                        likedMovies.append(movie)
                    }
                        else
                        {
                            likedMovies.removeAll {$0.id == movie.id}
                        }
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
           }.foregroundColor(.white)
                    }
//                    agregado
                    
                    HStack
                    {
                        Text("Sinopsis").font(.title3).fontWeight(.bold).foregroundColor(.white)
                        Spacer()
                    }
                    Text(movie.overview).lineLimit(20).foregroundColor(.white)
                    
                    HStack
                    {
                        Text("Cast").font(.title3).fontWeight(.bold).foregroundColor(.white)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        LazyHStack
                        {
                            ForEach(model.castProfiles)
                            { cast in
                            CastView(cast: cast).foregroundColor(.white)
                        }
                        }
                    }
                }.padding()
            }
        }.ignoresSafeArea().overlay(alignment: .topLeading)
        {
            Button
            {
                dismiss()
            } label:
            {
                Image(systemName: "chevron.left").imageScale(.large).fontWeight(.bold)
                
            }.padding(.leading)
        }.toolbar(.hidden, for: .navigationBar).task
        {
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
        }
        
//        .navigationTitle(Text(movie.title))
        
    }
}


struct MovieDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MovieDetailView(movie: .preview)
    }
}

struct CastView: View {

    let cast: CastProfile

    var body: some View {
        VStack {
            AsyncImage(url: cast.photoUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 120)
            }
            Text(cast.name)
                .lineLimit(1)
                .frame(width: 100)
        }
    }

}
