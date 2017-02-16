library("tidyr")
library("dplyr")
library("ggplot2")
library("gridExtra")
source("config.R")

### tambourine man coord_cartesian(xlim = c(0, 329))
### watchtower coord_cartesian(xlim = c(0, 151))

print_one_song <- function (data,type, duration){
  one_song <- read.csv(file = paste0("data/",data,".csv"), sep = ",", header = T, stringsAsFactors = F)
  
  startTime = as.data.frame(matrix(unlist(strsplit(one_song$Start,":")), ncol = 2, byrow = T), stringsAsFactors = FALSE)
  names(startTime) <- c("startm", "starts")
  one_song <- cbind(one_song, startTime)
  
  one_song$start <- (as.integer(one_song$startm)*60) + as.integer(one_song$starts)
  
  base_plot <- ggplot() + geom_point(data = one_song, aes(x = start, y = 0, group = Kategorie, color = Kategorie), size = 6, alpha = 0.6) + sztheme_points
  base_plot <- base_plot + scale_color_manual(values = farben) + scale_fill_manual(values = farben)  + coord_cartesian(xlim = c(0, duration))
  
  article_plot <- base_plot + scale_x_continuous(name = "Laufzeit in Minuten", labels = c("Start","1 min", "2 min","3 min","4 min","5 min","6 min", "7 min", "8 min","9 min","10 min","11 min"), breaks = c(0,60,120,180,240,300,360,420,480,540,600,660))
  article_plot <- article_plot + guides(color = guide_legend(nrow = 1))
  
  mobile_plot <- base_plot + scale_x_continuous(name = "Laufzeit in Minuten", labels = c("Start","1", "2","3","4","5","6", "7", "8","9","10","11"), breaks = c(0,60,120,180,240,300,360,420,480,540,600,660))
  mobile_plot <- mobile_plot + guides(col = guide_legend(ncol = 2)) + sztheme_points_mobile
  
  link_plot <- mobile_plot + sztheme_point_linkbild
  
  # ggsave(filename = paste0("images/",type,"-", data,".svg"), plot = article_plot, dpi = 144, height = 3.2, width = 13.06)# 8.89)
  ggsave(filename = paste0("images/link-",type,"-", data,".png"), plot = link_plot, dpi = 144, height = 1.3, width = 8.89)
  ggsave(filename = paste0("images/link-mobile-",type,"-", data,".png"), plot = link_plot, dpi = 144, height = 1.3, width = 4.44)
  # ggsave(filename = paste0("images/mobile-",type,"-", data,".svg"), plot = mobile_plot, dpi = 144, height = 3.2, width = 4.44)# 8.89)
}

print_article_versions <- function(){
  print_one_song("aint-talking","article", 528)
  print_one_song("watchtower","article", 151)
  print_one_song("idiot-wind","article", 468)
  print_one_song("tambourine-man","article", 329)
  print_one_song("desolation-row","article", 682)
}
print_normalized_version <- function(){
  print_one_song("tambourine-man","normalized", 682)
  print_one_song("watchtower","normalized", 682)
  print_one_song("idiot-wind","normalized", 682)
  print_one_song("aint-talking","normalized", 682)
  print_one_song("desolation-row","normalized", 682)
}
print_article_versions()
# print_normalized_version()
