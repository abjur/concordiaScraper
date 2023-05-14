devtools::load_all(".")

path <- "data-raw/"
path_pages <- paste0(path, "results_itamaraty")

# baixa os dados
purrr::walk(
  1:13,
  download_pag,
  path = path_pages,
  .progress = TRUE
)

# leitura dos dados das páginas -------------------------------------------
dados <- fs::dir_ls(path_pages) |>
  purrr::map(readr::read_rds) |>
  dplyr::bind_rows()

concordia_pages <- dados |>
  tidyr::unnest(items) |>
  janitor::clean_names()

usethis::use_data(concordia_pages, overwrite = TRUE)

path_cases <- paste0(path, "itamaraty_paginas/")

purrr::walk(
  # essa coluna guarda os ids reais
  resultados$id_3,
  purrr::possibly(concordia_download_case),
  path = path_cases,
  .progress = TRUE
)

# leitura dados baixados --------------------------------------------------

concordia_cases <- fs::dir_ls(path_cases, glob = "*.json") |>
  purrr::map(jsonlite::read_json, simplifyDataFrame = TRUE) |>
  purrr::map(purrr::compact) |>
  purrr::map(\(x) purrr::map_if(x, ~length(.x)>1, list)) |>
  purrr::map(tibble::as_tibble) |>
  dplyr::bind_rows(.id = "file") |>
  janitor::clean_names()

concordia_cases <- da_individual

usethis::use_data(concordia_cases, overwrite = TRUE)

# baixar html -------------------------------------------------------------
path_html <- paste0(path, "itamaraty_html/")
fs::dir_create(path_html)

da_individual |>
  dplyr::filter(possui_html) |>
  with(file) |>
  tools::file_path_sans_ext() |>
  basename() |>
  purrr::walk(
    concordia_download_html,
    path = path_html,
    .progress = TRUE
  )


# baixar_pdf --------------------------------------------------------------

path_doc <- paste0(path, "itamaraty_doc/")
fs::dir_create(path_doc)

aux_doc <- concordia_cases |>
  dplyr::select(file, documento_integra) |>
  dplyr::filter(purrr::map_int(documento_integra, length) > 0) |>
  dplyr::mutate(documento_integra = purrr::map(documento_integra, tibble::as_tibble)) |>
  tidyr::unnest(documento_integra) |>
  janitor::clean_names() |>
  dplyr::mutate(
    id_case = tools::file_path_sans_ext(basename(file)),
    .before = file
  ) |>
  dplyr::group_split(id_case)

aux_doc |>
  purrr::walk(
    purrr::possibly(concordia_download_doc),
    path = path_doc,
    .progress = TRUE
  )

# salvar arquivos PDF em chunks

arquivos <- fs::dir_ls(path_doc)
fs::file_info(arquivos) |>
  dplyr::mutate(chunk = ((seq_len(dplyr::n()) - 1) %% 10)+1) |>
  dplyr::group_split(chunk) |>
  purrr::iwalk(\(x, y) {
    file <- glue::glue("../zip/chunk_{y}.zip")
    zip::zip(
      file,
      basename(x$path),
      compression_level = 1,
      include_directories = FALSE,
      root = "data-raw/itamaraty_doc"
    )
  }, .progress = TRUE)

# drafts ------------------------------------------------------------------


# ids_download <- da_individual |>
#   dplyr::select(titulo, documento_integra, possui_html)
#
# da_individual |>
#   dplyr::filter(possui_html) |>
#   with(vigencia[[1]])
#   dplyr::glimpse()
#
# u_base <- "https://aplicacao.itamaraty.gov.br/ApiConcordia/Acordo/integra-acordo-html/"
#
# da_individual |>
#   dplyr::filter(!possui_html) |>
#   dplyr::glimpse() |>
#   dplyr::slice(1) |>
#   with(file)
#
# da_individual |>
#   dplyr::slice(1) |>
#   View()
#
# da_individual |>
#   tidyr::unnest(outras_partes)
#
# da_individual$outras_partes[[11]]
#
# dplyr::glimpse(da_individual)
#

# dataverse
