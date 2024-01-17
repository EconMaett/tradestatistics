# 01 - Introduction ----

# Open Trade Statistics package

# This package is available on CRAN
# install.packages("tradestatistics")


## Introduction ----

library(tradestatistics)

library(tibble)


## Package data ----

### Available tables ----

as_tibble(ots_tables)

# y: year column
# r: reporter column
# p: partner column
# c: commodity column

# The most aggregated table is yr


### Country codes ----

as_tibble(ots_countries)


### Commodity codes ----

as_tibble(ots_commodities)


### Inflation data ----

as_tibble(ots_gdp_deflator)


## Package functions ----

### Country code ----

# single match with no replacement
as_tibble(ots_country_code("Chile"))


# Single match with replacement
as_tibble(ots_country_code("America"))


# Double match with no replacement
as_tibble(ots_country_code("Germany"))


### Commodity code ----

as_tibble(ots_commodity_code(commodity = " ShEEp ", section = "mEaT"))


### Trade data ----

### Bilateral trade at commodity level ----

# Chile-Argentina bilateral trade at community level in 2019
yrpc <- ots_create_tidy_data(
  years     = 2019,
  reporters = "chl",
  partners  = "arg",
  table     = "yrpc"
)

as_tibble(yrpc)


# Pass two years or more, several reporters/partners,
# and filter by commodities with exact codes or code 
# matching based on keywords:

yrpc2 <- ots_create_tidy_data(
  years = 2018:2019,
  reporters = c("chl", "Peru", "bol"),
  partners = c("arg", "Brazil"),
  commodities = c("01", "food"),
  table = "yrpc"
)


### Bilateral trade at aggregated level ----

yrp <- ots_create_tidy_data(
  years = 2018:2019,
  reporters = c("chl", "per"),
  partners = "arg",
  table = "yrp"
)

as_tibble(yrp)
yrpc2


### Reporter trade at commodity level ----
yrc <- ots_create_tidy_data(
  years = 2019,
  reporters = "chl",
  commodities = "010121",
  table = "yrc"
)

as_tibble(yrc)


### Reporter trade at aggregated level -----
yr <- ots_create_tidy_data(
  years = 2018:2019,
  reporters = c("chl", "arg", "per"),
  table = "yr"
)

as_tibble(yr)


### Commodity trade at aggregated level ----
yc <- ots_create_tidy_data(
  years = 2019,
  table = "yc"
)

as_tibble(yc)

yc2 <- ots_create_tidy_data(
  years = 2019,
  commodities = "010121",
  table = "yc"
)

as_tibble(yc2)


### Inflation adjustment ----

inflation <- ots_gdp_deflator_adjustment(
  trade_data = yr, 
  reference_year = 2000
)

as_tibble(inflation)
