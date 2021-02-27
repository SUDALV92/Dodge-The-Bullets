/// @description  scrDTBAttack9( spawnX, spawnY, scale, speed );
function scrDTBAttack9() {
	spawnX = argument[0];
	spawnY = argument[1];
	scale = argument[2];
	targetSpeed = argument[3];
	color = scrDTBGetRandomColor();
	var tempAngle = random(360);
	repeat(15)
	{
		bullet = instance_create_layer( irandom_range( spawnX - 100, spawnX + 100), irandom_range( spawnY - 100, spawnY + 100 ),"Bullets",objAlgBullet);
		bullet.sprite_index = sprAlgKnife;
		instance_set_scale(bullet,4);
		instance_scale(bullet,scale,30);
		bullet.direction = tempAngle + irandom_range(-5,5);
		tempAngle += 360/15;
		bullet.speed = random_range( targetSpeed - 1, targetSpeed + 2);
		bullet.gravity_direction = bullet.direction;
		bullet.gravity = 0.05;
		bullet.color = color;
		bullet.image_angle = bullet.direction;
		bullet.outsideDelete = true;
		bullet.mode = 9;
		bullet.data[0] = 1;
	}


}
