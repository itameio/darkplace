///act_follow_unit(target)
//follow unit 
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

if(exists(target)){

    targetx = target.x;
    targety = target.y;
    min_range = 100
    max_range = 200
    run = false;
   
    
    //check if targetis insight
    if(collision_line(x, y, target.x, target.y, oblock, true, true) != noone){insight = false;} else {insight = true;};

    
    //get distance to target
    dst = distance_to_object(target)
    
    if(dst > min_range or !insight){
        if(!run){run = true;}
    
    } else {
        if(run){run = false;}
    }
    
    if(!run){
        if(speed>0){speed -= 1;}
    }
    
    if(insight and run){ 
        direction = point_direction(x, y, target.x, target.y)
        if(speed<spd){speed += 1;}
        move_towards_point(target.x, target.y, speed)//x += spd;
    } else
    
    if(not insight and run){

        if(!path_exists(path)){
            path = path_add();
        }
            
            mp_grid_path(grid, path, x, y, target.x, target.y, true)
            mp_grid_add_instances(grid, oblock, true)
            
            if(speed<spd){speed = spd;} //this needs fixin
            path_start(path, speed, run=false, false)
            
    }
    
    if(insight){
        if(path_exists(path)){
            path_end()
            path_delete(path);
            path = noone;
            
        }
    }
        
        
        
    
}





