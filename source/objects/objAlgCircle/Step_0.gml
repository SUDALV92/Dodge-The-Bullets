/// @description code
if(!instance_exists(oPlayer)) exit;

currentAngle = angle;
if(hold)
{
	for(var i = 0; i < spawnNumber; i++)
	{
		if(!instance_exists(bullets[| i])) continue;
	
		bullets[| i].x = x + lengthdir_x(radius,currentAngle);
		bullets[| i].y = y + lengthdir_y(radius,currentAngle);
	
		switch(mode)
		{
			case 4:
				if(radius <= 30)
				{
					if(bullets[| i].image_alpha != 0)
					{
						instance_change_alpha(bullets[| i], 0, 0);
						killer_set_active(bullets[| i], false);
					}		
				}
				else if(data[0] == 1)
				{
					if(bullets[| i].image_alpha != 1)
					{
						instance_change_alpha(bullets[| i], 1, 0);
						killer_set_active(bullets[| i], true);
					}	
				}
				break;
			case 5:
				bullets[| i].image_angle = currentAngle;
				bullets[| i].direction = currentAngle;
				break;
			case 11:
				bullets[| i].direction = currentAngle;
				if(data[1] == 0)
					bullets[| i].image_angle = currentAngle;
				else if(data[1] == 1)
					bullets[| i].image_angle = currentAngle+90;

				var loopStart = radius - 600;
				if(loopStart < 10)
					loopStart = 10;
				for(var j = loopStart; j < radius - 40; j += 40)
				{
					spawnX = x + lengthdir_x( j, currentAngle );
					spawnY = y + lengthdir_y( j, currentAngle );
					trailBullet = instance_create_layer( spawnX, spawnY, "Bullets", objAlgBullet );
					trailBullet.sprite_index = sprite;
					instance_set_scale( trailBullet, scale);
					trailBullet.image_angle = currentAngle;
					trailBullet.mode = 11;
					trailBullet.color = color;
					trailBullet.data[0] = 1;
				}
				break;
		}
	
		currentAngle += 360 / spawnNumber;
	}
}
switch(mode)
{
	case 3:
		if(x < 600)
		{
			angle -= 0.5;	
		}
		else
		{
			angle += 0.5;
		}
		radius += data[0];
		data[0] += 0.25;
		break;
	case 4:
		if(x < 600)
		{
			angle -= 0.5;
		}
		else
		{
			angle += 0.5;
		}
		break;
	case 5:
		switch(data[0])
		{
			case 0:
				radius += 8;
				break;
			case 2:
				hold = false;
				with(objAlgBullet)
				{	
					speed = 6;
					outsideDelete = true;
				}
				instance_destroy();
				break;
			case 3:
				hold = false;
				with(objAlgBullet)
				{
					direction = point_direction(x,y,oPlayer.x,oPlayer.y);	
					speed = 10;
					outsideDelete = true;
				}
				instance_destroy();
				break;
		}
		break;
	case 8:
		angle += data[0];
		radius -= data[1];
		break;
	case 11:		
		if(t >= 0 && t < 25)
		{
			radius = tween_sine_inout( 0, 400, t, 25 );
		}
		if(t >= 25 && t < 50)
		{
			radius = tween_sine_inout( 400, -250, t - 25, 25 );
		}
		if(t >= 50 && t < 100)
		{
			angle += 360/50;	
			data[1] = 1;
		}
		if(t >= 100)
		{
			data[1] = 0;
			radius += data[0];
			if(data[0] > 0.5)
				data[0] -= 0.06;
		}
		break;
}
t++;