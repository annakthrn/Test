library(markdown)
library(shinyWidgets)
library(shinyjs)

createLink <- function() {
  actionButton('jumpToP2', 'Jump')
}

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

ui <- fillPage(
  
  tags$script(src = "myscript.js"),
  
  
  # shinyjs::useShinyjs(),
  
  # tags$script(HTML(
  #   "document.body.style.backgroundColor = 'skyblue';
  #   var a = document.getElementById('linkID');
  #   console.log()
  #   a.href = 'https://www.google.com/';"
  # )),
  # tags$head(
  #   tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
  # ),
          
            
div(class = "customNavbar", navbarPage( id = "inTabset",
  "Navbar!",
  tabPanel("Index", 
           h2("Test"),
  includeHTML("include.html")),
  tabPanel("Finance-Feed anlegen", 
           div(class="financeFeedForm",
             id = "form",
             textInput("name", "Name", ""),
             textInput("time_interval", "Zeitintervall:"),
             selectInput("rs_type", "Resource",
                         c("",  "Twitter")),
             actionButton("submit", "Submit", class = "btn btn-primary")
           )),
  navbarMenu(
    "More",
    tabPanel("Table",
             tablePage),
    tabPanel("About",
             fluidRow(column(6,),
                      column(
                        3,
                        img(
                          class = "img-polaroid",
                          src = paste0(
                            "http://upload.wikimedia.org/",
                            "wikipedia/commons/9/92/",
                            "1919_Ford_Model_T_Highboy_Coupe.jpg"
                          )
                        ),
                        tags$small(
                          "Source: Photographed at the Bay State Antique ",
                          "Automobile Club's July 10, 2005 show at the ",
                          "Endicott Estate in Dedham, MA by ",
                          a(href = "http://commons.wikimedia.org/wiki/User:Sfoskett",
                            "User:Sfoskett")
                        )
                      )))
  )
)
)
)
