local allowCountdown = true --CODE BY BAMB

function onStartCountdown() 
    if not allowCountdown then
	    return Function_Stop
	end

	if allowCountdown then
	    return Function_Continue
	end
end

function onCreatePost() -- sprite loading
        makeLuaText('skiptext', 'PRESS SPACE TO SKIP/END CUTSCENE', 400, 500, 500) --spacebar skip stuff
        setTextSize('skiptext', 32) --spacebar skip stuff
        addLuaText('skiptext') --spacebar skip stuff
        characterPlayAnim('dad', 'dad-summon', true); --animation to play
        playSound('Wekk3', 0.7, 'pico-talks') --audio to play mods/sounds
        runTimer('OtherCut', 3.3, 1) --timer
        --runTimer('CutEnd', 12.0, 1) --timer
end

function onTimerCompleted(tag) --this isnt really used idk
    if tag == 'CutEnd' then
        allowCountdown = true
        startCountdown()
        
    end
end
function onTimerCompleted(tag) 
    if tag == 'OtherCut' then --cutscene stuff
     cameraSetTarget('boyfriend') --camera go to bf
     runTimer('CameraBF', 1) --another timer lmfao
    elseif tag == 'CameraBF' then --another timer lmfao
     characterPlayAnim('bf', 'summoned', true); --animation to play
     runTimer('CameraDad', 1) --timer again
    elseif tag == 'CameraDad' then --tag
    cameraSetTarget('dad') --camera goes back to dad
end
end

function onUpdate()
	 if getPropertyFromClass("flixel.FlxG", "keys.justPressed.SPACE") then --code for skip cutscene
             setTextString('skiptext', deeznuts) --dont change this
             allowCountdown = true
             startCountdown() --self explanatory
             stopSound('ughass') --stops sound
end
end