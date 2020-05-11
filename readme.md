Proyecto en el que se muestran los 30 ultimos personajes actualizados de Marvel y al pulsar en el 
listado sobre alguno de ellos pasa a una pantalla de detalle del personaje.

Para esto se hce uso de dos servicos de la web de developer.marvel.com:
 
  * GET /v1/public/characters
  Devuele el listado de personajes, se puede hacer la solicitid filtrando por nombre, y aunque dejamos 
  la capa de dominio preparado para ello, no lo usamos en la capa de presentción porque solicitamos los 
  30 ultimos personajes modificados para probar la funcionalidad en la App.
  
  * GET /v1/public/characters/{characterId}
  Devuelve los datos del personajes que coincidan con el id que le pasamos por parametro. lo usamos para el detalle.

La arquitectura de la App se basa en el patrón Viper y para las llamadas a los servicios se usa la libreria externa 
de Alamofire.

            Ejecutar 'Pod install'
