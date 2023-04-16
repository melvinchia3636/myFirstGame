extends Area2D

@onready var tooltip = get_node("../../Panel")
@onready var chest = $"../../ChestContents"

var isChestOpened: bool = false

func _ready():
	tooltip.visible = false

func _on_body_entered(body):
	if (body.get_name() == "PlayerCat"):
		tooltip.visible = true


func _on_body_exited(body):
	if (body.get_name() == "PlayerCat"):
		tooltip.visible = false

func _input(event):
	if (Input.is_action_pressed("open_inventory")):
		var overlapping = get_overlapping_bodies()
		for body in overlapping:
			if (body.get_name() == "PlayerCat" && !isChestOpened):
				isChestOpened = true
				chest.open_chest()
				
	if (Input.is_action_pressed("close_inventory")):
		chest.close_chest()
		isChestOpened = false
