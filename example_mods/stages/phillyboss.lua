--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	makeAnimatedLuaSprite('cross', 'cassfight/cross', 650, 200)
	setObjectOrder('cross', 5)
	addAnimationByPrefix('cross', 'white', 'white', 24, true)
	addAnimationByPrefix('cross', 'red', 'red', 24, true)
	playAnim('cross', 'white', true)
	addLuaSprite('cross', true)
	setProperty('cross.alpha', 0);
	setScrollFactor('cross', 0.6, 0.6)


	makeLuaSprite('obj28', 'phillyreq/fog', -2045, 300)
	setObjectOrder('obj28', 14)
	addLuaSprite('obj28', true)
	setBlendMode('obj28', 'add')
	setProperty('obj28.velocity.x', getRandomFloat(-10, -15))

	makeLuaSprite('obj29', 'phillyreq/fog', 0, 300)
	setObjectOrder('obj29', 14)
	addLuaSprite('obj29', true)
	setBlendMode('obj29', 'add')
	setProperty('obj29.velocity.x', getRandomFloat(-10, -15))

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

	makeLuaSprite('obj17', 'phillyreq/city4', -752, -101)
	setObjectOrder('obj17', 0)
	setScrollFactor('obj17', 0.3, 0.3)
	addLuaSprite('obj17', true)

	makeLuaSprite('obj27', 'phillyreq/city4', 552, -101)
	setObjectOrder('obj27', 0)
	setScrollFactor('obj27', 0.3, 0.3)
	addLuaSprite('obj27', true)
	
	makeLuaSprite('obj8', 'phillyreq/sky', -1159, -381)
	setObjectOrder('obj8', 0)
	setScrollFactor('obj8', 0.1, 0.1)
	addLuaSprite('obj8', true)
	
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
	if trainMoving then
		trainFrameTiming = trainFrameTiming + elapsed;

		if trainFrameTiming >= 1 / 24 then
			updateTrainPos();
			trainFrameTiming = 0;
		end
	end
	setProperty('window.alpha', getProperty('window.alpha') - (crochet / 1000) * elapsed * 1.5);
end

function onBeatHit()
	if not trainMoving then
		trainCooldown = trainCooldown + 1;
	end

	if curBeat % 4 == 0 then
		for i = 0, 4 do
			setProperty('window.visible', false)
		end

		curLight = getRandomInt(0, 4);
		setProperty('window.visible', true)
		setProperty('window.alpha', 1)
		setProperty('window.color', getColorFromHex(phillyLightsColors[getRandomInt(0, #phillyLightsColors)]));
	end
	
	if curBeat % 8 == 4 and getRandomInt(0, 9) <= 3 and not trainMoving and trainCooldown > 10000 then
		trainCooldown = getRandomInt(-4, 0);
		trainStart();
	end
end

function trainStart()
	trainMoving = true;
	playSound('train_passes', 1, 'trainSound');
end

function updateTrainPos()
	if getSoundTime('trainSound') >= 4700 then
		startedMoving = true;
		characterPlayAnim('gf', 'blow');
	end

	if (startedMoving) then
		trainX = getProperty('train.x') - 800;
		setProperty('train.x', trainX);

		if trainX < -2000 and not trainFinishing then
			setProperty('train.x', -1150);
			trainX = -1150;
			trainCars = trainCars - 1;

			if trainCars <= 0 then
				trainFinishing = true;
			end
		end

		if trainX < -4000 and trainFinishing then
			trainReset();
		end
	end
end

function trainReset()
	setProperty('train.x', screenWidth + 600);
	trainMoving = false;
	trainCars = 8;
	trainFinishing = false;
	startedMoving = false;
end
