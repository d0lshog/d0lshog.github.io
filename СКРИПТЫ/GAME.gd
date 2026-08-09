extends Node

var Costume :String
var Head :String
var Accessory :String

@onready var costume_set = $Control/VBoxContainer/COSTUME2 



@export_category("BUTTONS GROUPS")
@export var COSTUMES: ButtonGroup
@export var HEADES: ButtonGroup
@export var ACCS: ButtonGroup

@export_category("TEXTURES")
@export var textures_costume: Array[Texture2D]


func _ready() -> void:
	COSTUMES.pressed.connect(_update_costume)
	HEADES.pressed.connect(_update_head)
	ACCS.pressed.connect(_update_acc)
	
func _update_costume(pressed: TextureButton) -> void:
	match pressed.name:
		"PIJAMA2": costume_set.texture = textures_costume[0]
		"LAB HALAT2": costume_set.texture = textures_costume[1]
		"HEV2": costume_set.texture = textures_costume[2]
	#$Control/VBoxContainer/COSTUME.text = pressed.name
func _update_head(pressed: BaseButton) -> void:
	$Control/VBoxContainer/HEAD.text = pressed.name
func _update_acc(pressed: BaseButton) -> void:
	$Control/VBoxContainer/accessories.text = pressed.name

func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://СЦЕНЫ/MENU.tscn")

func _on_music_button_toggled(Music_Play: bool) -> void:
	MusicController.stream_paused = Music_Play


func _on_v_slider_value_changed(value: float) -> void:
	MusicController.volume_db =- value


func _on_foldable_container_folding_changed(is_folded: bool) -> void:
	if is_folded == true:
		$Control/FoldableContainer/HBoxContainer/FoldableContainer.set_v_size_flags(Control.SIZE_SHRINK_CENTER)
	else:
		$Control/FoldableContainer/HBoxContainer/FoldableContainer.set_v_size_flags(Control.SIZE_EXPAND_FILL)


func _on_shuffle_pressed() -> void:
	MusicController.play()
