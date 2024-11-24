import states.MainMenuState;	// Some values in the state are static, and require the state class to be imported in order to be accessed

var state = FlxG.state;		// This variable can be called whatever you want, but it's equivalent to the "game" variable in normal hscript

function onCreate()			// Called when the script is initially loaded
{
}

function onDestroy()		// Called right before the state is destroyed
{
}

function onUpdate(elapsed)	// Called on every game update, with "elapsed" being the time since the last one
{
}

function onUpdatePost(elapsed)	// Called on every game update, after the game's internal update function is ran
{
}

function onBeatHit()		// Called on every beat of the song
{
}

function onStepHit()		// Called on every step of the song
{
}

function onChangeItem()		// Called when a menu item is selected
{
}

function onAccept()			// Called when a menu item is chosen. Return Function_Stop to prevent an item from being chosen
{
}