function onUpdate()
 	if keyJustPressed('spaceBar') then
		characterPlayAnim('boyfriend', 'hey', true);
    characterPlayAnim('gf', 'cheer', true);
		setProperty('boyfriend.specialAnim', true);
    setProperty('gf.specialAnim', true);
		playSound('BF Yeah!', 0.8); --plays the "Yeah!" SFX, put this "--" before 'playsound' to disable, the numbers are the volume, max volume is 1.0. 
    end
    --secondary taunt
    if keyJustPressed('back') then
		characterPlayAnim('boyfriend', 'hey', true);
		setProperty('boyfriend.specialAnim', true);
		playSound('BF Laugh', 0.8); --plays the Laugh SFX, put this "--" before 'playsound' to disable, the numbers are the volume, max volume is 1.0.
    end
end

--function onCreate()
    --precacheSound('Hey!'); --Optional too, precaches the sound, just in case lol, maybe the SFX can lag the game if the file is too big idk
--end


    --if keyJustPressed('space') == true and getProperty('boyfriend.idleSuffix') ~= '-alt' then
        --characterPlayAnim('boyfriend', 'hey', false);
        --setProperty('boyfriend.specialAnim', true);
        --playSound('Hey!', 0.3);
   -- end 
   --alternate code, if you don't want the taunts to be spamable, taken from the uberkids psych port from NateTDOM