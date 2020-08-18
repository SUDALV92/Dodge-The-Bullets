function scrDTBAttack2Horizontal() {
	with(objAlgBullet)
	{
		if(mode == 2)
		{
			if(data[0] == 0)
			{
				if(x < 600)
				{
					instance_move_to_x(id,1110,30);	
				}
				else
				{
					instance_move_to_x(id,90,30);
				}
			}
		}
	}


}
