extends Area2D

var item_cost

signal Score

func _ready():
	var spawn_number = randi() % 100 + 1 
	print(spawn_number)
	
	if spawn_number > 30 and spawn_number < 80: 
		generate_treasure()
	elif spawn_number > 30 and spawn_number > 80:
		generate_rare_treasure()
	else: 
		queue_free()

func generate_treasure():
	var normal_list = []
	
	var item1 = {"name": "Colar","sprite_name": "item1","cost": 100}
	var item2 = {"name": "Calice","sprite_name": "item4","cost": 200}
	var item3 = {"name": "Anel","sprite_name": "item3","cost": 300}
	
	normal_list.append(item1)
	normal_list.append(item2)
	normal_list.append(item3)
	
	var random_item = normal_list[randi() % normal_list.size()]
	
	var sprite_name = random_item["sprite_name"]
	item_cost = random_item["cost"]
	
	$AnimatedSprite2D.play(sprite_name)
	print("Custo:", item_cost)
	
	return item_cost


func generate_rare_treasure():
	var rare_list = []
	var item1 = {"name":"Ring", "sprite_name":"item6", "cost":450}
	var item2 = {"name":"Map", "sprite_name":"item5", "cost":500}
	var item3 = {"name":"Bracelet", "sprite_name":"item2", "cost":600}
	
	rare_list.append(item1)
	rare_list.append(item2)
	rare_list.append(item3)
	
	var random_item = rare_list[randi() % rare_list.size()]
	
	var sprite_name = random_item["sprite_name"]
	item_cost = random_item["cost"]
	
	$AnimatedSprite2D.play(sprite_name)
	print("Custo:", item_cost)
	
	return item_cost
	

func _on_body_entered(body):
	if body.is_in_group("player"):
		print(item_cost)
		Score.emit(item_cost)
		queue_free()
