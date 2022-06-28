library(rmarkdown)
library(readxl)
library(purrr)

# cria o caminho para o arquivo
caminho_rmd <- "params/exemplo-params.Rmd"

# renderiza o arquivo
render(caminho_rmd) # equivale ao botao KNIT!

# renderizar com parametros!!!

list(ano = 2010)

render(caminho_rmd, params = list(ano = 2010))

# gerando com parametros e configurando o nome do arquivo gerado
render(caminho_rmd, params = list(ano = 2010),
       output_file = "2010.html")


# buscar os anos possiveis!
imdb <- read_sheet("https://docs.google.com/spreadsheets/d/1x9pXr4QAnY1nHcH03Kne7oXlEqSKV8N12nuDMQ7ep0U/edit?usp=sharing")
  
imdb$ano


unique(imdb$ano)

anos_imdb <- sort(unique(imdb$ano))

# vamos começar a falar de purrr!!

# criar pasta pra deixar os relatorios
fs::dir_create("params/relatorios_imdb")


# exemplo curto de purr
# 1, 2, 3
sqrt(1)
sqrt(2)
sqrt(3)


vetor_que_quero_repetir <- 1:3


purrr::map(vetor_que_quero_repetir,
           # funcao que eu quero que seja aplicada
           sqrt)

purrr::map(vetor_que_quero_repetir,
           ~ sqrt(.x))        

# funcao <- funcao(.x){
#   sqrt(.x)
# }
      
# map + render

# map(vetor, funcao)

map(anos_imdb,
    ~ render(
      caminho_rmd,
     # output_format = word_document(),
      output_format = prettydoc::html_pretty(theme = "architect"),
      params = list(ano = .x),
      output_file = glue::glue("relatorios_imdb/{.x}")
    ))


# imprime em PDF!
pagedown::chrome_print("params/exemplo-params.html")

caminhos_html <- fs::dir_ls("params/relatorios_imdb/")

caminhos_html_base <- list.files("params/relatorios_imdb/", full.names = TRUE)



# map(vetor, funcao)

map(caminhos_html, pagedown::chrome_print)


