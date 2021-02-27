/// @description code
var mode8Alarm = 20;
repeat(spawnNumber)
{
	bullet = instance_create_layer(-100,-100,"Bullets",objAlgBullet);
	bullet.sprite_index = sprite;
	bullet.color = color;
	bullet.mode = mode;
	instance_set_scale(bullet,scale);
	
	switch(mode)
	{
		case 0:
			bullet.trail = true;
			bullet.trailInterval = 10;
			break;
		case 3:
			bullet.image_alpha = 0;
			trailEntity = trail_attach(bullet,10);
			trailEntity.image_blend = color;
			instance_change_alpha(bullet,1,20);
			break;
		case 4:
			killer_set_active(bullet,false);
			bullet.image_alpha = 0;			
			bullet.data[0] = 1;
			instance_change_alpha(bullet,1,100);
			alarm[0] = 100;
			break;
		case 5:
			bullet.image_alpha = 0;
			instance_change_alpha(bullet,1,10);
			break;
		case 8:
			bullet.t = irandom(99);
			bullet.data[0] = 0; //звезда
			bulletTail = trail_attach( bullet, 5 );
			bulletTail.image_blend = bullet.color;
			bulletTail.TailAlpha = 0.5;
			bulletTail.TailScale = 1;
			//bullet.trail = true;
			//bullet.trailInterval = 10;
			if(mode8Alarm < 600)
			{
				bullet.alarm[0] = mode8Alarm;			
				mode8Alarm += 40;
			}
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