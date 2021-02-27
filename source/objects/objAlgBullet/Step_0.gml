if(outsideDelete)
{
	instance_inbounds_check();	
}
if(!instance_exists(oPlayer)) exit;

direction += curving;

if(trail)
{
	if(t mod trailInterval == 0)
	{
		switch(trailMode)
		{
			case 1:			
				trailBullet = instance_create_depth(x,y,depth,objAlgBullet);
				trailBullet.sprite_index = sprite_index;
				trailBullet.alarm[1] = 50; //outsideDelete
				instance_set_scale(trailBullet,image_xscale);
				trailBullet.color = color;
				killer_set_active(trailBullet,false);
				instance_fade_out(trailBullet,30);
				break;
			case 2:
				repeat(2)
				{
					trailBullet = instance_create_depth(x,y,depth,objAlgBullet);
					trailBullet.sprite_index = sprAlgSphereColored;
					trailBullet.alarm[1] = 50; //outsideDelete
					trailBullet.direction = direction + 180 + irandom_range(-30,30);
					trailBullet.speed = speed/2;
					instance_set_scale(trailBullet,image_xscale*0.6);
					trailBullet.color = color;
					killer_set_active(trailBullet,false);
					instance_fade_out(trailBullet,10);	
				}
				break;
		}
	}
}

switch(mode)
{
	case 0:
		image_angle = direction;
		break;
	case 0.1:
		image_angle = direction;
		if(t > 20)
			outsideDelete = true;
		break;
	case 1:
		image_angle = direction;
		break;
	case 2:
		switch(data[0])
		{
			case 0:
				
				break;
			case 1: //атакующая пулька		
				if(speed > 9)
				{
					speed = 9;	
				}
				break;
		}
		break;
	case 8:
		image_angle -= 5;
		if(t % 150 == 0 && data[0] == 0)
		{
			bullet = instance_create_depth(x,y,depth - 1,objAlgBullet);
			bullet.sprite_index = sprAlgFrag;
			bullet.direction = random(360);
			bullet.speed = random_range(5,6);
			bullet.image_alpha = 0;
			bullet.color = color;
			bullet.image_angle = bullet.direction;
			bullet.data[0] = 1; //маленькие пульки
			bullet.outsideDelete = true;
			instance_set_scale(bullet,0.7);
			instance_change_alpha(bullet,1,20);
		}
		break;
	case 10:
		x = xstart + lengthdir_x(data[0],data[1]);
		y = ystart + lengthdir_y(abs(dcos(data[1])*data[0])/2,data[1]);
		data[1] += 4;
		
		if(t % 6 == 0)
		{
			bullet = instance_create_layer( x, y, "Bullets", objAlgBullet );
			bullet.sprite_index = sprite_index;
			bullet.mode = 10.1;
			bullet.color = color;
			instance_set_scale( bullet, 3 );
		}
		if(t == 380)
		{
			instance_destroy();
		}
		break;
	case 10.1:
		if(t == 50)
		{
			angle = random(360);
			repeat(5)
			{
				bullet = instance_create_layer( x, y, "Bullets", objAlgBullet );
				bullet.sprite_index = sprite_index;
				bullet.direction = angle;
				angle += 360/5;
				bullet.speed = 8;
				bullet.color = color;
				bullet.outsideDelete = true;
				instance_set_scale( bullet, 5 );
				instance_scale( bullet, 2, 20 );
			}
			instance_destroy();
		}
		break;
}

t++;