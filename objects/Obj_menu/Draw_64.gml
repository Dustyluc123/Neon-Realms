
draw_set_font(fonte_menu3)

var gui_width = display_get_gui_width()

var gui_height = display_get_gui_height()

var x1 = gui_width/2
var y1 = gui_height/2

var margin = 100;

var m_x = device_mouse_x_to_gui(0)
var m_y = device_mouse_y_to_gui(0)

draw_set_halign(fa_center);
draw_set_valign(fa_center);

for(var i = 0;i< op_max;i++){
	
	
	var y2 = y1 + (margin * i)
	
	var _string_w = string_width(options[i])
	var _string_h= string_height(options[i])
	if(	point_in_rectangle(m_x, m_y, x1 - _string_w / 2, y2 - _string_h / 2,x1 + _string_w / 2, y2 + _string_h/ 2)){
		
	draw_set_color(c_maroon)
	
	index = i
	
	show_debug_message(index)
	
	if(mouse_check_button_pressed(mb_left)){
		if (index = 2){
			
			game_end()
			}
				if (index = 0){
			
			room_goto(Room_casa_Yuki)
			
		
			}
		
	}
	}else{
		
		draw_set_color(c_white)
		
	}
		
		
	draw_text(x1,y2,options[i])
	
}

