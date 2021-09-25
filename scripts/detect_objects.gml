//detects objects and sorts them based on type
/*for(i=0;i<array_length_1d(id.detected_objects);i++){
        
    if(exists(id.detected_objects[i])){
        
        //show_message("is unit: "+string(o.is_unit))
        //show_message("unit: "+string(id.detected_objects[i].object_index))
        
        if(id.detected_objects[i].object_index==ounit){
            id.detected_units[i] = id.detected_objects[i];
        } else
        
        if(id.detected_objects[i].object_index==oitem){
            id.detected_items[i] = id.detected_objects[i];
        }
    } else {
        id.detected_objects[i]=noone;
    }
}
