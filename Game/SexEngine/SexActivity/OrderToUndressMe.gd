extends SexActivityBase

var itemIDToRemove = ""
var tick = 0

func _init():
	id = "OrderToUndressMe"

func getGoals():
	return {
		SexGoal.FuckAnal: 1.0,
		SexGoal.FuckVaginal: 1.0,
		SexGoal.ReceiveAnal: 1.0,
		SexGoal.ReceiveVaginal: 1.0,
		SexGoal.DoOralOnSub: 1.0,
	}

func getVisibleName():
	return "Order to undress me"

func getCategory():
	return ["Order"]

func getDomTags():
	return [SexActivityTag.OrderedToDoSomething]

func getSubTags():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.OrderedToUndressDom]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.UndressingDom]

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_domInfo.goalsScoreMax({SexGoal.TieUp: 1.0}, _subInfo.charID) > 0.0):
		return 0.3
	return 0.0

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var itemToUndress = getItemToRemove(_domInfo.getChar())
	if(itemToUndress == null):
		return false
	
	if(_subInfo.getChar().hasBoundArms() || _subInfo.getChar().hasBlockedHands()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func startActivity(_args):
	state = ""
	
	#affectSub(subInfo.fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, 0.0, -0.2, -0.02)
	var itemToUndress = getItemToRemove(getDom())
	if(itemToUndress == null):
		endActivity()
		return
	var casualName = str(itemToUndress.getCasualName())
	itemIDToRemove = itemToUndress.id
	
	return {
		text = "{dom.You} {dom.youVerb('order')} {sub.you} to undress {dom.yourHis} <ITEM>.".replace("<ITEM>", casualName),
		domSay = Util.replaceIfNotNull(domReaction(SexReaction.OrderToUndressMe), "<ITEM>", casualName),
		subSay = Util.replaceIfNotNull(subReaction(SexReaction.OrderToUndressMe), "<ITEM>", casualName),
	}

func checkRemoved():
	if(itemIDToRemove == null || itemIDToRemove == ""):
		return true
	
	var dom = getDom()
	var subDidIt = false
	var item = dom.getInventory().getEquippedItemByID(itemIDToRemove)
	if(item == null):
		subDidIt = true
	else:
		var itemState = item.getItemState()
		if(itemState != null && itemState.isRemoved()):
			subDidIt = true
	
	return subDidIt

func processTurn():
	if(state == ""):
		if(checkRemoved()):
			domInfo.addAnger(-0.1)
			endActivity()
			return {
				text = "{sum.You} {sub.youVerb('nod', 'nods')}.",
			}
			
		tick += 1
		if(tick > 3):
			endActivity()
			return {
				text = "{dom.You} gave up waiting."
			}
		
		if(tick > 1):
			domInfo.addAnger(0.1 + 0.02 * tick)
			return {
					text = "{dom.You} {dom.youAre} losing patience.",
				}
	
func reactActivityEnd(_otheractivity):
	if(checkRemoved()):
		domInfo.addAnger(-0.1)
		endActivity()
		return {
			text = "{sub.You} {sub.youVerb('nod', 'nods')}.",
		}
	
func getDomActions():
	var actions = []

	return actions

func doDomAction(_id, _actionInfo):
	return null

func getSubActions():
	var actions = []
	if(!getSub().hasBoundArms()):
		actions.append({
				"id": "sayno",
				"score": subInfo.getResistScore() * 1.0,
				"name": "Refuse to undress dom",
				"desc": "You're not gonna undress them",
			})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "sayno"):
		domInfo.addAnger(0.7)
		endActivity()
		return {text = "{sub.You} {sub.youVerb('refuse')} to undress {dom.you}.",}

func getItemToRemove(character):
	var bodypartsToExpose = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var canRemoveItems = []

	for bodypartToExpose in bodypartsToExpose:
		var firstItem = character.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem != null && !canRemoveItems.has(firstItem) && !firstItem.isRestraint()):
			canRemoveItems.append(firstItem)
	return RNG.pick(canRemoveItems)

func saveData():
	var data = .saveData()
	
	data["itemIDToRemove"] = itemIDToRemove
	data["tick"] = tick

	return data
	
func loadData(data):
	.loadData(data)
	
	itemIDToRemove = SAVE.loadVar(data, "itemIDToRemove", "")
	tick = SAVE.loadVar(data, "tick", 0)
