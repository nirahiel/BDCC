extends BodypartHair

func _init():
	visibleName = "mohawk"
	id = "mohawkhair"

	maleWeight = 1.0
	femaleWeight = 1.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/MohawkHair/MohawkHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}
