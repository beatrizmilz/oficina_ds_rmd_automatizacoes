# install packages ---
install.packages("httr")

# run code ---

httr::POST(
  "https://app.anm.gov.br/SIGBM/Publico/ClassificacaoNacionalDaBarragem/ExportarExcel",
  httr::write_disk(paste0(
    "ghactions/downloads/sigbm_download_", Sys.Date(), ".xlsx"
  ))
)
