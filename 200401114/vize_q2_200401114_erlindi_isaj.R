library(httr)

spotify_search_artist <- function(artist_name){
  if(is.character(artist_name) == F){
    return(list(status_code=NULL, search_results=NULL))
  }
  
  auth <- POST(
    "https://accounts.spotify.com/api/token",
    config = authenticate(user = Sys.getenv("SPOTIFY_ID"), 
                          password = Sys.getenv("SECRET_KEY")),
    body = list(grant_type = "client_credentials"), 
    encode = "form"
  )
  getToken <-  content(auth)
  bearer.Token = paste(getToken$token_type, getToken$access_token)
  
  response <- GET(
    "https://api.spotify.com/v1/search",
    config = add_headers(Authorization = bearer.Token),
    query = list(q = artist_name, type = "artist")
  )
  content <- content(response)
  search_result <- data.frame(
    artist = sapply(content$artists$items, function(artist_info){
      artist_info$name
    }),
    id = sapply(content$artists$items, function(artist_info){
      artist_info$id
    })
  )
  return(list(status_code=response$status_code, search_results=search_result))
}