image_speed = 0;
mode = 0;
outsideDelete = false;
instance_set_scale(id,1.5);
curving = 0;
t = 0;
data[1] = 0;
color = -1;
smoothing = true;

mode = Spawner.mode;

switch(mode)
{
	case 0:
		data[0] = Spawner.data[0];
		instance_set_scale(id,0.8);
		color = scrDTBGetRandomColor();
		switch(data[0])
		{
			case 0: //left
				direction = irandom_range(280,350);
				speed = Spawner.targetSpeed;
				sprite_index = sprAlgKnife;
				break;
			case 1: //right
				direction = irandom_range(190,260);
				speed = Spawner.targetSpeed;
				sprite_index = sprAlgKnife;
				break;
		}
		break;
	case 1:
		data[0] = Spawner.data[0];
		sprite_index = sprAlgStar;
		color = scrDTBGetRandomColor();
		instance_set_scale(id,2);
		switch(data[0])
		{
			case -1:
				x = -50;
				direction = irandom_range(10,25);
				Spawner.data[0] = 1;
				break;
			case 1:
				x = 1250;
				direction = irandom_range(155,170);
				Spawner.data[0] = -1;
				break;			
		}
		speed = 6;	
		break;
	case 3:
		data[0] = Spawner.data[0];
		y = y + irandom_range(-150,150);
		sprite_index = sprAlgKunaiColored;
		if(x < 600)
			direction = irandom_range(3,8) * Spawner.data[1];		
		else
			direction = irandom_range(3,8) * Spawner.data[1] + 180;
			
		Spawner.data[1] *= -1;
			
		color = scrDTBGetRandomColor();
		image_angle = direction;
		
		switch(data[0])
		{
			case 0:
				speed = 5;
				break;
			case 1:
				speed = Spawner.targetSpeed;
				gravity_direction = direction;
				gravity = 0.1;
				Spawner.targetSpeed += 0.2;
				break;
		}		
		break;
	case 5:
		sprite_index = sprAlgSphereColored;
		//instance_set_scale( id, 2 );
		color = scrDTBGetRandomColor();
		break;
	case 6:
		xx = irandom_range(0,1200);
		sprite_index = sprAlgSphereColored;
		image_angle = 90;
		yy = y;
		tt = 0;
		amplitude = 300;
		data[0] = choose(-1,1);
		direction = 90;
		color = scrDTBGetRandomColor();
		break;
	case 7:
		data[0] = Spawner.data[0];
		sprite_index = sprAlgStar;
		color = scrDTBGetRandomColor();
		speed = 4;
		switch(data[0])
		{
			case 0:
				direction = 0;
				break;
			case 1:
				direction = 270;
				break;
			case 2:
				direction = 180;
				break;
			case 3:
				direction = 90;
				break;
		}
		break;
	case 9:
		data[0] = Spawner.data[0];
		sprite_index = sprAlgSphereColored;
		color = scrDTBGetRandomColor();
		speed = 25;
		switch(data[0])
		{
			case 0: direction = 0; y = irandom_range(0,912); break;
			case 1: direction = 270; x = irandom_range(0,1200); break;
			case 2: direction = 180; y = irandom_range(0,912); break;
			case 3: direction = 90; x = irandom_range(0,1200); break;
		}
		break;
	case 11:
		data[0] = Spawner.data[0];		
		sprite_index = sprAlgWaveColored;
		color = scrDTBGetRandomColor();
		image_alpha = 0;
		instance_change_alpha( id, 1, 30 );
		switch(data[0])
		{
			case 0:
				direction = irandom_range( 60, 120 );
				speed = random_range( 8, 12 );
				break;
			case 1:
				if(Spawner.direction < 90)
				{
					direction = irandom_range( 40, 60 );	
				}
				else
				{
					direction = irandom_range( 120, 140 );	
				}
				speed = random_range( 15, 20 );
				break;
		}
		gravity = 0.1;		
		break;
}