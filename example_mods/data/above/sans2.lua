holdTimer = -1.0;
singDuration = 4;
specialAnim = false;

characterAnimationsList = {};

characterAnimationsList[0] = 'idle' -- idle
characterAnimationsList[1] = 'singLEFT' -- left
characterAnimationsList[2] = 'singDOWN' -- down
characterAnimationsList[3] = 'singUP' -- up
characterAnimationsList[4] = 'singRIGHT' -- right
player3 = 'sansHUD'
directions = {'left', 'down', 'up', 'right'}

function onCreate() -- change this part for your character image (and the animation prefixes too) (you're also gonna need to make your own offset values)
	--- Caching the character into the memory ---
	makeAnimatedLuaSprite(player3, 'characters/LDSANS', 630, 135);

	--- Setting up Character Animations ---
	addAnimationByPrefix(player3, 'idle', 'SANSIdle', 24, false);
	addOffset(player3, 'idle', 13, 22)

	addAnimationByPrefix(player3, 'singLEFT', 'SANSLeft', 24, false);
	addOffset(player3, 'singLEFT', 15, 3)

	addAnimationByPrefix(player3, 'singDOWN', 'SANSDown', 24, false);
	addOffset(player3, 'singDOWN', 4, -7)

	addAnimationByPrefix(player3, 'singUP', 'SANSUp', 24, false);
	addOffset(player3, 'singUP', 106, 45)

	addAnimationByPrefix(player3, 'singRIGHT', 'SANSRight', 24, false);
	addOffset(player3, 'singRIGHT', -39, 1)

	playAnim(player3,'singLEFT',true)
end

function onCreatePost()
	setProperty(player3..'.flipX', false) -- remove this for other characters, this flips their x position
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
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	characterPlayAnimation(noteData + 1, true)
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
		doTweenAlpha('sans1',player3, 0.87, 15, 'sineInOut')
	end
	if curStep == 4380 then
		doTweenAlpha('sans2',player3, 0, 2, 'sineInOut')
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