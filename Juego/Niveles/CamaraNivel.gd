class_name CamaraNivel
extends CamaraJuego

## Atributos Onready
onready var tween_zoomm:Tween = $TweenZoom

## Setters y Getters
func set_puede_hacer_zoom(puede: bool) -> void:
	puede_hacer_zoom = puede

## Metodos
func _ready() -> void:
	zoom_original = zoom

## Metodos Custom
func devolver_zoom_original() -> void:
	puede_hacer_zoom = false
	zoom_suavizado(zoom_original.x, zoom_original.y, 1.5)

func zoom_suavizado(nuevo_zoom_x: float, nuevo_zoom_y: float, tiempo_transicion: float) -> void:
	tween_zoom.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(nuevo_zoom_x, nuevo_zoom_y),
		tiempo_transicion,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	tween_zoomm.start()
