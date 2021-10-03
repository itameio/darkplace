#define is_type


#define is_unit
/// is_unit(object)
var ent;
//set target
if(argument_count>0){
    ent = argument[0];
} else {
    ent = target;
}

//check if object is unit or not
if(ent.object_index==ounit){
    return true;
} else {
    return false;
}

#define is_item
/// is_item(object)
var ent;
//set target
if(argument_count>0){
    ent = argument[0];
} else {
    ent = target;
}

//check if object is item or not
if(ent.object_index==oitem){
    return true;
} else {
    return false;
}

#define is_ent
/// is_ent(object)
var ent
//set target
if(argument_count>0){
    ent = argument[0];
} else {
    ent = target;
}

//check if object is an entity or not
if(ent.object_index==oent){
    return true;
} else {
    return false;
}

#define is_block
/// is_block(object)
var ent
//set target
if(argument_count>0){
    ent = argument[0];
} else {
    ent = target;
}

//check if object is a block or not
if(ent.object_index==oblock){
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
