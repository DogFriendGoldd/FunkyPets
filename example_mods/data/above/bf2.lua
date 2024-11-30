holdTimer = -1.0;
singDuration = 4;
specialAnim = false;

characterAnimationsList = {};

characterAnimationsList[0] = 'idle' -- idle
characterAnimationsList[1] = 'singLEFT' -- left
characterAnimationsList[2] = 'singDOWN' -- down
characterAnimationsList[3] = 'singUP' -- up
characterAnimationsList[4] = 'singRIGHT' -- right
characterAnimationsList[5] = 'singLEFTmiss' -- left
characterAnimationsList[6] = 'singDOWNmiss' -- down
characterAnimationsList[7] = 'singUPmiss' -- up
characterAnimationsList[8] = 'singRIGHTmiss' -- right
player3 = 'bfHUD'
directions = {'left', 'down', 'up', 'right'}

function onCreate() -- change this part for your character image (and the animation prefixes too) (you're also gonna need to make your own offset values)
	--- Caching the character into the memory ---
	makeAnimatedLuaSprite(player3, 'characters/LDBF', 0, 125);

	--- Setting up Character Animations ---
	addAnimationByPrefix(player3, 'idle', 'BFIdle', 24, false);
	addOffset(player3, 'idle', 13, 26)

	addAnimationByPrefix(player3, 'singLEFT', 'BFLeft', 24, false);
	addOffset(player3, 'singLEFT', 41, 26)

	addAnimationByPrefix(player3, 'singDOWN', 'BFDown', 24, false);
	addOffset(player3, 'singDOWN', 24, -5)

	addAnimationByPrefix(player3, 'singUP', 'BFUp', 24, false);
	addOffset(player3, 'singUP', -4, 52)

	addAnimationByPrefix(player3, 'singRIGHT', 'BFRight', 24, false);
	addOffset(player3, 'singRIGHT', -41, 26)

	addAnimationByPrefix(player3, 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
	addOffset(player3, 'singLEFT', 104, 31)

	addAnimationByPrefix(player3, 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	addOffset(player3, 'singDOWN', 51, 12)

	addAnimationByPrefix(player3, 'singUPmiss', 'BF NOTE UP MISS', 24, false);
	addOffset(player3, 'singUP', 3, 44)

	addAnimationByPrefix(player3, 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
	addOffset(player3, 'singRIGHT', -2, 17)

	playAnim(player3,'singLEFT',true)
end

function onCreatePost()
	setProperty(player3..'.flipX', true) -- remove this for other characters, this flips their x position
	addLuaSprite(player3, false);
	setProperty(player3..'.alpha',0)
	scaleObject(player3,0.8,0.8)
	setProperty(player3..'.antialiasing',true)
	setObjectCamera(player3,'hud')
end
local allowbop = false
function onBeatHit()
	if curBeat % 2 == 0 and holdTimer < 0 and not (getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing')  then
		characterPlayAnimation(0, true)
	end
end
function onCountdownTick(count)
	if count % 2 == 0 then
		characterPlayAnimation(0, false)
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	characterPlayAnimation(noteData + 1, true)
end
function onNoteMiss(id, noteData, noteType, isSustainNote)
	characterPlayAnimation(noteData + 4, true)
end
function characterPlayAnimation(animId, forced) -- thank you shadowmario :imp:
	-- 0 = idle
	-- 1 = left
	-- 2 = down
	-- 3 = up
	-- 4 = right

	specialAnim = false;

	local animName = characterAnimationsList[animId]
	playAnim(player3, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)

	if animId > 0 then 
		specialAnim = true ;
		holdTimer = 0;
	end
end
function onUpdate(elapsed)
	if curStep == 4188 then
		doTweenAlpha('bf1',player3, 0.87, 15, 'sineInOut')
	end
	if curStep == 4380 then
		doTweenAlpha('bf2',player3, 0, 2, 'sineInOut')
	end
	holdCap = stepCrochet * 0.0011 * singDuration;
	if holdTimer >= 0 then
		holdTimer = holdTimer + elapsed;
		if holdTimer >= holdCap and getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing' or holdTimer >= holdCap and getProperty('muk.animation.curAnim.name') == 'eww' then
			characterPlayAnimation(0, false)
			holdTimer = -1;
		end
	end
	
	if getProperty(player3..".animation.curAnim.finished") and specialAnim then
		specialAnim = false;
	end
end

