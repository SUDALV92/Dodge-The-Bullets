function scrDTBGetRandomColors() {
	var rng = irandom(5);

	var colorList = ds_list_create();
	ds_list_add( colorList, c_fuchsia, c_maroon, c_orange, c_purple, c_red, c_yellow );
	var newList = ds_list_create();
	repeat(argument[0])
	{
		if(rng > 5)
			rng = 0;
		ds_list_add( newList, colorList[| rng] );
		rng++;
	}

	return newList;


}
