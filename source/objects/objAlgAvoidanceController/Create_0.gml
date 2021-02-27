Avoidance = avoidance_start( musAnima );

attacks = ds_list_create();
ds_list_add(attacks, 
100, //intro, 420 - вторая часть
880, //1
1770, //2 2170
2550, //3
3340, //4 3730
4120, //5
4920, //6
5300, //7
6080, //8
6860, //9
7460, //10
7850 //final 8350 - конец
);

circle = noone;
nextRadius = 0;
whiteAlpha = 0;
avoidance_set_step(attacks[| 0]);
practiceEnabled = false;

///////////////////////////////
/*instance_destroy(objAlgBackground);
colorChanger = instance_create_layer(0,0,"Bullets",objAlgBlockColorChanger);
colorChanger.bgColor = make_color_rgb(12,211,201);
colorChanger.blockColor = make_color_rgb(9,38,51);
colorChanger.duration = 1;*/
///////////////////////////////