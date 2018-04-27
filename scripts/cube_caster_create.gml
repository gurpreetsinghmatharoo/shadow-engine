/// cube_caster_create(x, y, width, height, z_height)

//Args
var _x = argument[0];
var _y = argument[1];
var _w = argument[2];
var _h = argument[3];
var _zH = argument[4];

//Create
var inst = instance_create(_x, _y, oSSCubeCaster);

inst.cubeW = _w;
inst.cubeH = _h;
inst.cubeZH = _zH;

return inst;
