extends EventBase

func _init():
	id = "NirahielEnteringCellEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)
	
func run(_triggerID, _args):
	addButton("Tinker", "Tinker with your items", "tinker")
	
func getPriority():
	return 1

func onButton(_method, _args):
	if (_method == "tinker"):
		runScene("NirahielTinkerScene")
