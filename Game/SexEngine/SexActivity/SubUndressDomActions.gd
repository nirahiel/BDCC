extends SexActivityBase

func _init():
	id = "SubUndressDomActions"
	startedByDom = false
	startedBySub = true

func getGoals():
	return {
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_sexEngine.hasTag(_subInfo.charID, SexActivityTag.OrderedToUndressDom)):
		return 1.0 - _subInfo.getResistScore()
	return 0.0

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var bodypartsToExpose = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var dom:BaseCharacter = _domInfo.getChar()
	var sub:BaseCharacter = _subInfo.getChar()
	var handledItems = {}
	var actions = []
	
	if(sub.hasBoundArms() || sub.hasBlockedHands()):
		return
	
	for bodypartToExpose in bodypartsToExpose:
		var firstItem = dom.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		var targetItem = dom.name + "'s "
		actions.append({
			name = "Take off "+targetItem+str(firstItem.getCasualName()),
			args = [firstItem],
			score = getActivityScore(_sexEngine, _domInfo, _subInfo),
			category = ["Undress"],
		})
	
	return actions

func getVisibleName():
	return "Undress dom"

func getCategory():
	return ["Undress"]

func getDomTags():
	return []

func getSubTags():
	return [SexActivityTag.HandsUsed]

func startActivity(_args):
	state = ""
	
	var theitem:ItemBase = _args[0]
	var itemState:ItemState = theitem.getItemState()
	if(itemState == null):
		getDom().getInventory().unequipItem(theitem)
	else:
		itemState.remove()
	
	endActivity()
	return {
		text = "{sub.You} {sub.youVerb('take')} off {dom.yourHis} "+str(theitem.getCasualName())+".",
	}
