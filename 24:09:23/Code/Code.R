# Loading Libraries #

install.packages('dplyr')
install.packages('tidyr')
install.packages('ggplot2')
install.packages('ggthemes')
install.packages('plotly')
library(dplyr)
library(tidyr)
library(ggplot2)
library(ggthemes)
library(plotly)
library(lubridate)

# UK CPI Data #


Aug_UKCPI_Data$X <- as.Date(paste0('01-',Aug_UKCPI_Data$X), format = "%d-%b-%y")

pl1 <- Aug_UKCPI_Data %>%
  rename(On_Year_CPI = CPI.12.month.rate, Date = X) %>%
  ggplot(aes(x = Date, y = On_Year_CPI)) + geom_point(aes(col = CPI.1.month.rate<0), size = 3, alpha = 0.7) + geom_line() + theme_economist_white() + scale_color_manual(values = c('red', 'green') ,guide = guide_legend('Month-on-Month Growth', title.position = 'top', title.hjust = 0.5,label.theme = element_text(size = 10)), labels = c('Growth', 'Contraction'))
pl2 <- pl1 + labs(x = '', y = 'Year-on-Year Consumer Price Index (%)', title = 'UK CPI Data') + theme(plot.title = element_text(hjust = 0.5)) + geom_text(aes(label = 'UK sees Headline CPI fall in 2023'), x = as.Date('2022-10-01'), y = 7.5)
pl3 <- pl2 + geom_rect(aes(xmin = as.Date('2023-01-01'), xmax = as.Date('2023-08-01'), ymin = 6.2, ymax = 11.5), alpha = 0.02, fill = 'green', col = 'black')
pl3

