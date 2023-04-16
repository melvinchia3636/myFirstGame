extends Button

@onready var Icon = $"../Icon"
@onready var Inventory = $"../../../../../../../Inventory"

func _ready():
	print(Inventory)


func _on_pressed():
	var item = Icon.ITEMS.keys()[Icon.item]
	Inventory.update_counter(item)
	var chestItem = get_parent()
	var chestItemsGrid = chestItem.get_parent()
	var chestItemsContainer = chestItemsGrid.get_parent().get_parent().get_parent()
	
	var is_target = func (elem): return elem.id == chestItem.id
	
	var to_be_deleted = chestItemsContainer.items.filter(is_target)[0]
	chestItemsContainer.items.remove_at(chestItemsContainer.items.find(to_be_deleted))
	chestItemsGrid.remove_child(chestItem)
	chestItem.queue_free()
