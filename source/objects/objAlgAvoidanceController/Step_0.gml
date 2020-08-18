if(!instance_exists(oPlayer)) exit;

#region PRACTICE
/*if(keyboard_check_pressed(ord("1")))
{
	avoidance_set_step(attacks[| 0]);	
}
if(keyboard_check_pressed(ord("2")))
{
	avoidance_set_step(attacks[| 1]);	
}
if(keyboard_check_pressed(ord("3")))
{
	avoidance_set_step(attacks[| 2]);	
}
if(keyboard_check_pressed(ord("4")))
{
	avoidance_set_step(attacks[| 3]);	
}
if(keyboard_check_pressed(ord("5")))
{
	avoidance_set_step(attacks[| 4]);	
}
if(keyboard_check_pressed(ord("6")))
{
	avoidance_set_step(attacks[| 5]);	
}
if(keyboard_check_pressed(ord("7")))
{
	avoidance_set_step(attacks[| 7]);
	platform = instance_create_layer(240,500,"BeyondPlayer",objAlgPlatform);
	instance_scale_x(platform,15,0);
	oPlayer.y = 450;
	instance_destroy(objAlgBlock);
}
if(keyboard_check_pressed(ord("8")))
{
	avoidance_set_step(attacks[| 8]);
	platform = instance_create_layer(240,500,"BeyondPlayer",objAlgPlatform);
	instance_scale_x(platform,15,0);
	oPlayer.y = 450;
	instance_destroy(objAlgBlock);
}
if(keyboard_check_pressed(ord("9")))
{
	avoidance_set_step(attacks[| 9]);
	oPlayer.y = 450;
	instance_destroy(objAlgBlock);
	room_set_infinite_jump(true);
}*/
#endregion
var t = Avoidance.Step;
#region 0. INTRO
current = attacks[| 0];
next = attacks[| 1];

if(t == current)
{
	instance_create_layer(0,0,"Controller",objAlgDeathController);
	with(objAlgBlock)
	{
		color = make_color_rgb(53,22,0);
	}
	platform = instance_create_layer(432,720,"Bullets",objAlgPlatform);
	platform.image_xscale = 7;
	platform.image_yscale = 0;
	platform.color = make_color_rgb(181,69,0);
	instance_scale_y(platform,1,50);	
	scrDTBAttack0();
}
if(t == current + 100)
{
	circle = instance_create_layer(600,456,"Bullets",objAlgCircle);
	circle.radius = 640;
	circle.spawnNumber = 50;
	circle.angle = random(360);
	circle.sprite = sprAlgSphereGrad;
	circle.color = c_ltgray;
	with(circle) event_user(0);
	
	platform = instance_create_layer(432,624,"Bullets",objAlgPlatform);
	platform.image_xscale = 7;
	platform.image_yscale = 0;
	platform.color = make_color_rgb(181,69,0);
	instance_scale_y(platform,1,50);	
	scrDTBAttack0();
}
if(t >= current + 100 && t < current + 200)
{
	circle.radius -= 3;	
}
if(t == current + 200)
{
	platform = instance_create_layer(432,528,"Bullets",objAlgPlatform);
	platform.image_xscale = 7;
	platform.image_yscale = 0;
	platform.color = make_color_rgb(181,69,0);
	instance_scale_y(platform,1,50);
	
	scrDTBAttack0();
}
if(t == current + 320)
{
	instance_destroy(circle);
	with(objAlgBullet)
	{
		if(mode == 0)
		{
			gravity = 0.1;
			direction = irandom_range(70,110);
			speed = random_range(5,8);
			outsideDelete = true;
		}
	}
}
if(t == current + 420)
{
	spawner = spawner_create_layer(-100,-100,"Bullets",8,objAlgBulletSpawned,280);
	spawner.mode = 0;
	spawner.data[0] = 0;
	spawner.targetSpeed = 5;
	
	spawner = spawner_create_layer(1300,-100,"Bullets",8,objAlgBulletSpawned,280);
	spawner.mode = 0;
	spawner.data[0] = 1;
	spawner.targetSpeed = 5;
	
	with(objAlgPlatform)
	{
		instance_scale_y(id,0,20);
		instance_fade_out(id,40);
	}	
}
if(t >= current + 420 && t < next)
{
	whiteAlpha += 0.003;	
}
if(t == current + 550)
{
	colorChanger = instance_create_layer(0,0,"Bullets",objAlgBlockColorChanger);
	colorChanger.bgColor = make_color_rgb(12,211,201);
	colorChanger.blockColor = make_color_rgb(9,38,51);
	colorChanger.duration = 330;	
}
if(t > current + 550 && t < current + 700)
{
	with(oFixedSpawner)
	{
		targetSpeed += 0.1;	
	}	
}
if(t == next - 50)
{
	with(objAlgBulletSpawned)
	{
		killer_set_active(id,false);
	}
}
if(t == next - 1)
{
	with(objAlgBullet)
	{
		outsideDelete = true;	
	}	
}
#endregion
#region 1. STARS
current = attacks[| 1];
next = attacks[| 2];

if(t == current)
{
	instance_destroy(objAlgBulletSpawned);
	instance_destroy(objAlgBackground);
	
	spawner = spawner_create_layer(-100,456,"Bullets",80,objAlgBulletSpawned,750);
	spawner.mode = 1;
	spawner.data[0] = choose(-1,1);
	spawner.data[1] = 5;
}
if(t >= current && t < current + 30)
{
	whiteAlpha -= 0.032;
}
if(t == current + 30)
{
	whiteAlpha = 0;	
}
if(t == current + 200)
{
	spawner.data[1] = 6;
}
if(t == current + 400)
{
	spawner.data[1] = 7;
}
if(t == current + 500)
{
	spawner.data[1] = 8;
}
if(t == current + 600)
{
	spawner.data[1] = 9;
}
if(t == current + 790)
{
	with(objAlgBulletSpawned)
	{
		data[1] = 0.5;
		speed = 0.5;
		instance_fade_out(id,80);
	}
	with(objAlgBullet)
	{
		speed = 0.5;
		instance_fade_out(id,80);
		killer_set_active(id,false);
	}
}
#endregion
#region 2. BIG SPHERES
current = attacks[| 2];
next = attacks[| 3];
if(t == current)
{
	colors = scrDTBGetRandomColors(3);
	bullet = instance_create_layer(50,250,"Bullets",objAlgBullet);
	bullet.sprite_index = sprAlgFullCircle;
	instance_set_scale(bullet,5);
	bullet.image_alpha = 0;
	instance_change_alpha(bullet,1,10);
	bullet.mode = 2;
	bullet.data[0] = 0;
	bullet.smoothing = true;
	bullet.color = colors[| 0];
	bullet.blend = true;
	bullet.alarm[0] = irandom_range(5,10);
	executor_create(30,scrDTBAttack2Horizontal,780);	
}
if(t == current + 390)
{
	bullet = instance_create_layer(90,50,"Bullets",objAlgBullet);
	bullet.sprite_index = sprAlgFullCircle;
	instance_set_scale(bullet,5);
	bullet.image_alpha = 0;
	instance_change_alpha(bullet,1,75);
	killer_set_active(bullet,false);
	bullet.mode = 2;
	bullet.data[0] = 2;
	bullet.color = colors[| 1];
	bullet.blend = true;
	bullet.smoothing = true;
	bullet.alarm[0] = irandom_range(5,10);
	
	bullet = instance_create_layer(1110,50,"Bullets",objAlgBullet);
	bullet.sprite_index = sprAlgFullCircle;
	instance_set_scale(bullet,5);
	bullet.image_alpha = 0;
	instance_change_alpha(bullet,1,75);
	killer_set_active(bullet,false);
	bullet.mode = 2;
	bullet.data[0] = 2;
	bullet.color = colors[| 2];
	bullet.blend = true;
	bullet.smoothing = true;
	bullet.alarm[0] = irandom_range(5,10);
	
	executor_create(30,scrDTBAttack2Vertical,325);
}
if(t == current + 390+75)
{
	with(objAlgBullet)
	{
		if(mode == 2)
		{
			if(data[0] == 2)
			{
				killer_set_active(id,true);
			}
		}
	}
}
if(t == next - 1)
{
	with(objAlgBullet)
	{
		if(data[0] == 0 || data[0] == 2)
		{
			active = false;
			killer_set_active(id,false);
			instance_fade_out(id,20);
		}
		else
		{
			direction = point_direction(oPlayer.x,oPlayer.y,x,y);
			speed = 25;
			gravity = 0;
			curving = 0;
		}
	}
}
#endregion
#region 3. HORIZONTAL ARROWS
current = attacks[| 3];
next = attacks[| 4];
if(t == current)
{
	spawnX = choose(-30,1230);
	spawnY = 150;
	repeat(3)
	{
		spawner = spawner_create_layer(spawnX,spawnY,"Bullets",8,objAlgBulletSpawned,390);
		spawner.mode = 3;
		spawner.data[0] = 0;
		spawner.data[1] = choose(-1,1);
		
		spawnY += 300;
	}
}
if(t == current + 390)
{
	with(objAlgBulletSpawned)
	{
		speed = 0;
		image_alpha = 0.5;
		killer_set_active(id,false);
	}
	circle = instance_create_layer(0,0,"Bullets",objAlgCircle);
	circle.sprite = sprAlgSphereColored;
	circle.spawnNumber = 30;
	circle.radius = 0;
	circle.angle = random(360);
	circle.mode = 3;
	circle.color = scrDTBGetRandomColor();
	circle.data[0] = 8; //start speed
	with(circle) event_user(0);
}
if(t == current + 490)
{
	circle = instance_create_layer(1200,0,"Bullets",objAlgCircle);
	circle.sprite = sprAlgSphereColored;
	circle.spawnNumber = 30;
	circle.radius = 0;
	circle.angle = random(360);
	circle.mode = 3;
	circle.color = scrDTBGetRandomColor();
	circle.data[0] = 8; //start speed
	with(circle) event_user(0);
}
if(t == current + 590)
{
	with(objAlgBulletSpawned)
	{
		speed = 8;
		gravity_direction = direction;
		gravity = 0.1;
		image_alpha = 1;
		killer_set_active(id,true);
	}
	spawnY = 150;
	repeat(3)
	{
		spawner = spawner_create_layer(spawnX,spawnY,"Bullets",12,objAlgBulletSpawned,200);
		spawner.mode = 3;
		spawner.data[0] = 1; //включить ускорение
		spawner.data[1] = choose(-1,1);
		spawner.targetSpeed = 8;
		spawnY += 300;
	}
}
if(t == next - 1)
{
	with(objAlgBulletSpawned)
	{
		killer_set_active(id,false);
		instance_fade_out(id,10);
	}
	instance_destroy(objAlgCircle);
	with(objAlgBullet)
	{
		instance_destroy();	
	}
}
#endregion
#region 4. CIRCLES
current = attacks[| 4];
next = attacks[| 5];

if(t == current)
{
	spawnX = choose(0,1200);
	radius = -600;
	repeat(20)
	{
		circle = instance_create_layer(spawnX,456,"Bullets",objAlgCircle);
		circle.radius = radius;
		circle.sprite = sprAlgSphereColored;
		circle.spawnNumber = 16;
		circle.angle = random(360);
		circle.mode = 4;
		circle.scale = 3;
		circle.color = scrDTBGetRandomColor();
		with(circle) event_user(0);
		
		radius += 200;
	}
	nextRadius = choose(-500,-400,400,500);
}
if(t >= current && t < current + 190 ||
   t >= current + 200 && t < current + 390 ||
   t >= current + 400 && t < current + 590 ||
   t >= current + 600 && t < current + 790
)
{
	with(objAlgCircle)
	{
		radius += other.nextRadius/190;
	}
}
if(t == current + 200 ||
   t == current + 400 ||
   t == current + 600)
{
	if(nextRadius < 0)
	{
		nextRadius = choose(400,500);	
	}
	else
	{
		nextRadius = choose(-400,-500);
	}
}
if(t == current + 390)
{
		angle = random(360);
		repeat(30)
		{
			bullet = instance_create_layer(1200-spawnX,456,"BehindPlayer",objAlgBullet);
			bullet.mode = 4;
			bullet.image_alpha = 0;
			instance_change_alpha(bullet,1,5);
			instance_scale(bullet,1.5,0);
			bullet.sprite_index = sprAlgKunaiColored;
			bullet.direction = angle;
			bullet.speed = 8;
			bullet.outsideDelete = true;
			bullet.color = scrDTBGetRandomColor();
			bullet.image_angle = angle;
			angle += 360/30;
		}
}
if(t == current + 580 ||
   t == current + 630 ||
   t == current + 680 ||
   t == current + 700 ||
   t == current + 720 ||
   t == current + 740)
{
	angle = random(360);
	repeat(20)
	{
		bullet = instance_create_layer(1200-spawnX,456,"BehindPlayer",objAlgBullet);
		bullet.mode = 4;
		bullet.image_alpha = 0;
		instance_change_alpha(bullet,1,5);
		instance_scale(bullet,1.5,0);
		bullet.sprite_index = sprAlgKunaiColored;
		bullet.direction = angle;
		bullet.speed = 8;
		bullet.color = scrDTBGetRandomColor();
		bullet.outsideDelete = true;
		bullet.image_angle = angle;
		angle += 360/20;
	}
}
if(t == next - 1)
{
	with(objAlgCircle)
	{
		instance_destroy();		
	}
	with(objAlgBullet)
	{
		if(mode == 4 && data[0] == 1)
		{
		 killer_set_active(id,false);
		 instance_fade_out(id,20);
		}
	}
}
#endregion
#region 5. PLATFORM
current = attacks[| 5];
next = attacks[| 6];

if(t == current)
{
	platform = instance_create_layer(240,864,"BeyondPlayer",objAlgPlatform);
	instance_scale_x(platform,15,0);
	platform.vspeed = -0.3;
	platform.color = make_color_rgb(39,71,64);
	
	spawnY = 220;
}
if(t == current + 90)
{
	with(objAlgBlock)
	{
		instance_fade_out(id,75);
	}
}
if(t == current + 90 ||
   t == current + 120 ||
   t == current + 150   
)
{	
	circle = instance_create_layer(220,spawnY,"Bullets",objAlgCircle);
	circle.mode = 5;
	circle.sprite = sprAlgBullet;
	circle.scale = 0.7;
	circle.spawnNumber = 14;
	circle.angle = random(360);
	circle.radius = 0;
	circle.color = scrDTBGetRandomColor();
	with(circle) event_user(0);
	
	circle = instance_create_layer(980,spawnY,"Bullets",objAlgCircle);
	circle.mode = 5;
	circle.sprite = sprAlgBullet;
	circle.scale = 0.7;
	circle.spawnNumber = 14;
	circle.angle = random(360);
	circle.radius = 0;
	circle.color = scrDTBGetRandomColor();
	with(circle) event_user(0);
	
	spawnY += 240;
}
if(t == current + 100 ||
   t == current + 130 ||
   t == current + 160 ||
   t == current + 310 ||
   t == current + 340 ||
   t == current + 370)
{
	with(objAlgCircle)
	{
		data[0] = 1;	
	}	
}
if(t == current + 200)
{
	with(objAlgCircle)
	{
		data[0] = 2;	
	}
	spawnY = 220;
}
if(t == current + 300 ||
   t == current + 330 ||
   t == current + 360)
{
	circle = instance_create_layer(220,spawnY,"Bullets",objAlgCircle);
	circle.mode = 5;
	circle.sprite = sprAlgBullet;
	circle.scale = 0.7;
	circle.spawnNumber = 30;
	circle.angle = random(360);
	circle.radius = 0;
	circle.color = scrDTBGetRandomColor();
	with(circle) event_user(0);
	
	circle = instance_create_layer(980,spawnY,"Bullets",objAlgCircle);
	circle.mode = 5;
	circle.sprite = sprAlgBullet;
	circle.scale = 0.7;
	circle.spawnNumber = 30;
	circle.angle = random(360);
	circle.radius = 0;
	circle.color = scrDTBGetRandomColor();
	with(circle) event_user(0);
	
	spawnY += 240;	
}
if(t == current + 400)
{
	with(objAlgCircle)
	{
		data[0] = 3;	
	}
}
if(t == current + 490)
{
	repeat(2)
	{
	 spawner = executor_create(30,scrDTBAttack5,270);
	 spawner.mode = 5;
	}
}
if(t == current + 760)
{
	with(objAlgBullet)
	{
		direction = point_direction(oPlayer.x,oPlayer.y,x,y);
		speed = 15;
	}
}
#endregion
#region 6. СИНУСОИДЫ
current = attacks[| 6];
next = attacks[| 7];

if(t == current)
{
	spawner = spawner_create_layer(0,950,"Bullets",5,objAlgBulletSpawned,360);
	spawner.mode = 6;
}
if(t == next - 1)
{
	with(objAlgPlatform)
	{
		vspeed = 0;	
	}
	with(objAlgBullet)
	{
		outsideDelete = true;	
	}
}
if(t == next - 25)
{
	bg = instance_create_layer(0,0,"InstanceBackground",objAlgBackground);
	bg.mode = 6;
	bg.image_alpha = 0;
	instance_set_scale(bg,1000);
}
#endregion
#region 7. SILENT
current = attacks[| 7];
next = attacks[| 8];

if(t == current)
{
	spawner1 = spawner_create_layer(-30,25,"Bullets",75,objAlgBulletSpawned,700);
	spawner1.mode = 7;
	spawner1.data[0] = 0;
	
	spawner2 = spawner_create_layer(1175,-30,"Bullets",75,objAlgBulletSpawned,700);
	spawner2.mode = 7;
	spawner2.data[0] = 1;
	
	spawner3 = spawner_create_layer(1230,912-25,"Bullets",75,objAlgBulletSpawned,700);
	spawner3.mode = 7;
	spawner3.data[0] = 2;
	
	spawner4 = spawner_create_layer(25,942,"Bullets",75,objAlgBulletSpawned,700);
	spawner4.mode = 7;
	spawner4.data[0] = 3;
}
if(t == next - 1)
{
	with(oAvoidanceKiller)
	{
		direction = point_direction(oPlayer.x,oPlayer.y,x,y);
		speed = 25;
		outsideDelete = true;
	}
}

#endregion
#region 8. STAR CIRCLE
current = attacks[| 8];
next = attacks[| 9];

if(t == current)
{
	circle = instance_create_layer(600,450,"Bullets",objAlgCircle);
	circle.mode = 8;
	circle.radius = 630;
	circle.angle = random(360);
	circle.sprite = sprAlgStar;
	circle.scale = 1.5;
	circle.color = scrDTBGetRandomColor();
	circle.spawnNumber = 30;
	circle.data[0] = 0.5; //скорость поворота
	circle.data[1] = 0.5; //скорость изменения радиуса
	with(circle) event_user(0);
}
if(t == current + 390)
{
	with(circle)
	{
		data[0] = -1;	
	}
}
if(t == current + 490)
{
	with(circle)
	{
		data[0] = 2;	
	}
}
if(t == current + 590)
{
	with(circle)
	{
		data[0] = -3;	
	}
}
if(t == current + 700)
{
	with(objAlgBullet)
	{
		data[0] = 2;	
	}
}
if(t == current + 750)
{
	with(circle)
	{
		data[1] = 6.5;
	}
	with(objAlgPlatform)
	{
		instance_fade_out(id,40);
	}
	with(objAlgBackground)
	{
		mode = 8;
	}
}
if(t == current + 779)
{	
	with(circle)
	{
		hold = false;
		for(var i = 0; i < spawnNumber; i++)
		{
			if(!instance_exists(bullets[| i])) continue;
			
			bullets[| i].direction = point_direction(oPlayer.x,oPlayer.y,bullets[| i].x,bullets[| i].y);
			bullets[| i].speed = 25;
			bullets[| i].outsideDelete = true;
		}
		instance_destroy();
	}
	room_set_infinite_jump(true);
}

#endregion
#region 9. INF JUMP
current = attacks[| 9];
next = attacks[| 10];

if(t == current)
{
	targetScale = 0.6;
	targetSpeed = 2;
	scrDTBAttack9(50,250,targetScale,targetSpeed);
}
if(t == current + 15)
{
	scrDTBAttack9(1150,700,targetScale,targetSpeed);
}
if(t == current + 40)
{	
	scrDTBAttack9(50,456,targetScale,targetSpeed);
}
if(t == current + 55)
{
	scrDTBAttack9(1150,456,targetScale,targetSpeed);
}
if(t == current + 80)
{
	scrDTBAttack9(50,700,targetScale,targetSpeed);
}
if(t == current + 95)
{
	scrDTBAttack9(1150,250,targetScale,targetSpeed);
}
if(t == current + 120)
{
	for(var i = 0; i <= 1200; i += 32)
	{
		bullet = instance_create_layer(i,942,"Bullets",objAlgBullet);
		bullet.sprite_index = sprAlgSphereColored;
		bullet.color = scrDTBGetRandomColor();
		bullet.trail = true;
		instance_set_scale(bullet,2);
		instance_move_to_y(bullet,510,40);
		
		bullet = instance_create_layer(i,-30,"Bullets",objAlgBullet);
		bullet.sprite_index = sprAlgSphereColored;
		bullet.color = scrDTBGetRandomColor();
		bullet.trail = true;
		instance_set_scale(bullet,2);
		instance_move_to_y(bullet,402,40);
	}
}
if(t == current + 160)
{
	with(objAlgBullet)
	{
		outsideDelete = true;
		if(y < 456) //верхняя стена
			instance_move_to_y(id,-30,40);
		else
			instance_move_to_y(id,942,40);
	}
}
if(t == current + 190)
{
	scrDTBAttack9(300,50,targetScale,targetSpeed);
}
if(t == current + 205)
{
	scrDTBAttack9(900,862,targetScale,targetSpeed);	
}
if(t == current + 230)
{
	scrDTBAttack9(600,50,targetScale,targetSpeed);
}
if(t == current + 245)
{
	scrDTBAttack9(600,862,targetScale,targetSpeed);	
}
if(t == current + 280)
{
	scrDTBAttack9(900,50,targetScale,targetSpeed);	
}
if(t == current + 295)
{
	scrDTBAttack9(300,862,targetScale,targetSpeed);	
}
if(t == current + 330)
{
	for(var i = 0; i <= 912; i += 32)
	{
		bullet = instance_create_layer(-30,i,"Bullets",objAlgBullet);
		bullet.sprite_index = sprAlgSphereColored;
		bullet.trail = true;
		instance_set_scale(bullet,2);
		instance_move_to_x(bullet,550,40);
		
		bullet = instance_create_layer(1230,i,"Bullets",objAlgBullet);
		bullet.sprite_index = sprAlgSphereColored;
		bullet.trail = true;
		instance_set_scale(bullet,2);
		instance_move_to_x(bullet,650,40);
	}
}
if(t == current + 370)
{
	with(objAlgBullet)
	{
		outsideDelete = true;
		if(x < 600) //верхняя стена
			instance_move_to_x(id,-30,40);
		else
			instance_move_to_x(id,1230,40);
	}
}
if(t == current + 380)
{
	instance_destroy(oMoveXCommand);
	with(objAlgBullet)
	{
		direction = random(360);
		speed = random_range(1,2.5);
		trail = false;
	}
}
if(t == next - 10)
{
	with(objAlgBullet)
	{
		instance_fade_out(id,40);
		killer_set_active(id,false);
	}
	block = instance_create_layer(0,0,"BehindPlayer",objAlgBlockCorner);
	block.image_alpha = 0;
	instance_change_alpha(block,1,30);
	
	block = instance_create_layer(1200-48,0,"BehindPlayer",objAlgBlockCorner);
	block.image_alpha = 0;
	instance_change_alpha(block,1,30);
	
	block = instance_create_layer(0,912-48,"BehindPlayer",objAlgBlockCorner);
	block.image_alpha = 0;
	instance_change_alpha(block,1,30);
	
	block = instance_create_layer(1200-48,912-48,"BehindPlayer",objAlgBlockCorner);
	block.image_alpha = 0;
	instance_change_alpha(block,1,30);
	
	for(var i = 48; i < 1200-48; i += 48)
	{
		block = instance_create_layer(i,0,"BehindPlayer",objAlgBlockHorizontal);
		block.image_alpha = 0;
		instance_change_alpha(block,1,30);	
				
		block = instance_create_layer(i,912-48,"BehindPlayer",objAlgBlockHorizontal);
		block.image_alpha = 0;
		instance_change_alpha(block,1,30);
	}
	
	for(var i = 48; i < 912-48; i += 48)
	{
		block = instance_create_layer(0,i,"BehindPlayer",objAlgBlockVertical);
		block.image_alpha = 0;
		instance_change_alpha(block,1,30);	
				
		block = instance_create_layer(1200-48,i,"BehindPlayer",objAlgBlockVertical);
		block.image_alpha = 0;
		instance_change_alpha(block,1,30);
	}
	with(objAlgBlock)
	{
		color = make_color_rgb(9,38,51);	
	}
	
	room_set_infinite_jump(false);
	
}

#endregion
#region 10. FINAL-1
current = attacks[| 10];
next = attacks[| 11];

if(t == current)
{
	bullet = instance_create_layer( 600, 250, "Bullets", objAlgBullet );
	bullet.image_alpha = 0;
	bullet.mode = 10;
	bullet.color = scrDTBGetRandomColor();
	bullet.sprite_index = sprAlgSphereColored;
	bullet.data[0] = 400;
	bullet.data[1] = 90;
	killer_set_active(bullet, false);
	instance_change_alpha( bullet, 1, 50 );
	instance_set_scale( bullet, 3);
}
#endregion
#region 11. FINAL-2
current = attacks[| 11];

if(t == current)
{
	spawner = spawner_create_layer( 96, 912, "Bullets", 6, objAlgBulletSpawned, 400 );
	spawner.mode = 11;
	
	spawner = spawner_create_layer( 1200-96, 912, "Bullets", 6, objAlgBulletSpawned, 400 );
	spawner.mode = 11;
}
if(t == current + 380)
{
	circle = instance_create_layer( 200, 300, "Bullets", objAlgCircle );
	circle.mode = 11;
	circle.sprite = sprAlgKnife;
	circle.scale = 0.8;
	circle.radius = 0;
	circle.color = scrDTBGetRandomColor();
	circle.angle = random(360);
	circle.spawnNumber = 16;
	with(circle) event_user(0);
	
	circle = instance_create_layer( 1000, 300, "Bullets", objAlgCircle );
	circle.mode = 11;
	circle.sprite = sprAlgKnife;
	circle.scale = 0.8;
	circle.radius = 0;
	circle.color = scrDTBGetRandomColor();
	circle.angle = random(360);
	circle.spawnNumber = 16;
	with(circle) event_user(0);
}
if(t == current + 800)
{	
	with(objAlgBullet)
	{
		instance_fade_out(id,70);
	}
}
if(t == current + 865)
{
	instance_destroy(objAlgCircle);
}
if(t == current + 1000)
{
	global.Autosave = true;
	room_goto(rAlgClear);
}

#endregion