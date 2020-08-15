/// @description code
switch(mode)
{
	case 6:	
		if(t == 0)
		{
			image_alpha = 0;
			color = c_black;
		}
		if(t > 0)
		{
			if(image_alpha < 0.5)
				image_alpha	+= 0.01;
		}
		break;
	case 8:
		if(image_alpha > 0)
			image_alpha -= 0.01;
		break;
		
}
t++;