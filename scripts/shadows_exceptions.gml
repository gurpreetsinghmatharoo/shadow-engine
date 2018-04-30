/// shadows_exceptions(exceptions...)

var list = oShadowManager.except;

for(var i=1; i<argument_count; i++){
    ds_list_add(list, argument[i]);
}
