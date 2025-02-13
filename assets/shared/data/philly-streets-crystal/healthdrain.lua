function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.15 and difficultyName == 'Hard' then
        setProperty('health', health - 0.017);
	end
	if getProperty('health') > 0.15 and difficultyName == 'soft' then
        setProperty('health', health - 0.004);
    end
end