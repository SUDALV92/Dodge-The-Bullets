/// @description  button_check_pressed( keyIndex )
/// @param  keyIndex 
function button_check_pressed(argument0) {
	var keyCode = global.InpuKeyCodes[argument0];
	return keyboard_check_pressed( keyCode );

	var value = keyboard_check_pressed(keyCode);
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
	    external_call(global.TASWriteValue,room,objTAS.state,1,keyCode,objTAS.timer);
	    }
	    return value;
	}
	else
	{
	    return external_call(global.TASReadValue,room,objTAS.state,1,keyCode,objTAS.timer);
	}




}
