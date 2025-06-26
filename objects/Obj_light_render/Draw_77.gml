

surface_set_target(surf_light)


gpu_set_blendmode_ext(bm_dest_color, bm_zero)

draw_surface(application_surface, 0, 0)

gpu_set_blendmode(bm_normal)

surface_reset_target()

draw_surface(surf_light,0, 0)


