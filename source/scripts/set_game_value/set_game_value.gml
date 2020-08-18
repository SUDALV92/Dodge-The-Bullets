/// @description  set_game_value( valueNameStr, value )
/// @param  valueNameStr
/// @param  value 
function set_game_value(argument0, argument1) {
	// Set a named value that is saved in the save file.

	ds_map_replace( oWorld.SaveData, argument0, argument1 );



}
