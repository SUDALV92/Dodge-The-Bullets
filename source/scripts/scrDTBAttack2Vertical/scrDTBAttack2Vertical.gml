function scrDTBAttack2Vertical() {
	with(objAlgBullet)
	{
		if(mode == 2)
		{
			if(data[0] == 2)
			{
				if(y < 456)
				{
					instance_move_to_y(id,912-90,30);	
				}
				else
				{
					instance_move_to_y(id,90,30);
				}
			}
		}
	}


}
