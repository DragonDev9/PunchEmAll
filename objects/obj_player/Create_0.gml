/// @description Insert description here
// You can write your code in this editor

event_inherited();

#region variaveis

max_spd = 3;


//sprites
sprites = [

	//idle
	[spr_player_girl_idle],
	
	//andando
	[spr_player_girl_moving],
	
	//punch attack
	[spr_player_girl_punch],
	
	//kick attack
	[spr_player_girl_kick],
	
	//hit
	[spr_player_girl_hit],
	
	//parried
	[spr_player_parried]
];

spr = spr_player_idle;

#endregion


attacks = function(){

	var _punch, _kick;
	
	_punch = keyboard_check_pressed(ord("A"));
	_kick = keyboard_check_pressed(ord("D"));
	
	if _punch && !_kick state = "punch";
	if _kick && !_punch state = "kick";
	
}//termina attacks

////////////////////////////////////////////////////////////////////////

mov = function(){

	
	var _left, _right, _down, _up;
	
	_left = keyboard_check(vk_left);
	_right = keyboard_check(vk_right);
	_down = keyboard_check(vk_down);
	_up = keyboard_check(vk_up);

	hsp = (_right-_left) * max_spd;
	
	vsp = (_down-_up) * max_spd;
	
	if _left || _right || _down || _up{
		state = "moving";
		
	}else{
		state = "idle";
		
	}

	if _left xscale = -1;
	if _right xscale = 1;

}//termina mov

//////////////////////////////////////////////////////////////////////
	



//////////////////////////////////////////////////////////////////////////


	
muda_estado = function(){


	switch(state){
	
		case "idle": {

			mov();
	
			muda_sprite(0);
			
			attacks();

		break;
		}//termina case idle
	
		case "moving":{

			mov();
			muda_sprite(1);
		
			attacks();

		break;
		}//termina case moving
	
		#region COMBATE
		
		case "punch":{
		
			zera_mov();

			muda_sprite(2);
			
			attacking(2, obj_player);
		
		break;
		}//termina light
		
		//
		
		case "kick":{
			
			zera_mov();
		
			muda_sprite(3);
			
			attacking(5, obj_player);
		
		break;
		}//termina kick
		
		//
	
		case "parried":{
	
			zera_mov();
			
			
			termina_animacao();
		
		}//termina parried
		
		//
		
		case "hit":{
		
			zera_mov();
			
			muda_sprite(4);
			
			termina_animacao();
		
		break;
		}
	
	#endregion
	
	}//termina swtich state
	

}//termina muda estado