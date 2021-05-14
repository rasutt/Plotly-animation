library(plotly)

l = 100
x = seq(-1, 1, len = l)
y = rev(x)
f = function(x, y) {
  x^2 + y^2
}
fxy = outer(x, y, f)

par(mar = rep(0, 4))
fig1 <- plot_ly(x = x, y = y, z = fxy, colorscale = 'Blues', showscale = F,
               hoverinfo = 'skip')
fig2 <- plot_ly(x = x, y = y, z = 0.5 * fxy, colorscale = 'Blues', showscale = F,
               hoverinfo = 'skip')

fig <- plot_ly(x = x, y = y, z = 0.5 * fxy, colorscale = 'Blues', showscale = F,
               hoverinfo = 'skip', frame = list(fig1, fig2))
fig <- fig %>% add_surface(contours = list(
  x = list(highlight = F),
  y = list(highlight = F),
  z = list(highlight = F)
))
fig <- fig %>% layout(
  scene = list(
    xaxis = list(showspikes=F),
    yaxis = list(showspikes=F),
    zaxis = list(showspikes=F)
  )
)
fig
