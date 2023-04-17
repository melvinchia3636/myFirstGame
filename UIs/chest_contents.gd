extends CanvasLayer

@onready var Grid = $CenterContainer/Panel/MarginContainer/VBoxContainer/Grid
@onready var Item = preload("res://Objects/chest_item.tscn")
@onready var Anim = $AnimationPlayer

enum ITEMS {WOOD, STONE}
var items: Array = []

func gen_random_item():
	var item_count = randi_range(1, 10)
	
	for i in item_count:
		items.append({
			"id": i,
			"item": randi() % ITEMS.size()
		})

func _ready():
	visible = false

func open_chest():
	visible = true
	Anim.play("open_chest")
	
	for n in Grid.get_children():
		Grid.remove_child(n)
		n.queue_free()
	
	for idx in items.size():
		var ItemInstance = Item.instantiate()
		ItemInstance.find_child("Icon").item = items[idx].item
		ItemInstance.id = items[idx].id
		Grid.add_child(ItemInstance)

func close_chest():
	Anim.play("close_chest")


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "close_chest"):
		visible = false
