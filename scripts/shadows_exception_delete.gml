/// shadows_exception_delete(id)

var list = oShadowManager.except;

var lID = ds_list_find_index(list, argument0);

if (lID >= 0) ds_list_delete(list, lID);
