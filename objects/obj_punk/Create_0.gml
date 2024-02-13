
event_inherited();

spr = spr_punk;

state = "idle";

tempo_dash = 60;

destinos = 0;

dash_spd = 30;

sprites = [

	//idle
	[spr_punk],
	
	//hit
	[spr_punk_hit],
	
	//punch
	[spr_punk_punch]



]

/////////////////////////////

controla_estado = function(){


	switch(state){



	case "idle":{
		
		hsp = 0;
		vsp = 0;

		muda_sprite(0);
	
	break;
	}//termina case idle
	
	case "hit":{
		
		hsp = 0;
		vsp = 0;

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
	
	
	case "punch":{
		
		hsp = 0;
		vsp = 0;
		
		muda_sprite(2);
	
		
		var _xx = x - ((xscale * (sprite_get_width(spr_dmg)*2))/2);
		var _yy = y - sprite_get_height(spr)*.2;
		
		termina_animacao(true,_xx,_yy,1,obj_punk);
		
		
		
		break;
	}
	
	#endregion

}//termina switch


}//termina function



