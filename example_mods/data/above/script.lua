local damageThing = false
function onCreatePost()
	setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
	setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
	setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
	setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)
	setPropertyFromGroup('playerStrums', 4, 'x', defaultOpponentStrumX4)
	setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
	setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
	setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
	setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
	setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX4)
end
function onSongStart()
	doTweenAlpha('blk','black', 0.4, 13, 'sineInOut')
	triggerEvent('Toggle Trail', '1', '')
end
local gameober = false
function onUpdate()
	if damageThing then 
		if getProperty('hpYay.scale.x') > 0.03 then
			setProperty('hpYay.scale.x', getProperty('hpYay.scale.x') - 0.0534)
			setProperty('hpKarma.scale.x', getProperty('hpKarma.scale.x') - 0.0534)
		end
	end
	setPropertyFromGroup('opponentStrums', 0, 'alpha', 0.5)
	setPropertyFromGroup('opponentStrums', 1, 'alpha', 0.5)
	setPropertyFromGroup('opponentStrums', 2, 'alpha', 0.5)
	setPropertyFromGroup('opponentStrums', 3, 'alpha', 0.5)
	setPropertyFromGroup('opponentStrums', 4, 'alpha', 0.5)

	setPropertyFromGroup('playerStrums', 0, 'alpha', 1)
	setPropertyFromGroup('playerStrums', 1, 'alpha', 1)
	setPropertyFromGroup('playerStrums', 2, 'alpha', 1)
	setPropertyFromGroup('playerStrums', 3, 'alpha', 1)
	setPropertyFromGroup('playerStrums', 4, 'alpha', 1)
	if curStep == 128 then
		setProperty('black.alpha', 0)
	end
	if curStep == 518 then
		doTweenAlpha('blk1','black', 0.5, 0.5, 'sineInOut')
	end
	if curStep == 528 then
		doTweenAlpha('blk2','black', 0, 9.5, 'sineInOut')
	end
	if curStep == 898 then
		damageThing = true
		gameober = true
		setProperty('black.alpha', 1)
		setProperty('soul.alpha', 1)
	end
	if curStep == 904 then
		playAnim('soul', 'snap')
	end
	if curStep == 906 then
		damageThing = false
	end
	if curStep == 916 then
		playAnim('soul', 'break')
	end
	if getProperty('soul.animation.curAnim.name') == 'break' then
		if getProperty('soul.animation.curAnim.finished') then
			setProperty('soul.alpha', 0)
		end
	end
	if curStep == 936 then
		doTweenY('over', 'gamepver', 155, 1, 'sineInOut')
	end
	if curStep == 1037 then
		setProperty('gamepver.x', -2000)
		setProperty('black.alpha', 0)
	end
	if curStep == 1039 then
		setProperty('gamepver.x', 250)
		setProperty('black.alpha', 1)
	end
	if curStep == 1041 then
		setProperty('gamepver.x', -2000)
		setProperty('black.alpha', 0)
	end
	if curStep == 1043 then
		setProperty('gamepver.x', 250)
		setProperty('black.alpha', 1)
	end
	if curStep == 1044 then
		setProperty('gamepver.x', -2000)
		setProperty('black.alpha', 0)
	end
	if curStep == 1045 then
		setProperty('black.alpha', 1)
	end
	if curStep == 1072 then
		setProperty('black.alpha', 0)
	end
	if curStep == 1401 then
		setProperty('black.alpha', 1)
		doTweenAlpha('blk1','black', 0.5, 3, 'sineInOut')
	end
	if curStep == 2052 then
		doTweenAlpha('blk1','black', 1, 8, 'sineInOut')
	end
	if curStep == 2185 then
		doTweenAlpha('blk1','black', 0.67, 3, 'sineInOut')
	end
	if curStep == 2368 then
		doTweenAlpha('blk1','black', 1, 3, 'sineInOut')
	end
	if curStep == 2592 then
		doTweenAlpha('blk1','black', 0.356, 18, 'sineInOut')
	end
	if curStep == 2762 then
		setProperty('black.alpha', 0)
	end
	if curStep == 3388 then
		doTweenAlpha('blk1','black', 0.5, 0.5, 'sineInOut')
	end
	if curStep == 3408 then
		setProperty('black.alpha', 0)
	end
	if curStep == 3720 then
		doTweenAlpha('blk1','black', 1, 1.5, 'sineInOut')
	end
	if curStep == 3748 then
		setProperty('black.alpha', 0)
	end
	if curStep == 4012 then
		doTweenAlpha('blk1','black', 1, 6.5, 'sineInOut')
	end
	if curStep == 4188 then
		doTweenAlpha('blk1','black', 0.5, 15, 'sineInOut')
	end
	if curStep == 4372 then
		doTweenAlpha('blk1','black', 0.75, 2, 'sineInOut')
	end
	if curStep == 4380 then
		doTweenAlpha('blk1','black', 0.75, 2, 'sineInOut')
	end
	if curStep == 4392 then
		setProperty('black.alpha', 1)
	end
end
function onTweenCompleted(tag)
	if gameober then
		if tag == 'over' then
			doTweenY('game', 'gamepver', 145, 1, 'sineInOut')
		end
		if tag == 'game' then
			doTweenY('over', 'gamepver', 155, 1, 'sineInOut')
		end
	end
end

function onEvent(n, v1, v2)
	if n == 'Change Character' then
		if v1 == 'dad' then
			if v2 == 'sanssex' then
				setProperty('bg1.visible', true)
				setProperty('bg2.visible', true)
				setProperty('bg3.visible', true)
				setProperty('bg4.visible', true)
				setProperty('bg5.visible', true)
				setProperty('bg6.visible', true)
				setProperty('bg7.visible', true)
				setProperty('bg8.visible', true)
				setProperty('bg9.visible', true)
				setProperty('bg10.visible', true)
				setProperty('bg11.visible', true)
		
				setProperty('bg21.visible', false)
				setProperty('bg22.visible', false)
				setProperty('bg23.visible', false)
				setProperty('bg24.visible', false)
				setProperty('bg25.visible', false)
				setProperty('bg26.visible', false)
				setProperty('bg27.visible', false)
				setProperty('bg28.visible', false)
				setProperty('bg29.visible', false)
				setProperty('bg210.visible', false)
				setProperty('bg211.visible', false)
		
				setProperty('bg31.visible', false)
				setProperty('bg32.visible', false)
				setProperty('bg33.visible', false)
				setProperty('bg34.visible', false)
				setProperty('bg35.visible', false)
				setProperty('bg36.visible', false)
				setProperty('bg37.visible', false)
				setProperty('bg38.visible', false)
				setProperty('bg39.visible', false)
				setProperty('bg310.visible', false)
				setProperty('bg311.visible', false)
				triggerEvent('Change Character', 'bf', 'AGARRA')
			end
			if v2 == 'sanssex2' then
				setProperty('bg1.visible', false)
				setProperty('bg2.visible', false)
				setProperty('bg3.visible', false)
				setProperty('bg4.visible', false)
				setProperty('bg5.visible', false)
				setProperty('bg6.visible', false)
				setProperty('bg7.visible', false)
				setProperty('bg8.visible', false)
				setProperty('bg9.visible', false)
				setProperty('bg10.visible', false)
				setProperty('bg11.visible', false)
		
				setProperty('bg21.visible', true)
				setProperty('bg22.visible', true)
				setProperty('bg23.visible', true)
				setProperty('bg24.visible', true)
				setProperty('bg25.visible', true)
				setProperty('bg26.visible', true)
				setProperty('bg27.visible', true)
				setProperty('bg28.visible', true)
				setProperty('bg29.visible', true)
				setProperty('bg210.visible', true)
				setProperty('bg211.visible', true)
		
				setProperty('bg31.visible', false)
				setProperty('bg32.visible', false)
				setProperty('bg33.visible', false)
				setProperty('bg34.visible', false)
				setProperty('bg35.visible', false)
				setProperty('bg36.visible', false)
				setProperty('bg37.visible', false)
				setProperty('bg38.visible', false)
				setProperty('bg39.visible', false)
				setProperty('bg310.visible', false)
				setProperty('bg311.visible', false)
				triggerEvent('Change Character', 'bf', 'AGARRA')
			end
			if v2 == 'sanssex3' or v2 == 'sanssex4' then
				setProperty('bg1.visible', false)
				setProperty('bg2.visible', false)
				setProperty('bg3.visible', false)
				setProperty('bg4.visible', false)
				setProperty('bg5.visible', false)
				setProperty('bg6.visible', false)
				setProperty('bg7.visible', false)
				setProperty('bg8.visible', false)
				setProperty('bg9.visible', false)
				setProperty('bg10.visible', false)
				setProperty('bg11.visible', false)
		
				setProperty('bg21.visible', false)
				setProperty('bg22.visible', false)
				setProperty('bg23.visible', false)
				setProperty('bg24.visible', false)
				setProperty('bg25.visible', false)
				setProperty('bg26.visible', false)
				setProperty('bg27.visible', false)
				setProperty('bg28.visible', false)
				setProperty('bg29.visible', false)
				setProperty('bg210.visible', false)
				setProperty('bg211.visible', false)
		
				setProperty('bg31.visible', true)
				setProperty('bg32.visible', true)
				setProperty('bg33.visible', true)
				setProperty('bg34.visible', true)
				setProperty('bg35.visible', true)
				setProperty('bg36.visible', true)
				setProperty('bg37.visible', true)
				setProperty('bg38.visible', true)
				setProperty('bg39.visible', true)
				setProperty('bg310.visible', true)
				setProperty('bg311.visible', true)
				triggerEvent('Change Character', 'bf', 'AGARRA2')
			end
		end
	end
end