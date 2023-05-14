#' Download Data from a Specific Page
#'
#' This function sends a POST request to a specific URL to download data from a given page.
#' The downloaded data is cleaned and transformed into a tibble data structure.
#' The tibble is then written to a file and saved to a specified path.
#'
#' @param pag A numeric or character value that specifies the page number from which the data should be downloaded.
#' @param path A character string specifying the path where the downloaded data should be saved.
#'
#' @return This function does not explicitly return a value.
#'   Instead, it writes the downloaded data to a file at the specified path.
#'
concordia_download_pag <- function(pag, path) {

  bb <- list(
    Pagina = pag,
    TextoAcordo = "",
    TamanhoPagina = 1000,
    TipoAcordo = list("BL,TL,ML")
  )

  r <- httr::POST(
    "https://aplicacao.itamaraty.gov.br/ApiConcordia/Acordo/pesquisar-acordos-simples",
    body = bb,
    encode = "json"
  )

  result <- httr::content(r, simplifyDataFrame = TRUE) |>
    janitor::clean_names() |>
    tibble::as_tibble()

  fs::dir_create(path)

  readr::write_rds(
    result,
    glue::glue("{path}/{pag}.rds")
  )

}

#' Download Specific Case Data in JSON Format
#'
#' This function checks if the JSON file for a specific case exists at the given path.
#' If the file does not exist, it sends a GET request to a specific URL to download the case data in JSON format.
#'
#' @param id A numeric or character value that specifies the id of the case to be downloaded.
#' @param path A character string specifying the path where the downloaded data should be saved.
#'
#' @return This function does not explicitly return a value. Instead, it writes the downloaded data to a file at the specified path.
#'
concordia_download_case <- function(id, path) {
  json_file <- paste0(path, id, ".json")
  if (!file.exists(json_file)) {
    link <- paste0(
      "https://aplicacao.itamaraty.gov.br/ApiConcordia/Acordo/detalhar-acordo/",
      id
    )
    httr::GET(link, httr::write_disk(json_file, TRUE))
  }
}

#' Download Specific Case Data in HTML Format
#'
#' This function checks if the HTML file for a specific case exists at the given path.
#' If the file does not exist, it sends a GET request to a specific URL to download the case data in HTML format.
#'
#' @param id A numeric or character value that specifies the id of the case to be downloaded.
#' @param path A character string specifying the path where the downloaded data should be saved.
#'
#' @return This function does not explicitly return a value. Instead, it writes the downloaded data to a file at the specified path.
#'
concordia_download_html <- function(id, path) {
  html_file <- paste0(path, id, ".html")
  if (!file.exists(html_file)) {
    link <- paste0(
      "https://aplicacao.itamaraty.gov.br/ApiConcordia/Acordo/integra-acordo-html/",
      id
    )
    httr::GET(link, httr::write_disk(html_file, TRUE))
  }
}

#' Download Specific Case Data in PDF/DOC/DOCX Format
#'
#' This function checks if the PDF/DOC/DOCX file for a specific case exists at the given path.
#' If the file does not exist, it sends a GET request to a specific URL to download the case data in PDF/DOC/DOCX format.
#'
#' @param data_doc A data frame with pdf information(id of the case, id of the file, name of the file)
#' @param path A character string specifying the path where the downloaded data should be saved.
#'
#' @return This function does not explicitly return a value. Instead, it writes the downloaded data to a file at the specified path.
#'
concordia_download_doc <- function(data_doc, path) {
  f <- glue::glue("{path}/{data_doc$id_case}_{data_doc$id_2}_{data_doc$nome_arquivo}")
  if (!file.exists(f)) {
    link <- paste0(
      "https://aplicacao.itamaraty.gov.br/ApiConcordia/Documento/download/",
      data_doc$id_2
    )
    httr::GET(link, httr::write_disk(f, TRUE))
  }
}
