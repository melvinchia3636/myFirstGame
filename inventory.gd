extends CanvasLayer

@onready var Wood = $Wood
@onready var Stone = $Stone

var counters = {
	"WOOD": 0,
	"STONE": 0
}


func _ready():
	Wood.item = Wood.ITEMS.WOOD
	Stone.item = Stone.ITEMS.STONE
		

func update_counter(item):
	counters[item.to_upper()] += 1
	get_node(item.capitalize() + "Counter").text = str(counters[item.to_upper()])
