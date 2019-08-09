## Data Visualization (GOVT16-QSS17) Summer 2019
## Lab 3
##
## This script loads the RDS data, cleans it, then visualizes it.
## The plot produced shows spikes in Pro-Trump tweets from Russian Troll accounts
## leading up to the 2016 Presidential Election, followed by a clear drop-off after the election.
##
## Name: Thomas Monfre
## Date: August 8, 2019

library(tidyverse)
library(lubridate)
library(ggrepel)
library(ggthemes)

# Load and Filter Data ---------------------------------------------------

df <- readRDS(file = "./output/tweets.rds") %>%
  filter(language == "English",
         account_category == "RightTroll",
         account_type != "?") %>%
  mutate(date = round_date(mdy_hm(publish_date), unit = "day"),
         date = as.character(date),
         date = ymd(date),
         content = tolower(content))

# Build Data Parsing Method --------------------------------------------------------------

# function used to grab pro-trump tweet data from any start and end date
getTweetData <- function(dataFrame, startDate, endDate) {
  output <- dataFrame %>% 
    filter(date %within% interval(start = mdy(startDate), end = mdy(endDate))) %>% 
    arrange(date) %>%
    mutate(protrump = grepl("build\\sthe\\swall", content),
           protrump = grepl("america\\sfirst", content) | protrump,
           protrump = grepl("maga", content) | protrump,
           protrump = grepl("make\\samerica\\sgreat\\sagain", content) | protrump,
           protrump = grepl("crooked\\shillary", content) | protrump,
           protrump = grepl("lock\\sher\\sup", content) | protrump,
           protrump = grepl("fake\\snews", content) | protrump,
           protrump = grepl("fake\\snews\\smedia", content) | protrump,
           protrump = grepl("left\\smedia", content) | protrump,
           protrump = grepl("leftist\\smedia", content) | protrump,
           protrump = grepl("hillary\\sfor\\sprison", content) | protrump) %>%
    group_by(date) %>%
    summarise(value = sum(protrump))
}


# Tidy Data ---------------------------------------------------------------

# grab data around election time
tweetData <- getTweetData(df, "09/08/2016", "12/08/2016") %>% 
  mutate(timeframe = "Election")

# grab data around 100 days in office
tweetData <- bind_rows(tweetData, getTweetData(df, "03/01/2017", "05/29/2017")) %>% 
  mutate(timeframe = ifelse(is.na(timeframe), "100 Days In Office", timeframe))

# reorder timeframe
tweetData <- tweetData %>% 
  mutate(timeframe = factor(timeframe, levels = c("Election", "100 Days In Office")))


# Visualize ---------------------------------------------------------------

# fill tweet frequency
plot <- ggplot(data = tweetData, mapping = aes(x = date, y = value)) +
  geom_area(fill = "#0f1845")

# add cut-off lines and annotations
plot <- plot +
  # add vertical lines
  geom_vline(mapping = aes(
    xintercept = ifelse(timeframe == "Election", ymd("2016-11-08"), ymd("2017-04-29"))
  ), color = "red", size = 1, linetype = "dashed") +
  
  # add labels
  geom_text(x = ymd("2016-11-04"), y = 85, label = "2016 Presidential Election",
            angle = 90, color = "red", size = 3) +
  geom_text(x = ymd("2017-04-25"), y = 85, label = "100th Day In Office",
            angle = 90, color = "red", size = 3)

# add prominent date labels
plot <- plot +
  geom_label_repel(mapping = 
                     aes(label = ifelse(date == ymd("2016-09-18"), "Reuters poll shows Clinton & Trump\nneck-and-neck in electoral college", "")), 
                   size = 3, nudge_x = -60, nudge_y = 35, segment.alpha = 0.3, segment.size = 0.35) +
  geom_label_repel(mapping = 
                     aes(label = ifelse(date == ymd("2016-09-30"), "USA Today declares Trump\nunfit for the presidency", "")), 
                   size = 3, nudge_x = -5, nudge_y = 15, segment.alpha = 0.3, segment.size = 0.35) +
  geom_label_repel(mapping = 
                     aes(label = ifelse(date == ymd("2016-10-07"), "Access Hollywood tape \nis released & WikiLeaks\ndumps Clinton emails", "")),
                   size = 3, nudge_x = 5, nudge_y = -25, segment.alpha = 0, segment.size = 0.35) +
  geom_label_repel(mapping = 
                     aes(label = ifelse(date == ymd("2016-11-09"), "Clinton concedes the \npresidency to Trump", "")), 
                   size = 3, box.padding = 1, nudge_x = 10, nudge_y = 40, segment.alpha = 0.3, segment.size = 0.35)

# NOTE: In order to get the actual date of the spikes that the above labels annotate,
#       I first added geom_label_repel and had it show the date as a numeric for each desired peak.
#       For example: geom_label_repel(mapping = aes(label = ifelse(value > ___, date, "")))
#       I then took that numeric and used the following function to get the date:
#       as_date(17068, origin = lubridate::origin).
#       I then did some research online to find the events relevant to the Trump campaign that
#       occured on the given day. I then replaced geom_label_repel with the function calls seen above.

# set scale limits and facet
plot <- plot +
  facet_wrap(~ timeframe, scales = "free") +
  ylim(c(0,150))

# add labels and theme
plot <- plot +
  labs(title = "Russian Troll Tweets Pre & Post-2016 Election",
       subtitle = "Pro-Trump tweets spike in the two months leading up to the election, then trail off later in office",
       x = "",
       y = "",
       caption = "Featured tweets contain the phrases:\nAmerica First, Build The Wall, Crooked Hillary, Fake News, Fake News Media, Hillary For Prison, Left Media, Leftist Media, Lock Her Up, MAGA, Make America Great Again") +
  theme_fivethirtyeight() +
  theme(strip.text.x = element_blank(), plot.caption = element_text(face = "italic", size = 7, hjust = 0))

# display graph
plot


# Save Output -------------------------------------------------------------

ggsave(plot = plot, filename = "./figures/Lab03_figure.pdf", width = 10, height = 5.5)

