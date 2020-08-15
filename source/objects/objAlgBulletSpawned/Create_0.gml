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
		y = y + irandom_range(-150,150);
		sprite_index = sprAlgKunaiColored;
		if(x < 600)
			direction = irandom_range(-5,5);
		else
			direction = irandom_range(175,185);
			
		color = scrDTBGetRandomColor();
		image_angle = direction;
		data[0] = Spawner.data[0];
		switch(data[0])
		{
			case 0:
				speed = 8;
				break;
			case 1:
				speed = Spawner.targetSpeed;
				gravity_direction = direction;
				gravity = 0.1;
				Spawner.targetSpeed += 0.3;
				break;
		}		
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
		sprite_index = sprAlgWaveColored;
		color = scrDTBGetRandomColor();
		image_alpha = 0;
		instance_change_alpha( id, 1, 30 );
		direction = irandom_range( 60, 120 );
		speed = random_range( 8, 12 );
		gravity = 0.1;		
		break;
}