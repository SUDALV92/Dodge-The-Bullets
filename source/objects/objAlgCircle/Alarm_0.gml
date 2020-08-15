/// @description code
switch(mode)
{
	case 4:
		for(var i = 0; i < spawnNumber; i++)
		{
			killer_set_active(bullets[| i],true);
			bullets[| i].image_alpha = 1;
		}
		data[0] = 1; //теперь можно менять альфу от приближения к центру
		break;
}
