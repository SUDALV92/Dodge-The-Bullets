/// @description code
if(t <= duration)
{ 
 var nextBlockColor = merge_colour(startBlockColor,blockColor,t/duration);
 with(objAlgBlock)
 {
  color = nextBlockColor;
 }
 
 var nextBGColor = merge_colour(startBGColor,bgColor,t/duration); 
 with(objAlgBackground)
 {
	 color = nextBGColor;
 }
 
 t++;
}
else
{
 instance_destroy();
}