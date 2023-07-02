extends ItemBase

func _init():
	id = "CasualClothes"

func getVisibleName():
	return "Casual clothes"
	
func getDescription():
	return "Just a simple shirt and shorts"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your inmate shirt and pulls down the shorts"
	else:
		return "take off your inmate shirt and pull down the shorts"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate shirt and the shorts"
	else:
		return "put on your inmate shirt and the shorts"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/CasualClothes/CasualClothes.tscn",
	}
