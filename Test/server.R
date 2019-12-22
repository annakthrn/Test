function(input, output, session) {
  
  # shinyjs::runjs(HTML("
  #   document.body.style.backgroundColor = 'skyblue';
  #   var a = document.getElementById('linkID');
  #   console.log()
  #   a.href = 'https://www.google.com/';
  #   $('#myButton').click(function(){
  #                     a.css('visibility', 'hidden');
  #       });                  
  #   "))
  
  output$plot <- renderPlot({
    plot(cars, type = input$plotType)
  })
  
  output$summary <- renderPrint({
    summary(cars)
  })
  
  
  output$mytable = DT::renderDataTable(datatable(
    iris,
    extensions = 'Buttons',
    options = list(dom = 'Bfrtip',
                   buttons = list(
                     "copy",
                     list(
                       extend = "collection",
                       text = 'test',
                       action = DT::JS(
                         "function ( e, dt, node, config ) {
                         Shiny.setInputValue('test', true, {priority: 'event'});}"
)
                       )
                       ))
                     ))
  
  observeEvent(input$test, {
    updateTabsetPanel(session, "inTabset",
                      selected = "panel1")
  })
  
}