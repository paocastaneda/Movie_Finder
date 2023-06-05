//
//  DiscoverView.swift
//  ProyectoMovies
//
//  Created by Paulina on 18/05/23.
//


import SwiftUI




struct DiscoverView: View {

    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""
    @State private var randomMovie: Movie2?
//    -----------
    @State private var likedMovies: [Movie2] = []
    @State private var movies: [Movie2] = []
       @State private var randomMovieTitle: String = ""

    var body: some View {
        

            NavigationStack
        {
            ScrollView {
                if searchText.isEmpty
                {
                    if viewModel.trending.isEmpty
                       {
                           Text("No results")

                       }
                       else
                       {
                           HStack
                           {
                               Text("Tendencia").foregroundColor(.white).fontWeight(.heavy).font(.title)
                               Spacer()
                           }.padding(.horizontal)

                               ScrollView(.horizontal, showsIndicators: false)
                               {
                                   HStack
                                   {
                                      ForEach(viewModel.trending)
                                       {
                                           trendingItem in NavigationLink
                                           {
                                               MovieDetailView(movie: trendingItem)
                                           } label:
                                           {
                                               TrendingCard(trendingItem: trendingItem)
                                           }

                                       }
                                   }.padding(.horizontal)
                               }
                          }

                    } else
                {
                        LazyVStack()
                        {
                            ForEach(viewModel.searchResults)
                            {
                                item in
                                HStack
                                {
                                    AsyncImage(url: item.backdropURL)
                                    {
                                        image in image .resizable().scaledToFill().frame(width:80, height: 120)

                                    } placeholder: {
                                        ProgressView().frame(width: 80, height: 120)
                                    }.clipped().cornerRadius(10)

                                    VStack(alignment: .leading)
                                    {
                                        NavigationLink(destination: MovieDetailView(movie: item)) {
                                            Text(item.title).foregroundColor(.white).font(.headline)
                                        }

//                                        Text(item.title).foregroundColor(.white).font(.headline)

                                        HStack
                                        {
                                            Image(systemName: "hand.thumbsup.fill")
                                            Text(String(format: "%.1f", item.vote_average))
                                            Spacer()
                                        }.foregroundColor(.yellow).fontWeight(.heavy)
                                    }
                                    Spacer()
                                }.padding().background(Color(red: 61/255, green:61/255, blue: 88/255)).cornerRadius(20).padding(.horizontal)
                            }
                        }
                }

//               experimentnaod ajaja
                VStack (spacing: 30) {
                    Spacer()
                    Text("Find a new").foregroundColor(.white).fontWeight(.heavy).font(.title2)
                    Text("MOVIE").foregroundColor(.yellow).fontWeight(.heavy).font(.title2)
                  
                         Button(action: {
                             getRandomMovieTitle()
                         }) {
                             Text("Random Movie")
                                 .font(.headline)
                                 .foregroundColor(.white)
                                 .padding()
                                 .background(Color.blue)
                                 .cornerRadius(10)
                         }
                         .padding()
                    
            
                    
                        Text(randomMovieTitle)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.white)
                    

    
                    
                       
                         List(movies, id: \.title) { movie in
                             Text(movie.title)
                         }
                     }
                     .onAppear {
                         fetchMovies()
                        
                     }

//                   no cambiar esto
               }.background(Color(red: 39/255, green:40/255, blue: 59/255).ignoresSafeArea())

        }.searchable(text: $searchText).onChange(of: searchText)
        {
            newValue in
            if newValue.count > 2
            {
                viewModel.search(term: newValue)
            }

        }.onAppear
        {
            viewModel.loadTrending()
            viewModel.search(term: "")
        }
    }
    
    func fetchMovies() {
            guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=3e651fe0e8197f2e1418517704bbdf67") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                    DispatchQueue.main.async {
                        movies = decodedResponse.results
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
 
    func getRandomMovieTitle() {
            guard !movies.isEmpty else {
                return
            }
            
            let randomIndex = Int.random(in: 0..<movies.count)
            let randomMovie = movies[randomIndex]
            randomMovieTitle = randomMovie.title
    
            
            
        }
    
  
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}



