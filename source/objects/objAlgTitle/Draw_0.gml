/// @description code
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fAlg);
var color = make_color_rgb(34,51,40);
draw_text_outline(x,y,"I wanna Dodge The Bullets",color,c_white);
draw_set_halign(fa_right);
draw_set_font(fAlg16);
draw_text_outline(x+385, y + 10,"\n"+global.gameVersion,color,c_white);