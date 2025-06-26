


if (!surface_exists(surf_light)){

var largura_tela = display_get_width();
var altura_tela = display_get_height();

surface_resize(application_surface, largura_tela, altura_tela);


	var _wid = surface_get_width(application_surface)
    var _hel = surface_get_height(application_surface)
surf_light = surface_create(_wid, _hel);


}


surface_set_target(surf_light)

   draw_clear(abiente_ligth)

   camera_apply(view_camera[0])
   
   gpu_set_blendmode(bm_add)
   
  
   
   with (Obj_light){
draw_self()
   }
   
   gpu_set_blendmode(bm_normal)
  
 surface_reset_target()


