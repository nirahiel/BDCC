extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/MathLogicBiggerThanBlock.gd"

func getCategories():
	return ["Math", "Logic"]

func thingOnlyNumbers():
	return false

func checkThing(a, b):
	return a != b

func getThingLabel():
	return "!="
