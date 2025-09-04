extends Node

var primeira_fase : String = "res://scenes/fases/fase_03/fase_03.tscn"

var add = false
var turnOnFadeOut = false
var selector_activated = true
var counter = 0

@onready var current_scene_name = get_tree().current_scene.name

#var is_initialized: bool = false
#@onready var admob = get_node("/root/"+current_scene_name+"/Admob")

@onready var selector1 = get_node("/root/"+current_scene_name+"/selector")
@onready var selector2 = get_node("/root/"+current_scene_name+"/selector2")
@onready var selector3 = get_node("/root/"+current_scene_name+"/selector3")
@onready var selector4 = get_node("/root/"+current_scene_name+"/selector4")
#@onready var selector5 = get_node("/root/"+current_scene_name+"/selector5")
@onready var controls_screen = get_node("/root/"+current_scene_name+"/Controls_Scr")
@onready var instructions_screen = get_node("/root/"+current_scene_name+"/Instructions_Scr")
@onready var about_screen = get_node("/root/"+current_scene_name+"/About_Scr")
@onready var back_arrow = get_node("/root/"+current_scene_name+"/BackArrow")

@onready var titleMusic : AudioStreamPlayer = $SomTitleScreen
@onready var select : AudioStreamPlayer = $SomSelector
@onready var selected : AudioStreamPlayer = $SomChoosed

func _ready():
	#admob
	#admob.initialize()
	selector1.input_event.connect(_on_selector1_input_event)
	selector2.input_event.connect(_on_selector2_input_event)
	selector3.input_event.connect(_on_selector3_input_event)
	selector4.input_event.connect(_on_selector4_input_event)
	back_arrow.input_event.connect(_on_back_arrow_input_event)


func _process(delta):
	#receber_inputs()
	set_music_fade_out()
	
# Selector 1 - Inicia jogo
func _on_selector1_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		selected.play()
		turnOnFadeOut = true
		await get_tree().create_timer(2.0).timeout
		GlobalData.reset_lives()
		ScoreManager.reset_player_score()
		GlobalData.reset_level()
		GlobalData.reset_stageCounter()
		get_tree().change_scene_to_file(primeira_fase)


# Selector 2 - Tela de controles
func _on_selector2_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		selected.play()
		instructions_screen.visible = true 
		back_arrow.visible = true
		selector1.visible = false
		selector2.visible = false
		selector3.visible = false
		selector4.visible = false
		#admob
		#if is_initialized:
			#print_debug("on_start_is_initalized")
			#admob.load_banner_ad()
			#await admob.rewarded_ad_loaded
			#admob.show_banner_ad()


# Selector 3 - Tela sobre
func _on_selector3_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		selected.play()
		about_screen.visible = true 
		back_arrow.visible = true
		selector1.visible = false
		selector2.visible = false
		selector3.visible = false
		selector4.visible = false
		#admob
		#if is_initialized:
			#print_debug("confirm_selec_is_initialized")
			#admob.load_rewarded_ad()
			#await admob.rewarded_ad_loaded
			#admob.show_rewarded_ad()
  

# Selector 4 - Sair do jogo
func _on_selector4_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		selected.play()
		await get_tree().create_timer(1.0).timeout
		get_tree().quit()

				
# Botão de voltar (back_arrow)
func _on_back_arrow_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		controls_screen.visible = false
		instructions_screen.visible = false 
		about_screen.visible = false
		back_arrow.visible = false
		selector1.visible = true
		selector2.visible = true
		selector3.visible = true
		selector4.visible = true


func set_music_fade_out() -> void:
	# Diminui o volume da música em 1 dB a cada intervalo de tempo
	if (turnOnFadeOut):
		titleMusic.set_volume_db(titleMusic.volume_db - 0.3)
		if titleMusic.volume_db <= -80:
		# Para a reprodução da música
			titleMusic.stop()

#
#func _on_admob_initialization_completed(status_data: InitializationStatus) -> void:
	#print_debug("on_admob_initialization")
	#is_initialized = true
