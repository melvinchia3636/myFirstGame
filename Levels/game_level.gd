extends Node2D

@onready var Chest = preload("res://Objects/chest.tscn")
@onready var Three = preload("res://Objects/tree.tscn")
@onready var Map = $TileMap

func generate_chests():
	var chest_count = 100
	
	for i in chest_count:
		var chest = Chest.instantiate()
		while (true):
			var coords = Vector2(
				floori(randi_range(-1000, 1000) / 16) + 1, 
				floori(randi_range(-1000, 1000) / 16) + 1
			)
			var base_ground_tileset_id = Map.get_cell_source_id(0, coords)
			var top_ground_tileset_id = Map.get_cell_source_id(1, coords)
			
			if (base_ground_tileset_id == 0 || top_ground_tileset_id == 1):
				chest.position = Vector2(coords.x - 1, coords.y - 1) * 16
				chest.find_child("ChestContents").gen_random_item()
				add_child(chest)
				break
				
func generate_trees():
	var noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	for y in range(-100, 100):
		for x in range(-100, 100):
			if (absi(noise.get_noise_2d(x * 16, y * 16) > 0.4)):
				var tree = Three.instantiate()
				tree.position = Vector2(x * 16, y * 16)
				add_child(tree)

func _ready():
	generate_chests()
	generate_trees()
