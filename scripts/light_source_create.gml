/// light_source_create(x, y)

var pos = array_length_1d(oShadowManager.lightX);

oShadowManager.lightX[pos] = argument0;
oShadowManager.lightY[pos] = argument1;

return pos;
