trailEnabledDad = true;
trailEnabledBF = false;
timerStartedDad = false;
timerStartedBF = false;

trailLength = 4;
trailDelay = 0.11;
shittyFUck = false
function onEvent(name, value1, value2)
	if name == "Toggle Trail" then
		if not (value1 == nil or value1 == '') and tonumber(value1) > 0 then
			if not timerStartedDad then
				runTimer('timerTrailDad', trailDelay, 0.11);
				timerStartedDad = true;
			end
			trailEnabledDad = true;
		else
			trailEnabledDad = false;
		end

		if not (value2 == nil or value2 == '') and tonumber(value2) > 0 then
			if not timerStartedBF then
				runTimer('timerTrailBF', trailDelay, 0);
				timerStartedBF = true;
			end
			trailEnabledBF = true;
		else
			trailEnabledBF = false;
		end
	end
	if name == 'Change Character' then
		if value1 == 'dad' then
			if value2 == 'sanssex' or value2 == 'sanssex2' then
				shittyFUck = false
			end
			if value2 == 'sanssex3' or value2 == 'sanssex4' then
				shittyFUck = true
			end
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'timerTrailDad' then
		createTrailFrame('Dad');
	end

	if tag == 'timerTrailBF' then
		createTrailFrame('BF');
	end
end

curTrailDad = 0;
curTrailBF = 0;
function createTrailFrame(tag)
	num = 0;
	color = -1;
	image = '';
	frame = 'BF idle dance';
	x = 0;
	y = 0;
	offsetX = 0;
	offsetY = 8;

	if tag == 'BF' then
		num = curTrailBF;
		curTrailBF = curTrailBF + 1;
		if trailEnabledBF then
			color = getColorFromHex('00ffff');
			image = getProperty('boyfriend.imageFile')
			frame = getProperty('boyfriend.animation.frameName');
			x = getProperty('boyfriend.x');
			y = getProperty('boyfriend.y');
			offsetX = getProperty('boyfriend.offset.x');
			offsetY = getProperty('boyfriend.offset.y');
			sizex = getProperty('boyfriend.scale.x')
			sizey = getProperty('boyfriend.scale.y')
		end
	else
		num = curTrailDad;
		curTrailDad = curTrailDad + 1;
		if trailEnabledDad then
			color = getColorFromHex('00ffff');
			image = getProperty('dad.imageFile')
			frame = getProperty('dad.animation.frameName');
			x = getProperty('dad.x');
			y = getProperty('dad.y');
			offsetX = getProperty('dad.offset.x');
			offsetY = getProperty('dad.offset.y');
			sizex = getProperty('dad.scale.x')
			sizey = getProperty('dad.scale.y')
		end
	end

	if num - trailLength + 1 >= 0 then
		for i = (num - trailLength + 1), (num - 1) do
			setProperty('psychicTrail'..tag..i..'.alpha', getProperty('psychicTrail'..tag..i..'.alpha') - (0.6 / (trailLength - 1)));
		end
	end
	removeLuaSprite('psychicTrail'..tag..(num - trailLength));

	if not (image == '') then
		trailTag = 'psychicTrail'..tag..num;
		makeAnimatedLuaSprite(trailTag, image, x, y);
		setProperty(trailTag..'.offset.x', offsetX);
		setProperty(trailTag..'.offset.y', offsetY);
		setProperty(trailTag..'.scale.x', sizex);
		setProperty(trailTag..'.scale.y', sizey);
		setProperty(trailTag..'.alpha', 0.6);
		setProperty(trailTag..'.color', color);
		setBlendMode(trailTag, '');
		addAnimationByPrefix(trailTag, 'stuff', frame, 0, false);
		addLuaSprite(trailTag, false);
		if shittyFUck then
			setProperty(trailTag..'.visible', true)
		else
			setProperty(trailTag..'.visible', false)
		end
	end
end