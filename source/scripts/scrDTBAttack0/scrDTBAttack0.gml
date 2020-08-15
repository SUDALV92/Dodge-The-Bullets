for(var i = 0; i < 912; i += 150)
{
	bullet = instance_create_layer(-20,i,"Bullets",objAlgBullet);
	bullet.sprite_index = sprAlgKunaiColored;
	bullet.direction = irandom_range(0,15);
	bullet.speed = random_range(5,8);
	bullet.gravity = 0.1;
	bullet.mode = 0.1;
	bullet.color = make_color_rgb(114,46,10);
		
	bullet = instance_create_layer(1220,i,"Bullets",objAlgBullet);
	bullet.sprite_index = sprAlgKunaiColored;
	bullet.direction = irandom_range(165,180);
	bullet.speed = random_range(5,8);
	bullet.gravity = 0.1;
	bullet.mode = 0.1;
	bullet.color = make_color_rgb(114,46,10);
}