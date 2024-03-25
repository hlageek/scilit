#' question UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_question_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("question"))
  )
}
    
#' question Server Functions
#'
#' @noRd 
mod_question_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    quid <- reactiveValues(id = 1)

    output$question <- renderUI({
  tagList(
    h3(paste("Otázka č.", quid$id)),
    if (quid$id > 1) {
      actionButton(ns("previous"), "Předchozí")
    },
    if (quid$id < 28) {
      actionButton(ns("next"), "Další")
    },
    p(questions[[quid$id]]$text),
    if (!is.null(questions[[quid$id]]$background)) {
      p(tags$i(HTML(questions[[quid$id]]$background)))
    },
    if (!is.null(questions[[quid$id]]$image)) {
      img(src = paste0("www/", questions[[quid$id]]$image),
      style = "height: 30vh; width: auto;")
    },
    radioButtons(ns(quid$id), "Vybrat odpověď",
      choiceNames = unname(questions[[quid$id]]$options),
      choiceValues = names(questions[[quid$id]]$options),
      width = "80%"
    )
  )
})

    observeEvent(input[["previous"]], {
      quid$id <- quid$id - 1 
    })
    observeEvent(input[["next"]], {
      quid$id <- quid$id + 1 
    })
 
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
