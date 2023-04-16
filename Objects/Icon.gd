extends Sprite2D

var ITEM_POSITION = {
	"WOOD": Vector2(16, 16),
	"STONE": Vector2(0, 16)
}

enum ITEMS {WOOD, STONE}

@export var item: ITEMS:
	get:
		return item
	set(value):
		item = value
		update_icon()

func update_icon():
	var item_pos = ITEM_POSITION[ITEMS.keys()[item]]
	region_rect = Rect2(item_pos.x, item_pos.y, 16, 16)
