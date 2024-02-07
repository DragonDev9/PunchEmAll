/// @description Insert description here
// You can write your code in this editor

cam = view_camera[0]

player = obj_player;

segue_player = function(){


	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);


	var _cam_x = camera_get_view_x(cam);
	var _cam_y = camera_get_view_y(cam);
	
	_cam_x = player.x - cam_w/2;
	_cam_y = camera_get_view_y(cam);

	_cam_x = clamp(_cam_x, 0, room_width - cam_w);

	

	camera_set_view_pos(cam, _cam_x, _cam_y);

}








