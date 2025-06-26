
function Scr_ligth(_x, _y, _color, _intensity, _xscale,_yscale, _alvo = -10){


var _luz = instance_create_depth(_x, _y, 0,Obj_light)


_luz.image_blend = _color
_luz.image_xscale = _xscale
_luz.image_yscale = _yscale
_luz.image_alpha = _intensity
_luz.alvo = _alvo




}