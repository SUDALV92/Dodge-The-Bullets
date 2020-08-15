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