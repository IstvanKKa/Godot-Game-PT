extends KinematicBody2D
class_name Istton, "res://NPC/Istton.png"

onready var player: KinematicBody2D = get_tree().current_scene.get_node("Player")
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")
onready var animation_istton: AnimationPlayer = get_node("IsttonAnimationPlayer")

func _process(delta) -> void:
	animation_istton.play("idle")
	var player_direction: Vector2 = player.position - position
	if player_direction.x < 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif player_direction.x > 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
