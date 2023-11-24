library(httr)

spotify_token <- function(){
  response <- POST(
    "https://accounts.spotify.com/api/token",
    config = authenticate(user = Sys.getenv("SPOTIFY_ID"), 
                          password = Sys.getenv("SECRET_KEY")),
    body = list(grant_type = "client_credentials"), 
    encode = "form"
  )
  getToken <-  content(response)
  bearer.Token = paste(getToken$token_type, getToken$access_token)
  return(list(status_code = response$status_code, token=bearer.Token))
}
