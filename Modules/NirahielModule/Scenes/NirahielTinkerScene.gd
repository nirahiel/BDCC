extends SceneBase

var inventoryScreenScene = preload("res://UI/Inventory/GenericInventoryScreen.tscn")

func _init():
	sceneID = "NirahielTinkerScene"

func _run():
	if (state == ""):
		saynn("You get ready to tinker with your items")
		addButton("Stop Tinkering", "You're done tinkering for now", "endthescene")

func _react(_action: String, _args):
	if (_action == "endthescene"):
		endScene()
		return
