# # mapas -------------------------------------------------------------------
# 
# # para realizar un mapa sencillo de Mexico con gradiente de color
# # usamos la funcion mxstate_choropleth
# # se pueden agregar funciones compatibles con ggplot2
# # Se pueden cambiar cosas  como los colores a un gradiente de colores 
# # Para eso cambiamos el valor de num_colors a "1" y
# # establecemos cortes para la distribucion de valores en el gradiante
# 

# TESTING GROUNDS
mapeadora_hex <-  function( la_data ) {
  
  # cargar datos de estados del INEGI
  diccionario.df <- read.table(file = "diccionario_mapa.tsv",
                               header = T, sep = "\t")
  # contiene el formato necesario para poder graficar el mapa de Mexico
  
  
  # unir dataframe con 32 estados con diccionario
  data_graficable.df <- left_join(x = diccionario.df,       # conservar datos diccionario
                                  y = la_data,                  # unir valores de los 32 estados
                                  by = "state_abbr")             # columna en comun
  
  mxhexbin_choropleth( df = data_graficable.df, 
                       num_colors = 1,
                       label_size = 3.8,
                       title = "Mapa hexagonos ejemplo") +
    scale_fill_gradient(low = "white", high = "skyblue",
                        name = "valor"
                        # labels = percent,                         # labels = percent
                        # breaks = c(0, 0.05, 0.1, 0.15, 0.198),   # se personalizan los breaks y limits
                        # limits = c(0, 0.2)
    ) +
    labs(caption = "Caption ejemplo") +
    theme(text = element_text(size = 20),
          plot.title = element_text( hjust = 0.5,
                                     face = "bold"),
          plot.caption = element_text(hjust = 0.5,
                                      face = "italic")) +
    guides( fill = guide_colourbar( ticks.colour = "black",         # Le cambiamos el color al contorno de la barra de color de la leyenda
                                    frame.colour = "black" )  )
  
}
