extends Node2D




@onready var _lines: Node2D = $Line2D
@onready var _camera = $Camera2D
@onready var sprite = $Sprite2D



var _pressed: bool = false
var _current_line: Line2D = null


#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#_pressed = event.pressed
			#
			#
			#if _pressed:
				#_current_line = Line2D.new()
				#_current_line.default_color = Color.BLUE
				#_current_line.width = 4
				#_lines.add_child(_current_line)
				#_current_line.add_point(event.position)
				#
#
	#elif event is InputEventMouseMotion and _pressed:
			#_current_line.add_point(event.position)
#
#func _ready() -> void:
	#randomize()
	#
#
#func _process(delta: float) -> void:
	#pass
#
#func _draw_line(startx, starty, movex, movey):
	#_current_line = Line2D.new()
	#_current_line.default_color = Color.BLUE
	#_current_line.width = 4
	#_lines.add_child(_current_line)
	#if startx: position.x = startx
	#if starty: position.y = starty
	#_current_line.add_point(position)
	#if movex: position.x += movex
	#if movey: position.y += movey
	#$Camera2D.position = position
	#_current_line.add_point(position)
#
#func draw_rectangle(point1, point2):
	#_draw_line(null, null, point1, null)
	#_draw_line(null, null, null, point2)
	#_draw_line(null, null, -point1, null)
	#_draw_line(null, null, null, -point2)
#
#func draw_square(point1):
	#draw_rectangle(point1, point1)
#
#func draw_circle(radius):



func _draw() -> void:
	#draw_rect(Rect2(Vector2(50, 50), Vector2(200, 100)), Color(1, 0, 0, 1))
	if sprite.texture:
		draw_texture(sprite.texture, Vector2(0, 0))	
	

func _process(_delta):
	queue_redraw()	
