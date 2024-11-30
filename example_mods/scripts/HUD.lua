--HUD by Im Saki--
local dFont = "PhantomMuff Full Letters 1.1.5.ttf"
local turnvalue = 20

function onCreate()

    makeLuaSprite('lowBar', 'pure2', 0, 720)
    makeGraphic('lowBar', 1600, 250, '000000')
    setObjectCamera('lowBar', 'camHUD')
    addLuaSprite('lowBar', false)
    screenCenter('lowBar', 'x')

    makeLuaSprite('UpperBar', 'pure2', 0, -301)
    makeGraphic('UpperBar', 1600, 250, '000000')
    setObjectCamera('UpperBar', 'camHUD')
    addLuaSprite('UpperBar', false)
    screenCenter('UpperBar', 'x')

    makeAnimatedLuaSprite('hollow', 'healthbarNEW', 1810, 530)
    addAnimationByPrefix('hollow', '100', 'health1000', 24, true);
    addAnimationByPrefix('hollow', '80', 'health800', 24, true);
    addAnimationByPrefix('hollow', '60', 'health600', 24, true);
    addAnimationByPrefix('hollow', '40', 'health400', 24, true);
    addAnimationByPrefix('hollow', '20', 'health200', 24, true);

    setObjectCamera('hollow', 'hud')
    scaleObject('hollow', 0.8, 0.8)
    addLuaSprite('hollow', false);

    objectPlayAnimation('hollow', '60', true)

    doTweenY('up', 'UpperBar', -150, 1.5, 'cubeInOut')
    doTweenY('down', 'lowBar', 650, 1.5, 'cubeInOut')

    makeLuaText("score", "Score: ", 470, 1200, 20)
    setTextAlignment("score", "right")
    setTextFont("score", dFont)
    setTextSize("score", 25)

    makeLuaText("misses", "Misses: ", 470, -1420, 680)
    setTextAlignment("misses", "center")
    setTextFont("misses", dFont)
    setTextSize("misses", 25)

    makeLuaText("rating", "Rating: ", 470, -1030, 20)
    setTextAlignment("rating", "left")
    setTextFont("rating", dFont)
    setTextSize("rating", 25)

    makeLuaText("song", "/ Now Playing: " .. (songName) .. ' / ' .. string.upper(difficultyName) .. ' /', 470, -1030, 680)
    setTextAlignment("song", "left")
    setTextFont("song", dFont)
    setTextSize("song", 25)
    setProperty('song.alpha', 0.3)

    setScrollFactor("score", 0, 0)
    setObjectCamera("score", "hud")
    setScrollFactor("misses", 0, 0)
    setObjectCamera("misses", "hud")
    setScrollFactor("rating", 0, 0)
    setObjectCamera("rating", "hud")
    setScrollFactor("song", 0, 0)
    setObjectCamera("song", "hud")

    addLuaText("score", true)
    addLuaText("misses", true)
    addLuaText("rating", true)
    addLuaText('song', true)

    if downscroll then
        setProperty('hollow.flipY', true)
        setProperty('hollow.y', 0)
        setProperty('score.y', 680)
        setProperty('misses.y', 20)
        setProperty('rating.y', 680)
        setProperty('song.y', 20)
    end

end

function onUpdatePost()

    setProperty('iconP1.y', 550)
    setProperty('iconP2.y', 550)
    setProperty('iconP1.x', 600)
    setProperty('iconP2.x', 20)

    setProperty('healthBar.x', 1550)

    setProperty("scoreTxt.visible", false)

    setTextString('score', getProperty("songScore") .. " :Score")
    setTextString('misses', "Misses: " .. getProperty("songMisses"))
    setTextString('rating', 'Rating: ' .. '/ ' .. getProperty('ratingName') .. ' / ' .. getProperty('ratingFC'))

    if downscroll then
        setProperty('iconP1.y', 30)
        setProperty('iconP2.y', 30)
    end

end

function onBeatHit()

    if getProperty('health') < 0.41 and getProperty('health') >= 0.01 then
        objectPlayAnimation('hollow', '20', true)
    end

    if getProperty('health') < 0.81 and getProperty('health') >= 0.41 then
        objectPlayAnimation('hollow', '40', true)
    end

    if getProperty('health') < 1.21 and getProperty('health') >= 0.81 then
        objectPlayAnimation('hollow', '60', true)
    end

    if getProperty('health') < 1.61 and getProperty('health') >= 1.21 then
        objectPlayAnimation('hollow', '80', true)
    end

    if getProperty('health') <=2 and getProperty('health') >= 1.61 then
        objectPlayAnimation('hollow', '100', true)
    end

    turnvalue = 20

if curBeat % 2 == 0 then
turnvalue = -10
end

setProperty('iconP2.angle',turnvalue)
setProperty('iconP1.angle',-turnvalue)

setProperty('iconP2,angle',0,crochet/1000)
setProperty('iconP1,angle',0,crochet/1000)

end

function onCreatePost()

    doTweenX('start', 'hollow', 810, 3, 'cubeInOut')
    doTweenX('score', 'score', 800, 3, 'cubeInOut')
    doTweenX('miss', 'misses', 420, 3, 'cubeInOut')
    doTweenX('rating', 'rating', 10, 3, 'cubeInOut')
    doTweenX('song', 'song', 10, 3, 'cubeInOut')
    doTweenAlpha('iconfade', 'iconP1', 1, 2, 'cubeInOut')
    doTweenAlpha('iconfade2', 'iconP2', 1, 2, 'cubeInOut')

end

function noteMiss()

    setProperty('camHUD.alpha', 0.5)
    setProperty('camGame.alpha', 0.5)

    doTweenAlpha('camFade1', 'camHUD', 1, 0.5, 'in')
    doTweenAlpha('camFade2', 'camGame', 1, 0.5, 'in')

end

function goodNoteHit(id, dir, typ, sus)

    if (not sus) then
      setProperty('rating.x', -25)
      scaleObject('rating', 1.17, 1.17) 
      doTweenX('back1', 'rating.scale', 1, 0.2, 'linear')
      doTweenY('back2', 'rating.scale', 1, 0.2, 'linear')
    end

  end