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

    # initialize reactive values
    quid <- reactiveValues(id = 1)
    loc <- reactiveValues(previous_answer = "")

    # check for previous answers
    # loc$previous_answer <- glob$answers_given[[quid$id]]

    # generate question from data
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
    # conditionally show additional background for question
    if (!is.null(scilit::questions[[quid$id]]$background)) {
      p(tags$i(HTML(scilit::questions[[quid$id]]$background)))
    },
    # conditionally show image for question
    if (!is.null(scilit::questions[[quid$id]]$image)) {
      img(src = paste0("www/", scilit::questions[[quid$id]]$image),
      style = "height: 33vh; width: auto;")
    },
    # show 4 plus 1 CSS hidden ("" - empty) option
    radioButtons(ns(paste0("choices", quid$id)), "",
      choiceNames = paste0(LETTERS[seq( from = 1, to = 5 )], ". ", c(unname(scilit::questions[[quid$id]]$options), "None")),
      choiceValues = c(names(scilit::questions[[quid$id]]$options), ""),
      selected = loc$previous_answer,
      width = "90%"
    )
  )
})

    # display selected answer
    output$selected <- renderText({
      toupper(input[[paste0("choices", quid$id)]])
    })

    # handle navigation between questions
    observeEvent(input[["previous"]], {
      quid$id <- quid$id - 1 
    })
    observeEvent(input[["next"]], {
      quid$id <- quid$id + 1 
    })
 
  })
}
