--created with Super_Hugo's Stage Editor v1.6.3

local bfturn = false

function onCreate()

	makeAnimatedLuaSprite('cross', 'cassfight/cross', 650, 200)
	setObjectOrder('cross', 5)
	addAnimationByPrefix('cross', 'white', 'white', 24, true)
	addAnimationByPrefix('cross', 'red', 'red', 24, true)
	playAnim('cross', 'white', true)
	addLuaSprite('cross', true)
	setProperty('cross.alpha', 0);
	setScrollFactor('cross', 0.6, 0.6)

	makeLuaSprite('obj3', 'phillyreq/streetnew', -2045, -699)
	setObjectOrder('obj3', 0)
	addLuaSprite('obj3', true)
	
	makeLuaSprite('window', 'phillyreq/city1', -772, 73)
	setObjectOrder('window', 0)
	setScrollFactor('window', 0.7, 0.7)
	addLuaSprite('window', true)
	setBlendMode('window', 'add')
	
	makeLuaSprite('obj5', 'phillyreq/city2', -772, 73)
	setObjectOrder('obj5', 0)
	setScrollFactor('obj5', 0.7, 0.7)
	addLuaSprite('obj5', true)
	
	makeLuaSprite('obj6', 'phillyreq/city3', -900, 163)
	setObjectOrder('obj6', 0)
	setScrollFactor('obj6', 0.5, 0.5)
	addLuaSprite('obj6', true)
	
	makeLuaSprite('obj7', 'phillyreq/city4', -152, -101)
	setObjectOrder('obj7', 0)
	setScrollFactor('obj7', 0.3, 0.3)
	addLuaSprite('obj7', true)
	
	makeLuaSprite('obj8', 'phillyreq/sky', -1159, -381)
	setObjectOrder('obj8', 0)
	setScrollFactor('obj8', 0.1, 0.1)
	addLuaSprite('obj8', true)
	setObjectOrder('gfGroup', getObjectOrder('dadGroup') +300)
	setScrollFactor('gfGroup', 1.7, 1.7)
	
end

phillyLightsColors = {
	'31A2FD',
	'31FD8C',
	'FB33F5',
	'FD4531',
	'FBA633'
};

trainMoving = false;
trainFrameTiming = 0;
startedMoving = false;

trainCars = 8;
trainFinishing = false;
trainCooldown = 0;

curLight = 0;
function onUpdate(elapsed)
	setProperty('window.alpha', getProperty('window.alpha') - (crochet / 1000) * elapsed * 1.5);
end

function onBeatHit()

	if curBeat % 4 == 0 then
		for i = 0, 4 do
			setProperty('window.visible', false)
		end

		curLight = getRandomInt(0, 4);
		setProperty('window.visible', true)
		setProperty('window.alpha', 1)
		setProperty('window.color', getColorFromHex(phillyLightsColors[getRandomInt(0, #phillyLightsColors)]));
	end
	
end


function onSectionHit()
	local isFocusedOnBF = false
	if mustHitSection then
		isFocusedOnBF = true
		if bfturn == false then
				triggerEvent('Change Character','GF', 'gf3right')
				triggerEvent('Play Animation','Turn', 'GF')
		end
		bfturn = true
	else
		isFocusedOnBF = false
		if bfturn == true then
				triggerEvent('Change Character','GF', 'gf3left')
				triggerEvent('Play Animation','Turn', 'GF')
		end
		bfturn = false
	end
end
