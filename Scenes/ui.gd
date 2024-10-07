extends CanvasLayer


class_name UI

@onready var win_container = $MarginContainer/WinContainer
@onready var lose_container = $MarginContainer/LoseContainer


func game_won():
	win_container.show()

func game_over():
	lose_container.show()
