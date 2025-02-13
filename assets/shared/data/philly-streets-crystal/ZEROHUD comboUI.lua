setX = 0
setY = 200

setcam = 'hud' -- other hud
directory = "ZEROHUDassets/"
function onCreatePost()--特殊なUI変更

    makeAnimatedLuaSprite("BACK", directory..'UI', setX, setY)
    addLuaSprite("BACK")
    scaleObject('BACK',0.55, 0.55);
	setObjectOrder('BACK', 20);
	setObjectCamera('BACK', setcam);

    addAnimationByPrefix('BACK', 'combo', "combo", 30, false);

	makeAnimatedLuaSprite('evaluation', directory..'evaluation',setX + 50, setY + 5);
	--scaleObject('evaluation', scale, scale);
	setProperty('evaluation.antialiasing', true);
	setProperty('evaluation.alpha', 0);
	setObjectOrder('evaluation', 21);
	setObjectCamera('evaluation', setcam);

    addAnimationByPrefix('evaluation', 'PERFECT', "PERFECT", 24, false);
    addAnimationByPrefix('evaluation', 'GOOD', "GOOD", 24, false);
    addAnimationByPrefix('evaluation', 'GREAT', "GREAT", 24, false);
    addAnimationByPrefix('evaluation', 'BAD', "BAD", 24, false);
    addAnimationByPrefix('evaluation', 'MISS', "MISS", 24, false);
    addAnimationByPrefix('evaluation', 'DODGED', "DODGED", 24, false);

    plus = 120
    makeAnimatedLuaSprite('combocount1', directory..'combocount',setX + plus +30, setY + 95);
    --scaleObject('combocount', scale, scale);
    setProperty('combocount1.antialiasing', false);
    setObjectOrder('combocount1', 22 );
    setObjectCamera('combocount1', setcam);

    makeAnimatedLuaSprite('combocount2', directory..'combocount',setX + plus +60, setY + 95);
    --scaleObject('combocount', scale, scale);
    setProperty('combocount2.antialiasing', false);
    setObjectOrder('combocount2', 23 );
    setObjectCamera('combocount2', setcam);

    makeAnimatedLuaSprite('combocount3', directory..'combocount',setX + plus +90, setY + 95);
    --scaleObject('combocount', scale, scale);
    setProperty('combocount3.antialiasing', false);
    setObjectOrder('combocount3', 24 );
    setObjectCamera('combocount3', setcam);

    makeAnimatedLuaSprite('combocount4', directory..'combocount',setX + plus +120, setY + 95);
    --scaleObject('combocount', scale, scale);
    setProperty('combocount4.antialiasing', false);
    setObjectOrder('combocount4', 25 );
    setObjectCamera('combocount4', setcam);

    setProperty('BACK.alpha', 0);
    setProperty('combocount1.alpha', 0);
    setProperty('combocount2.alpha', 0);
    setProperty('combocount3.alpha', 0);
    setProperty('combocount4.alpha', 0);


    for i = 0,9 do
        addAnimationByPrefix('combocount1', 'combocount'..i,i.." ", 24, false);
        addAnimationByPrefix('combocount2', 'combocount'..i,i.." ", 24, false);
        addAnimationByPrefix('combocount3', 'combocount'..i,i.." ", 24, false);
        addAnimationByPrefix('combocount4', 'combocount'..i,i.." ", 24, false);
    end
    
end

C1000 = 0
C0100 = 0
C0010 = 0
C0001 = 0
function addcombo()
    C0001 = C0001 + 1
end
function misscombo()
    C1000 = 0
    C0100 = 0
    C0010 = 0
    C0001 = 0
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        addcombo()
    end

    if getPropertyFromGroup("notes", membersIndex, "rating") == "sick" then
        playAnim('evaluation', 'PERFECT')
    elseif getPropertyFromGroup("notes", membersIndex, "rating") == "good" then
        playAnim('evaluation', 'GOOD')
    elseif getPropertyFromGroup("notes", membersIndex, "rating") == "shit" then
        playAnim('evaluation', 'GREAT')
    elseif getPropertyFromGroup("notes", membersIndex, "rating") == "bad" then
        playAnim('evaluation', 'BAD')
    end

    if not isSustainNote then
        setProperty('evaluation.alpha', 1);
        doTweenAlpha("evaluation", "evaluation", 0, (crochet / 600), "linear")

        setProperty('evaluation.y', setY + 5 -15);
        doTweenY("evaluationY", "evaluation", setY + 5, (crochet / 1200), "linear")

        setProperty('BACK.alpha', 1);
        doTweenAlpha("BACK", "BACK", 0, (crochet / 1200), "linear")
        for i = 1,4 do
            setProperty('combocount'..i..'.alpha', 1);
            doTweenAlpha("combocount"..i, "combocount"..i, 0, (crochet / 600), "linear")
            setProperty('combocount'..i..'.y', setY + 95 - 15);
            doTweenY("combocountY"..i, "combocount"..i, setY + 95, (crochet / 1200), "linear")
        end
    else --ロングノーツの時 setY + 95
        setProperty('evaluation.alpha', 1);
        doTweenAlpha("evaluation", "evaluation", 0, (crochet / 600)*2, "linear")

        setProperty('evaluation.y', setY + 5 -15);
        doTweenY("evaluationY", "evaluation", setY + 5, (crochet / 1200)*2, "linear")

        setProperty('BACK.alpha', 1);
        doTweenAlpha("BACK", "BACK", 0, (crochet / 600)*2, "linear")
        for i = 1,4 do
            setProperty('combocount'..i..'.alpha', 1);
            doTweenAlpha("combocount"..i, "combocount"..i, 0, (crochet / 600)*2, "linear")
            setProperty('combocount'..i..'.y', setY + 95 - 15);
            doTweenY("combocountY"..i, "combocount"..i, setY + 95, (crochet / 1200)*2, "linear")
        end
    end


    if C0001 >= 10 then 
        C0001 = 0
        C0010 = C0010 + 1
    end
    if C0010 >= 10  then 
        C0010 = 0
        C0100 = C0100 + 1
    end
    if C0100 >= 10 then 
        C0100 = 0
        C1000 = C1000 + 1
    end
    playAnim('combocount1', 'combocount'..C1000)
    playAnim('combocount2', 'combocount'..C0100)
    playAnim('combocount3', 'combocount'..C0010)
    playAnim('combocount4', 'combocount'..C0001)
    for i = 1,100 do
        if getProperty('combo') == 50*i then
            playAnim('BACK', 'combo')
        end
    end
end

function dodgedsuccess(dummy)-- callOnLuas('dodgedsuccess',{1})
    playAnim('evaluation', 'DODGED')

    setProperty('evaluation.alpha', 1);
    doTweenAlpha("evaluation", "evaluation", 0, (crochet / 600), "linear")

    setProperty('evaluation.y', setY + 5 -15);
    doTweenY("evaluationY", "evaluation", setY + 5, (crochet / 1200), "linear")

    setProperty('BACK.alpha', 1);
    doTweenAlpha("BACK", "BACK", 0, (crochet / 1200), "linear")
end


function noteMiss(membersIndex, noteData, noteType, isSustainNote)
        misscombo()

        playAnim('combocount1', 'combocount'..C1000)
        playAnim('combocount2', 'combocount'..C0100)
        playAnim('combocount3', 'combocount'..C0010)
        playAnim('combocount4', 'combocount'..C0001)

        playAnim('evaluation', 'MISS')

        setProperty('evaluation.alpha', 1);
        doTweenAlpha("evaluation", "evaluation", 0, (crochet / 600), "linear")
    
        setProperty('evaluation.y', setY + 5 -15);
        doTweenY("evaluationY", "evaluation", setY + 5, (crochet / 1200), "linear")
    
        setProperty('BACK.alpha', 1);
        doTweenAlpha("BACK", "BACK", 0, (crochet / 1200), "linear")
        for i = 1,4 do
            setProperty('combocount'..i..'.alpha', 1);
            doTweenAlpha("combocount"..i, "combocount"..i, 0, (crochet / 600), "linear")
            setProperty('combocount'..i..'.y', setY + 95 - 15);
            doTweenY("combocountY"..i, "combocount"..i, setY + 95, (crochet / 1200), "linear")
        end
end

function noteMissPress(direction)
        misscombo()

        playAnim('combocount1', 'combocount'..C1000)
        playAnim('combocount2', 'combocount'..C0100)
        playAnim('combocount3', 'combocount'..C0010)
        playAnim('combocount4', 'combocount'..C0001)
        playAnim('evaluation', 'MISS')

        setProperty('evaluation.alpha', 1);
        doTweenAlpha("evaluation", "evaluation", 0, (crochet / 600), "linear")
    
        setProperty('evaluation.y', setY + 5 -15);
        doTweenY("evaluationY", "evaluation", setY + 5, (crochet / 1200), "linear")
    
        setProperty('BACK.alpha', 1);
        doTweenAlpha("BACK", "BACK", 0, (crochet / 1200), "linear")
        for i = 1,4 do
            setProperty('combocount'..i..'.alpha', 1);
            doTweenAlpha("combocount"..i, "combocount"..i, 0, (crochet / 600), "linear")
            setProperty('combocount'..i..'.y', setY + 95 - 15);
            doTweenY("combocountY"..i, "combocount"..i, setY + 95, (crochet / 1200), "linear")
        end
end

function onUpdatePost(elapsed)

	setProperty('showRating', false);
    setProperty('showComboNum', false)

end
