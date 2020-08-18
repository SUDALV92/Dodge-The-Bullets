/// @description  get_game_flag( flagNameStr )
/// @param  flagNameStr 
function get_game_flag(argument0) {
	// Return a named flag from the save file. False is returned if the flag is not in the save.

	var flagValue = get_game_value( argument0 );
	if( is_undefined( flagValue ) ) {
	    return false;
	}
	return flagValue;



}
