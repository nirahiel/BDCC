extends BuffBase

var amount = 0

func _init():
	id = Buff.AmbientLustBuff

func initBuff(_args):
	amount = _args[0]

func getVisibleDescription():
	var text = str(amount)
	if(amount > 0):
		text = "+"+text
	return "Ambient lust "+text

func apply(_buffHolder):
	_buffHolder.ambientLust += amount

func getBuffColor():
	if(amount > 0):
		return Color.red
	return DamageType.getColor(DamageType.Lust)
