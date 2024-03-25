#' intro UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_intro_ui <- function(id){
  ns <- NS(id)
  tagList(
  h2("Test vědecké gramotnosti"),

h3("Pokyny k testu"),

p("Test obsahuje 28 otázek s možností volby odpovědi, správná je vždy jen jedna odpověď."),
p("Na vypracování otázek máte 60 minut."),
p("Zvolené písmeno odpovědi zapište do záznamového listu; na jeho druhou stranu můžete kreslit, provádět pomocné výpočty apod."),
p("Nepoužívejte kalkulačku!"),





p("Neotvírejte zadání, dokud k tomu nedostanete pokyn."),





p("Zadání testu vychází z práce Gormally C., Brickman P., Lutz M. (2012). Developing a Test of Scientific Literacy Skills (TOSLS): measuring undergraduates’ evaluation of scientific information and arguments. CBE-Life Sciences Education, 11(4), 364-377. https://doi.org/10.1187/cbe.12-03-0026"),
p("Český překlad: RNDr. Eva Hejnová, Ph.D. (PřF UJEP Ústí nad Labem), revize českého překladu: RNDr. Jindřiška Svobodová, Ph.D. (PF MU Brno), doc. RNDr. Stanislav Daniš, Ph.D. (MFF UK Praha), RNDr. Jiří Králík, Ph.D. (PřF UJEP Ústí nad Labem)")

 
  )
}
    
#' intro Server Functions
#'
#' @noRd 
mod_intro_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
