extends Control


func _on_back_pressed() -> void:
	GameManager.navigation.to_mainmenu()

func _on_back_mouse_entered() -> void:
	GameManager.sounds.hoverSound()

func _on_enter_game_pressed() -> void:
	GameManager.navigation.to_3dLevel()

func _on_enter_game_focus_entered() -> void:
	GameManager.sounds.hoverSound()
