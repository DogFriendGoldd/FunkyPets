dick = false
bf = false
bflive = true
active = false
attack = false
whatshedo = 0
sound = 1
walkdelay = 0.6
walk = false
cancool = 0
canlevel = 4
canaim = false
canning = false
canhealth = -1
cancool2 = 0
canlevel2 = 10
canaim2 = false
canning2 = false
canhealth2 = -1
trainfall = 5
traincooldown = 0
trainactive = 0
picohurt = 0
bfmove = false
bfleft = true
phase = 1
time = 500
dog = true
bfpos = 1
dogmove = 1
bosstime = false
picolookx = 2
picolooky = 1
flash = 1
local intensity = 0.003
local duration = 0.1
local hitintensity = 0.01
local hitduration = 0.2
meter = 1
bullet = 32
dead = false
bfName = 'gfleftboss'
local gftime = 0
realdead = false
charge = false
local allowCountdown = false
distance = 1
speed = 4

--ending variables
focus = 1

function onStartCountdown() -- This is so that the kinematics does not start before the countdown
    if not allowCountdown then
	runTimer('intro', 300);
	    return Function_Stop
	end

	if allowCountdown then
	doTweenAlpha(173471, 'tip', 0, 0.3, quintIn)
	    return Function_Continue
	end
end



function onBeatHit()
	if gftime == 1 then
		playAnim(bfName, 'danceLeft', true)
	end
	if gftime == 2 then
		playAnim(bfName, 'danceRight', true)
		gftime = 0
	end
	gftime = gftime + 1
end

function onSongStart()
	for i = 0, 7 do

	setPropertyFromGroup('strumLineNotes', i, 'visible', false)

	end
	runTimer('badend', 97);
	runTimer('clock1', 1);
	runTimer('bfwalkover', 1);
	runTimer('bosstime', 2.53);
	triggerEvent('Alt Idle Animation','Gf', '')
	triggerEvent('Play Animation','intro', 'gf')
	runTimer('canattackagain', 5);
	runTimer('fight', 300);
end


function onCreatePost()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)	
	triggerEvent('Alt Idle Animation','Gf', '-intro')
	callMethod('gf.dance', {''})
	setProperty('timeBar.y', -600000)
    	setProperty('timeBarBG.y', -600000)
        setProperty('timeTxt.y', -600000)
	makeLuaSprite('hitbox', 'cassfight/hitbox', 740, 100)
	setObjectOrder('hitbox', 150)
	scaleObject('hitbox', 1.4, 1.4)
	addLuaSprite('hitbox', true)
	setScrollFactor('hitbox', 0.5, 0.5)
	makeLuaSprite('hitboxpico', 'cassfight/hitbox', 100, 400)
	setObjectOrder('hitboxpico', 150)
	scaleObject('hitboxpico', 1.4, 1.4)
	addLuaSprite('hitboxpico', true)
	makeLuaSprite('hitboxpico2', 'cassfight/hitbox', 100, 400)
	setObjectOrder('hitboxpico2', 150)
	scaleObject('hitboxpico2', 1.4, 1.4)
	addLuaSprite('hitboxpico2', true)
	makeLuaSprite('hitboxbf', 'cassfight/hitbox', 900, 500)
	setObjectOrder('hitboxbf', 150)
	scaleObject('hitboxbf', 1.4, 1.4)
	addLuaSprite('hitboxbf', true)
	setObjectOrder('gfGroup', getObjectOrder('dadGroup') -5)
	setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup')-1)
	setScrollFactor('gfGroup', 0.5, 0.5)
	precacheImage('characters/bfdead3')
	precacheImage('characters/shoot')
	makeAnimatedLuaSprite('fuck1', 'cassfight/boomcan', 435, 0)
	addAnimationByPrefix('fuck1', 'just', 'can', 24, true)
	addAnimationByPrefix('fuck1', 'hit', 'boom', 12, false)
	playAnim('fuck1', 'just', true)
	setObjectOrder('fuck1', 6)
	setProperty('fuck1.alpha', 0);
	makeAnimatedLuaSprite('fuck2', 'cassfight/boomcan', 435, 0)
	addAnimationByPrefix('fuck2', 'just', 'can', 24, true)
	addAnimationByPrefix('fuck2', 'hit', 'boom', 12, false)
	playAnim('fuck2', 'just', true)
	setObjectOrder('fuck2', 6)
	setProperty('fuck2.alpha', 0);
	makeAnimatedLuaSprite('train', 'cassfight/trainnew', 435, -1800)
	addAnimationByPrefix('train', 'just', 'warn', 24, true)
	addAnimationByPrefix('train', 'hit', 'fall', 24, false)
	playAnim('train', 'just', true)
	setObjectOrder('train', 42)
	scaleObject('train', 3, 2)
	setProperty('train.alpha', 0);
	precacheImage('characters/picoboss')
	makeAnimatedLuaSprite('cross', 'cassfight/crosslol', 650, 200)
	setObjectOrder('cross', 105)
	addAnimationByPrefix('cross', 'white', 'white', 24, false)
	addAnimationByPrefix('cross', 'red', 'red', 24, false)
	playAnim('cross', 'white', true)
	addLuaSprite('cross', true)
	setProperty('cross.alpha', 0);
	setScrollFactor('cross', 0.6, 0.6)
	setHealth(0.0001)
        makeLuaText('text', 'Get Ready', 770, 630, 100);
        setTextSize('text', '50') --text size
        addLuaText('text', true);
        setObjectCamera('text', 'hud');
        makeLuaText('Atext', 'AMMO', 770, -130, 100);
        setTextSize('Atext', '50') --text size
        addLuaText('Atext', true);
        setObjectCamera('Atext', 'hud');
	setProperty('text.alpha', 0);
	setProperty('Atext.alpha', 0);
	makeAnimatedLuaSprite('meter', 'cassfight/refil', 650, 300)
	setObjectOrder('meter', 105)
	addAnimationByPrefix('meter', 'Idle', 'Idle', 24, true)
	addAnimationByPrefix('meter', 'Fill', 'Fill', 48, false)
	addAnimationByPrefix('meter', 'Fin', 'Fin', 24, false)
	playAnim('meter', 'Idle', true)
	addLuaSprite('meter', true)
	setProperty('meter.alpha', 0);
	makeLuaSprite('border', 'cassfight/borderneww', -100, 0)
	setObjectOrder('border', 150)
	addLuaSprite('border', true)
	setProperty('border.alpha', 0);
	makeLuaSprite('black', 'cassfight/black', 0, 0)
	setObjectOrder('black', 150)
	addLuaSprite('black', true)
        setObjectCamera('black', 'hud');
	setProperty('black.alpha', 0);
	makeLuaSprite('tip', 'cassfight/tipsnew', 0, 0)
	setObjectOrder('tip', 150)
	addLuaSprite('tip', true)
        setObjectCamera('tip', 'hud');
	setProperty('tip.alpha', 1);
	setScrollFactor('gfleftboss', 1.7, 1.7)
	createInstance(bfName, 'objects.Character', {400, 730, bfName, isPlayerBF})
	setObjectOrder(bfName, getObjectOrder('dadGroup') +300)
	setProperty('gfleftboss.alpha', 1);
end

function onUpdate(elapsed)
speed = 240/getPropertyFromClass("Main", "fpsVar.currentFPS")
distance = (getProperty('cross.x') - 500)/2
distancey = (getProperty('cross.y') - 200)/2
if getMouseX('game') > -200 and getMouseX('game') < 1600 then
	setProperty('cross.x', (getMouseX('game')+distance/1.6))
end
if getMouseY('game') > -100 and getMouseY('game') < 500 then
	setProperty('cross.y', (getMouseY('game')+distancey/1.6))
end
	for i = 0, 7 do

	setPropertyFromGroup('strumLineNotes', i, 'visible', false)

	end
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
	allowCountdown = true
	startCountdown()
end
if time < 1 then
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver')
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd')
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'picotrain')
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'traindead')
	setHealth(0)
end
if time < 4 and charge == false and bosstime == true then
	triggerEvent('Play Animation','charge', 'gf')
	attack = false
	charge = true
	cancelTimer('canattackagain');
end
setProperty('dadGroup.x', getProperty('hitboxpico.x'))
if bosstime == false and dead == true then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
	triggerEvent('Play Animation','defeat', 'gf')
	dead = false
	focus = 2
	runTimer('back2pico', 5.1);
	doTweenZoom('deadfuck', 'game', 1.1, 5.1, 'quadIn')
	cancelTimer('cangoboom');
	cancelTimer('cangoboom2');
	cancelTimer('traintime');
	cancelTimer('bfcan');
	cancelTween(trainalpha);
	doTweenAlpha(6, 'fuck1', 0, 0.2, quintIn)
	doTweenAlpha(7, 'fuck2', 0, 0.2, quintIn)
	doTweenAlpha(8, 'cross', 0, 0.5, quintIn)
	doTweenAlpha(9, 'border', 0, 0.5, quintIn)
	doTweenAlpha(10, 'train', 0, 0.5, quintIn)
	playSound('end')
end
if bosstime == false and focus == 2 then
	setCameraFollowPoint(getProperty('hitbox.x')-50, getProperty('hitbox.y')-500)
end
if bosstime == false and focus == 3 then
	setCameraFollowPoint(getProperty('hitboxpico.x')+330, getProperty('hitboxpico.y'))
end
setProperty('boyfriendGroup.x', getProperty('hitboxbf.x'))
setProperty('flash.x', getProperty('hitboxpico.x')-70)
setProperty('meter.x', getProperty('hitboxbf.x')+140)
if bosstime == true then
	if getProperty('hitboxbf.x')+250 < -100 then
		cancelTween(bfmove)
		setProperty('hitboxbf.x', 151)
	end
	if getProperty('hitboxbf.x')+250 > 1800 then
		cancelTween(bfmove)
		setProperty('hitboxbf.x', 1649)
	end
	if getProperty('cross.x') > getProperty('hitboxpico.x')+200 then
		picolookx = 3
	end
	if getProperty('cross.x') > getProperty('hitboxpico.x')-200 and getProperty('cross.x') < getProperty('hitboxpico.x')+200 then
		picolookx = 2
	end
	if getProperty('cross.x') < getProperty('hitboxpico.x')-200 then
		picolookx = 1
	end
	if getProperty('cross.y') > getProperty('hitboxpico.y')-100 then
		picolooky = 1
	end
	if getProperty('cross.y') < getProperty('hitboxpico.y')-100 then
		picolooky = 2
	end
	setTextString('text','Time Left '.. time)
	setTextString('Atext','Ammo Left '.. bullet)
	if walk == false then
		bfmove = false
	end
	if picolookx == 1 and picolooky == 1 and walk == false then
		triggerEvent('Alt Idle Animation','Dad', '-l')
	end
	if picolookx == 2 and picolooky == 1 and walk == false then
		triggerEvent('Alt Idle Animation','Dad', '-m')
	end
	if picolookx == 3 and picolooky == 1 and walk == false then
		triggerEvent('Alt Idle Animation','Dad', '-r')
	end
	if picolookx == 1 and picolooky == 2 and walk == false then
		triggerEvent('Alt Idle Animation','Dad', '-ul')
	end
	if picolookx == 2 and picolooky == 2 and walk == false then
		triggerEvent('Alt Idle Animation','Dad', '-um')
	end
	if picolookx == 3 and picolooky == 2 and walk == false then
		triggerEvent('Alt Idle Animation','Dad', '-ur')
	end
	if trainactive == 1 then
		if walk == false then
			doTweenAlpha(trainalphawalk, 'train', 0.5, 0.2, quadIn)
			doTweenAlpha(gfalphawalk, 'gfleftboss', 0.5, 0.2, quadIn)
		end
		if walk == true then
			doTweenAlpha(trainalphawalk, 'train', 1, 0.2, quadIn)
			doTweenAlpha(gfalphawalk, 'gfleftboss', 1, 0.2, quadIn)
		end
	end

		if walk == false then
			doTweenAlpha(gfalphawalk, 'gfleftboss', 0.5, 0.2, quadIn)
		end
		if walk == true then
			doTweenAlpha(gfalphawalk, 'gfleftboss', 1, 0.2, quadIn)
		end

	if bfmove == true then
		callMethod('boyfriend.dance', {''})
	end

	callMethod('dad.dance', {''})

	if canning == true then
		doTweenX('canthrow', 'fuck1', getProperty('hitboxpico.x')+250-(getProperty('cross.x')*0.4), 1, 'linear')
		doTweenAlpha(canalpha, 'fuck1', 1, 0.001, quadIn)
	end	

	if canning2 == true then
		if bflive == true then
		doTweenX('canthrow2', 'fuck2', getProperty('hitboxbf.x')+250, 1, 'linear')
		end
		if bflive == false then
		doTweenX('canthrow2', 'fuck2', getProperty('hitboxpico.x')+250, 1, 'linear')
		end
		doTweenAlpha(canalpha2, 'fuck2', 1, 0.001, quadIn)
	end	

	if getProperty('fuck1.scale.x') > 0.2 then
		setObjectOrder('fuck1', getObjectOrder('boyfriendGroup') -2)
	end

	if getProperty('fuck2.scale.x') > 0.2 then
		setObjectOrder('fuck2', getObjectOrder('boyfriendGroup') -2)
	end

	if picohurt == 1 then
		doTweenZoom('zoom', 'game', 0.5, 0.1, 'linear')
		setCameraFollowPoint(600, 300)
		doTweenAlpha(crossalpha, 'cross', 0, 0.2, quintIn)
	end

	if keyPressed('left') then
		walk = true
		doTweenZoom('zoom', 'game', 0.5, 0.1, 'linear')
		setCameraFollowPoint(600, 300)
		doTweenAlpha(crossalpha, 'cross', 0, 0.2, quintIn)
		doTweenAlpha(borderalpha, 'border', 0.7, 0.2, quintIn)
	end

	if keyPressed('left') then
		triggerEvent('Alt Idle Animation','Dad', '-panic')
	end

	if keyPressed('right') then
		walk = true
		doTweenZoom('zoom', 'game', 0.5, 0.1, 'linear')
		setCameraFollowPoint(600, 300)
		doTweenAlpha(crossalpha, 'cross', 0, 0.2, quintIn)
		doTweenAlpha(borderalpha, 'border', 0.7, 0.2, quintIn)
	end

	if keyPressed('right') then
		triggerEvent('Alt Idle Animation','Dad', '-panic')
	end

	if walk == false and picohurt == 0 then
		doTweenAlpha(crossalpha, 'cross', 1, 0.2, quintIn)
		doTweenAlpha(borderalpha, 'border', 0, 0.2, quintIn)
	end

	if keyReleased('left') then
		walk = false
	end

	if keyReleased('right') then
		walk = false
	end

	setProperty('gfGroup.x', getProperty('hitbox.x')-350)

	if attack == true then
		whatshedo = getRandomInt((1), (4), true)
	end

	if dog == true and bflive == true then
		bfpos = getRandomInt(10,700)
		dogmove = getRandomInt(1,3)
	end
	
	if dog == true and dogmove == 1 and walk == false and bflive == true and getProperty('hitboxbf.x') < getMidpointX('border') then
		if trainactive == 1 and getProperty('hitboxbf.x') > getProperty('train.x') then
		runTimer('dogshit', 2);
		doTweenX('bfmove', 'hitboxbf', getProperty('hitboxpico.x')+bfpos, 1, 'quadInOut')
		if getProperty('hitboxpico.x')+bfpos < getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wl')
			bfleft = true
		end
		if getProperty('hitboxpico.x')+bfpos > getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wr')
			bfleft = false
		end
		bfmove = true
		dog = false
		callMethod('boyfriend.dance', {''})
		runTimer('bfidle', 1);
		end
		if trainactive == 0 then
		runTimer('dogshit', 2);
		doTweenX('bfmove', 'hitboxbf', getProperty('hitboxpico.x')+bfpos, 1, 'quadInOut')
		if getProperty('hitboxpico.x')+bfpos < getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wl')
			bfleft = true
		end
		if getProperty('hitboxpico.x')+bfpos > getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wr')
			bfleft = false
		end
		bfmove = true
		dog = false
		callMethod('boyfriend.dance', {''})
		runTimer('bfidle', 1);
		end
		if trainactive == 1 and getProperty('hitboxbf.x') < getProperty('train.x') then
			dogmove = 2
		end
	end

	if dog == true and dogmove == 2 and walk == false and bflive == true and getProperty('hitboxbf.x') > getMidpointX('border') then
		if trainactive == 1 and getProperty('hitboxbf.x') < getProperty('train.x') then
		runTimer('dogshit', 2);
		if getProperty('hitboxpico.x')-bfpos < getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wl')
			bfleft = true
		end
		if getProperty('hitboxpico.x')-bfpos > getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wr')
			bfleft = false
		end
		doTweenX('bfmove', 'hitboxbf', getProperty('hitboxpico.x')-bfpos, 1, 'quadInOut')
		bfmove = true
		dog = false
		runTimer('bfidle', 1);
		callMethod('boyfriend.dance', {''})
		end
		if trainactive == 0 then
		runTimer('dogshit', 2);
		if getProperty('hitboxpico.x')-bfpos < getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wl')
			bfleft = true
		end
		if getProperty('hitboxpico.x')-bfpos > getProperty('hitboxbf.x') then
			triggerEvent('Alt Idle Animation','Bf', '-wr')
			bfleft = false
		end
		doTweenX('bfmove', 'hitboxbf', getProperty('hitboxpico.x')-bfpos, 1, 'quadInOut')
		bfmove = true
		dog = false
		runTimer('bfidle', 1);
		callMethod('boyfriend.dance', {''})
		end
		if trainactive == 1 and getProperty('hitboxbf.x') > getProperty('train.x') then
			dogmove = 1
		end
	end

	if dog == true and dogmove == 3 and walk == false and bflive == true then
		dog = false
		runTimer('dogshit', 2);
	end

	if attack == true and whatshedo == 1 and getProperty('hitbox.x') < 1200 then
		doTweenX('move', 'hitbox', getProperty('hitbox.x')+250, walkdelay, 'quadInOut')
		attack = false
		runTimer('canattackagain', (walkdelay)+0.4);
		triggerEvent('Play Animation','walk', 'gf')
	end


	if attack == true and whatshedo == 2 and getProperty('hitbox.x') > 300 then
		doTweenX('move', 'hitbox', getProperty('hitbox.x')-250, walkdelay, 'quadInOut')
		attack = false
		runTimer('canattackagain', (walkdelay)+0.4);
		triggerEvent('Play Animation','walk', 'gf')
	end

	if attack == true and whatshedo == 3 and cancool == 0 then
		canhealth = 3
		playAnim('fuck1', 'just', true)
		setObjectOrder('fuck1', 6)
		scaleObject('fuck1', 0.2, 0.2)
		attack = false
		setProperty('fuck1.x', getProperty('hitbox.x')+350)
		setProperty('fuck1.y', 0)
		doTweenX('bigx', 'fuck1.scale', 1, canlevel, 'circIn');
		doTweenY('bigy', 'fuck1.scale', 1, canlevel, 'circIn');
		doTweenX('canthrow', 'fuck1', getProperty('hitboxpico.x')+250, canlevel, 'quadIn')
		doTweenY('canthrowY', 'fuck1', getProperty('hitboxpico.y'), canlevel, 'quadIn')
		runTimer('cangoboom', canlevel);
		cancool = 1
		canning = true
		runTimer('cancooling', canlevel+2);
		triggerEvent('Play Animation','throw', 'gf')
		if phase == 1 then
			runTimer('canattackagain', 1);
		end
		if phase == 2 then
			runTimer('bfcan', 1);
			runTimer('canattackagain', 2);
		end
	end

	if attack == true and whatshedo == 4 and traincooldown == 0 then
		setProperty('train.alpha', 0);
		playAnim('train', 'just', true)
		triggerEvent('Play Animation','train', 'gf')
		doTweenAlpha('trainalpha', 'train', 1, trainfall, quintIn)
		runTimer('traintime', trainfall);
		setProperty('train.x', getProperty('hitboxpico.x')-400)
		attack = false
		runTimer('canattackagain', 2);
		traincooldown = 1
	end

	if attack == true and whatshedo == 3 and cancool == 1 then
		attack = true
	end

	if attack == true and whatshedo == 4 and traincooldown == 1 then
		attack = true
	end

	if active == true and walk == false and picohurt == 0 then
		doTweenZoom('zoom', 'game', 0.7, 0.1, 'linear')
	end
	if active == false and walk == false and picohurt == 0 then
		doTweenZoom('zoom', 'game', 0.6, 0.1, 'linear')
	end
	if walk == false and picohurt == 0 then
		setCameraFollowPoint(getProperty('cross.x'), getProperty('cross.y'))
	end
	if keyPressed('left') and not keyPressed('right') and walk == true and trainactive == 0 and picohurt == 0 and getProperty('hitboxpico.x')+250 > 100 then
		setProperty('hitboxpico.x', getProperty('hitboxpico.x')-(4*speed))
		triggerEvent('Alt Idle Animation','Dad', '-walkl')
		if bflive == true then
			runTimer('bfidle', 0.1);
				doTweenX('bfmove', 'hitboxbf', getProperty('hitboxpico.x'), 0.3, 'linear')
				triggerEvent('Alt Idle Animation','Bf', '-wl')
				bfmove = true
				bfleft = true
		end
	end
	if keyPressed('right') and not keyPressed('left') and walk == true and trainactive == 0 and picohurt == 0 and getProperty('hitboxpico.x')+250 < 1600 then
		setProperty('hitboxpico.x', getProperty('hitboxpico.x')+(4*speed))
		triggerEvent('Alt Idle Animation','Dad', '-walkr')
		if bflive == true then
			runTimer('bfidle', 0.1);
				doTweenX('bfmove', 'hitboxbf', getProperty('hitboxpico.x'), 0.3, 'linear')
				triggerEvent('Alt Idle Animation','Bf', '-wr')
				bfmove = true
				bfleft = false
		end
	end
	if keyPressed('left') and not keyPressed('right') and walk == true and trainactive == 1 and getProperty('hitboxpico.x') > getProperty('train.x')+850 and picohurt == 0 and getProperty('hitboxpico.x')+250 > -100 then
		setProperty('hitboxpico.x', getProperty('hitboxpico.x')-(4*speed))
		triggerEvent('Alt Idle Animation','Dad', '-walkl')
	end
	if keyPressed('left') and not keyPressed('right') and walk == true and trainactive == 1 and getProperty('hitboxpico.x')+200 < getProperty('train.x') and picohurt == 0 and getProperty('hitboxpico.x')+250 > 100 then
		setProperty('hitboxpico.x', getProperty('hitboxpico.x')-(4*speed))
		triggerEvent('Alt Idle Animation','Dad', '-walkl')
	end
	if keyPressed('right') and not keyPressed('left') and walk == true and trainactive == 1 and getProperty('hitboxpico.x') > getProperty('train.x')+820 and picohurt == 0 and getProperty('hitboxpico.x')+250 < 1600 then
		setProperty('hitboxpico.x', getProperty('hitboxpico.x')+(4*speed))
		triggerEvent('Alt Idle Animation','Dad', '-walkr')
	end
	if keyPressed('right') and not keyPressed('left') and walk == true and trainactive == 1 and getProperty('hitboxpico.x')+400 < getProperty('train.x') and picohurt == 0 then
		setProperty('hitboxpico.x', getProperty('hitboxpico.x')+(4*speed))
		triggerEvent('Alt Idle Animation','Dad', '-walkr')
	end
	if keyPressed('right') and keyPressed('left') and walk == true then
		triggerEvent('Alt Idle Animation','Dad', '-panic')
	end
	if not keyPressed('right') and not keyPressed('left') and walk == true then
		triggerEvent('Alt Idle Animation','Dad', '-panic')
	end
	if getProperty('cross.x') < getProperty('hitbox.x')+100 and getProperty('cross.x') > getProperty('hitbox.x')-400 and getProperty('cross.y') > getProperty('hitbox.y')+140 and getProperty('cross.y') < getProperty('hitbox.y')+340 and walk == false and canaim == false then
		playAnim('cross', 'red', false)
		dick = true
		active = true
	end
	if getProperty('cross.x') > getProperty('hitbox.x')+100 and dick == true then
		playAnim('cross', 'white', false)
		dick = false
		active = false
	end
	if getProperty('cross.x') < getProperty('hitbox.x')-400 and dick == true then
		playAnim('cross', 'white', false)
		dick = false
		active = false
	end
	if getProperty('cross.y') < getProperty('hitbox.y')+140 and dick == true then
		playAnim('cross', 'white', false)
		dick = false
		active = false
	end
	if getProperty('cross.y') > getProperty('hitbox.y')+340 and dick == true then
		playAnim('cross', 'white', false)
		dick = false
		active = false
	end
	if getProperty('hitboxpico.x') < getProperty('hitboxbf.x')+400 and getProperty('hitboxpico.x') > getProperty('hitboxbf.x')-200 then
		bf = true
	end
	if getProperty('hitboxpico.x') > getProperty('hitboxbf.x')+400 and bf == true then
		bf = false
	end
	if getProperty('hitboxpico.x') < getProperty('hitboxbf.x')-200 and bf == true then
		bf = false
	end
	if getMidpointX('cross') < getProperty('fuck1.x')+500 and getMidpointX('cross') > getProperty('fuck1.x')-200 and getMidpointY('cross') > getMidpointY('fuck1')-(250) and getMidpointY('cross') < getMidpointY('fuck1')+(150) and canning == true and walk == false then
		playAnim('cross', 'red', false)
		canaim = true
		active = true
		dick = false
		canaim2 = false
	end
	if getMidpointX('cross') > getProperty('fuck1.x')+500 and canaim == true then
		playAnim('cross', 'white', false)
		canaim = false
		active = false
	end
	if getMidpointX('cross') < getProperty('fuck1.x')-200 and canaim == true then
		playAnim('cross', 'white', false)
		canaim = false
		active = false
	end
	if getMidpointY('cross') < getProperty('fuck1.y')-100 and canaim == true then
		playAnim('cross', 'white', false)
		canaim = false
		active = false
	end
	if getMidpointY('cross') > getProperty('fuck1.y')+400 and canaim == true then
		playAnim('cross', 'white', false)
		canaim = false
		active = false
	end
	if getMidpointX('cross') < getProperty('fuck2.x')+500 and getMidpointX('cross') > getProperty('fuck2.x')-200 and getMidpointY('cross') > getMidpointY('fuck2')-(250) and getMidpointY('cross') < getMidpointY('fuck2')+(150) and canning2 == true and walk == false and canaim == false then
		playAnim('cross', 'red', false)
		canaim2 = true
		canaim = false
		active = true
		dick = false
	end
	if getMidpointX('cross') > getProperty('fuck2.x')+500 and canaim2 == true then
		playAnim('cross', 'white', false)
		canaim2 = false
		active = false
	end
	if getMidpointX('cross') < getProperty('fuck2.x')-200 and canaim2 == true then
		playAnim('cross', 'white', false)
		canaim2 = false
		active = false
	end
	if getMidpointY('cross') < getProperty('fuck2.y')-100 and canaim2 == true then
		playAnim('cross', 'white', false)
		canaim2 = false
		active = false
	end
	if getMidpointY('cross') > getProperty('fuck2.y')+400 and canaim2 == true then
		playAnim('cross', 'white', false)
		canaim2 = false
		active = false
	end
	if canhealth == 0 then
		playSound('boom', getProperty('fuck1.scale.x'))
		canhealth = -1
		setProperty('fuck1.color', 0xFFFFFF)
		playAnim('fuck1', 'hit', false)
		canning = false
		canaim = false
		cancelTimer('cangoboom');
		cancelTween(bigx)
		cancelTween(bigy)
		cancelTween(canthrow)
		cancelTween(canthrowy)
		runTimer('canflash', 0.1);
		doTweenAlpha(canalpha, 'fuck1', 0, 0.5, quintIn)
		playAnim('cross', 'white', false)
		active = false
	end
	if canhealth2 == 0 then
		playSound('boom', getProperty('fuck2.scale.x'))
		canhealth2 = -1
		setProperty('fuck2.color', 0xFFFFFF)
		playAnim('fuck2', 'hit', false)
		canning2 = false
		canaim2 = false
		cancelTimer('cangoboom2');
		cancelTween(bigx2)
		cancelTween(bigy2)
		cancelTween(canthrow2)
		cancelTween(canthrowy2)
		runTimer('canflash2', 0.1);
		doTweenAlpha(canalpha2, 'fuck2', 0, 0.5, quintIn)
		playAnim('cross', 'white', false)
		active = false
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and bf == true then
		playAnim('meter', 'Fill', true)
		runTimer('meter', 0.5);
		doTweenAlpha(refillnalpha, 'meter', 1, 0.2, quintIn)
	end
	if mouseClicked("left") and walk == false and picohurt == 0 then
		if bullet > 0 then
		bullet = bullet - 1
		camShake()
		triggerEvent('Change Character','dad', 'picoshoot')
		if flash == 2 then
			playAnim('flash', 'a', true)
		end
		if flash == 1 then
			playAnim('flash', 'b', true)
			flash = 2
		end
		runTimer('picoflash', 0.1);
		sound = getRandomInt((1), (2), true)
			if sound == 1 then
		  	     	playSound('gun1')
			end
			if sound == 2 then
			       	playSound('gun2')
			end
		if dick == true then
			setProperty('gf.color', 0xFF0000)
			runTimer('gfhit', 0.03);
			addHits(1)
			addHealth(0.011)
			addHits(1)
			addScore(320)
		end
		if canaim == true then
			canhealth = canhealth-1
			setProperty('fuck1.color', 0xFF0000)
			runTimer('canflash', 0.1);
			addHits(1)
		end
		if canaim2 == true then
			canhealth2 = canhealth2-1
			setProperty('fuck2.color', 0xFF0000)
			runTimer('canflash2', 0.1);
			addHits(1)
		end
		if flash == 2 then
			flash = 1
		end
		end
	end
	if getHealth() > 1 then
		phase = 2
		walkdelay = 0.2
		trainfall = 3
		canlevel2 = 3
		canlevel = 3
	end
	if getHealth() == 2 then
		dead = true
		bosstime = false
	end

    if sec > 9 then

        setProperty('timeTxt.text', min .. ':' .. sec)

    end

    if sec <= 9 then

        setProperty('timeTxt.text', min .. ':0' .. sec)

    end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'canattackagain' then
		attack = true
	end
	if tag == 'cancooling' then
		cancool = 0
	end
	if tag == 'cancooling2' then
		cancool2 = 0
	end
	if tag == 'cangoboom' then
		if getHealth() < 0.3 then
			setProperty('boyfriendGroup.x', getProperty('hitboxpico.x'))
		end
		setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver')
		setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd')

		setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'pico-explosion-dead')
		setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pico-explode')
		camShakehit()
		playAnim('fuck1', 'hit', true)
		canning = false
		playSound('boom', getProperty('fuck1.scale.x'))
			triggerEvent('Play Animation','hit', 'dad')
			setHealth(getHealth()-0.3)
			if getProperty('hitboxpico.x') < 700 then
				doTweenX('picohit', 'hitboxpico', getProperty('hitboxpico.x')+450, 1, 'quadOut')
				picohurt = 1
				runTimer('justhit', 1);
			end
			if getProperty('hitboxpico.x') > 700 then
				doTweenX('picohit', 'hitboxpico', getProperty('hitboxpico.x')-450, 1, 'quadOut')
				picohurt = 1
				runTimer('justhit', 1);
			end
	end
	if tag == 'cangoboom2' then
		if getHealth() < 0.3 then
			setProperty('boyfriendGroup.x', getProperty('hitboxpico.x'))
		end
		setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver')
		setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd')

		setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'pico-explosion-dead')
		setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pico-explode')

		camShakehit()
		playAnim('fuck2', 'hit', true)
		canning2 = false
		playSound('boom', getProperty('fuck2.scale.x'))
		setHealth(getHealth()-0.3)
		if bflive == false then
			triggerEvent('Play Animation','hit', 'dad')
			if getProperty('hitboxpico.x') < 700 then
				doTweenX('picohit', 'hitboxpico', getProperty('hitboxpico.x')+450, 1, 'quadOut')
				picohurt = 1
				runTimer('justhit', 1);
			end
			if getProperty('hitboxpico.x') > 700 then
				doTweenX('picohit', 'hitboxpico', getProperty('hitboxpico.x')-450, 1, 'quadOut')
				picohurt = 1
				runTimer('justhit', 1);
			end
		end
		if bflive == true then
			triggerEvent('Play Animation','hit', 'bf')
			cancelTween(bfmove)
			triggerEvent('Change Character','BF', 'deadbf')
			triggerEvent('Play Animation','firstDeath', 'BF')
			playSound('fnf_loss_sfx')
			bflive = false
			playAnim('cross', 'white', false)
			bf = false
			active = false
			triggerEvent('Alt Idle Animation','Bf', '-left')
			cancelTimer('bfidle');
		end
	end
	if tag == 'canflash' then
		setProperty('fuck1.color', 0xFFFFFF)
	end
	if tag == 'canflash2' then
		setProperty('fuck2.color', 0xFFFFFF)
	end
	if tag == 'gfhit' then
		setProperty('gf.color', 0xFFFFFF)
	end
	if tag == 'traintime' then
		setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver')
		setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd')

		setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'picotrain')
		setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'traindead')
		camShakehit()
		playSound('crash', 0.5)
		playAnim('train', 'hit', true)
		runTimer('traindespawn', 4.9);
		trainactive = 1
		if getHealth() < 0.5 then
			setProperty('boyfriendGroup.x', getProperty('hitboxpico.x'))
		end
		if getProperty('hitboxpico.x') < getProperty('train.x')+1020 and getProperty('hitboxpico.x')+400 > getProperty('train.x')+100 then
			setHealth(getHealth()-0.5)
			triggerEvent('Play Animation','hit', 'dad')

			if getProperty('hitboxpico.x')+150 > getMidpointX('border') then
				doTweenX('picohit', 'hitboxpico', getProperty('hitboxpico.x')+450, 1, 'quadOut')
				picohurt = 1
				runTimer('justhit', 1);
			end
			if getProperty('hitboxpico.x')+150 < getMidpointX('border') then
				doTweenX('picohit', 'hitboxpico', getProperty('hitboxpico.x')-450, 1, 'quadOut')
				picohurt = 1
				runTimer('justhit', 1);
			end
		end
		if getProperty('hitboxbf.x') < getProperty('train.x')+1020 and getProperty('hitboxbf.x')+400 > getProperty('train.x')+100 then
		if bflive == true then
			triggerEvent('Play Animation','hit', 'bf')
			cancelTween(bfmove)
			triggerEvent('Change Character','BF', 'deadbf')
			triggerEvent('Play Animation','firstDeath', 'BF')
			playSound('fnf_loss_sfx')
			bflive = false
			playAnim('cross', 'white', false)
			bf = false
			active = false
			triggerEvent('Alt Idle Animation','Bf', '-left')
			cancelTimer('bfidle');
			cancelTween(bfmove)
		end
		end
	end
	if tag == 'traindespawn' then
		trainactive = 0
		runTimer('traincooldown', trainfall);
		cancelTween(trainalphawalk)
		setProperty('train.alpha', 0);
	end
	if tag == 'justhit' then
		picohurt = 0
	end
	if tag == 'traincooldown' then
		traincooldown = 0
	end
	if tag == 'bfidle' then
		bfmove = false
		if bfleft == true then
			triggerEvent('Alt Idle Animation','Bf', '-left')
		end
		if bfleft == false then
			triggerEvent('Alt Idle Animation','Bf', '-right')
		end
		callMethod('boyfriend.dance', {''})
	end
	if tag == 'bfcan' then
		canhealth2 = 3
		playAnim('fuck2', 'just', true)
		setObjectOrder('fuck2', 6)
		scaleObject('fuck2', 0.2, 0.2)
		setProperty('fuck2.x', getProperty('hitbox.x')+350)
		setProperty('fuck2.y', 0)
		doTweenX('bigx2', 'fuck2.scale', 1, canlevel, 'circIn');
		doTweenY('bigy2', 'fuck2.scale', 1, canlevel, 'circIn');
		if bflive == true then
		doTweenX('canthrow2', 'fuck2', getProperty('hitboxbf.x')+250, canlevel, 'quadIn')
		end
		if bflive == false then
		doTweenX('canthrow2', 'fuck2', getProperty('hitboxpico.x')+250, canlevel, 'quadIn')
		end
		doTweenY('canthrowY2', 'fuck2', getProperty('hitboxbf.y'), canlevel, 'quadIn')
		runTimer('cangoboom2', canlevel);
		canning2 = true
		triggerEvent('Play Animation','throw', 'gf')
	end
	if tag == 'clock1' and realdead == false then
		runTimer('clock2uah', 1);
		time = time-1
	end
	if tag == 'clock2uah' and realdead == false then
		runTimer('clock1', 1);
		time = time-1
	end
	if tag == 'dogshit' then
		dog = true
	end
	if tag == 'bosstime' then
		bosstime = true
	end
	if tag == 'bfwalkover' then
		bosstime = true
		doTweenX('bfmove', 'hitboxbf', getProperty('hitboxpico.x')+400, 1, 'quadInOut')
		bfleft = true
		bfmove = true
		triggerEvent('Alt Idle Animation','Bf', '-left')
		dog = false
		runTimer('dogshit', 2);
		runTimer('bfidle', 1);
		callMethod('boyfriend.dance', {''})
		doTweenAlpha(crossstart, 'cross', 1, 0.2, quadIn)
		doTweenAlpha(textstart, 'text', 1, 0.2, quadIn)
		doTweenAlpha(atextstart, 'Atext', 1, 0.2, quadIn)
	end
	if tag == 'picoflash' then
		triggerEvent('Change Character','dad', 'picoboss')
	end
	if tag == 'meter' then
		playAnim('meter', 'Fin', true)
		bullet = 32
		doTweenAlpha(refillnalpha, 'meter', 0, 0.3, quintIn)
	end
	if tag == 'back2pico' then
		focus = 3
		doTweenZoom('deadfuck2', 'game', 0.6, 0.3, 'quadOut')
		triggerEvent('Play Animation','defeat', 'dad')
		setProperty('hitboxpico.x', getProperty('hitboxpico2.x'))
		runTimer('picoend', 3.7);
		if bflive == true then
			triggerEvent('Alt Idle Animation','Bf', '-wr')
			setProperty('hitboxbf.x', 900)
			doTweenX('walkright', 'hitboxbf', 3000, 5, 'linear')
		end
	end
	if tag == 'picoend' then
		doTweenZoom('donee', 'game', 0.000001, 0.1, 'quadIn')
		setProperty('black.alpha', 1);
		runTimer('songend', 1);
	end
	if tag == 'songend' then
		endSong()
	end
end

function camShake()
    cameraShake('game', intensity, duration)
end

function camShakehit()
    cameraShake('game', hitintensity, hitduration)
end