#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  mod_intro_server("intro")
  mod_question_server("question")

  
  observeEvent(input$enter_test, 
              updateTabsetPanel(inputId = "wizard", 
              selected = "question_panel")
              )
}
