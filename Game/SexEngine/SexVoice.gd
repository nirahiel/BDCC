extends Reference
class_name SexVoice

var character: WeakRef

func setCharacter(newchar):
	character = weakref(newchar)
	
func getCharacter():
	if(character == null):
		return character
	return character.get_ref()
	

	
func getDomReaction(_reactionID, _sexEngine, _domInfo, _subInfo):
	var possible = []
	var domIsAngry = _domInfo.isAngry()
	var domIsMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.4
	var domIsVeryMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.7
	
	match(_reactionID):
		SexReaction.DomPutsOnACondomOnSub:
			possible.append_array([
				"I'm not taking any chances.",
				"Here, let me put that on for you.",
				"I don't want to take any chances.",
				"I want to make sure we're protected.",
				"I don't want to have to worry about this later.",
				"Just being responsible.",
			])
		
		SexReaction.DomPutsOnACondom:
			possible.append_array([
				"I don't want to accidentally knock you up.",
				"I'm not trying to be a dad right now, so let's use protection.",
				"I can't risk having a baby with you.",
				"I always use a condom to avoid any unwanted pregnancies.",
				"Trust me, you don't want to have my baby.",
				"I'd rather not have any surprise pregnancies, so let's use protection.",
			])
		
		SexReaction.AboutToRubPussiesTogether:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I'm only doing this because I want to see the look on your face when I dominate you.",
					"Just remember that this means nothing to me and I will never have any real feelings for you.",
					"I hope you're ready to be completely humiliated and degraded by me, because that's exactly what's going to happen.",
					"I'm going to make you feel so good, you won't be able to resist me. And that's exactly how I want it.",
					"You know you can't resist me. I'm the one in charge here, and you're just along for the ride.",
					"Mmm, I can't wait to feel you squirm beneath me. You're going to be begging for more.",
					"I love seeing you like this, so vulnerable and helpless. It's just what I need to get off."
				])
			else:
				possible.append_array([
					"I can't wait to feel your soft skin against mine.",
					"Are you ready for this? It's going to be so hot.",
					"I love the way your body feels against mine.",
					"I want to rub our pussies together and feel the heat between us.",
					"Let's explore each other's bodies and see what feels good.",
					"I love the way you smell and taste. Let's get closer and enjoy each other.",
					"I want to feel your body on top of mine as we grind and rub together.",
					"I'm so turned on right now. Let's make this moment unforgettable.",
					"Are you ready to experience the intense pleasure of scissoring?",
				])
		
		SexReaction.AboutToSuckSubOff:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I hope you know that I'm only doing this because I want to, not because I have to.",
					"Do you really think you're good enough for me to bother with this?",
					"You should be grateful that I'm even considering doing this for you.",
					"You know the rules. Warn me before you blow your load.",
					"I hope you're ready to take orders, because I'm not letting you come without my permission.",
					"Don't even think about finishing without giving me a heads up.",
					"You better warn me before you cum, or else.",
					"Don't you dare come without letting me know first.",
				])
			else:
				possible.append_array([
					"Just lie back and relax, and let me take care of everything.",
					"Can you let me know when you're about to cum? I don't want to be caught off guard.",
					"I hope you're ready for the best oral you've ever had.",
					"I'm going to make you feel so good.",
					"You're going to love how I do this.",
					"I can't wait to see the look on your face when I'm done with you.",
				])
		SexReaction.AboutToLickPussy:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I can't wait to taste you, you little slut.",
					"You're so lucky to have me lick your pussy.",
					"You know you want me to eat your pussy, don't you?",
					"I'm going to make you cum so hard.",
					"You're going to love the way I lick your clit.",
					"I'm going to make you beg for more.",
					"I'm going to make you cum so hard you won't be able to walk.",
				])
			else:
				possible.append_array([
					"Are you ready for me to lick your pussy?",
					"I've been waiting to taste you.",
					"Your pussy is so wet and inviting.",
					"I'm going to lick you slowly and sensually.",
					"I want to make you feel amazing with my tongue.",
					"I'm going to make you cum with my tongue.",
					"Just relax and let me take control.",
					"I can't wait to hear your moans of pleasure as I lick your pussy.",
				])
		
		SexReaction.AboutToRidePussy, SexReaction.AboutToRideAnal:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I hope you're ready for the ride of your life. It's going to be a bumpy one.",
					"You might want to brace yourself. This is going to be a rough one.",
					"Don't even think about trying to escape. I've got you right where I want you.",
					"Say goodbye to any pleasure you were hoping for. This is about domination, not satisfaction.",
					"You might be begging for mercy by the time I'm finished with you.",
					"I hope you're ready to be completely and utterly humiliated.",
					"I'm only doing this because I want to.",
					"You're not going to last long, trust me.",
				])
			else:
				possible.append_array([
					"Are you ready for this?",
					"I'm going to straddle you now.",
					"I want to feel you inside me.",
					"This is going to be so good.",
					"I can't wait to feel you.",
					"I'm going to rock your world.",
					"You're going to love this.",
					"I'm going to take control.",
					"Hold on tight, this is going to be a wild ride.",
					"I want to look into your eyes as I straddle you and make love to you.",
				])
		
		SexReaction.DomsPussyGetsLicked:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I can't believe you're actually enjoying this rough treatment.",
					"I love it when you lick my pussy. It feels so good.",
					"Oh, yes, keep licking my little kitty. I love it when you give me all your attention like that.",
					"Don't stop, baby. I want to feel your tongue on my most sensitive spot. Make me cum for you.",
					"That's it, lick and suck on my pussy like you're starving for it. I love how badly you want me.",
					"I can't get enough of your tongue on my clit. You know exactly how to make me scream with pleasure.",
					"I'm so close. Keep licking me, don't stop until I've climaxed.",
				])
			else:
				possible.append_array([
					"Oh, yes, right there!",
					"Don't stop, keep going!",
					"It feels so good!",
					"I love the way you're licking me!",
					"Mmm, that feels amazing!",
					"Mmm, I love the way your tongue feels against my skin.",
					"I'm getting so turned on, keep going.",
					"Your tongue is so skilled, I can't get enough.",
					"I'm so wet, I can't control myself anymore.",
					"I'm going to cum, keep doing what you're doing!",
				])
		
		SexReaction.GrindingFaceWithPussy:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"You like that, don't you? My body grinding against your face.",
					"I love the way you squirm beneath me. Keep struggling, it only makes me want you more.",
					"You're mine now. I'm going to grind you into submission.",
					"I can feel your face getting redder and redder. You can't handle my roughness, can you?",
					"Don't even try to fight back. You know you want this as much as I do.",
					"You're at my mercy now. And I'm not going to show you any mercy.",
					"Do you like the way my body feels pressed against yours? I can feel your heart racing.",
					"I'm going to grind you into the ground. You're mine to do with as I please.",
					"You're completely helpless against me. And I love it.",
				])
			else:
				possible.append_array([
					"Oh my goodness, your face is right up against my lady parts!",
					"I can't believe you're letting me grind my pussy against your face like this!",
					"Oh yes, just like that. Keep your face right there and let me grind against it.",
					"Your face feels so good against my pussy. Keep grinding, baby.",
					"I love the way your face feels against my sensitive parts. Don't stop.",
					"This is amazing. I never thought I'd be grinding my pussy against someone's face like this.",
					"Your face is so close to my most intimate areas. It's driving me wild.",
					"This is so hot. I can feel my juices flowing as I grind against your face.",
					"I never thought I'd be this turned on by grinding my pussy against someone's face, but here we are.",
					"Your face is the perfect surface for me to rub against. It feels so good.",
					"I never thought I'd be this passionate, but grinding against your face is driving me wild.",
					"I love the way your skin feels against mine as I grind against your face.",
					"I can feel every contour of your face against my sensitive parts. It's so intense.",
				])
		
		SexReaction.OrderLickPussy:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Don't make me repeat myself. Lick my "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+" now.",
					"You better do as I say and lick my "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+".",
					"I'm not playing around. Lick my fucking "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+".",
					"I won't hesitate to punish you if you don't lick my "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+".",
					"I'm not joking. Lick. My. Pussy.",
					"You have three seconds to start licking my "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+" or else.",
					"I don't care if you like it or not. Lick my "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+" now.",
					"You have no choice in the matter. Lick my "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+" now.",
					"I'm not going to repeat myself. Lick my fucking "+RNG.pick(["pussy", "pussy", "pussy slit", "cunt"])+" now.",
				])
			else:
				possible.append_array([
					"Lick my pussy, I want to feel your tongue on me.",
					"Don't be shy, just put your mouth on my clit and lick it.",
					"I need you to focus on my pussy, lick it slowly and sensually.",
					"My pussy is craving your touch, so don't be afraid to lick it.",
					"I want to feel your tongue swirling around my clit, so don't hold back.",
					"I need you to take control and lick my pussy with confidence.",
					"I'm feeling so turned on right now, so don't be afraid to lick my pussy.",
					"I want to feel your tongue exploring every inch of my pussy, so don't be shy.",
					"I need you to focus all your attention on my pussy and lick it until I climax.",
					"I want to feel your tongue worshipping my pussy, so don't be afraid to go for it."
				])
		
		SexReaction.OrderBlowjob:
			if(domIsAngry || domIsMean):
				possible.append_array([
					"You better open your mouth if you know what's good for you.",
					"I'm not going to ask again, open your mouth.",
					"You better do as I say, open your mouth and let me do my thing.",
					"I don't care if you want to or not, open your mouth and let me have my way with you.",
					"If you know what's best for you, you'll open your mouth and let me take control.",
				])
			else:
				possible.append_array([
					"Open your mouth and let me in.",
					"I want to feel your mouth on me, so open up.",
					"Don't be shy, open your mouth and let me explore.",
					"I need to feel your warmth, so open up and let me in.",
					"You know you want it, so open your mouth and let me in.",
					"I want to feel your tongue, so open up.",

				])
		
		SexReaction.ForcingDrug:
			possible.append_array([
				"You're going to take this pill whether you like it or not.",
				"Don't fight me on this. Just open your mouth and swallow.",
				"You know you want it. Just let go and let me take control.",
				"You don't have a choice. I'm going to make you take this pill.",
				"I can see the desire in your eyes. Give in to me and take the pill.",
			])
		
		SexReaction.OfferingDrug:
			if(domIsAngry || domIsVeryMean):
				possible.append_array([
					"Don't be a coward, just pop the pill in your mouth and let me show you what it can do.",
					"You think you can handle me? Prove it by swallowing this pill.",
					"Come on, don't be a wimp. Swallow the pill and let's see how wild you can get.",
					"Just swallow it and let me take care of the rest.",
					"You want to try something new?",
				])
			else:
				possible.append_array([
					"Would you like to try it?",
					"Just swallow it and let it work its magic.",
					"Come on, live a little. You only live once.",
					"Come on, don't be shy. This pill is completely safe.",
					"Come on, I know you're curious.",
					"Don't be afraid, just pop it in your mouth and swallow.",
					"You want to try something new?",
				])
		
		SexReaction.OrderToUndress:
			if(domIsAngry || domIsVeryMean):
				possible.append_array([
					"Your <ITEM>, take that shit off.",
					"Take your <ITEM> off, "+RNG.pick(["slut", "whore", "fucktoy", "bitch"])+".",
					"Don't make me break you, take your stupid <ITEM> off.",
					"Take off your <ITEM> or I'll rip your clothes off myself.",
				])
			else:
				possible.append_array([
					"You don't need your <ITEM>. Undress for me.",
					"I think you don't need your <ITEM>. Be a good toy and undress.",
					"Take your <ITEM> off for me.",
				])
		SexReaction.OrderToUndressMe:
			if(domIsAngry || domIsVeryMean):
				possible.append_array([
					"My <ITEM>, get it off me, now !",
					"Remove my <ITEM>, "+RNG.pick(["slut", "whore", "fucktoy", "bitch"])+".",
					"How the fuck am I supposed to fuck you properly with that <ITEM> in the way ?",
				])
			else:
				possible.append_array([
					"Be a good pet and remove my <ITEM>, would you ?",
					"Give me a hand, that <ITEM> won't take itself off.",
					"Would you mind helping me get off my <ITEM> ?"
				])
		SexReaction.ForceUndress:
			if(domIsAngry || domIsVeryMean):
				possible.append_array([
					"Don't you dare resist, you little "+RNG.pick(["slut", "whore", "fucktoy", "bitch"]),
					"You don't need that shit.",
					"Don't whine about it, no one will save you.",
					"You're going to do exactly what I say or you'll regret it.",
					"I'll do whatever it takes to get you naked.",
					"I won't stop until you're completely naked.",
					"Fine, if you won't undress willingly, I'll do it for you.",
					"Stop struggling! You're only making it worse for yourself.",
					"You'll thank me later. Trust me, this is for your own good.",
				])
			else:
				possible.append_array([
					"Let me take that off.",
					"You don't need that with me.",
					"That's only getting in the way.",
					"Let me see what's under.",
					"Why are you being so shy? Let me help you out of those clothes.",
					"I can't wait to see what's underneath. Come on, let me take it off.",
					"You can't resist me. Just let me undress you and we can get started.",
					"Don't be such a prude. Let me show you how good it can be without all those clothes on.",
					"You know you want me to take your clothes off. Just let go and let me do it.",
					"I bet you're even more beautiful without any clothes on. Come on, let me see.",
					"I can't wait to touch every inch of your bare skin. Just let me undress you.",
					"Don't be scared. I promise I'll be gentle as I take off your clothes.",
					"Let's make this even more exciting by letting me undress you. Trust me, you'll love it.",
				])
		
		SexReaction.AboutToBeatUp:
			if(domIsMean):
				possible.append_array([
					"Bitch, you fucking asked for it.",
					"You're not gonna get away unscarred, you stupid "+RNG.pick(["slut", "whore", "fucktoy", "bitch"]),
					"Stop fucking resisting, you "+RNG.pick(["slut", "whore", "stupid fucktoy", "bitch"]),
					"You brought this upon yourself, you "+RNG.pick(["slut", "whore", "fucktoy", "bitch"]),
				])
			else:
				possible.append_array([
					"I'm getting really mad with you.",
					"I'm usually not that mean. But you are fucking annoying.",
					"You made me do this.",
					"You brought this upon yourself",
				])
		
		SexReaction.BeatingUpHard:
			possible.append_array([
				"You like that, huh? I'll give you something to cry about.",
				"I'm not done with you yet. Take this!",
				"You want me to hit harder? Fine, I'll show you who's boss.",
				"You thought this was just rough sex? Think again.",
				"You're going to regret ever crossing me.",
				"I told you to be ready for a rough ride. This is what you asked for.",
				"You thought you could handle me? You were wrong.",
				"I'm going to make you pay for your disobedience.",
				"You better start begging for mercy, because I'm not going easy on you.",
				"You thought this was just a game? Think again.",
				"I'm going to make you pay for what you did.",
				"You better start begging for mercy, because I'm not going to let up.",
				"I warned you not to mess with me. Now you're going to suffer the consequences.",
			])

		SexReaction.BeatingUp:
			if(domIsMean):
				possible.append_array([
					"Stupid. Fucking. Bitch.",
					"You fucking whore",
					"I'm gonna break you if I have to.",
					"It's your fault!",
					"Stupid painslut.",
				])
			else:
				possible.append_array([
					"Stop resisting already!",
					"Stop making me mad!",
					"Quit struggling on me.",
					"Just let it fucking happen.",
					"You are making this worse for yourself.",
				])
		
		SexReaction.AboutToDrawOnBody:
			if(!domIsAngry && !domIsMean):
				possible.append_array([
					"Check this out",
					"Gonna leave you a memento",
					"Hope you are into bodywritings",
					"Stay still while I do this",
					"I wanna draw something on you",
					"Get ready to be humiliated!",
					"This is going to be so embarrassing for you!",
				])
			else:
				possible.append_array([
					"Don't fucking move, bitch",
					"Don't you dare move",
					"Stay still, slut",
					"About to brand you",
					"Stay still while I brand you, whore",
					"Gonna brand you like the little prison's whore that you are.",
					"I'm going to make sure everyone knows exactly what you did.",
					"But don't worry, I'll make sure everyone knows who you are.",
					"This is going to be the best graffiti I've ever done.",
					"I can't wait to see the look on your face when you see what I've written.",
					"You deserve everything you're about to get.",
				])
		SexReaction.AfterDrawingOnBody:
			possible.append_array([
				"There we go",
				"A present from me",
				"Now everyone can see who you are",
				"Enjoy that",
				"Don't hide this one",
				"Want another one?",
				"How many will fit I wonder",
				"This is real art",
			])
		SexReaction.AboutToPenetratePussy:
			if(!domIsAngry && !domIsMean):
				possible.append_array([
					"Gonna fuck that slit",
					"Hope you're ready to get fucked",
					"Gonna fuck you nice and slow",
					"Hope you're wet already",
					"Let's have some fun",
					"I wanna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"]),
					"Are you ready for this?",
					"I can't wait to feel you around me.",
					"I'm going to make you mine.",
					"Just relax and let me take control.",
					"I want to feel you climax around me.",
					"I'm going to make you mine, body and soul.",
				])
			else:
				possible.append_array([
					"Stupid slut, I'm gonna fuck you rough",
					"Bitches like you need to be pounded rough",
					"I know you love being fucked, whore",
					"Gonna fuck you rough",
					"I'm gonna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"]),
					"You should have thought twice before crossing me.",
					"You're mine now. And I'm going to enjoy every second of it.",
					"My turn to have some fun.",
				])
		SexReaction.AboutToPenetrateAnal:
			if(!domIsAngry && !domIsMean):
				possible.append_array([
					"Gonna fuck that "+RNG.pick(["ass", "butt"]),
					"Hope you're ready to get your "+RNG.pick(["butt", "ass"])+" fucked",
					"Hope you're excited to be buttfucked",
					"Let's have some fun",
					"I wanna fuck your "+RNG.pick(["ass", "butt"]),
					"Are you ready for this?",
					"I can't wait to feel you around me.",
					"I'm going to make you mine.",
					"Just relax and let me take control.",
					"I want to feel you climax around me.",
					"I'm going to make you mine, body and soul.",
				])
			else:
				possible.append_array([
					"Stupid slut, I'm gonna fuck your ass rough",
					"Bitches like you need to be pounded rough",
					"I know you love being fucked, whore",
					"Gonna fuck you rough",
					"I'm gonna fuck your "+RNG.pick(["ass", "butt"]),
					"You should have thought twice before crossing me.",
					"You're mine now. And I'm going to enjoy every second of it.",
					"My turn to have some fun.",
				])
			
	if(possible.size() > 0):
		return RNG.pick(possible)

func getSubReaction(_reactionID, _sexEngine, _domInfo, _subInfo):
	var _sub = _subInfo.getChar()
	var _dom = _domInfo.getChar()
	var subInHeat = _sub.isInHeat()
	var subIsMean = _subInfo.personalityScore({PersonalityStat.Mean: 1.0}) > 0.4
	var subIsSubby = _subInfo.personalityScore({PersonalityStat.Subby: 1.0}) > 0.2
	var subIsResisting = _subInfo.isResisting()
	var subIsScared = _subInfo.isScared()
	var subIsVisiblyPregnant = _sub.isVisiblyPregnant()
	var subCanGetPregnantVaginal = _sub.hasVagina() && _sub.getFertility()>0.1 && !subIsVisiblyPregnant
	var domWearingACondom = (_dom.getWornCondom() != null)
	var possible = []
	
	match(_reactionID):
		SexReaction.OfferingACondom:
			possible.append_array([
				"Please, put on a condom. You can use mine.",
				"I beg of you, protect us both with a condom. I can give you one.",
				"I don't want to take any risks. Can you please put on a condom? I have one here.",
				"I'm begging you, let's be safe and use a condom. Use mine.",
				"Can you please put on a condom? Take this one.",
			])
		
		SexReaction.BeggingForCondom:
			possible.append_array([
				"Please, put on a condom.",
				"I beg of you, protect us both with a condom.",
				"I don't want to take any risks. Can you please put on a condom?",
				"I'm begging you, let's be safe and use a condom.",
				"Can you please put on a condom?",
			])
		
		SexReaction.RefusingToSwallowDrug:
			possible.append_array([
				"No way, I'm not swallowing that!",
				"I don't do drugs, no thanks.",
				"I don't think that's a good idea.",
				"I'm sorry, but I'm not comfortable with that.",
				"I don't want to do anything that could be dangerous.",
				"No, I don't want to risk my health like that.",
				"I'm sorry, but I just can't do that.",
				"I'm sorry, but I just can't swallow that pill.",
			])
		
		SexReaction.AboutToDrawOnBody:
			if(subIsResisting):
				possible.append_array([
					"What? No!",
					"Put it away!",
					"Why did you pull that out?",
					"Don't do it",
					"Hey! No!",
				])
		SexReaction.AfterDrawingOnBody:
			if(subIsResisting):
				possible.append_array([
					"Don't you dare.. fuck",
					"No! Fuck..",
					"I didn't ask for that..",
					"Why did you do that?!",
					"That's too humiliating..",
				])
				
		SexReaction.WarnAboutToCum:
			possible.append_array([
				"I'm very close..",
				"I'm gonna cum soon..",
				"About to cum..",
				"I really wanna cum..",
			])
			if(subIsSubby):
				possible.append_array([
					"Please let me cum, I really want to..",
					"I wanna cum so much.. Please!",
					"I'm about to cum, I need it!",
				])
		SexReaction.Teasing:
			if(subIsResisting):
				possible.append_array([
					"You just gonna stop now?",
					"Gonna give up now?",
					"You saw some resistance and decided to stop?",
					"Some resistance is enough to stop you?",
					"Don't you want to play with me?",
				])
				if(subIsMean):
					possible.append_array([
						"If you dare to touch me, I swear!",
						"Don't try to touch me, you bitch.",
						"See this? It's not yours!",
						"Fap to this and get the fuck out.",
						"Are you fucking done already?",
						"You're shaking. Can't you handle it?",
						"You're nothing without me. Admit it.",
						"Just one touch and you'll be begging for more.",
						"Don't fight it. You know you're mine.",
					])
			else:
				possible.append_array([
					"Do you like this?",
					"Let's do something..",
					"You know you want me.",
					"I can see it in your eyes, you're craving me.",
					"You want to give in to me, don't you?",
					"I can't help but want you right now.",
				])
				if(subInHeat):
					possible.append_array([
						"Can you feel that I'm in heat?..",
						"Damn heat.. Wanna do something about it?..",
						"I'm in heat..",
						"Heat makes me feel so needy..",
						"Damn heat..",
						"Don't make me beg, I can't endure this heat..",
						"Huff.. stupid heat..",
						"You just gonna watch me while I'm in heat?.."
					])
				if(subIsMean):
					possible.append_array([
						"We're just gonna stare at each other?",
						"Do something already!",
						"C'mon, I don't have all day!",
						"You're such a bitch.",
						"Don't be so fucking rude and do something.",
						"I'm waiting!",
						"Look at you. Pathetic!",
					])
				if(subIsSubby):
					possible.append_array([
						"What are you gonna do to me..",
						"What should I do..",
						"We can do something..",
						"Do you like this?..",
						"You can do more than just stare..",
						"You gonna..?",
						"Do I look good..?",
						"I want to do whatever you want. I want to make you happy.",
						"I love the way you look at me, like I'm your little toy to play with.",
						"I can't stop thinking about all the naughty things you could do to me.",
						"I want to submit to you completely. I want to be yours.",
						"I love the way your voice sounds when you tell me what to do.",
						"I want to be your plaything, to do whatever you want with me.",
						"I crave your touch, your dominance. I want you to take me.",
					])
		SexReaction.Apologizing:
			if(subIsResisting):
				possible.append_array([
					"Quit it and I won't resist!",
					"Stop it! I don't want this! Please!",
				])
			elif(subIsScared):
				possible.append_array([
					"I'm not resisting! Please!",
					"I will do anything! Please stop..",
					"I'm sorry! I'm very sorry!",
					"I'm scared.. Please stop..",
					"Enough!.. Please..",
				])
			else:
				possible.append_array([
					"I'm sorry, okay?",
					"Calm down, I'm sorry.",
					"You don't have to do this. I'm sorry.",
					"You don't have to do this..",
					"I'm sorry for what I did.",
				])
				if(subIsMean):
					possible.append_array([
						"I'm sorry. Calm down, bitch.",
						"Will you calm the fuck down already?",
						"Relax for fuck's sake. I'm sorry.",
						"I said I'm sorry!",
					])
				if(subIsSubby):
					possible.append_array([
						"I'm very-very sorry..",
						"I'm extremely sorry..",
						"It's my fault, I'm sorry..",
						"What I did was wrong, sorry..",
					])
		SexReaction.ResistingRestraints:
			possible.append_array([
				"Nghh..",
				"Uhh..",
				"Ff-fh..",
				"Hh-h..",
				"Mgh-h..",
			])
		SexReaction.ActivelyResisting:
			if(subIsMean):
				possible.append_array([
					"Fuck off! I don't want you!",
					"Let me go, you "+RNG.pick(["fucker", "bitch"])+"!",
					"Let me fucking go already!",
					"Go fuck yourself!",
					"I will break you fingers!",
					"I will mess you up if you don't stop!",
				])
			else:
				possible.append_array([
					"Don't touch me!",
					"Get away from me!",
					"I don't wanna do this!",
					"Don't make me do this!",
					"I don't want any of this!",
					"Stop it already, I wanna leave!",
					"I don't want to do this, I'm begging you."
				])
		SexReaction.Resisting:
			if(subIsMean):
				possible.append_array([
					"Fuck off with this shit!",
					"FUCK OFF!",
					"Go fuck yourself!",
					"I will break you if you do this!",
					"You stupid "+RNG.pick(["fucker", "bitch"])+", what are you doing?!",
					"I don't want this, fuck off!",
					"Stop it, go screw yourself!",
				])
			else:
				possible.append_array([
					"Don't do this, please!",
					"I don't want this!",
					"I don't like this!",
					"Don't touch me!",
					"Stop it, please!",
					"This is not funny, stop it!",
					"I don't wanna do this!",
					"I can't do this, it's not right.",
					"Please, stop. I'm not ready for this.",
					
				])
		SexReaction.BeggingToPullOutVaginal:
			if(subCanGetPregnantVaginal):
				if(!domWearingACondom):
					if(subInHeat):
						possible.append_array([
							"I'm in heat, I can get pregnant! Please pull out!",
							"I'm in heat, don't cum inside. Please!",
							"Not inside.. not when I'm in heat..",
							"Please pull out, I don't wanna get pregnant.. I'm in heat..",
							"My body really wants it.. but please.. don't breed me..",
						])
					possible.append_array([
						"I don't wanna get pregnant, please pull out..",
						"Don't cum inside or I might get pregnant..",
						"Please pull out, I really don't wanna become pregnant..",
						"If you cum inside you might make me pregnant.. please don't..",
						"Remember not to cum inside, please.. Don't make me pregnant.",
						"Please pull out.. I might get pregnant if I don't..",
					])
				else:
					if(subInHeat):
						possible.append_array([
							"The condom might break.. you should play it safe and pull out.. I'm in heat..",
							"Please don't test the condom and just pull out.. I'm in heat and don't wanna get pregnant..",
							"Please pull out.. The condom might break.. And I'm in heat..",
						])
					possible.append_array([
						"I don't wanna get pregnant if the condom breaks, please pull out..",
						"Don't cum inside.. the condom might break.. I don't wanna get pregnant..",
						"Remember not to cum inside, please.. If the condom breaks I will become pregnant..",
						"Please pull out.. I might get pregnant if the condom breaks..",
					])
			else:
				if(!domWearingACondom):
					possible.append_array([
						"Please pull out..",
						"Don't cum inside, please..",
						"Please don't cum inside my pussy..",
					])
				else:
					possible.append_array([
						"The condom might break.. Please pull out..",
						"Don't cum inside, please.. What if the condom breaks..",
						"The condom might break.. Please don't cum inside my pussy..",
					])
		SexReaction.BeggingToPullOutAnal:
			if(!domWearingACondom):
				possible.append_array([
					"Please pull out..",
					"Don't cum inside, please..",
					"Please don't cum inside my "+RNG.pick(["ass", "butt"])+"..",
				])
			else:
				possible.append_array([
					"The condom might break.. Please pull out..",
					"Don't cum inside, please.. What if the condom breaks..",
					"The condom might break.. Please don't cum inside my "+RNG.pick(["ass", "butt"])+"..",
				])
		
	if(possible.size() > 0):
		return RNG.pick(possible)
		
func domReactToSubBodypart(_bodypart, _sexEngine, _domInfo, _subInfo):
	var _dom = _domInfo.getChar()
	var _sub = _subInfo.getChar()
	var domIsAngry = _domInfo.isAngry()
	var domIsMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.4
	
	var possible = []
	
	if(_bodypart is BodypartBreasts):
		var lustInterets:LustInterests = _dom.getLustInterests()
		var likesBigBreasts = lustInterets.getTopicValue(InterestTopic.BigBreasts, _sub)
		var likesAverageBreasts = lustInterets.getTopicValue(InterestTopic.MediumBreasts, _sub)
		var likesSmallBreasts = lustInterets.getTopicValue(InterestTopic.SmallBreasts, _sub)
		var likesLactation = lustInterets.getTopicValue(InterestTopic.LactatingBreasts, _sub)
		#var likesFlatBreasts = lustInterets.getTopicValue(InterestTopic.NoBreasts, _sub)
		
		if(likesLactation > 0.2):
			possible.append_array([
				"Wow, those are some beautiful lactating "+RNG.pick(["breasts", "tits"])+" you've got there!",
				"I love the way your milk is flowing, it's so mesmerizing.",
				"I've always been a fan of lactating breasts.",
				"Lactating breasts are incredibly sexy.",
				"I've always had a thing for lactating "+RNG.pick(["breasts", "tits"])+".",
			])
		elif(likesLactation < -0.2):
			possible.append_array([
				"You should be ashamed of yourself for lactating in public. That's just disgusting.",
				"I don't care for lactation. Not my thing.",
				"I can't stand the sight of lactating breasts. It's just so gross.",
				"I've never understood the appeal of lactating breasts.",
			])
		
		if(likesBigBreasts > 0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Well, well, well, look at the size of those things! I bet you could feed the whole space station with those "+RNG.pick(["melons", "tits", "giant tits", "breasts", "giant breasts"])+".",
					"Wow, didn't think it was possible for someone to have such big "+RNG.pick(["tits", "breasts", "melons"])+". You must get a lot of attention with those.",
					"I don't know if I should be impressed or intimidated by those massive mammaries of yours.",
					"I bet those babies have their own gravitational field.",
					"I bet those things could crush a man's skull if you hugged him too hard. Be careful with those weapons of mass distraction.",
					"You must have back problems with "+RNG.pick(["breasts", "tits"])+" that size. But I love them.",
				])
			else:
				possible.append_array([
					"Oh yeah. I'd like to see what those puppies can do.",
					"Oh yeah, I can't get enough of big, bouncy "+RNG.pick(["tits", "breasts", "jugs"])+".",
					"I could stare at giant "+RNG.pick(["tits", "breasts", "jugs"])+" all day.",
					"Now we're talking. Great curves.",
					"My goodness, your chest is absolutely stunning!",
					"That's some impressive assets you've got there",
					"You know what they say about "+RNG.pick(["breasts", "tits"])+". The bigger the better.",
					"I don't know what your secret is, but those "+RNG.pick(["breasts", "tits"])+" are absolutely magnificent. I'm in awe.",
				])
		if(likesBigBreasts < -0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I bet you can barely move with those things weighing you down.",
					"Seriously, get those monstrosities reduced. You'll be much happier without them.",
					"I can't stand looking at those massive breasts. They're grotesque.",
					"Those massive mammaries are just ridiculous. Get rid of them.",
					"Why do some women have such huge hooters? It's disgusting.",
					"I can't stand looking at those "+RNG.pick(["giant", "large"])+" "+RNG.pick(["tits", "breasts"])+". Gross.",
				])
			else:
				possible.append_array([
					"Not a fan of giant "+RNG.pick(["tits", "breasts"])+". Look so uncomfortable and unnatural.",
					"Large "+RNG.pick(["tits", "breasts"])+" are a hassle and only get in the way.",
					"Oh wow. I prefer a more natural and understated look.",
					"I don't like "+RNG.pick(["giant", "large"])+" "+RNG.pick(["tits", "breasts"])+". They're just too much for me.",
					RNG.pick(["Giant", "Large"])+" "+RNG.pick(["tits", "breasts"])+" just don't do it for me, sadly.",
					"Huge knockers are a bit much for my taste.",
				])
		
		if(likesAverageBreasts > 0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Finally, someone with "+RNG.pick(["normal", "average"])+" "+RNG.pick(["tits", "breasts"])+". I'm tired of seeing nothing but either flat chests or massive "+RNG.pick(["ones", "melons"])+".",
					"I can't stand these fake, inflated chests that are all the rage these days. Give me a pair of average-sized "+RNG.pick(["tits", "breasts"])+" any day.",
					"Finally, a pair of "+RNG.pick(["tits", "breasts"])+" that aren't obscenely huge.",
					"It's about time someone with a normal-sized chest came along.",
					"I'm so tired of seeing massive, fake "+RNG.pick(["tits", "breasts"])+". But yours are up my standarts.",
				])
			else:
				possible.append_array([
					"I have a thing for average-sized "+RNG.pick(["tits", "breasts"])+", and yours are absolutely lovely.",
					"Your "+RNG.pick(["tits", "breasts"])+" are beautiful. Not too big, and not too small. They're just right.",
					"Oh, great "+RNG.pick(["tits", "breasts"])+". Couldn't ask for more.",
					"Not too pointy, not too round, just the right amount of fullness.",
					"There's something so alluring about a pair of perky breasts.",
					"I'm a sucker for a nice set of "+RNG.pick(["tits", "breasts"])+".",
					"I'm a big fan of a well-proportioned pair of "+RNG.pick(["tits", "breasts"])+".",
				])
		elif(likesAverageBreasts < -0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I can't believe some people are satisfied with such mediocre "+RNG.pick(["chest size", "tits", "breasts"])+". It's truly pathetic.",
					"Why would anyone settle for average "+RNG.pick(["chest size", "tits", "breasts"])+"? It's like they don't even care about having any sex appeal at all.",
					"Your "+RNG.pick(["tits", "breasts"])+" are so... average. Don't know what I expected.",
					"I'd rather be flat-chested than have average "+RNG.pick(["tits", "breasts"])+". At least that would be a unique and interesting look, unlike this dull and boring average size.",
				])
			else:
				possible.append_array([
					"Give me something interesting to look at, not those generic "+RNG.pick(["tits", "breasts"])+".",
					"I know some people might find your breasts attractive, but to me they're just bland and uninteresting.",
					"Hmm. Nothing remarkable, not eye-catching at all.",
					"Not a fan of your "+RNG.pick(["tits", "breasts"])+".",
				])
		
		if(likesSmallBreasts > 0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Don't be upset, darling. I'm sure you have other qualities that make up for your lack of ample bosom. Or maybe not, but who cares?",
					"I adore "+RNG.pick(["tiny", "small"])+" "+RNG.pick(["tits", "breasts"])+". They're so cute and adorable, like little toys for me to play with.",
					"I bet they're barely a handful. Ha ha.",
					"Do they even need a bra? They're so small.",
					"I always thought bigger was better, but those tiny breasts are so cute.",
					"I bet they don't get in the way like big ones do. Lucky.",
					"Do they ever get in the way? They're so tiny.",
				])
			else:
				possible.append_array([
					"I'm a big fan of the small-breasted look. It's so sexy and feminine.",
					"I can't get enough of perky little breasts. They're absolutely adorable.",
					"Natural and beautiful, great "+RNG.pick(["tits", "breasts"])+".",
					"I've always been attracted to petite "+RNG.pick(["tits", "breasts"])+".",
					"I never understood the obsession with big "+RNG.pick(["tits", "breasts", "melons"])+". I think small ones are so much more elegant and graceful.",
					"I adore small "+RNG.pick(["tits", "breasts"])+".",
					"Small "+RNG.pick(["tits", "breasts"])+" are so cute.",
					"Your small "+RNG.pick(["tits", "breasts"])+" are the perfect size.",
					"Good things come in small packages, huh.",
				])
		elif(likesSmallBreasts < -0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Those tiny little things? I'm surprised they can even be called breasts.",
					"Ugh, what are those? Mosquitoes on your chest?",
					"I can barely even see your chest. It's like looking at a flat line on a heart monitor.",
					"You must have been left on the clearance rack at the breast store.",
					"I bet you have to stuff your bra just to make it look like you have something there.",
					"I can't even call those things "+RNG.pick(["tits", "breasts"])+". They're more like mosquito bites.",
					"I bet you wish you had bigger "+RNG.pick(["tits", "breasts"])+". Too bad you're stuck with those tiny things.",
				])
			else:
				possible.append_array([
					"Wish they were bigger. But oh well.",
					"I need more to grab onto.",
					"I prefer a more voluptuous figure.",
					"Aww, nothing to get excited over.",
					"Small "+RNG.pick(["tits", "breasts"])+" just don't do it for me.",
					"Aw. Small "+RNG.pick(["tits", "breasts"])+" aren't sexy for me.",
				])
		
	if(_bodypart is BodypartAnus && RNG.chance(30)):
		var lustInterets:LustInterests = _dom.getLustInterests()
		var likesTightAnus = lustInterets.getTopicValue(InterestTopic.TightAnus, _sub)
		var likesLooseAnus = lustInterets.getTopicValue(InterestTopic.LooseAnus, _sub)
		
		if(likesTightAnus > 0.3):
			possible.append_array([
				"Your tight "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" is quite enticing, won't lie.",
				RNG.pick(["Nice", "Great"])+" "+RNG.pick(["butt", "butthole", "ass"])+" you have. I like my fuckholes tight.",
				"Ohh. Your "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" is so tight and perfect.",
			])
		elif(likesTightAnus < -0.3):
			possible.append_array([
				"Not a fan of that overly-tight look. I like tailholes looking stretched.",
				"Won't like, your butthole looks too tight for my liking.",
				"What's the appeal of tight "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+" anyway?",
			])
		
		if(likesLooseAnus > 0.3):
			possible.append_array([
				"Your stretched "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" is quite hot, won't lie.",
				"Huh, your "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" looks extra plump, love it.",
				"Oh, I'm a fan of loose gaping "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+".",
				"Oh yeah, that "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" can fit a lot of "+RNG.pick(["dicks", "cocks"])+".",
			])
		elif(likesLooseAnus < -0.3):
			possible.append_array([
				"Why would anyone want their "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" to look like that?",
				"I don't get the appeal of having a "+RNG.pick(["stretched out", "gaping"])+" "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"]),
				"How many dicks did you had in that "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+"? Looks so loose.",
				"Not a fan of loose-looking "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+".",
				"Not sure how attractive "+RNG.pick(["stretched", "loose"])+" "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+" look.",
			])
	
	if(_bodypart is BodypartVagina && RNG.chance(80)):
		var lustInterets:LustInterests = _dom.getLustInterests()
		var likesTightVagina = lustInterets.getTopicValue(InterestTopic.TightPussy, _sub)
		var likesLooseVagina = lustInterets.getTopicValue(InterestTopic.LoosePussy, _sub)
		
		if(likesTightVagina > 0.3):
			possible.append_array([
				"Your tight "+RNG.pick(["pussy", "slit", "pussy slit"])+" is quite enticing, won't lie.",
				RNG.pick(["Nice", "Great"])+" "+RNG.pick(["pussy", "slit", "pussy slit"])+" you have. I like tight ones.",
				"Ohh. Your "+RNG.pick(["pussy", "slit", "pussy slit"])+" is so tight and perfect.",
			])
		elif(likesTightVagina < -0.3):
			possible.append_array([
				"Not a fan of that overly-tight look. I like pussies looking stretched.",
				"Won't like, your pussy looks too tight for my liking.",
				"What's the appeal of tight "+RNG.pick(["pussies", "slits"])+" anyway?",
			])
		
		if(likesLooseVagina > 0.3):
			possible.append_array([
				"Your stretched "+RNG.pick(["snatch", "pussy", "pussy slit"])+" is quite hot, won't lie.",
				"Huh, your "+RNG.pick(["pussy", "vulva"])+" looks extra plump, love it.",
				"Oh, I'm a fan of loose gaping "+RNG.pick(["cunts", "pussies", "slits"])+".",
				"Oh yeah, that "+RNG.pick(["pussy", "slit", "cunt"])+" can fit a lot of "+RNG.pick(["dicks", "cocks"])+".",
			])
		elif(likesLooseVagina < -0.3):
			possible.append_array([
				"Why would anyone want their "+RNG.pick(["labia", "pussy", "pussy slit", "pussy folds"])+" to look like that?",
				"I don't get the appeal of having a "+RNG.pick(["stretched out", "gaping"])+" "+RNG.pick(["pussy", "slit", "kitty slit"]),
				"How many dicks did you had in that "+RNG.pick(["cunt", "pussy slit", "pussy"])+"? Looks so loose.",
				"Not a fan of loose-looking "+RNG.pick(["pussies", "vaginas", "slits", "cunts"])+".",
				"Not sure how attractive "+RNG.pick(["stretched", "loose"])+" "+RNG.pick(["pussies", "cunts", "slits"])+" look.",
			])

	if(_bodypart is BodypartPenis):
		var lustInterets:LustInterests = _dom.getLustInterests()
		
		var likesBigCock = lustInterets.getTopicValue(InterestTopic.BigCock, _sub)
		var likesAverageCock = lustInterets.getTopicValue(InterestTopic.AverageCock, _sub)
		var likesSmallCock = lustInterets.getTopicValue(InterestTopic.SmallCock, _sub)
		
		if(_sub.isWearingChastityCage()):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"Is that a chastity cage? Ha! I bet you can't even get it off without the key. Loser.",
					"I can't believe you're walking around with that thing on. You must be so embarrassed. Serves you right for being such a deviant.",
					"Looks like someone's got their junk on lockdown. Must be nice to be so repressed and miserable.",
					"What a waste of metal. You must be desperate though. That's good.",
					"Well, I guess that's one way to make sure you don't accidentally reproduce.",
					"Ha! Looks like someone's been a bad slut and had to be punished. Serves you right.",
				])
			else:
				possible.append_array([
					"I bet that cage is really effective at keeping you in line.",
					"The cage fits you perfectly.",
				])
				if(likesBigCock > 0.1 || likesAverageCock > 0.1 || likesSmallCock > 0.1):
					possible.append_array([
						"Wow, that's a nice looking chastity cage you've got there.",
						"I can't help but admire the way that cage hugs your penis. It's very sexy.",
						"I like your "+RNG.pick(["cock", "dick"])+". Too bad it's caged.",
						"Nice cage for a nice "+RNG.pick(["cock", "dick"])+". It looks like it was made just for you.",
						"I'm not normally a fan of chastity cages, but on you, it looks nice."
					])
				else:
					possible.append_array([
						"I must say, I'm not a big fan of that. I think it's a bit too restrictive and uncomfortable.",
						"Nice cage. Can't say that I like your "+RNG.pick(["dick", "cock"])+" so I'm glad you're locked.",
					])
		
		if(likesBigCock > 0.1):
			possible.append_array([
				"Oh wow, that's one impressive "+RNG.pick(["dick", "cock", "monster of a cock"]),
				"I can't believe how big you are. I'm impressed.",
				"I didn't think they came that big. Wow.",
				"I bet that's a lot of fun to play with.",
				"I didn't know they made them that big. I'm impressed.",
				"I like your "+RNG.pick(["dick", "cock"])+". It's perfect.",
				"Ohh, that's just the right size. Nice.",
				"I like your size. It's perfect for me.",
				"Nice "+RNG.pick(["cock", "dick"])+" you have there.",
				"I like your "+RNG.pick(["cock", "dick"])+".",
			])
		elif(likesBigCock < -0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"What are you trying to compensate for with that thing? You must have some serious insecurities.",
					"I bet you're used to scaring people off with that thing. It must be hard to find someone who's actually into it.",
					"I didn't think size really mattered, but now I see it's all you have going for you. Pathetic.",
					"I didn't know they made them that big. I'm shocked, to be honest.",
				])
			else:
				possible.append_array([
					"I've seen bigger, so don't try to impress me with that.",
					"I've had bigger, so don't think you're anything special.",
					"I don't find big cocks too appealing, it's painful than anything.",
					"Huh. Your dick is nothing special. But it will do.",
				])
		if(likesAverageCock > 0.1):
			possible.append_array([
				"I like your "+RNG.pick(["dick", "cock"])+". It's perfect.",
				"Ohh, that's just the right size. Nice.",
				"I like your size. It's perfect for me.",
				"Nice "+RNG.pick(["cock", "dick"])+" you have there.",
				"I like your "+RNG.pick(["cock", "dick"])+".",
			])
		elif(likesAverageCock < 0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"Meh. Your "+RNG.pick(["dick", "cock"])+" is so-o average.",
					"I've seen better dicks, and trust me, yours is not that impressive.",
					"Not a fan of average "+RNG.pick(["dicks", "cocks"])+". Meh.",
				])
			else:
				possible.append_array([
					"Your "+RNG.pick(["dick", "cock"])+" is average at best.",
					"Huh. Your dick is nothing special. But it will do.",
					"Not a huge fan of average "+RNG.pick(["dicks", "cocks"])+". But let's see.",
				])
		if(likesSmallCock > 0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"Aww, look at the little guy trying to act big.",
					"It's so cute how you think that tiny thing is impressive. Keep dreaming, buddy.",
					"Aww, poor little thing. I bet you get picked on all the time because of how small it is.",
					"Oh wow, careful when you use condoms on your little dick. One wrong move and it could slip right off.",
				])
			else:
				possible.append_array([
					"Ohh, what a cute cock you have~.",
					"I like your "+RNG.pick(["cock", "dick"])+". It's perfect.",
					"Some might prefer a larger size, but for me, there's just something about a small penis that I find incredibly endearing.",
					"Wow, that is the cutest little thing I've ever seen! I just love how tiny and adorable it is. It's just so precious.",
					"Oh wow, I just can't get enough of that tiny little thing you have. It's just so cute!",
					"I like your "+RNG.pick(["dick", "cock"])+". It's perfect.",
					"Ohh, that's just the right size. Nice.",
					"I like your size. It's perfect for me.",
					"Nice "+RNG.pick(["cock", "dick"])+" you have there.",
					"I like your "+RNG.pick(["cock", "dick"])+".",
				])
		elif(likesSmallCock < -0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"I don't think I can take your "+RNG.pick(["dick", "cock"])+" seriously.",
					"Ugh, that's not what I was expecting at all.",
					"I'm not impressed. I've seen bigger things on a baby's toy.",
					"What is that thing? It's barely even a pecker!",
					"I can barely see it from here. Is that all you've got?",
					"You must be really insecure about that tiny thing.",
					"Looks like someone shrunk your "+RNG.pick(["dick", "cock"])+" in the wash!"
				])
			else:
				possible.append_array([
					"Huh. Your dick is nothing special. But it will do.",
					"Not a fan of small cocks honestly.",
					"Well, you're not exactly impressive. Quite the opposite.",
				])
			
	if(possible.size() > 0):
		return RNG.pick(possible)

func domReactionWhenUndressing(_bodypart, _sexEngine, _domInfo, _subInfo):
	var possible = []
	
	var domIsAngry = _domInfo.isAngry()
	var domIsMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.4
	#var domIsVeryMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.7
	
	if(_bodypart is BodypartPenis && RNG.chance(30)):
		if(domIsAngry || domIsMean):
			possible.append_array([
				"See my dick? Wanna worship it like a good slut?",
				"I'm gonna make you fall in love with my "+RNG.pick(["dick", "cock"])+", bitch",
				"Drooling already, slut?",
				"There we go, here is my cock",
				"Come on, don't be shy. I know you're curious.",
			])
		else:
			possible.append_array([
				"Like what you see? That's my "+RNG.pick(["dick", "cock"]),
				"Like my "+RNG.pick(["dick", "cock"])+"?",
				"There we go",
				"Check my "+RNG.pick(["dick", "cock"])+" out",
			])
	
	if(possible.size() > 0):
		return RNG.pick(possible)
