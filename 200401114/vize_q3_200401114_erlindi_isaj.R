source("vize_q2_200401114_erlindi_isaj.R")

artists_names <- c("Ed Sheeran", "Drake Up", "Taylor Swift", "The Weekend", "Justin Biber")

my_artists <- data.frame(
  artist = sapply(artists_names, function(artist_info){
    spotify_search_artist(artist_info)$search_results[[1]][[1]]
  }),
  id = sapply(artists_names, function(artist_info){
    spotify_search_artist(artist_info)$search_results[[2]][[1]]
  })
)


