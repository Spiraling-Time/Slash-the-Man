extends Node2D




var hit_positions: Array = [] # Stores the hit positions


func _draw() -> void:
	#draw_circle(Vector2(1,1), 100, Color.RED)
	#print(hit_positions)
	
	pass
	#for i in range(hit_positions.size()):
	#	draw_circle(hit_positions[i], 2, Color.RED)




func _on_sword_wound(collision_point) -> void:
	hit_positions.append(Vector2(collision_point.x-40.5, collision_point.y-264)) # Add hit position to the list
	#hit_positions.append(Vector2(collision_point.x-40, collision_point.y-60)) # Add hit position to the list

func _process(delta: float) -> void:
	#queue_redraw()	
	pass


#func _on_head_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_head_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_arm_l_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_arm_l_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_arm_r_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_arm_r_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_body_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_body_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_leg_l_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_leg_l_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_leg_r_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_leg_r_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_foot_l_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_foot_l_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_foot_r_area_entered(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
##
##
#func _on_foot_r_area_exited(area: Area2D) -> void:
	#hit_positions.append(Vector2(area.position.x-40, area.position.y-60))
