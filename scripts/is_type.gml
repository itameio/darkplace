#define is_type


#define is_unit
/// is_unit(object)

//set target
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

//check if object is unit or not
if(target.object_index==ounit){
    return true;
} else {
    return false;
}

#define is_item
/// is_item(object)

//set target
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

//check if object is item or not
if(target.object_index==oitem){
    return true;
} else {
    return false;
}

#define is_ent
/// is_ent(object)

//set target
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

//check if object is an entity or not
if(target.object_index==oent){
    return true;
} else {
    return false;
}

#define is_block
/// is_block(object)

//set target
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

//check if object is a block or not
if(target.object_index==oblock){
    return true;
} else {
    return false;
}

#define is_player
/// is_player(object)

//check if object is a block or not
if(argument[0].id==o.player){
    return true;
} else {
    return false;
}
