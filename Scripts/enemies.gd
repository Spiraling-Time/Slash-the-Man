extends Node2D


@onready var sprite = $Sprite2D
@onready var h_wound = $Wounds/head_wound



var bugthing1 = 0
var bugthing2 = 0

var hit_type = null

var cut_points: Array = []

var entry_point: Vector2
var exit_point: Vector2


var lastHIT: Vector2


#func _draw() -> void:
	#if sprite.texture:
		#draw_texture(sprite.texture, Vector2(-480, -270))



func be_woundedin(area, type):
	#bugthing1 += 1
	#if bugthing1 > 16:
		##sprite.texture.region = Rect2(Vector2(0, 151.117), Vector2( 960, 388.883))
		##if !h_wound.visible:
			##h_wound.visible = true
		#entry_point = area.position + Vector2(0, 255)
	##	area.position = Vector2(0,-45)
		#if cut_points.size() > 1:
			#if cut_points[cut_points.size() - 1] != entry_point:
				#cut_points.append(entry_point)
				#hit_type = type
				#print("in")
				#print("cut_pointsize: ", cut_points.size())
#
		#else:
			#cut_points.append(entry_point) 
			#hit_type=type
			#print("in?")
			#print("cut_pointsize: ", cut_points.size())
#END REAL CODE
	pass
		#print(area.position)
#	print(Area2D, "bugthing1: ", bugthing1)

func be_woundedout(area, type):
	#real code
	#if cut_points.size() > 1:
		#if cut_points[cut_points.size() - 1] != exit_point:
			#cut_points.append(exit_point)
			#hit_type = type
			#print("out")
			#print("cut_pointsize: ", cut_points.size())
	#else:
		#cut_points.append(exit_point) 
		#hit_type=type
		#print("out?")
		#print("cut_pointsize: ", cut_points.size())

	#END REAL CODE
	
	
	
	#bugthing2 += 1
	#if bugthing2 > 16:
	
	#sprite.texture.region = Rect2(Vector2(0, 151.117), Vector2( 960, 388.883))
	#if !h_wound.visible:
		#h_wound.visible = true
		
		
	#exit_point = area.position
	#cut_points.append(entry_point)
	#cut_points.append(exit_point)
	pass
	
	#print(area.position)
#	print(Area2D, "bugthing2: ", bugthing2)


func _process(delta: float) -> void:
	#if hit_type:
		#print(hit_type.get_overlapping_areas().size())
		#if hit_type.get_overlapping_areas().size() > 0:
			#for area in hit_type.get_overlapping_areas():
				#cut_points.append(area.position)
				#hit_type = null
				#return
			#return
	queue_redraw()




func _draw() -> void:
	#print("cut_pointsize: ", cut_points.size())
	#print("cut_points: ", cut_points)
	if sprite.texture:
		draw_texture(sprite.texture, Vector2(-480, -270))
	#for i in range(cut_points.size()):
		#if i % 2 == 0 and i > 0:
			#draw_line(Vector2(cut_points[i]), Vector2(cut_points[i-1]), Color.RED, 7)
			##print("cut1: ", cut_points[i]," cut2: ", cut_points[i-1] )
	
	
	# Ensure we have at least 2 points before drawing
	if cut_points.size() < 2:
		return  

	# Only iterate over valid pairs
	for i in range(1, cut_points.size(), 2):  # Step by 2
		#draw_polyline(points, color, width, true)
		draw_line(cut_points[i - 1], cut_points[i], Color.RED, 5)
		#draw_polyline([cut_points[i - 1], cut_points[i]], Color.RED, 5, true)

	#for i in range(cut_points.size()):
		#draw_circle(cut_points[i], 2, Color.RED)
		
		
		
		
func _on_sword_wound(bleedthere: Vector2) -> void:
	var thewound = bleedthere + Vector2(0, 255)
	if cut_points.size() > 1:
		#if cut_points[cut_points.size() - 1] != lastHIT:
		cut_points.append(thewound)
			#lastHIT = thewound
			#print("in")
			#print("cut_pointsize: ", cut_points.size())
			#print("the last point: ", lastHIT, " this point: ", thewound)
		#else: print("they are the same")
		#print("last point: ", lastHIT, " this point: ", thewound)

	else:
		cut_points.append(thewound) 
		#print("in?")
		#print("cut_pointsize: ", cut_points.size())


func _on_head_area_entered(area: Area2D) -> void:
	be_woundedin(area, $head)
#
func _on_head_area_exited(area: Area2D) -> void:
	be_woundedout(area, $head)
	#pass
#
#
func _on_arm_l_area_entered(area: Area2D) -> void:
	be_woundedin(area, $armL)
#
#
func _on_arm_l_area_exited(area: Area2D) -> void:
	be_woundedout(area, $armL)
	#pass
#
#
func _on_arm_r_area_entered(area: Area2D) -> void:
	be_woundedin(area, $armR)
#
#
func _on_arm_r_area_exited(area: Area2D) -> void:
	be_woundedout(area,$armR)
	#pass
#
#
func _on_body_area_entered(area: Area2D) -> void:
	be_woundedin(area, $body)
#
#
func _on_body_area_exited(area: Area2D) -> void:
	be_woundedout(area, $body)
	#pass
#
#
func _on_leg_l_area_entered(area: Area2D) -> void:
	be_woundedin(area, $legL)
#
#
func _on_leg_l_area_exited(area: Area2D) -> void:
	be_woundedout(area, $legL)
	#pass
#
#
func _on_leg_r_area_entered(area: Area2D) -> void:
	be_woundedin(area, $legR)
#
#
func _on_leg_r_area_exited(area: Area2D) -> void:
	be_woundedout(area, $legR)
	#pass
#
#
func _on_foot_l_area_entered(area: Area2D) -> void:
	be_woundedin(area, $footL)
#
#
func _on_foot_l_area_exited(area: Area2D) -> void:
	be_woundedout(area, $footL)
	#pass
#
#
func _on_foot_r_area_entered(area: Area2D) -> void:
	be_woundedin(area, $footR)
#
#
func _on_foot_r_area_exited(area: Area2D) -> void:
	be_woundedout(area, $footR)
	#pass


func _on_neck_area_entered(area: Area2D) -> void:
	be_woundedin(area, $neck)


func _on_neck_area_exited(area: Area2D) -> void:
	be_woundedout(area, $neck)
	#pass
