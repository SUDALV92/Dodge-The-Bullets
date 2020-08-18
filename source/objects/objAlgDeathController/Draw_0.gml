/// @description code
if( !surfaceCopied && !instance_exists(oPlayer) )
{
	if(!surface_exists(deathSurface))
		deathSurface = surface_create(1200,912);
	
	with(deadPlayer)
	{
		visible = true;
		draw_self();
	}	
	surface_copy(deathSurface,0,0,application_surface);	
	surfaceCopied = true;
}
if( surfaceCopied )
{	
	if(!surface_exists(deathSurface))
		deathSurface = surface_create(1200,912);
		
	if(shader_is_compiled(shdAlgGreyScale))
	{
		shader_set(shdAlgGreyScale);
	}
	
	draw_surface(deathSurface,0,0);
	shader_reset();
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fAlg);
	var color = make_color_rgb(135,210,229);
	var drawY = 300;
	if(deadPlayer.y < 400)
	{
		drawY = 600;	
	}
	draw_text_outline(600,300,"YOU HAVE TO DODGE THIS BULLET",color,c_white);
}