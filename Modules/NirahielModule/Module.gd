extends Module


func _init():
	id = "NirahielModule"
	author = "Nirahiel"
	
	events = [
		"res://Modules/NirahielModule/Events/NirahielEnteringCellEvent.gd"
	]
	
	scenes = [
		"res://Modules/NirahielModule/Scenes/NirahielTinkerScene.gd"
	]
