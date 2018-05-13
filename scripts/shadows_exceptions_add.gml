/// shadows_exception_add(exceptions...)

var list = oShadowManager.except;

for(var i=0; i<argument_count; i++){
    ds_list_add(list, argument[i]);
}
