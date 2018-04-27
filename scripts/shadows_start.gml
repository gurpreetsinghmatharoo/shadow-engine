/// shadows_start(depth, [x, y])

//Args
var _dep = argument[0];

if (argument_count>1){
    var _x = argument[1];
    var _y = argument[2];
}
else{
    var _x = 0;
    var _y = 0;
}

//Create
inst = instance_create(_x, _y, oShadowManager);
inst.depth = _dep;

//Return
return inst;
