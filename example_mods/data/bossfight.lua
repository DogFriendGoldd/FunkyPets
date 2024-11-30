luaDebugMode = false
local fuck = 2;
local sound = 1;
local red = false
local right = false
local middle = true
local left = false
local charge = false
local gun = true
local picol = false
local picor = false
local picom = true
local l = false
local m = true
local r = right
local u = false
local c = true
local d = false
local bosstime = false
local attack = false
local gfName = 'cass'
local can = 2
local bosshealth = 100
local canactive = false
local hasdied = false
bfName = 'gf3left'
local gftime = 0

function onCreatePost()
	runTimer('fight', 300);
	setObjectOrder('gfGroup', getObjectOrder('dadGroup') -5)
	setScrollFactor('gfGroup', 0.5, 0.5)
	runTimer('justdidathing', 5);
	makeAnimatedLuaSprite('fuck1', 'cassfight/can', 435, 0)
	addAnimationByPrefix('fuck1', 'just', 'can', 12, false)
	addAnimationByPrefix('fuck1', 'hit', 'can', 24, false)
	playAnim('fuck1', 'hit', true)
	setObjectOrder('fuck1', 6)
	setProperty('fuck1.alpha', 0);
	addLuaSprite('fuck1', true)
	makeAnimatedLuaSprite('boom', 'cassfight/boom', 435, -100)
	addAnimationByPrefix('boom', 'just', 'boom', 12, false)
	addAnimationByPrefix('boom', 'wait', 'boom', 24, false)
	playAnim('boom', 'wait', true)
	setObjectOrder('boom', 7)
	setProperty('boom.alpha', 0);
	addLuaSprite('boom', true)
	createInstance(bfName, 'objects.Character', {400, 130, bfName, isPlayerBF})
	setObjectOrder(bfName, getObjectOrder('dadGroup') -1)
	setHealth(0.0001)
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
	if bosshealth < 25 and bosshealth > 0 then
		bosshealth = 1
		triggerEvent('dripcheck','Shoot', 'dad')
	end
end

function onUpdate()
	if bosshealth < 1 then
		bosstime = false
		hasdied = true
		cancelTimer('cangoboom');
		cancelTimer('charge');
		runTimer('deadmf', 0.1);
		setProperty('fuck1.alpha', 0);
		setProperty('cross.alpha', 0);
		setProperty('text.alpha', 0);
	end
if bosstime == true then
	if bosshealth < 1 then
		bosstime = false
		hasdied = true
		cancelTimer('cangoboom');
		cancelTimer('charge');
		runTimer('deadmf', 0.1);
		setProperty('fuck1.alpha', 0);
		setProperty('cross.alpha', 0);
		setProperty('text.alpha', 0);
	end
	if hasdied == false then
	if m == true then
		setCameraFollowPoint(535, 200)
	end
	if l == true then
		setCameraFollowPoint(200, 200)
	end
	if r == true then
		setCameraFollowPoint(870, 200)
	end
	if charge == false and fuck > 1 then
		cancelTimer('charge');
	end
	if getProperty('gf.x') == 435 then
		middle = true
		right = false
		left = false
	end
	if getProperty('gf.x') == 770 then
		middle = false
		right = true
		left = false
	end
	if getProperty('gf.x') == 100 then
		middle = false
		right = false
		left = true
	end
	
	if gun == false then
		if keyJustPressed('left') then
			triggerEvent('Play Animation','roll', 'dad')
			if picom == true then 
				picol = true
				picom = false
				picor = false
				doTweenX('leftpicol', 'dad', 100, 0.4, 'quadInOut')
			end
			if picor == true then
				picom = true
				picor = false
				picol = false
				doTweenX('leftpicor', 'dad', 435, 0.4, 'quadInOut')
			end
		end
		if keyJustPressed('right') then
			triggerEvent('Play Animation','roll', 'dad')
			if picom == true then
				picor = true
				picom = false
				picol = false
				doTweenX('rightpicor', 'dad', 770, 0.4, 'quadInOut')
			end
			if picol == true then
				picom = true
				picol = false
				picor = false
				doTweenX('rightpicor', 'dad', 435, 0.4, 'quadInOut')
			end
		end
	end
	if gun == true then
		playAnim('cross', 'white', true)
		red = false
		if d == true then
			if m == true and middle == true then
				playAnim('cross', 'red', true)
				red = true
			end
			if l == true and left == true then
				playAnim('cross', 'red', true)
				red = true
			end
			if r == true and right == true then
				playAnim('cross', 'red', true)
				red = true
			end
		end
		if u == true and charge == true then
			if m == true and middle == true then
				playAnim('cross', 'red', true)
				red = true
			end
			if l == true and left == true then
				playAnim('cross', 'red', true)
				red = true
			end
			if r == true and right == true then
				playAnim('cross', 'red', true)
				red = true
			end
		end
		if c == true and canactive == true then
			if m == true and can == 2 then
				playAnim('cross', 'red', true)
				red = true
			end
			if l == true and can == 1 then
				playAnim('cross', 'red', true)
				red = true
			end
			if r == true and can == 3 then
				playAnim('cross', 'red', true)
				red = true
			end
		end
		if keyJustPressed('left') then
			if m == true then 
				l = true
				m = false
				r = false
				doTweenX('ll', 'cross', 315, 0.1, 'quadInOut')
			end
			if r == true then
				m = true
				r = false
				l = false
				doTweenX('lr', 'cross', 650, 0.1, 'quadInOut')
			end
		end
		if keyJustPressed('right') then
			if m == true then
				r = true
				m = false
				l = false
				doTweenX('rr', 'cross', 985, 0.1, 'quadInOut')
			end
			if l == true then
				m = true
				l = false
				r = false
				doTweenX('rl', 'cross', 650, 0.1, 'quadInOut')
			end
		end
		if keyJustPressed('up') then
			if c == true then
				u = true
				c = false
				d = false
				doTweenY('uu', 'cross', 0, 0.1, 'quadInOut')
			end
			if d == true then
				u = false
				c = true
				d = false
				doTweenY('du', 'cross', 200, 0.1, 'quadInOut')
			end
		end
		if keyJustPressed('down') then
			if c == true then
				d = true
				c = false
				u = false
				doTweenY('uu', 'cross', 450, 0.1, 'quadInOut')
			end
			if u == true then
				d = false
				c = true
				u = false
				doTweenY('du', 'cross', 200, 0.1, 'quadInOut')
			end
		end
  		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
			sound = getRandomInt((1), (2), true)
			triggerEvent('Play Animation','Shoot', 'dad')
				if sound == 1 then
			  	     	playSound('gun1')
				end
				if sound == 2 then
				       	playSound('gun2')
				end
			if d == true and red == true then
				doTweenColor('badapplexd1', 'gf', '00FFFF', 0.001, 'linear')
				runTimer('thunderFlash do end tween', 0.01);
				setProperty('health', getProperty('health')+ 0.012)
				bosshealth = bosshealth - 1
			end
			if c == true and red == true then
				setProperty('fuck1.alpha', 0);
				setProperty('boom.alpha', 100);
				canactive = false
				playAnim('boom', 'just', true)
				setProperty('boom.alpha', 100);
				cancelTimer('cangoboom');
		       		playSound('boom')
			end
			if u == true and red == true then
				triggerEvent('Play Animation','hit', 'gf')
				cancelTimer('charge');
				charge = false
				fuck = 3
				runTimer('justdidathing', 1);
			end
		end
	end

	if attack == true and charge == false and fuck > 1 then
		fuck = getRandomInt((2), (6), true)
		if middle == true then
		if fuck == 2 then
			if middle == true then
				triggerEvent('Play Animation','walk', 'gf')
			end
			if right == true then
				triggerEvent('Play Animation','walk', 'gf')
			end
			left = true
			right = false
			middle = false
			doTweenX('left', 'gf', 100, 0.4, 'quadInOut')
			runTimer('justdidathing', 1);
			attack = false
		end
		end 
		if middle == false then
		if fuck == 3 then
			if left == true then
				triggerEvent('Play Animation','walk', 'gf')
			end
			if right == true then
				triggerEvent('Play Animation','walk', 'gf')
			end
			middle = true
			right = false
			left = false
			doTweenX('middle', 'gf', 435, 0.4, 'quadInOut')
			runTimer('justdidathing', 1);
			attack = false
		end
		end
		if fuck == 4 then
		if middle == true then
			if middle == true then
				triggerEvent('Play Animation','walk', 'gf')
			end
			if left == true then
				triggerEvent('Play Animation','walk', 'gf')
			end
			right = true
			middle = false
			left = false
			doTweenX('right', 'gf', 770, 0.4, 'quadInOut')
			runTimer('justdidathing', 1);
			attack = false
		end
		end
		if fuck == 5 then
			triggerEvent('Play Animation','charge', 'gf')
			runTimer('charge', 3);
			charge = true
			attack = false
			fuck = 1
		end
		if fuck == 6 then
			triggerEvent('Play Animation','throw', 'gf')
			attack = false
			right = false
			middle = true
			left = false
			doTweenX('middle', 'gf', 435, 0.3, 'quadInOut')
			playAnim('fuck1', 'just', true)
			runTimer('justdidathing', 2);
			runTimer('cangoboom', 1.3);
			setProperty('fuck1.alpha', 100);
			canactive = true
			setProperty('boom.alpha', 0);
			playAnim('boom', 'wait', true)
				if picom == true then
					doTweenX('canmiddle', 'fuck1', 435, 0.1, 'quadInOut')
					doTweenX('boommiddle', 'boom', 435, 0.1, 'quadInOut')
					can = 2
				end
				if picol == true then
					doTweenX('canleft', 'fuck1', 100, 0.1, 'quadInOut')
					doTweenX('boomleft', 'boom', 100, 0.1, 'quadInOut')
					can = 1
				end
				if picor == true then
					doTweenX('canright', 'fuck1', 770, 0.1, 'quadInOut')
					doTweenX('boomright', 'boom', 770, 0.1, 'quadInOut')
					can = 3
				end
		end
	end
end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'thunderFlash do end tween' then
		doTweenColor('badapplexd2 ', 'gf', 'FFFFFF', 0.01, 'linear')
	end
	if tag == 'charge' and fuck == 1 then
		setProperty('health', 0)
	end
	if tag == 'cangoboom' and canactive == true then
		setProperty('health', 0)
	end
	if tag == 'justdidathing' then
		attack = true
	end
	if tag == 'deadmf' then
	end
end

function onEvent(name, value1, value2)
	if name == "bosstime" and bosshealth > 1 then
		bosstime = true
		fuck = 3
		attack = false
		runTimer('justdidathing', 2);
		setProperty('cross.alpha', 100);
	elseif name == "endcheck" and bosshealth > 1 then
		setProperty('health', 0)
	elseif name == "dripcheck" then
	if bosshealth < 2 then
		bosshealth = 0
	end
		bosshealth = 0
		bosstime = false
		hasdied = true
		cancelTimer('cangoboom');
		cancelTimer('charge');
		runTimer('deadmf', 0.1);
		setProperty('fuck1.alpha', 0);
		setProperty('cross.alpha', 0);
		setProperty('text.alpha', 0);
		triggerEvent('Alt Idle Animation','Dad', '')
		triggerEvent('Play Animation','stop', 'Dad')
		triggerEvent('Play Animation','dead', 'gf')
		bosshealth = 0
		cameraSetTarget(bf)
	end
end