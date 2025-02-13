option = {
    'Resume',
    'Options',
    'Restart',
    'Exit'
}
local musicPath = 'tea-time'

function onPause()
    openCustomSubstate('OurplePause',true);
    return Function_Stop;
end

function onCustomSubstateCreate(name)
    if name == 'OurplePause' then
	precacheSound('scrollMenu')
        playSound(musicPath,0,'MusicP')
        soundFadeIn('MusicP', 20)
        runTimer('loopmusic', 59.00, 69)
    end
end
function onCustomSubstateSoundFinished(name)
    if name == 'OurplePause' then
        playSound(musicPath,1,'MusicP')
        runTimer('loopmusic', 59.00, 0)
    end
end
function onCustomSubstateUpdate(name)
    if keyJustPressed('back') then
        closePause()
    end
end
function onCustomSubstateCreatePost(name)
    if name == 'OurplePause' then

-- bg stuff

     makeLuaSprite('bg','pausemenu/pmbg', -1200, -40);
     setObjectCamera('bg','other')
     scaleObject('bg', 1.9, 1.9)
     setProperty('bg.antialiasing', false)
     doTweenX("bg", "bg", 0, 0.4, 'QuadOut')

     makeLuaSprite('grey', nil, -460, -260);
     makeGraphic('grey', 4000, 3000, '000000')
     setLuaSpriteScrollFactor('grey', 0, 0)
     scaleObject('grey', 1.7, 1.7)
     setObjectCamera('grey', 'other')
     setProperty('grey.alpha', 0.6)
     doTweenX("grey", "grey", 0, 5, 'QuadOut')

-- The character on the right image

     makeLuaSprite('RightImage','pausemenu/defaultportrait', 1600, 0)
     scaleObject('RightImage', 1, 1);
     setObjectCamera('RightImage', 'other')
     setProperty('RightImage.alpha', 1);
     setProperty('RightImage.antialiasing', false);
     doTweenX("RightImage", "RightImage", 800, 1, 'QuadOut')

-- Buttons
    
	makeAnimatedLuaSprite('RESUMEBG', 'pausemenu/resume', -1200, 20);
        addAnimationByPrefix('RESUMEBG','dance','pm_resumeidle',24,true);
        setProperty('RESUMEBG.antialiasing', false)
	objectPlayAnimation('RESUMEBG','dance',false);
	setProperty('RESUMEBG.visible', true);
	scaleObject('RESUMEBG', 1.4, 1.4);
        setObjectCamera('RESUMEBG', 'other');
        doTweenX("RESUMEBG", "RESUMEBG", 100, 0.5, 'QuadOut');

	makeAnimatedLuaSprite('OPTIONBG', 'pausemenu/options', -1200, 20);
        addAnimationByPrefix('OPTIONBG','dance','pm_resumeidle',24,true);
        setProperty('OPTIONBG.antialiasing', false)
	objectPlayAnimation('OPTIONBG','dance',false);
	setProperty('OPTIONBG.visible', true);
	scaleObject('OPTIONBG', 1.4, 1.4);
        setObjectCamera('OPTIONBG', 'other');
         doTweenX("OPTIONBG", "OPTIONBG", 100, 0.6, 'QuadOut');

	makeAnimatedLuaSprite('RESTARTBG', 'pausemenu/restart', -1200, 20);
        addAnimationByPrefix('RESTARTBG','dance','pm_resumeidle',24,true);
        setProperty('RESTARTBG.antialiasing', false)
	objectPlayAnimation('RESTARTBG','dance',false);
	setProperty('RESTARTBG.visible', true);
	scaleObject('RESTARTBG', 1.4, 1.4);
        setObjectCamera('RESTARTBG', 'other');
        doTweenX("RESTARTBG", "RESTARTBG", 100, 0.7, 'QuadOut');

	makeAnimatedLuaSprite('EXITBG', 'pausemenu/exit', -1200, 20);
        addAnimationByPrefix('EXITBG','dance','pm_resumeidle',24,true);
        setProperty('EXITBG.antialiasing', false)
	objectPlayAnimation('EXITBG','dance',false);
	setProperty('EXITBG.visible', true);
	scaleObject('EXITBG', 1.4, 1.4);
        setObjectCamera('EXITBG', 'other');
        doTweenX("EXITBG", "EXITBG", 100, 0.8, 'QuadOut');

	makeAnimatedLuaSprite('RESUMEBG2', 'pausemenu/resume', -1200, 20);
        addAnimationByPrefix('RESUMEBG2','dance','pm_resumec',24,true);
        setProperty('RESUMEBG2.antialiasing', false)
	objectPlayAnimation('RESUMEBG2','dance',false);
	setProperty('RESUMEBG2.visible', false);
	scaleObject('RESUMEBG2', 1.4, 1.4);
        setObjectCamera('RESUMEBG2', 'other');
        doTweenX("RESUMEBG2", "RESUMEBG2", 100, 0.5, 'QuadOut');
        insertToCustomSubstate('RESUMEBG2')

	makeAnimatedLuaSprite('OPTIONBG2', 'pausemenu/options', -1200, 20);
        addAnimationByPrefix('OPTIONBG2','dance','pm_optionsc',24,true);
        setProperty('OPTIONBG2.antialiasing', false)
	objectPlayAnimation('OPTIONBG2','dance',false);
	setProperty('OPTIONBG2.visible', false);
	scaleObject('OPTIONBG2', 1.4, 1.4);
        setObjectCamera('OPTIONBG2', 'other');
        doTweenX("OPTIONBG2", "OPTIONBG2", 100, 0.6, 'QuadOut');
        insertToCustomSubstate('OPTIONBG2')

	makeAnimatedLuaSprite('RESTARTBG2', 'pausemenu/restart', -1200, 20);
        addAnimationByPrefix('RESTARTBG2','dance','pm_restartc',24,true);
        setProperty('RESTARTBG2.antialiasing', false)
	objectPlayAnimation('RESTARTBG2','dance',false);
	setProperty('RESTARTBG2.visible', false);
	scaleObject('RESTARTBG2', 1.4, 1.4);
        setObjectCamera('RESTARTBG2', 'other');
        doTweenX("RESTARTBG2", "RESTARTBG2", 100, 0.7, 'QuadOut');
        insertToCustomSubstate('RESTARTBG2')

	makeAnimatedLuaSprite('EXITBG2', 'pausemenu/exit', -1200, 20);
        addAnimationByPrefix('EXITBG2','dance','pm_exitc',24,true);
        setProperty('EXITBG2.antialiasing', false)
	objectPlayAnimation('EXITBG2','dance',false);
	setProperty('EXITBG2.visible', false);
	scaleObject('EXITBG2', 1.4, 1.4);
        setObjectCamera('EXITBG2', 'other');
        doTweenX("EXITBG2", "EXITBG2", 100, 0.8, 'QuadOut');
        insertToCustomSubstate('EXITBG2')

-- adding stuff

     addLuaSprite('grey', false)
     addLuaSprite('RightImage',true);
     addLuaSprite('bg', true);
     addLuaSprite('arrow',true);

        for i = 1,#option do
            makeLuaText('option_'..i,option[i],-100,0,i * 140);
            setTextSize('option_'..i,50);
            setTextBorder('option_'..i,3,'000000');
            setObjectCamera('option_'..i,'other');
            setProperty('option_'..i..'.x',screenWidth/6 - getTextWidth('option_'..i)/3)
            setTextFont('option_'..i, 'vcr.ttf');
            setProperty('option_'..i..'.alpha', 0)
            addLuaText('option_'..i,true);
            addLuaSprite('RESUMEBG', true);
            addLuaSprite('RESTARTBG', true);
            addLuaSprite('OPTIONBG', true);
            addLuaSprite('EXITBG', true);
        end
    end
end

function onCustomSubstateTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopmusic' then
		playSound('MusicP', 1, 'tea-time') -- loop song
	end
end

function onCustomSubstateUpdatePost(name)
    if name == 'OurplePause' then
        if keyboardJustPressed('ENTER') and optionSelected == 1 then
            stopSound('MusicP')
            cancelTimer('loopmusic')
            closeCustomSubstate();
            for i = 1,#option do
                removeLuaText('option_'..i,false);
            end
            doTweenX("RightImage", "RightImage", 1800, 0.1, 'QuadOut');
            doTweenX("RESUMEBG", "RESUMEBG", -1200, 0.1, 'QuadOut');
            doTweenX("RESTARTBG", "RESTARTBG", -1200, 0.1, 'QuadOut');
            doTweenX("OPTIONBG", "OPTIONBG", -1200, 0.1, 'QuadOut');
            doTweenX("EXITBG", "EXITBG", -1200, 0.1, 'QuadOut');
            doTweenX("RESUMEBG2", "RESUMEBG2", -1200, 0.1, 'QuadOut');
            doTweenX("RESTARTBG2", "RESTARTBG2", -1200, 0.1, 'QuadOut');
            doTweenX("OPTIONBG2", "OPTIONBG2", -1200, 0.1, 'QuadOut');
            doTweenX("EXITBG2", "EXITBG2", -1200, 0.1, 'QuadOut');
            doTweenX("bg", "bg", -1200, 0.1, 'QuadOut');
            doTweenAlpha("grey", "grey", 0, 0.1, 'QuadOut');
        end
        if keyboardJustPressed('ENTER') and optionSelected == 2 then
	runHaxeCode([[
   	 import options.OptionsState;
  	  import backend.MusicBeatState;
  	  game.paused = true; // For lua
 	   game.vocals.volume = 0;
  	  MusicBeatState.switchState(new OptionsState());
  	  if (ClientPrefs.data.pauseMusic != 'None') {
    	    FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), game.modchartSounds('pauseMusic').volume);
    	    FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
      	    FlxG.sound.music.time = game.modchartSounds('pauseMusic').time;
    	  }
    	OptionsState.onPlayState = true;
	]])
        end

        if keyboardJustPressed('ENTER') and optionSelected == 3 then
            stopSound('MusicP')
	playSound('scrollMenu')
            restartSong(false);
        end

        if keyboardJustPressed('ENTER') and optionSelected == 4 then
            stopSound('MusicP')
	playSound('scrollMenu')
            exitSong(false);
        end

        if optionSelected == 1 then
	setProperty('RESUMEBG.visible', false);
	setProperty('OPTIONBG.visible', true);
	setProperty('RESTARTBG.visible', true);
	setProperty('EXITBG.visible', true);
	setProperty('RESUMEBG2.visible', true);
	setProperty('OPTIONBG2.visible', false);
	setProperty('RESTARTBG2.visible', false);
	setProperty('EXITBG2.visible', false);

        elseif optionSelected == 2 then
        insertToCustomSubstate('OPTIONBG2')
	setProperty('RESUMEBG.visible', true);
	setProperty('OPTIONBG.visible', false);
	setProperty('RESTARTBG.visible', true);
	setProperty('EXITBG.visible', true);
	setProperty('RESUMEBG2.visible', false);
	setProperty('OPTIONBG2.visible', true);
	setProperty('RESTARTBG2.visible', false);
	setProperty('EXITBG2.visible', false);

        elseif optionSelected == 3 then
        insertToCustomSubstate('RESTARTBG2')
	setProperty('RESUMEBG.visible', true);
	setProperty('OPTIONBG.visible', true);
	setProperty('RESTARTBG.visible', false);
	setProperty('EXITBG.visible', true);
	setProperty('RESUMEBG2.visible', false);
	setProperty('OPTIONBG2.visible', false);
	setProperty('RESTARTBG2.visible', true);
	setProperty('EXITBG2.visible', false);

        elseif optionSelected == 4 then 
        insertToCustomSubstate('EXITBG2')  
	setProperty('RESUMEBG.visible', true);
	setProperty('OPTIONBG.visible', true);
	setProperty('RESTARTBG.visible', true);
	setProperty('EXITBG.visible', false);
	setProperty('RESUMEBG2.visible', false);
	setProperty('OPTIONBG2.visible', false);
	setProperty('RESTARTBG2.visible', false);
	setProperty('EXITBG2.visible', true);
        end

        if keyboardJustPressed('W') then
            chooseOption(-1)
	playSound('scrollMenu')
        elseif keyboardJustPressed('S') then
            chooseOption(1)
	playSound('scrollMenu')
        end
        if keyboardJustPressed('UP') then
            chooseOption(-1)
	playSound('scrollMenu')
        elseif keyboardJustPressed('DOWN') then
            chooseOption(1)
	playSound('scrollMenu')
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopmusic' then
		playSound(musicPath, 0.7, 'MusicP') -- loop song
	end
end

optionSelected = 1
function chooseOption(choose)
    optionSelected = optionSelected + choose;

    if optionSelected >= #option + 1 then
        optionSelected = 1;
    elseif optionSelected <= 0 then
        optionSelected = #option;
    end
end