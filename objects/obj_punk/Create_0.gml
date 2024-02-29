
event_inherited();

spr = spr_punk;

state = "idle";

max_hsp=.1;

max_vsp=.1;

//vars de combate

punch_timer_max = 40;

punch_timer = punch_timer_max;



sprites = [

	//idle
	[spr_punk],
	
	//hit
	[spr_punk_hit],
	
	//punch
	[spr_punk_punch],
	
	//walking
	[spr_punk_chasing]



]

/////////////////////////////

pos_player = function(){

	 _player_x = obj_player.x;
	 _player_y = obj_player.y;

}

perseguindo_player = function(){

	var _perto = point_distance(x, y, _player_x, _player_y);

	show_debug_message(_perto);
	
	while _perto >= 90{
	
		hsp-=max_hsp*xscale;
		
		muda_sprite(3);
		
		if _perto <= 43 && punch_timer <= 0{
		
			state = "punch"
			
			break;
		}else if _perto <= 43 && punch_timer >= 1{
		
			muda_sprite(0);
			
			state = "idle";
			
			break;
			
		}

	break;
	}

}

verifica_pos_player = function(){

		
	punch_timer--;
	
	perseguindo_player();

}



////////////////////////////

controla_estado = function(){


	switch(state){



	case "idle":{
		
		zera_mov();

		muda_sprite(0);
		
		
	
	break;
	}//termina case idle
	
	case "hit":{
		
		zera_mov();

		muda_sprite(1);
		
		termina_animacao();
		
	break;
	}
	
	case "chasing": {
	
		verifica_pos_player();
	
	break;
	}//termina case chasing
	
	//////////////////////////////////////////////////////////////////////
	
	#region estados de combate
	
	case "parry":{
	
		xscale = sign(x - obj_player.x);
		
		spr = spr_dummy_parry;
		
	
	break;
	}//termina case parry
	
	
	case "punch":{
		
		punch_timer = punch_timer_max;
		
		zera_mov();
		
		muda_sprite(2);
	
		attacking(1, obj_punk);
	
		break;
	}
	
	
	
	#endregion

}//termina switch


}//termina function


	
visao = function(){


	if collision_circle(x,y,130,obj_player,true,true) && state = "idle"{
	
		state = "chasing";
		
	}

}//termina visao

