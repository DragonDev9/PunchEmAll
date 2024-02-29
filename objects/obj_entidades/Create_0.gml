/// @description Insert description here
// You can write your code in this editor


//variaevis
#region variaveis
//variaveis de velocidade
hsp = 0;
vsp = 0;

max_hsp = 1;
max_vsp = 15;

//hp

hp = 1;

//sprites
sprites = [

	//lado 0
	[],
	
	//pulando 1
	[],
	
	//soco 2
	[]
];

spr = noone;

mov_state = 0;

spr_num = 0;

spr_index = 0;

xscale = 1;

spr_spd = .1;

//estado
state = "idle";

//combate
hit = true;


#endregion


muda_sprite = function(_ind){

	if spr !=  sprites[_ind][0]{
	
		spr_index = 0;
		
	}
	
	///////////////////////////////////
	
	switch(state){
	
		case "punch":{
		
			spr_spd = .2;
	
		break;
		}
		
		case "kick":{
		
			spr_spd = .1;
	
		break;
		}
		
		default:{
		
			spr_spd = .3;
		
		break;
		}
	
	}
	
	////////////////////////////////////

	spr = sprites[_ind][0];
	
	spr_num = sprite_get_number(spr)
	
	spr_index += spr_spd;
	
	spr_index %= spr_num;
	
	

}//termina muda sprite

///////////////////////////////////////////////////

///@function termina_animacao
termina_animacao = function(_hitbox = false, _xx = 0 , _yy = 0,_dmg = 0, _criador = obj_entidades, _state = "idle"){

	
	var _terminar = spr_index+spr_spd >= spr_num;


	if _terminar{
			
				if _hitbox{
					
				
					var _box = instance_create_layer(_xx, _yy,layer,obj_col_damage);
					
					_box.dmg = _dmg;
				
					_box.criado_por = _criador;
					
					switch(_criador){
					
						case obj_player: audio_play_sound(sfx_player_punch,0,0); break;
						case obj_punk: audio_play_sound(sfx_player_punch,0,0); break;
					
					}//termina switch
					
				}//termina if _hitbox
				
				state = _state;
			
	}


}//termina animacao

/////////////////////////////////////////////////////////////

attacking = function(_dmg, _obj){


	//criando o hitbox do ataque


	if _obj = obj_player{
		var _xx = x + ((xscale * (sprite_get_width(spr_dmg)*2))/2);
	}else if _obj = obj_punk{
		var _xx = x - ((xscale * (sprite_get_width(spr_dmg)*2))/2);
	}
	
	var _yy = y - sprite_get_height(spr)*.2;
	

	
	hit = spr_index < spr_num-1 ? false : true;
	

	
	
	termina_animacao(true, _xx, _yy, _dmg, _obj);


}


/////////////////////////////////////////////////////////////

grav = function(){


	var _col = place_meeting(x,y+1,obj_col);
	
	if !_col{
	
		vsp+=GRAVIDADE;
		state = "jumping";
	
	}

}//termina grav

//////////////////////////////////////////////////////////////////

zera_mov = function(){

	hsp = 0;
	vsp = 0;

}