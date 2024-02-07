/// @description Insert description here
// You can write your code in this editor

event_inherited();

show_debug_message(spr_spd);


switch(state){



	case "idle":{
		
		xscale = sign(x - obj_player.x);

		muda_sprite(0);
	
	break;
	}//termina case idle
	
	case "hit":{
	
		
		muda_sprite(1);
		
		termina_animacao();
	break;
	}
	
	//////////////////////////////////////////////////////////////////////
	
	#region estados de combate
	
	case "parry":{
	
		xscale = sign(x - obj_player.x);
		
		spr = spr_dummy_parry;
		
	
	break;
	}//termina case parry
	
	
	case "prepare_dash":{
		
		spr = spr_dummy_prepare_dash;
		
		destinos = obj_player.x;
		
		if tempo_dash <= 0 state = "dash" else tempo_dash--;
	
	break;
	}//termina prepare dash
	
	case "dash":{

		tempo_dash = 30;
		
		spr = spr_dummy_dash;
		
		var _dir = point_direction(x,y,destinos,obj_player.y);
		
		hsp = lengthdir_x(max_hsp * dash_spd,_dir);
		
		var _dist = point_distance(x,y,destinos,obj_player.y);
		

		if _dist<16	state = "trocar";

		x+=hsp;
	
	break;
	}//termina case dash

	case "prepare_atirar":{
	
		spr = spr_dummy_prepare_atirando;
	
		destinos = obj_player.x;
		
		if tempo_atirar <= 0 state = "atirar"; else tempo_atirar--;
		
	
	break;
	}//termina prepare atirar

	case "atirar":{
		
		spr = spr_dummy_prepare_tiro
	
		
		
		tempo_atirar=40;
		
		var _dir = point_direction(x,y,destinos,y);
		
		var _xx = x - (xscale * sprite_get_width(spr_bullet)/2);
		var _yy = y - sprite_get_height(spr)*.2;
		
		var _tiro = instance_create_layer(_xx , _yy, layer, obj_bullets);
		
		_tiro.dir = _dir;
		
		state = "trocar";
	
	break;
	}
	
	#endregion

}//termina switch







