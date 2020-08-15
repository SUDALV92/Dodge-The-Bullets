/// @description code
repeat(spawnNumber)
{
	bullet = instance_create_layer(-100,-100,"Bullets",objAlgBullet);
	bullet.sprite_index = sprite;
	bullet.color = color;
	bullet.mode = mode;
	instance_set_scale(bullet,scale);
	
	switch(mode)
	{
		case 3:
			bullet.image_alpha = 0;
			instance_change_alpha(bullet,1,20);
			break;
		case 4:
			killer_set_active(bullet,false);
			bullet.image_alpha = 0;			
			bullet.data[0] = 1;
			instance_change_alpha(bullet,1,50);
			alarm[0] = 50;
			break;
		case 5:
			bullet.image_alpha = 0;
			instance_change_alpha(bullet,1,10);
			break;
		case 8:
			bullet.t = irandom(99);
			bullet.data[0] = 0; //звезда
			break;
	}
	
	ds_list_add(bullets,bullet);
}
switch(mode)
{
	case 11:
		data[0] = 14; //radius speed
		break;
}