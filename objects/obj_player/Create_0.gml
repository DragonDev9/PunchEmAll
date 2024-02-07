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
			
			mov_state = 0;
			
			muda_sprite(0);
			
			attacks();
			
			
		
		break;
		}//termina case idle
	
		case "moving":{
		
			
			mov();
			
			mov_state = 1;
		
			muda_sprite(0);
		
			attacks();
			
			
		
		break;
		}//termina case moving
	

		case "punch":{
		
			hsp = 0;
			vsp = 0;
		
			mov_state = 2;
			
			muda_sprite(0);
			
			//criando o hitbox do ataque
			
			var _xx = x + (xscale * sprite_get_width(spr_col)/2);
			var _yy = y - sprite_get_height(spr)*.2;
			
			
			
			////////////////////
			
			termina_animacao(true,_xx,_yy,1, obj_player);
		
		break;
		}//termina light
		
		case "kick":{
			
			hsp = 0;
			vsp = 0;
			
			mov_state = 3;
			
			muda_sprite(0);
			
			
			var _xx = x + (xscale * sprite_get_width(spr_col)/2);
			var _yy = y - sprite_get_height(spr)*.2;
			
			
			termina_animacao(true, _xx, _yy, 2, obj_player);
		
		break;
		}//termina heavy 
	
		case "parried":{
		
			mov_state = 4;
			
			muda_sprite(0);
			
			termina_animacao();
		
		}
	
	}//termina swtich state



}//termina muda estado