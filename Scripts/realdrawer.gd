extends Node2D

@onready var R1 = $RayCast2D1
@onready var R2  = $RayCast2D2


var started: bool = false
var ended: bool = false
var line_started: bool = false
var line_ended: bool = false



var start_point: Vector2
var end_point: Vector2
var line_point1: Vector2
var line_point2: Vector2



func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		var mouse_here = get_global_mouse_position()
		await event.pressed == false
		print("Left mouse button clicked!")
		
		if !started:
			print("start")
			R1.position = mouse_here
			R1.target_position = Vector2.ZERO
			started = true
			R1.force_raycast_update()
			if !R1.is_colliding():
				start_point = mouse_here
				


		elif !ended:
			R2.position = mouse_here
			R2.target_position = Vector2.ZERO
			ended = true
			R2.force_raycast_update()
			if !R2.is_colliding():
				end_point = mouse_here
					#shoot the rays
				R1.position = start_point
				R1.target_position = end_point - R1.position
				R2.position = end_point
				R2.target_position = start_point - R2.position



func _process(delta: float) -> void:
	if started and ended:
		if !line_started:
			if R1.is_colliding():
				line_point1 = R1.get_collision_point()
				line_started = true
			else:
				started = false
				ended = false
				line_started = false
				line_ended = false
	
		elif !line_ended:
			if R2.is_colliding():
				line_point2 = R2.get_collision_point()
				line_ended = true
				$"../enemies".cut_points.append(line_point1)
				$"../enemies".cut_points.append(line_point2) 
				started = false
				ended = false
				line_started = false
				line_ended = false
				
				
				
	
	
