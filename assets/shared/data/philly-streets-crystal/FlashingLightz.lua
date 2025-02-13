function onCreate()
	makeLuaSprite('hell', '', -900, -440);
	makeGraphic('hell', 5000, 5000, '000000')
	addLuaSprite('hell', false);
	setObjectCamera('hell', 'other')
	setLuaSpriteScrollFactor('hell', 1, 1)

	makeLuaSprite('warn', 'warn', 450, 100);
	setObjectCamera('warn', 'other');
	scaleObject('warn', 0.5, 0.5);
	addLuaSprite('warn', true);
	-- setBlendMode('warn', 'multiply');

	bruh = 'Essa Musica Contem Luzes Piscantes \n Caso para pessoas fracas em luzes porfavor jogue na dificuldade crystalin'

	makeLuaText('text', bruh, 500, 380, 426);
    setTextAlignment('text', 'center');
    setTextSize('text', 40);
    setObjectCamera('text', 'other')

    addLuaText('text', true);
    
end

function onSongStart()
	runTimer('disappear', 5)
end

function onTimerCompleted(tag)
	if tag =='disappear' then
		doTweenAlpha('bro','text', 0, 1);
		doTweenAlpha('bro2','warn', 0, 1);
		doTweenAlpha('bro3','hell', 0, 1);
	end
end
