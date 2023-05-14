#' Itamaraty API Cases Dataset
#'
#' A dataset containing 12,156 cases retrieved from the Itamaraty API.
#'
#' @format A data frame with 12,156 rows and 16 variables:
#' \describe{
#'   \item{id}{A character vector representing the ID of the case.}
#'   \item{page}{An integer vector indicating the page number from which the case data was downloaded.}
#'   \item{count}{An integer vector indicating the count of cases present in each page.}
#'   \item{total_pages}{An integer vector indicating the total number of pages of cases data.}
#'   \item{total_count}{An integer vector indicating the total count of cases.}
#'   \item{id_2}{A character vector representing another ID associated with the case.}
#'   \item{id_3}{An integer vector representing yet another ID associated with the case.}
#'   \item{titulo}{A character vector representing the title or description of the case.}
#'   \item{assuntos}{A list of data frames, each containing detailed information about the case.}
#'   \item{vigencia}{A character vector indicating the current status of the case.}
#'   \item{outra_parte}{A character vector indicating the other party involved in the case.}
#'   \item{data_celebracao}{A character vector indicating the date of celebration or conclusion of the case.}
#'   \item{outras_partes}{A list of character vectors, each indicating the other parties involved in the case.}
#'   \item{tipo_acordo}{A character vector indicating the type of agreement involved in the case.}
#'   \item{documentos}{A list of data frames, each containing documents related to the case.}
#'   \item{documento_integra}{A data frame containing detailed documents related to the case.}
#' }
#'
#' @source \url{https://concordia.itamaraty.gov.br/}
#'
"concordia_pages"

#' Concordia Cases Dataset
#'
#' A dataset containing 12,237 cases retrieved from the Itamaraty API. This dataset includes various
#' details of the cases like the title, other parties involved, signatory details, agreement types,
#' ratification types, observation notes, etc.
#'
#' @format A data frame with 12,237 rows and 32 variables:
#' \describe{
#'   \item{file}{Character. The file path from which the case data was loaded.}
#'   \item{id}{Character. The ID of the case.}
#'   \item{titulo}{Character. The title or description of the case.}
#'   \item{outra_parte}{Character. The other party involved in the case.}
#'   \item{outras_partes}{List. Other parties involved in the case.}
#'   \item{signatario_brasil}{Character. The signatory from Brazil for the case.}
#'   \item{cargo_signatario_brasil}{Character. The designation of the Brazilian signatory.}
#'   \item{local_celebracao}{Character. The location where the case was celebrated or concluded.}
#'   \item{nome_pais_celebracao}{Character. The name of the country where the case was celebrated or concluded.}
#'   \item{data_celebracao}{Character. The date of celebration or conclusion of the case.}
#'   \item{tipo_acordo}{Character. The type of agreement involved in the case.}
#'   \item{possui_html}{Logical. Whether the case has an HTML version or not.}
#'   \item{is_publicacao_direta}{Logical. Whether the case is directly published or not.}
#'   \item{tipo_ratificacao}{Character. The type of ratification involved in the case.}
#'   \item{is_notificacao_brasil}{Logical. Whether there was a notification from Brazil or not.}
#'   \item{is_notificacao_outra_parte}{Logical. Whether there was a notification from the other party or not.}
#'   \item{signatario_outra_parte}{List. Signatory details of the other party involved in the case.}
#'   \item{assuntos}{List. Subject matters related to the case.}
#'   \item{mensagem_congresso}{List. Messages to Congress related to the case.}
#'   \item{decreto_legislativo}{List. Legislative decrees related to the case.}
#'   \item{ratificacao}{List. Ratification details of the case.}
#'   \item{decreto_promulgacao}{List. Promulgation decrees related to the case.}
#'   \item{vigencia}{List. Validity details of the case.}
#'   \item{documento_integra}{List. Complete document details related to the case.}
#'   \item{observacoes}{List. Observation notes related to the case.}
#'   \item{depositario}{Character. The depositary of the case.}
#'   \item{documentos}{List. Documents related to the case.}
#'   \item{emendas}{List. Amendments related to the case.}
#'   \item{emendendados}{List. Amended cases related to the current case.}
#'   \item{acordo_substituiu}{List. Agreements that were replaced by the current case.}
#'   \item{acordo_substituido}{List. Agreements that replaced the current case.}
#'   \item{errors}{List. Errors encountered during the data gathering process.}
#' }
#'
#' @source \url{https://concordia.itamaraty.gov.br/}
#'
"concordia_cases"
