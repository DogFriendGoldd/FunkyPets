local allowCountdown = false
local allowEndSong = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene and isStoryMode then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
		allowCountdown = true
		preloadAssets()
		return Function_Stop
	end

	return Function_Continue
end

function onEndSong()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowEndSong and isStoryMode then
		setProperty('inCutscene', true)
		runTimer('startDialogueEnd', 0.8)
		allowEndSong = true
		preloadAssets()
		return Function_Stop
	end

	return Function_Continue
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue','FNF_Dialogue2_Piazza')
	end

	if tag == 'startDialogueEnd' then -- Timer completed, play dialogue
		startDialogue('dialogueEnd','')
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	if not allowEndSong and count == 8 then
		soundFadeOut('', 0.5)
    	playSound('bang')
    end

    if allowEndSong and count == 8 then
		playMusic('FNF_Dialogue2_Piazza')
    end
	--debugPrint("Current Count:"..count,'Current Playing:'..soundFolder..count+1,'-----------')	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	

end



function onTweenCompleted( tag )


end

function preloadAssets()

end

function onDialogueFinished()
		
	doTweenAlpha("DialogueBGFade","DialogueBG",0,.5,'cubeOut')	
		
	isSkip = getProperty('skipDialogueEndCallback')
	if isSkip == false then
		restartSong(true)
	end
end