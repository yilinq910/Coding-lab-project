library(tidyverse)
data_file <- file.path("data", "Public_Health_Statistics_-_Selected_public_health_indicators_by_Chicago_community_area_-_Historical_20261016.csv")
data <- read_csv(
  data_file, 
  col_types = cols(.default = col_character())
)
data <- data %>%
  mutate(indicator_label = factor(indicator_label,
                                  levels = c("Below threshold", "High teen birth rate")))

my_plot <- ggplot(data, aes(x = .data[["indicator_label"]], fill = .data[["indicator_label"]])) +
  geom_bar() +
  geom_text(stat = "count", aes(label = after_stat(count)), hjust = -0.2) +
  scale_fill_manual(values = c("Below threshold" = "grey70",
                               "High teen birth rate" = "#800000"),
                    guide = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  coord_flip() +
  labs(
    title = "Most Chicago community areas fall below a teen birth rate of 70",
    subtitle = "High = teen birth rate of 70 or more (threshold chosen by me)",
    x = "Teen birth rate category",
    y = "Number of community areas (out of 77)",
    caption = stringr::str_wrap(
      "Source: Public Health Statistics - Selected public health indicators by Chicago community area - Historical | Chicago; reference year not confirmed",
      width = 80
    )
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.caption = element_text(hjust = 0),
    plot.caption.position = "plot"
  )

my_plot

dir.create("figures", showWarnings = FALSE)
ggsave(
  filename = "figures/a3-first-plot.png",
  plot = my_plot,
  width = 8, height = 5, units = "in", dpi = 150, bg = "white"
)