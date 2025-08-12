extends CanvasLayer

@onready var star: TextureRect = %star
@onready var star_2: TextureRect = %star2
@onready var star_3: TextureRect = %star3
@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")
@onready var health_label: Label = $CenterContainer/PanelContainer/VBoxContainer/HealthLabel
@onready var gold_label: Label = $CenterContainer/PanelContainer/VBoxContainer/GoldLabel

func victory() -> void:
	visible = true
	if base.max_health == base.current_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
	if  bank.gold> 500:
		star_3.modulate = Color.WHITE
		gold_label.visible = true
	

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
