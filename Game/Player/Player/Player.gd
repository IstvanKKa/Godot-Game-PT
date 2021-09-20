extends Character

onready var knife: Node2D = get_node("Knife")
onready var knife_hitbox: Area2D = get_node("Knife/Node2D/Sprite/Hitbox")
onready var knife_animation_player: AnimationPlayer = knife.get_node("KnifeAnimationPlayer")


func _process(delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	knife.rotation = mouse_direction.angle()
	knife_hitbox.knockback_direction = mouse_direction
	if knife.scale.y == 1 and mouse_direction.x < 0:
		knife.scale.y = -1
	elif knife.scale.y == -1 and mouse_direction.x > 0:
		knife.scale.y = 1
		
func get_input() -> void:
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("right"):
		mov_direction += Vector2.RIGHT
	if Input.is_action_pressed("up"):
		mov_direction += Vector2.UP
		
		
	if Input.is_action_just_pressed("ui_attack") and not knife_animation_player.is_playing():
		knife_animation_player.play("attack")


func switch_camera() -> void:
	var main_scene_camera: Camera2D = get_parent().get_node("Camera2D")
	main_scene_camera.position = position
	main_scene_camera.current = true
	get_node("Camera2D").current = false
