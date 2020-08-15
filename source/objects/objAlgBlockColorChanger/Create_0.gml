/// @description code
if(instance_exists(objAlgBackground))
	startBGColor = objAlgBackground.color;
else
	startBGColor = 0;

if(instance_exists(objAlgBlock))
{
	startBlockColor = objAlgBlock.color;	
}
else
	startBlockColor = 0;
bgColor = 0;
blockColor = 0;
t = 0;
duration = 0;