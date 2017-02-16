farben = c("Biografisches" = "#16CCFF","Historisches" = "#3D6999","Musik" = "#6fda89", "Literatur & Film" = "#FF7568", "Religion" = "#CCC739", "Märchen & Mythen" = "#A0414D")

sztheme_points <- theme(
  strip.background = element_blank(),
  strip.text.y = element_blank(),
  strip.text.x = element_blank(),
  axis.text.y = element_blank(),
  axis.text.x = element_text(family = "SZoSansCond-Light", size = 18, colour = "#999999"),
  axis.ticks = element_blank(),
  axis.title.x = element_text(family = "SZoSansCond-Light", size = 18, margin = margin(t = 20), colour = "#999999"),
  axis.title.y = element_blank(),
  panel.background = element_blank(),
  panel.border = element_blank(),
  panel.grid.major.x = element_line(color = "#FFFFFF", size = 0.5),
  panel.grid.major.y = element_blank(),
  panel.grid.minor = element_blank(),
  legend.margin = margin(0.1, 0, 0.4, 0, "cm"),
  legend.background = element_blank(),
  legend.title = element_blank(),
  legend.position = "bottom",
  legend.direction = "vertical",
  legend.key = element_blank(),
  legend.text = element_text(family = "SZoSans-Light", size = 16, colour = "#999999", margin = margin(r = 1, l = 1)),
  plot.background = element_rect(fill = "#eeeeee"),
  plot.margin = margin(2, 0, 0.7, 0, "cm")
)

sztheme_points_mobile <- theme(
  legend.margin = margin(0, 0, 10, 25, "pt"),
  legend.text = element_text(family = "SZoSans-Light", size = 16, colour = "#999999"),# margin = margin(r = .5, l = .5)),
  plot.margin = margin(40, 10, 20, 10, "pt")
)

sztheme_point_linkbild <- theme(
  plot.margin = margin(20, 10, 10, 10, "pt"),
  axis.title.x = element_text(family = "SZoSansCond-Light", size = 18, margin = margin(t = 10), colour = "#999999"),
  legend.position = "none"
)

sztheme_histodot <- theme(
  strip.background = element_blank(),
  strip.text.y = element_blank(),
  strip.text.x = element_blank(),
  axis.text.y = element_blank(),
  axis.text.x = element_text(family = "SZoSansCond-Light", size = 18, colour = "#999999"),
  axis.ticks = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  panel.background = element_blank(),
  panel.border = element_blank(),
  panel.grid.major.x = element_line(color = "#FFFFFF", size = 0.6),
  panel.grid.minor.x = element_line(color = "#FFFFFF", size = 0.3),
  panel.grid.major.y = element_blank(),
  panel.grid.minor.y = element_blank(),
  legend.background = element_blank(),
  legend.title = element_blank(),
  legend.position = "top",
  legend.direction = "horizontal",
  legend.key = element_blank(),
  legend.text = element_text(family = "SZoSans-Light", size = 16, colour = "#999999"),
  plot.background = element_rect(fill = "#eeeeee"),
  plot.margin = margin(0.2, 0.1, 0.3, 0.1, "in")
)

sztheme_histodot_covered <- theme(
  strip.background = element_blank(),
  strip.text.y = element_blank(),
  strip.text.x = element_blank(),
  axis.text.y = element_blank(),
  axis.text.x = element_text(family = "SZoSansCond-Light", size = 18, colour = "#999999"),
  axis.ticks = element_blank(),
  panel.background = element_blank(),
  panel.border = element_blank(),
  panel.grid.major.x = element_blank(),
  panel.grid.minor.x = element_blank(),
  panel.grid.major.y = element_blank(),
  panel.grid.minor.y = element_blank(),
  legend.background = element_blank(),
  legend.title = element_blank(),
  legend.position = "top",
  legend.direction = "horizontal",
  legend.key = element_blank(),
  legend.text = element_text(family = "SZoSans-Light", size = 16, colour = "#999999"),
  plot.background = element_rect(fill = "#eeeeee"),
  plot.margin = margin(0, 0.1, 0.3, 0.1, "in")
)