scale = 1

setcam = 'hud' -- other hud
directory = "ZEROHUDassets/"
function onCreatePost()--特殊なUI変更
luaDebugMode = true
    --ZEROHU

    setProperty('healthBar.visible', false);
	makeAnimatedLuaSprite('HP', directory..'HP',screenWidth - (screenWidth*scale), screenHeight -(188*scale));
	setProperty('HP.antialiasing', false);
    scaleObject('HP', scale, scale);
	setProperty('HP.alpha', 1);
	setObjectCamera('HP', setcam);

	makeAnimatedLuaSprite('Song', directory..'SONG',0, 0);
	setProperty('Song.antialiasing', false);
	setProperty('Song.alpha', 1);
    scaleObject('Song', scale, scale);
	setObjectCamera('Song', setcam);

    if scale == 1 then
        ZEROHUD('ZEROHUD1',900,660)
        ZEROHUD('ZEROHUD2',950,670-2)
        ZEROHUD('ZEROHUD3',1050,640+2)
    end

    if downscroll then
        setObjectOrder('HP', 500);
        setObjectOrder('Song', 1);
        if scale == 1 then
            for s = 1,3 do
                setObjectOrder('ZEROHUD'..s, (503+s));
            end
        end
        setObjectOrder('iconP2', 2);
        setObjectOrder('iconP1', 501);
    else
        setObjectOrder('HP', 1);
        setObjectOrder('Song', 500);
        if scale == 1 then
            for s = 1,3 do
                setObjectOrder('ZEROHUD'..s, (3+s));
            end
        end
        setObjectOrder('iconP2', 501);
        setObjectOrder('iconP1', 2);
    end

    for i = 0,100 do
        addAnimationByPrefix('Song', 'SONG'..i, 'SONG_'..i.." ", 24, false);
        addAnimationByPrefix('HP', 'HP'..i, 'HP_'..i.." ", 24, false);
    end
    playAnim("Song", "SONG0",true)
end
local time = 0


function onUpdatePost(elapsed)
 local time = getSongPosition()/getProperty("songLength")
--math.floor(time*1000.0)
--debugPrint(math.floor(time*100))
    setProperty("camHUD.zoom", 1)

    RPC = getProperty('ratingPercent')
	Acc = math.floor((RPC*100)*100)/100;

	formatted_score = format_int(score)
    if scale == 1 then
	    setTextString('ZEROHUD1',"Score:" ..formatted_score);
        setTextString('ZEROHUD2',"Miss:"..getProperty('songMisses'));
        setTextString('ZEROHUD3',"Accuracy:"..math.floor((RPC*100)*100)/100 ..'%');
    end


    setProperty("HP.alpha", getProperty("camHUD.alpha"))
    setProperty("Song.alpha", getProperty("camHUD.alpha"))

    playAnim("HP", "HP"..math.floor(getHealth()*50),true)
    playAnim("Song", "SONG"..math.floor(time*100),true)

    if hideHud == false then
        setProperty('iconP2.x', 0);setProperty('iconP2.y', -15);
	    setProperty('iconP1.x', screenWidth-110-15);setProperty('iconP1.y', screenHeight-90-15);
    end

	setProperty('healthBar.visible', false);
    setProperty('healthBarBG.visible', false);
    setProperty('timeBar.visible', false);
	setProperty('timeBarBG.visible', false);
	setProperty('timeTxt.visible', false);
    setProperty('scoreTxt.visible', false);
end

function format_int(number)

	local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
	-- reverse the int-string and append a comma to all blocks of 3 digits
	int = int:reverse():gsub("(%d%d%d)", "%1,")
  
	-- reverse the int-string back remove an optional comma and put the 
	-- optional minus and fractional part back
	return minus .. int:reverse():gsub("^,", "") .. fraction
end

function ZEROHUD(name,x,y)
    makeLuaText(name,"",200,x,y); -- x y values go on the second and third 0's
    setTextSize(name, 15);
    addLuaText(name)
    setObjectCamera(name, setcam)--hud or other
    setProperty(name..'.alpha', 1)
    setProperty(name..'.angle', -6.7)
    setProperty(name..'.antialiasing', true)
    setTextBorder(name, 0.25, "000000")
    setTextAlignment(name,'left')
end