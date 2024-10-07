extends Node

var pellets_eaten = 0
var total_pellets_count = 0
var current_score = 0

@onready var ui = $"../UI" as UI
@onready var pellet_count_label = ui.get_node("pellet_count_label")  # Access your label in the UI
@onready var score_label = ui.get_node("score_label")
@onready var game_timer = $"../Timer"


func _ready():
	var pellets = self.get_children() as Array[Pellet]
	total_pellets_count = pellets.size()
	update_pellet_ui()  # Update the UI with initial values
	
	game_timer.start()
	
	for pellet in pellets:
		pellet.pellet_eaten.connect(on_pellet_eaten)

func on_pellet_eaten():
	pellets_eaten += 1
	update_pellet_ui()  # Update the UI after a pellet is eaten
	
	if pellets_eaten == total_pellets_count:
		# Game won condition
		ui.game_won()

func update_pellet_ui():
	var pellets_remaining = total_pellets_count - pellets_eaten
	pellet_count_label.text = "Pellets Eaten: %d / %d" % [pellets_eaten, total_pellets_count]
	score_label.text = "Score: %d" % [pellets_eaten * 10]


func _on_timer_timeout():
	ui.game_over()
