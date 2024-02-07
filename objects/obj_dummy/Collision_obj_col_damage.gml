/// @description Insert description here
// You can write your code in this editor

if state != "parry"{
	hit = 1;
}else{

	with(obj_player){
	
		state = "parried";
		tempo_parry = 60;
	}

	troca_estado = 30;
	state = "trocar";

}






