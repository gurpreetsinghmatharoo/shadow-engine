/// shadows_exceptions(id, exceptions...)

var list = argument[0].except;

for(var i=1; i<argument_count; i++){
    ds_list_add(list, argument[i]);
}
