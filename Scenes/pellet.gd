extends Area2D

class_name Pellet

signal pellet_eaten()

func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if body is Player:
		pellet_eaten.emit()
		queue_free()
