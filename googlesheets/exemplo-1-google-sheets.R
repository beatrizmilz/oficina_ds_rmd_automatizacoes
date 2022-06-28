# googlesheets4::gs4_deauth()
# googlesheets4::gs4_auth()

library(googlesheets4)

url_planilha <- "https://docs.google.com/spreadsheets/d/1x9pXr4QAnY1nHcH03Kne7oXlEqSKV8N12nuDMQ7ep0U/edit?usp=sharing"

imdb <- read_sheet(url_planilha)
