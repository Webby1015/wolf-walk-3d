extends Control
@onready var game: RigidBody3D = $"../../../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	game.pausemenu()
func _on_resume_mouse_entered() -> void:
	GameManager.sounds.hoverSound()


func _on_main_menu_pressed() -> void:
	GameManager.navigation.to_mainmenu()
func _on_main_menu_mouse_entered() -> void:
	GameManager.sounds.hoverSound()


func _on_quit_game_pressed() -> void:
	GameManager.navigation.quit_game()
func _on_quit_game_mouse_entered() -> void:
	GameManager.sounds.hoverSound()
	
