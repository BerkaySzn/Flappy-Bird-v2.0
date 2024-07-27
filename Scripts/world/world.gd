extends Node

@export var plant_scene : PackedScene
@export var plant_scene2 : PackedScene
@export var flameeye_up_scn : PackedScene
@export var flameeye_down_scn : PackedScene
@export var fly_eater_up_scn: PackedScene
@export var fly_eater_down_scn: PackedScene
@export var spider_up_scn: PackedScene
@export var little_up_scn: PackedScene
@export var little_down_scn: PackedScene
var random = RandomNumberGenerator.new()
var random2 = RandomNumberGenerator.new()
var timer = Timer.new()
var timer2 = Timer.new()
var numup : int
var numdown : int
var game_running : bool
var scroll
const SCROLL_SPEED : float = 2.5
var screen_sizex : int
var screen_sizey : int
var plants : Array
var plants2 : Array
var flamedowns: Array
var flameups: Array
var flyeatersup: Array
var flyeatersdown: Array
var spidersup: Array
var littlesup: Array
var littlesdown: Array
const PLANT_DELAY : int = 0
const PLANT_RANGE : int = 128	
var randomup = RandomNumberGenerator.new()
var randomdown = RandomNumberGenerator.new()


func _ready():
	screen_sizex =1152
	screen_sizey=525
	random.randomize()
	timer.timeout.connect(_on_timer_timeout)
	timer2.timeout.connect(_on_timer2_timeout)
	add_child(timer)
	add_child(timer2)
	timer.start()
	timer2.start()
	new_game()
	start_game()

func new_game():
	game_running = false
	scroll = 0
	get_tree().call_group("plants", "queue_free")
	get_tree().call_group("plants2", "queue_free")
	get_tree().call_group("flamedowns", "queue_free")
	get_tree().call_group("flameups", "queue_free")
	get_tree().call_group("flyeatersup", "queue_free")
	get_tree().call_group("flyeatersdown", "queue_free")
	get_tree().call_group("spidersup", "queue_free")
	get_tree().call_group("littlesup", "queue_free")
	get_tree().call_group("littlesdown", "queue_free")
	plants.clear()
	plants2.clear()
	flamedowns.clear()
	flameups.clear()
	flyeatersdown.clear()
	flyeatersup.clear()
	spidersup.clear()
	littlesdown.clear()
	littlesup.clear()




func start_game():
	game_running = true
	


func _process(delta):
	
	if game_running:
		scroll += SCROLL_SPEED
		if scroll >= screen_sizex:
			scroll = 0

		for plant in plants:
			plant.position.x -= SCROLL_SPEED
		for plant2 in plants2:
			plant2.position.x -= SCROLL_SPEED	
		for flamedown in flamedowns:
			flamedown.position.x -= SCROLL_SPEED	
		for flameup in flameups:
			flameup.position.x -= SCROLL_SPEED	
		for flyeaterdown in flyeatersdown:
			flyeaterdown.position.x -= SCROLL_SPEED	
		for flyeaterup in flyeatersup:
			flyeaterup.position.x -= SCROLL_SPEED	
		for spiderup in spidersup:
			spiderup.position.x -= SCROLL_SPEED	
		for littleup in littlesup:
			littleup.position.x -= SCROLL_SPEED	
		for littledown in littlesdown:
			littledown.position.x -= SCROLL_SPEED		
func _on_timer_timeout():
	random_wall_down()
	timer.set_wait_time(random.randf_range(1,2))
	



func _on_timer2_timeout():
	random_wall_up()
	timer2.set_wait_time(random2.randf_range(1,1.5))
	


	
func random_wall_up():
	randomup.randomize()
	numup = randomup.randi_range(1,5)

	if numup==1:
		generate_plants2()
	elif numup==2:
		generate_flameup()
	elif numup==3:
		generate_fly_eater_up()
	elif numup==4:
		generate_spider_up()
	elif numup==5:
		generate_little_up()
	
func random_wall_down():
	randomdown.randomize()
	numdown = randomdown.randi_range(1,4)
	if numdown==1:
		generate_plants()
	elif numdown==2:
		generate_flamedown()
	elif numdown==3:
		generate_fly_eater_down()
	elif numdown==4:
		generate_little_down()
	
func generate_plants():#alt
	var plant = plant_scene.instantiate()
	plant.position.x = screen_sizex + PLANT_DELAY
	plant.position.y = (screen_sizey)  
	add_child(plant)
	plants.append(plant)	

	
	

	
func generate_plants2():#üst
	var plant2 = plant_scene2.instantiate()
	plant2.position.x = screen_sizex + PLANT_DELAY
	plant2.position.y = (screen_sizey)
	add_child(plant2)
	plants2.append(plant2)



func generate_flamedown():
	var flamedown = flameeye_down_scn.instantiate()
	flamedown.position.x = screen_sizex + PLANT_DELAY
	flamedown.position.y = (screen_sizey)
	add_child(flamedown)
	flamedowns.append(flamedown)
	


	
func generate_flameup():
	var flameup = flameeye_up_scn.instantiate()
	flameup.position.x = screen_sizex + PLANT_DELAY
	flameup.position.y = (screen_sizey)
	add_child(flameup)
	flameups.append(flameup)
	
func generate_fly_eater_down():
	var flyeaterdown = fly_eater_down_scn.instantiate()
	flyeaterdown.position.x = screen_sizex + PLANT_DELAY
	flyeaterdown.position.y = (screen_sizey)
	add_child(flyeaterdown)
	flyeatersdown.append(flyeaterdown)

func generate_fly_eater_up():
	var flyeaterup = fly_eater_up_scn.instantiate()
	flyeaterup.position.x = screen_sizex + PLANT_DELAY
	flyeaterup.position.y = (screen_sizey)
	add_child(flyeaterup)
	flyeatersup.append(flyeaterup)

func generate_spider_up():
	var spiderup = spider_up_scn.instantiate()
	spiderup.position.x = screen_sizex + PLANT_DELAY
	spiderup.position.y = (screen_sizey)
	add_child(spiderup)
	spidersup.append(spiderup)

func generate_little_down():
	var littledown = little_down_scn.instantiate()
	littledown.position.x = screen_sizex + PLANT_DELAY
	littledown.position.y = (screen_sizey)
	add_child(littledown)
	littlesdown.append(littledown)	


func generate_little_up():
	var littleup = little_up_scn.instantiate()
	littleup.position.x = screen_sizex + PLANT_DELAY
	littleup.position.y = (screen_sizey)
	add_child(littleup)
	littlesup.append(littleup)	



