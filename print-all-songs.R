library("tidyr")
library("dplyr")
library("ggplot2")
library("gridExtra")
source("config.R")

all_songs <- read.csv("data/all-dylan-songs.csv", stringsAsFactors = F)
coveredFromDylan <- read.csv("data/covered-from-dylan.csv", stringsAsFactors = F)

all_songs$songTitle <- tolower(all_songs$songTitle)
coveredFromDylan$songTitle <- tolower(coveredFromDylan$songTitle)

countedCover <- aggregate(
    coveredFromDylan$artist ~ coveredFromDylan$songTitle + coveredFromDylan$artist,
    FUN = length
  )
names(countedCover) <- c("songTitle", "coverCount")

all_songs <- merge(all_songs, countedCover, by = "songTitle", all.x = T)
coveredFromDylan <- select(merge(coveredFromDylan, all_songs, by = "songTitle", all.x = T), -firstAlbum,-firstPlayed, -origAuthor, -notes)
coveredFromDylan$coverCount <- countedCover$coverCount[match(coveredFromDylan$songTitle, countedCover$songTitle)]
coveredFromDylan <- coveredFromDylan[order(coveredFromDylan$coverCount, decreasing=T),]

all_songs <- mutate(all_songs, covered = ifelse(grepl("Bob Dylan", all_songs$origAuthor, fixed = T),0,1))

coveredFromDylanMini <- filter(all_songs, !is.na(all_songs$coverCount))

uniqueReleaseYears <- unique(hisSongs$albumRelease)

########### plots ##############

#### dylan songs as dotplot #####

print_dylan_songs <- function (){
  plotCover <- ggplot(data = all_songs, aes(x = albumRelease, fill= factor(covered))) + sztheme_histodot + coord_cartesian(xlim = c(1960, 2017)) + geom_dotplot(
    stackgroups = T,
    binwidth = .9,
    dotsize = .9,
    method = "histodot",
    binpositions="all",
    stackdir = "center",
    color = NA
  ) + scale_x_continuous(breaks = c(1960, 1970, 1980, 1990, 2000, 2010)) + 
    scale_fill_manual(values = c("#000000", "#999999"),labels = c("eigene Songs", "gecoverte Titel")) +
    guides(col = guide_legend(nrow = 1))
  print(plotCover)
  # ggsave("images/all-dylan-songs.png", plot = plotCover, dpi = 144,  height = 9, width = 8.89)
  ggsave("images/all-dylan-songs-mobile.png", plot = plotCover, dpi = 144,  height = 7, width = 4.44)
}

#### covered from Dylan, what songs have been covered #####
print_covered_from_him_mini <- function (){
  miniplot <-
    ggplot(data = coveredFromDylanMini, aes(x = albumRelease)) + sztheme_histodot + coord_cartesian(xlim = c(1960, 2017)) + geom_dotplot(
      binwidth = 1,
      dotsize = .5,
      method = "histodot",
      fill = "#ef6d72",
      stackdir = "center",
      color = NA
    ) + scale_x_continuous(breaks = c(1960,1970,1980,1990,2000,2010))
  # ggsave("images/all-covered-from-him.png", plot = miniplot, dpi = 144, height = 3, width = 8.89)
  ggsave("images/all-covered-from-him-mobile.png", plot = miniplot, dpi = 144, height = 2, width = 4.44)
  }

####### covered from dylan, all songs counted ######
## prepared data for futher workflow in illustrator
print_covered_from_him <- function ()
{
    plotCover <- ggplot(data = coveredFromDylan, aes(x = reorder(songTitle,coverCount))) + sztheme_histodot_covered + geom_dotplot(
      binwidth = 1,
      dotsize = .9,
      stackratio = 1.2,
      method = "histodot",
      color = NA,
      alpha = 0.6
    ) + coord_flip() + scale_y_continuous(limits = c(0,0.7))
    print(plotCover)
  ggsave("images/all-covered-songs-counted.svg", plot = plotCover, dpi = 144,  height=36, width=8)
}
print_dylan_songs()
print_covered_from_him_mini()
# print_covered_from_him()