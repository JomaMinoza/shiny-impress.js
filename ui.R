shinyUI(pageWithSidebar(
  headerPanel("Impress Graph Demo"), 
  sidebarPanel(
    sliderInput('slide_count', 'Slide Count', min=1, max=100,value=20),
    sliderInput('slide_width', 'Slide Width', min=50, max=2000,value=350),
    sliderInput('slide_height', 'Slide Height', min=50, max=2000,value=350),
    sliderInput('font_size', 'Font Size', min=5, max=200,value=20)
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Overview",includeMarkdown("README.md")),
      tabPanel("Graph",
               selectInput('ccm','Graph Generation:',ls(ccm.fcns),selected="Random"),
               selectInput('layout','Layout Type:',ls(layout.fcns),selected="Grid3D"),
               sliderInput('con_frac', 'Connectivity (%)', min=0, max=100,value=35),
               plotOutput('igraph_plot')
      ),
      tabPanel("Slides", 
               sliderInput('frame_width', 'Frame Width', min=100, max=2000,value=500),
               sliderInput('frame_height', 'Frame Height', min=100, max=2000,value=500),
               sliderInput('spacing', 'Spacing (%)', min=0, max=1000,value=65),
               helpText(h4("Click inside the frame to use the keyboard <- and -> to navigate")),
               htmlOutput("preview",inline=T),
               sliderInput('scale_noise', 'Scale Jitter (%)', min=0, max=100,value=0),
               sliderInput('angle_noise', 'Angle Jitter (%)', min=0, max=100,value=15)
      ),
      tabPanel("Slide Positions",
               dataTableOutput("slide_positions")),
      tabPanel("Source Code",
               verbatimTextOutput("sourcecode")
               )
    )
  )
))