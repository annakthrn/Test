library(shiny)


tablePage <- HTML('<table class="table">
                  <thead>
                  <tr>
                  <th scope="col">#</th>
                  <th scope="col">First</th>
                  <th scope="col">Last</th>
                  <th scope="col">Handle</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  </tr>
                  <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                  </tr>
                  <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                  </tr>
                  </tbody>
                  </table>')


form <- div(
  id = "form",
  
  textInput("name", "Name", ""),
  textInput("favourite_pkg", "Favourite R package"),
  checkboxInput("used_shiny", "I've built a Shiny app in R before", FALSE),
  selectInput("os_type", "Resource",
              c("",  "Twitter")),
  actionButton("submit", "Submit", class = "btn-primary")
)

  ui <- fluidPage(

    div(class = "customNavbar", navbarPage(title="Navbar One",theme="custom-navbar.css",
                                      tabPanel("Plot",
                                               sidebarLayout(
                                                 sidebarPanel(
                                                   radioButtons("plotType", "Plot type",
                                                                c("Scatter"="p", "Line"="l")
                                                   )
                                                 ),
                                                 mainPanel(
                                                   plotOutput("plot")
                                                 )
                                               )
                                      ),
                                      tabPanel("Summary",
                                               includeHTML("include.html")
                                      ),
                                      navbarMenu("More",
                                                 tabPanel("Table",
                                                          form
                                                 ),
                                                 tabPanel("About",
                                                          fluidRow(
                                                            column(6,
                                                                   
                                                            ),
                                                            column(3,
                                                                   img(class="img-polaroid",
                                                                       src=paste0("http://upload.wikimedia.org/",
                                                                                  "wikipedia/commons/9/92/",
                                                                                  "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                                                   tags$small(
                                                                     "Source: Photographed at the Bay State Antique ",
                                                                     "Automobile Club's July 10, 2005 show at the ",
                                                                     "Endicott Estate in Dedham, MA by ",
                                                                     a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                                                       "User:Sfoskett")
                                                                   )
                                                            )
                                                          )
                                                 )
                                      ))), #custom colors
    
  )


server <- function(input, output, session) {
  output$plot <- renderPlot({
    plot(cars, type=input$plotType)
  })
  
  output <- DT::renderDataTable({
    DT::datatable(cars)
  })
}

shinyApp(ui = ui, server = server)