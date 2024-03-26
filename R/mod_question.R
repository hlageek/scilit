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
    uiOutput(ns("question")),
    tags$div(style = "display: inline-block;",
      actionButton(ns("choice"), "Zadat odpověď")
    ),
    tags$div(style = "display: inline-block;",
      textOutput(ns("selected"))
    )
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
      actionButton(ns("previous"), "", icon = icon("arrow-left"))
    },
    if (quid$id < length(scilit::questions)) {
      actionButton(ns("next"), "", icon = icon("arrow-right"))
    },
    tags$br(),tags$br(),
    p(scilit::questions[[quid$id]]$text),
    if (!is.null(scilit::questions[[quid$id]]$background)) {
      p(tags$i(HTML(scilit::questions[[quid$id]]$background)))
    },
    if (!is.null(scilit::questions[[quid$id]]$image)) {
      img(src = paste0("www/", scilit::questions[[quid$id]]$image),
      style = "height: 30vh; width: auto;")
    },
    radioButtons(ns(paste0("choices", quid$id)), "",
      choiceNames = paste0(LETTERS[seq( from = 1, to = 5 )], ". ", c(unname(scilit::questions[[quid$id]]$options), "None")),
      choiceValues = c(names(scilit::questions[[quid$id]]$options), ""),
      selected = "",
      width = "80%"
    )
  )
})

    output$selected <- renderText({
      input[[paste0("choices", quid$id)]]
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
