extends Node2D


@onready var cam = $Camera2D
@onready var cursor = $cursor

signal wound (bleedthere: Vector2) #maybe I will use



var premouseposition = Vector2(0,0)
var mouse_position = Vector2(0,0)
var collision_point = Vector2(0,0)
var trail = 48#was 45 #was 50
var PreAreaPos = Vector2(0,0)
var STAYBACK: bool = true
var init: bool = false
var coordinate: bool = false



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
		
		var mouse_here = get_global_mouse_position() - Vector2(0, trail)
		await event.pressed == false
		
		if !started:
			R1.position = mouse_here
			R1.target_position = Vector2.ZERO
			R1.force_raycast_update()
			if !R1.is_colliding():
				started = true
				start_point = mouse_here

				


		elif !ended:
			R2.position = mouse_here
			R2.target_position = Vector2.ZERO
			R2.force_raycast_update()
			if !R2.is_colliding():
				ended = true
				end_point = mouse_here
					#shoot the rays
				R1.position = start_point
				R1.target_position = end_point - R1.position
				R2.position = end_point
				R2.target_position = start_point - R2.position
			else:
				started = false
				ended = false
				line_started = false
				line_ended = false
				R1.position = Vector2(0, 100)
				R1.target_position = Vector2.ZERO
				R2.position = Vector2(0, 100)
				R2.target_position = Vector2.ZERO				

		#else:
			#started = false
			#ended = false
			#line_started = false
			#line_ended = false
			#R1.position = Vector2(0, 100)
			#R1.target_position = Vector2.ZERO
			#R2.position = Vector2(0, 100)
			#R2.target_position = Vector2.ZERO



func _process(delta: float) -> void:
	
	
	premouseposition = mouse_position
	cursor.position = get_local_mouse_position()
	mouse_position = cursor.position - Vector2(0, trail)
	cam.position = mouse_position

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
				$"../enemies".cut_points.append(line_point1 + Vector2(0, 193))
				$"../enemies".cut_points.append(line_point2 + Vector2(0, 193)) 
				started = false
				ended = false
				line_started = false
				line_ended = false
	
	queue_redraw()			
				
				
	
	











func _draw() -> void:

	if 	premouseposition != mouse_position and premouseposition.distance_to(mouse_position) > 5:
		if premouseposition.distance_to(mouse_position) < 10:
			draw_line(Vector2(premouseposition), Vector2(mouse_position), Color.SILVER, premouseposition.distance_to(mouse_position)/2)
		else: draw_line(Vector2(premouseposition), Vector2(mouse_position), Color.SILVER, 10)





	#
	##draw_line($RayCast2D.position, $RayCast2D.position + $RayCast2D.target_position, Color.BLUE, 10)
#
	#
	##for hit_pos in hit_positions:
		###draw_circle(hit_pos, 5, Color.RED)
		##draw_line(hit_pos[0], hit_pos[1], Color.RED, 5)
#
#
		###if $RayCast2D.is_colliding():
			###collision_point = $RayCast2D.get_collision_point()
			###print("hit at", collision_point)
			###emit_signal("wound", collision_point)
		##
		###area raycast mix
		##if $RayCast2D.is_colliding():
			##if !$RayCast2D.position == $RayCast2D.get_collision_point():
				##collision_point = $RayCast2D.get_collision_point()
				###$Area2D.visible = true
				##if $RayCast2D.global_position.y < $RayCast2D.target_position.y: # - $RayCast2D.position.y:
					##$Area2D.position.y = collision_point.y - 256
					##STAYBACK = false
					##print("hit from above")
				##else:
					##$Area2D.position.y = collision_point.y - 254
					##STAYBACK = false
					##print("hit from below")
				##print("RaycastY: ", $RayCast2D.global_position.y, " TargetY ", $RayCast2D.target_position.y) # - $RayCast2D.position.y)
				##if $RayCast2D.global_position.x < $RayCast2D.target_position.x: # - $RayCast2D.position.y:
					##$Area2D.position.x = collision_point.x - 1
					##STAYBACK = false
					##print("hit from above")
				##else:
					##$Area2D.position.x = collision_point.x + 1
					##STAYBACK = false
					##print("hit from below")
				##print("RaycastX: ", $RayCast2D.global_position.x, " TargetX ", $RayCast2D.target_position.x) # - $RayCast2D.position.y)
##
##
				###$Area2D.visible = false
				##print("hit at", collision_point)
				###I need to shoot a raycast from the mouse to the area to get the exit
				##intohit = true
#
#func _process(_delta):
	##MAKE THIS MAKE POINTS WHEN LEAVING
	#
	##$Area2D.visible = false
	#PreAreaPos = $Area2D.position
	#premouseposition = mouse_position
	#mouse_position.x = get_local_mouse_position().x
	#mouse_position.y = get_local_mouse_position().y-trail
	#cursor.position.x = mouse_position.x
	#cursor.position.y = mouse_position.y+trail
	#cam.position = mouse_position
#
	#if !STAYBACK:
	#
		#
		#$RayCast2D.position = mouse_position
		#$RayCast2D.target_position = $Area2D.position - $RayCast2D.position #Vector2(-mouse_position.x+$Area2D.position.x, -mouse_position.y+$Area2D.position.y)
#
#
	#else:
		#
		#
		#$RayCast2D.position = premouseposition
		#$RayCast2D.target_position = mouse_position - premouseposition
#
		##$RayCast2D.position = $Area2D.position
		##$RayCast2D.target_position = mouse_position - $RayCast2D.position
	#
	#
	##area raycast mix
	##$RayCast2D.force_raycast_update()
	#if $RayCast2D.is_colliding():
		##if $RayCast2D.global_position.distance_to($RayCast2D.get_collision_point()) >= 5.0:
		#collision_point = $RayCast2D.get_collision_point()
		##$Area2D.visible = true
		#if $RayCast2D.global_position.y < $RayCast2D.target_position.y: # - $RayCast2D.position.y:
			#$Area2D.position.y = collision_point.y - 256
			#STAYBACK = false
			##print("hit from above")
		#else:
			#$Area2D.position.y = collision_point.y - 254
			#STAYBACK = false
			##print("hit from below")
		##print("RaycastY: ", $RayCast2D.global_position.y, " TargetY ", $RayCast2D.target_position.y) # - $RayCast2D.position.y)
		#if $RayCast2D.global_position.x < $RayCast2D.target_position.x: # - $RayCast2D.position.y:
			#$Area2D.position.x = collision_point.x - 1
			#STAYBACK = false
			##print("hit from above")
		#else:
			#$Area2D.position.x = collision_point.x + 1
			#STAYBACK = false
			##print("hit from below")
		##print("RaycastX: ", $RayCast2D.global_position.x, " TargetX ", $RayCast2D.target_position.x) # - $RayCast2D.position.y)
		##$Area2D.visible = false
		##print("hit at", collision_point)
		#
		##I need to shoot a raycast from the mouse to the area to get the exit
#
#
	#
	#
		##else:
			##if coordinate:
			##$"../enemies".cut_points.pop_back()
			##$"../enemies".cut_points.append(collision_point)
				##coordinate = false
			#
		##	print("no deal")
		##print("$RayCast2D.global_position: ", $RayCast2D.global_position, " $RayCast2D.get_collision_point(): ", $RayCast2D.get_collision_point())
		#
	##else:
		##if coordinate:
			##$"../enemies".cut_points.pop_back()
			##coordinate = false
		##print("nope")
#
		#if PreAreaPos != $Area2D.position:
			#emit_signal("wound", $Area2D.position)
			#STAYBACK = true
			#coordinate = true
	#queue_redraw()		
		##else:
			##$"../enemies".cut_points.pop_back()
			##print("popback")
#
	##
	##
			###area raycast mix
		##if $RayCast2D.is_colliding():
			##collision_point = $RayCast2D.get_collision_point()
			###$Area2D.visible = true
			##$Area2D.position.x = collision_point.x
			##$Area2D.position.y = collision_point.y-250
		###	$Area2D.visible = false
			##print("hit at", collision_point)
			###I need to shoot a raycast from the mouse to the area to get the exit
			##intohit = false
	#
	#
	#
	#
	##atlas???
	#
	#
	#
	#
	#
	#
##maybe get color of pixel and if not white or red put red
##here we go...nope
	##get_screen_color(cursor.position)
		##await !$RayCast2D.is_colliding()
			##
		##if collision_point != Vector2(cursor.position):
			##collision_point = Vector2(cursor.position)
			##print("hit at", collision_point)
			##emit_signal("wound", collision_point)
##area
#
#
#
#
	##$Area2D.position.x = cursor.position.x
	##$Area2D.position.y = cursor.position.y
	#
	##end of working area script
	#
	##if $Area2D.get_overlapping_areas().size() > 0:
		##collision_point = $Area2D.position
		##print("hit at", collision_point)
		##emit_signal("wound", collision_point)
#
#
#
	##if premouseposition == mouse_position:
		##cursor.visible = true
	##else:
		##cursor.visible = false
#
#
##func get_screen_color(screen_position: Vector2) -> Color:
	###var screen = get_viewport().get_texture().get_image()
	###var clamped_position = screen_position.clamp(Vector2(0, 0), Vector2(screen.get_width() - 1, screen.get_height() - 1))
	###var color = screen.get_pixelv(clamped_position)
	###print("Color at position ", screen_position, ": ", color)
	###return color
	##var color = get_viewport().get_texture().get_image().get_pixelv(screen_position)
	##print("Color at position ", screen_position, ": ", color)
	##return color
