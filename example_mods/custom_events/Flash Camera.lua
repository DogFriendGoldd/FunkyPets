function onEvent(n,v1,v2)


	if n == 'Flash Camera' then

	   makeLuaSprite('flash', '', 0, 0);
	   if v2 == '' then
        makeGraphic('flash',1280,720,'ffffff')
	   else
        makeGraphic('flash',1280,720,v2)
	   end
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		setObjectCamera("flash", 'hud')
		doTweenAlpha('flTw','flash',0,0.25,'linear')
	end



end