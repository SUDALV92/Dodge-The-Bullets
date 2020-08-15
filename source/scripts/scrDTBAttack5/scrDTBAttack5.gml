angle = random(360);
spawnX = irandom_range(100,1100);
var N = 10;
repeat(N)
{
	bullet = instance_create_layer(spawnX,200,"BehindPlayer",objAlgBullet);
	bullet.sprite_index = sprAlgBullet;
	instance_set_scale(bullet,0.8);
	bullet.image_alpha = 0;
	instance_change_alpha(bullet,1,10);
	bullet.direction = angle;
	bullet.image_angle = angle;
	bullet.color = scrDTBGetRandomColor();
	angle += 360/N;
	bullet.speed = 8;
	bullet.outsideDelete = true;
}