if(outsideDelete)
{
	instance_inbounds_check();	
}
if(!instance_exists(oPlayer)) exit;
direction += curving;

switch(mode)
{
	case 0:
		image_angle = direction;
		break;
	case 1:
		if(instance_exists(Spawner))
		{
			data[1] = Spawner.data[1];	
		}
		image_angle += data[1];
		if(t > 100)
		{
			outsideDelete = true;	
		}
		
		if(data[1] > 1)
		{
			if(t % (14 - floor(data[1])) == 0)
			{
				repeat(1)
				{
					bullet = instance_create_depth(x,y,depth-1,objAlgBullet);
					bullet.image_alpha = 0;
					instance_change_alpha(bullet,1,10);
					bullet.direction = random(360);
					bullet.speed = data[1];
					bullet.sprite_index = sprAlgKunaiColored;
					bullet.color = color;
					bullet.mode = 1;
					bullet.outsideDelete = true;
					instance_set_scale(bullet,2);
					scrDTBTrailAttach(bullet,7,color);
				}
			}
		}
		break;
	case 6:
		tt = (tt + 1) mod 360;
		shift = amplitude * dsin(tt);
		
		yy -= 5;
		
		x = xx + lengthdir_x(shift,direction + 90 * data[0]);
		y = yy + lengthdir_y(shift,direction + 90 * data[0]);		
		break;
	case 7:
		image_angle += 5;
		if(t % 15 == 0)
		{
			bullet = instance_create_depth(x,y,depth - 1,objAlgBullet);
			bullet.sprite_index = sprAlgFrag;
			bullet.direction = random(360);
			bullet.speed = random_range(1,3);
			bullet.image_alpha = 0;
			bullet.color = color;
			bullet.image_angle = bullet.direction;
			bullet.outsideDelete = true;
			instance_set_scale(bullet,0.7);
			instance_change_alpha(bullet,1,20);
		}
		break;
	case 9:
		if(data[1])
		{
			move_towards_point(oPlayer.x,oPlayer.y,2);
		}
		break;
	case 11:
		if(t > 50)
		{
			outsideDelete = true;	
		}
		image_angle = direction;
		break;
}

t++;