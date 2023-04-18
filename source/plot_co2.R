library(tidyverse)
library(lubridate)

plot_co2 <- function(
    # Arguments
    color_choice = "lightblue4", 
    ylim = c(400,800),
    xlim = c(0, 12500), 
    title_text = ""
    )
  {
  # Function definition
  co2 <- read_csv("data/Aranet4 0C39F_2023-04-07T17_14_19-0600.csv") |> 
    rename(co2.ppm = `Carbon dioxide(ppm)`,
           temp.C = `Temperature(°C)`,
           RH = `Relative humidity(%)`,
           P.hPa = `Atmospheric pressure(hPa)`,
           time.str = `Time(dd/mm/yyyy)`
    ) |> 
    mutate(
      datetime = as_datetime(time.str, format = "%d/%m/%Y %H:%M:%S %Op", tz = "MST"),
      dt = as.numeric(difftime(datetime, "2023-03-30 09:32:50", units = "mins"))
    ) 
  p_co2 <- co2 |> 
    ggplot() +
    aes(
      x = dt,
      y = co2.ppm
    ) +
    geom_line(color = color_choice) +
    coord_cartesian(xlim = xlim, ylim = ylim) +
    labs(
      x = "∆t (minutes)",
      y = "Carbon dioxide (ppm)",
      title = title_text
    ) +
    theme_bw() +
    theme(
      panel.grid = element_blank()
    )
  return(p_co2)
}

plot_co2(color_choice = "orange", xlim = c(0, 400))
