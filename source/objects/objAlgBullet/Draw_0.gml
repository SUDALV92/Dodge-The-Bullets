/// @description code
if(smoothing)
{
	gpu_set_tex_filter(true);	
}
if(blend)
{
	gpu_set_blendmode(bm_add);
}
if(color == -1)
	draw_self();
else
{
	if(shader_is_compiled(shdAlgHSV))
		shader_set(shdAlgHSV);
	
	
	switch(drawMode)
	{
		case 0:
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha);
			break;
		case 1:
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*3,image_yscale*3,image_angle,color,image_alpha*0.2);
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*2,image_yscale*2,image_angle,color,image_alpha*0.5);
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha);
			break;
	}
	shader_reset();
}
gpu_set_tex_filter(false);
gpu_set_blendmode(bm_normal);