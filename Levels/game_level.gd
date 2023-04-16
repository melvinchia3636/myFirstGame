extends Node2D

@onready var Chest = preload("res://Objects/chest.tscn")

func _ready():
	var chest_count = 10
	
	for i in chest_count:
		var chest = Chest.instantiate()
		chest.position = Vector2(randi_range(-1000, 1000) / 16 * 16, randi_range(-1000, 1000) / 16 * 16)
		chest.find_child("ChestContents").gen_random_item()
		add_child(chest)
