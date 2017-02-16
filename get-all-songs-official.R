library("rvest")
library("XML")
library("magrittr")
library("dplyr")
library("tidyr")

song_table <- data.frame()

page <- read_html("http://bobdylan.com/songs/")
songs <- html_nodes(page, ".line_detail")

songTitle <- vector()
origAuthor <- vector()
firstPlayed <- vector()
coveredBy <- vector()
firstAlbum <- vector()

make_date <- function (rawDate){
  Sys.timezone(FALSE)
  t <- substr(rawDate, 6,7)
  m <- translate_month(substr(rawDate, 2,4))
  j <- substr(rawDate, 10,13)
  date <- as.Date(paste0(t,m,j), "%d%B%Y", tz = "")
  print(paste0(m, " datum ", date))
  date
}

translate_month <- function(m){
  switch (m, Mar = "März", May = "MAI", Oct = "OKT", Dec = "DEZ", m)
}

for (song in seq_along(songs)){
  songTitle <- rbind(songTitle, html_text(html_node(songs[song], ".song")))
  firstAlbum <- rbind(firstAlbum, html_text(html_node(songs[song], ".release")))
  rawDate <- html_text(html_node(songs[song], ".played"))
  firstPlayed <- rbind(firstPlayed, make_date(rawDate))
  songPage <- read_html(html_attr(html_node(html_node(songs[song], ".song"), "a"),"href"))
  rawAuthor <- html_text(html_node(songPage, ".credit"))
  author <- unlist(strsplit(gsub("\\n*\\t*", "", rawAuthor), "Written by: "))[2]
  origAuthor <- rbind(origAuthor, author)
  song_table <- data.frame(songTitle, firstAlbum, firstPlayed, origAuthor, stringsAsFactors = F)
}
class(song_table$firstPlayed) <- "Date"

album_table  <- data.frame()

albumpage <- read_html("http://bobdylan.com/albums/")
album <- html_nodes(albumpage, ".item")

albumTitel <- vector()
albumRelease <-vector()

for (one in seq_along(album)){
  albumTitel <- rbind(albumTitel, html_text(html_node(album[one], "h3")))
  albumRelease <- rbind(albumRelease, html_text(html_node(album[one], ".year")))
  album_table <- data.frame(albumTitel, albumRelease, stringsAsFactors = F)
}

song_table <- mutate(song_table, albumRelease = album_table$albumRelease[match(song_table$firstAlbum, album_table$albumTitel)])
write.csv(song_table, "data/all-dylan-songs.csv")


# write.csv(album_table, "data/all_dylan_albums.csv")


