if Mind_control = true{
	time_e=100000000000000
Tempo_Mind_control-=1

if Tempo_Mind_control<=0{
	Obj_player.estado_debuff="normal"
	instance_destroy()
	
}
}



	
time_e-=1
if time_e<=0{
	instance_destroy()
}





