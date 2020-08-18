/// @description code
if(instance_exists(oPlayer))
{
	deadPlayer.sprite_index = oPlayer.sprite_index;
	deadPlayer.image_xscale = oPlayer.Dir;
	deadPlayer.image_index = oPlayer.image_index;
	deadPlayer.x = oPlayer.x;
	deadPlayer.y = oPlayer.y;
}