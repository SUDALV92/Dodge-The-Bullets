/// @description  button_check( keyCode )
/// @param  keyCode 
function button_check(argument0) {
	var keyCode = global.InpuKeyCodes[argument0];
	return keyboard_check( keyCode );

	var value = keyboard_check(keyCode);
	if(!instance_exists(objTAS))
		return value;

	if(!objTAS.gameStarted)
	    return value;
     
	switch(keyCode)
	{
	    case vk_left:
	    case vk_right:
	    case vk_up:
	    case vk_down:
	    case vk_shift:
	    case ord("Z"):
	    case ord("Q"):
	    case ord("R"):
	    break;
	    default: return value;
	}
     
	if(objTAS.rec)
	{
	    if(value)
	    {
	    external_call(global.TASWriteValue,room,objTAS.state,0,keyCode,objTAS.timer);
	    }
	    return value;
	}
	else
	{
	    return external_call(global.TASReadValue,room,objTAS.state,0,keyCode,objTAS.timer);
	}


}
