
# ggplot(aes(x = date, y = value, color = metric)) +
plot_fndtion <- ggplot() +
  # geom_line() +
  geom_line(
    aes(x = date, y = value)
    , data = covid_trn_lng_plt %>% filter(terrain == 'mainland', metric == 'cases avg per 100k')
    , stat = 'identity'
    , color = "#69b3a2"

  ) +
  geom_density(
    aes(x = date, y = value)
    , data = covid_trn_lng_plt %>% filter(terrain == 'mainland', metric != 'cases avg per 100k')
    , stat = 'identity'
    , fill = "#69b3a2"
    , color = "#69b3a2"
  ) +
  geom_line(
    aes(x = date, y = value)
    , data = covid_trn_lng_plt %>% filter(terrain != 'mainland', metric == 'cases avg per 100k')
    , stat = 'identity'
    , color = "#82a7e8"

  ) +
  geom_density(
    aes(x = date, y = value)
    , data = covid_trn_lng_plt %>% filter(terrain != 'mainland', metric != 'cases avg per 100k')
    , stat = 'identity'
    , fill = "#82a7e8"
    , color = "#82a7e8"
  ) +

  facet_grid(metric ~ terrain , scales = 'free_y') +
  # theme_solarized() +
  theme_wsj() +
  theme(
    strip.text.y = element_text(angle = 0)
    # , panel.grid = element_line(color = 'red')
  )

plot_fndtion
#
# p <- plot_fndtion
# p
# g <- ggplot_gtable(ggplot_build(p))
# strip_both <- which(grepl('strip-', g$layout$name))
# fills <- c("#82a7e8","#69b3a2","#fbf3e3","#fbf3e3"
#            # ,"red","green","blue","yellow"
# )
# k <- 1
# for (i in strip_both) {
#   j <- which(grepl('rect', g$grobs[[i]]$grobs[[1]]$childrenOrder))
#   g$grobs[[i]]$grobs[[1]]$children[[j]]$gp$fill <- fills[k]
#   k <- k+1
# }
# grid.draw(g)
#
