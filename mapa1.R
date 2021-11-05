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
mapeadora <-  function( la_data ) {
  
  # cargar datos de estados del INEGI
  diccionario.df <- read.table(file = "diccionario_mapa.tsv",
                               header = T, sep = "\t")
  # contiene el formato necesario para poder graficar el mapa de Mexico
  
  
  # unir dataframe con 32 estados con diccionario
  data_graficable.df <- left_join(x = diccionario.df,       # conservar datos diccionario
                                  y = la_data,                  # unir valores de los 32 estados
                                  by = "state_abbr")             # columna en comun
  
  mxstate_choropleth(df = data_graficable.df,    
                     num_colors = 1,                           # "1" nos permitira agregar un gradiente de color
                     title = "Titulo ejemplo") +
    scale_fill_gradient( low = "white", high = "skyblue",                # se agregan colores a la escala baja y alta
                         name = "Valores"                    # el titulo de la leyenda de la escala de colores
                         # breaks = c(),    # los breaks son los "dientes" que estan en la escala del gradiente, se pueden personalizar
                         # labels = c(),    # mejoramos las etiquetas que acompañan a los breaks
                         # limits = c()     # los limites seran los valores minimos y maximos de los datos a graficar
    ) +
    labs(caption = "Caption ejemplo") +      # Agregamos caption en la parte inferior del plot
    theme(text = element_text(size = 20),                           # Establecemos que todo el texto del plot sea de tamaño 20
          plot.title = element_text( hjust = 0.5,                   # Centramos el titulo del plot
                                     face = "bold"),                # en negritas el titulo del plot
          plot.caption = element_text(hjust = 0.5,                  # Centramos el caption
                                      face = "italic")) +           # Establecemos letra cursiva en el caption
    guides( fill = guide_colourbar( ticks.colour = "black",         # Le cambiamos el color al contorno y las lineas interiores de la barra de color del gradiente
                                    frame.colour = "black" )  )
  
}
