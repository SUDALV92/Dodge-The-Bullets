/// @description code
if(!instance_exists(oPlayer)) exit;

switch(mode)
{
	case 2:
		if(!active) break;
		
		if(data[0] == 0) //горизонтальный спавнер
		{
			bullet = instance_create_depth(x,y,depth-1,objAlgBullet);
			bullet.sprite_index = sprite_index;
			bullet.image_alpha = 0;
			instance_change_alpha(bullet,1,10);
			bullet.speed = 3;
			bullet.gravity = 0.3;
			bullet.direction = 270;
			bullet.mode = 2;
			bullet.data[0] = 1;
			bullet.color = color;
			bullet.blend = true;
			bullet.outsideDelete = true;
			instance_set_scale(bullet,1.5);
			
			if(bullet.x <= 600)
			{
				bullet.curving = 1.8;				
			}
			else
			{
				bullet.curving = -1.8;
			}
			scrDTBTrailAttach(bullet,5,color);
			if(t < 390)
				alarm[0] = irandom_range(7,12);
			else
				alarm[0] = irandom_range(12,16);
		}
		if(data[0] == 2) //вертикальный спавнер
		{
			bullet = instance_create_depth(x,y,depth-1,objAlgBullet);
			bullet.sprite_index = sprite_index;
			bullet.image_alpha = 0;
			instance_change_alpha(bullet,1,10);
			bullet.speed = random_range(10,12);
			bullet.direction = 50;
			bullet.gravity = 0.1;		
			bullet.color = color;
			bullet.blend = true;
			bullet.mode = 2;
			bullet.data[0] = 1;
			bullet.outsideDelete = true;
			instance_set_scale(bullet,1.5);
			scrDTBTrailAttach(bullet,5,color);
			
			bullet = instance_create_depth(x,y,depth-1,objAlgBullet);
			bullet.sprite_index = sprite_index;
			bullet.image_alpha = 0;
			instance_change_alpha(bullet,1,10);
			bullet.speed = random_range(10,12);
			bullet.direction = 130;
			bullet.gravity = 0.1;			
			bullet.mode = 2;
			bullet.color = color;
			bullet.blend = true;
			bullet.data[0] = 1;
			bullet.outsideDelete = true;
			instance_set_scale(bullet,1.5);
			scrDTBTrailAttach(bullet,5,color);
			alarm[0] = irandom_range(20,25);
		}
		break;
}