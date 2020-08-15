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
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha);
	shader_reset();
}
gpu_set_tex_filter(false);
gpu_set_blendmode(bm_normal);