/// act_pickup(target)
//pick up an item
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

var space = unit_width*2;

if (exists(target) and (target.object_index==oitem)){

    if (distance_to_object(target)>space){
        act_moveto(target);
    } else {
        
        if(!has_item(target.item_type)){inv[? target.item_type] = 0;}
        inv[? target.item_type] += target.quantity;
        instance_destroy(target);
        speed = 0;
        if(exists(path)){
            path_end();
        }
         
    }
}
