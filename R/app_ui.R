#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
    tags$head(tags$style(HTML("
      .center-div {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
      }
      .shiny-options-group .radio:nth-child(5) {
      display: none;
    }
    "))),
      tabsetPanel(
    id = "wizard",
    type = "hidden",
    tabPanel("intro_panel", 
    div(class = "center-div",
      mod_intro_ui("intro"),
      actionButton("enter_test", "Zahájit test")
      )
    ),
    tabPanel("question_panel", 
        div(class = "center-div",
      mod_question_ui("question")
        )
    ),
    tabPanel("final_panel", 
      "final panel"
    )
  )

    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "scilit"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
