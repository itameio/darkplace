#define scr_actions


#define act_move
//move 
target = argument0;
targetx = target.x;
targety = target.y;

if(x < targetx){ 
    x += spd;
} else if(x > targetx){
    x -= spd
}

if(y < targety){ 
    y += spd;
} else if(y > targety){
    y -= spd
}

#define act_move_control
//controls
up = kbrd(vk_up) || kbrd('W');
down = kbrd(vk_down) || kbrd('S');
left = kbrd(vk_left) || kbrd('A');
right = kbrd(vk_right) || kbrd('D');
run = kbrd(vk_shift);

//left and right
if(right){
    if(run){
        for(i=0;i<spd;i++){
            if(!place_meeting(x + 1, y, oblock)){x += 1;}
        }
    } else {
        for(i=0;i<wspd;i++){
            if(!place_meeting(x + 1, y, oblock)){x += 1;}
        }
    }
}
if(left){
    if(run){
        for(i=0;i<spd;i++){
            if(!place_meeting(x - 1, y, oblock)){x -= 1;}
        }
    } else {
        for(i=0;i<wspd;i++){
            if(!place_meeting(x - 1, y, oblock)){x -= 1;}
        }
    }
}
//up and down
if(up){

    if(run){
        for(i=0;i<spd;i++){
            if(!place_meeting(x, y -1, oblock)){y -= 1;}
        }
    } else {
        for(i=0;i<wspd;i++){
            if(!place_meeting(x, y -1, oblock)){y -= 1;}
        }
    }
} 

else if(down){

    if(run){
        for(i=0;i<spd;i++){
            if(!place_meeting(x, y + 1, oblock)){y += 1;}
        }
    } else {
        for(i=0;i<wspd;i++){
            if(!place_meeting(x, y + 1, oblock)){y += 1;}
        }
    }
} 

else {speed = 0;} 

#define act_follow_unit
//follow unit 

target = argument0;
targetx = target.x;
targety = target.y;
min_range = 100
max_range = 100
run = false;

if(exists(target)){
    
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






#define act_attack_unit
target = argument0;
act_follow_unit(target)
#define act_avoid
//avoid solid objects
#define act_face
//face a unit or a point

var xx, yy;

xx = argument0;
yy = argument1;


direction =  point_direction(x, y, xx, yy)



#define player_move_mouse
///move player character by mouse

var mbr = mbp(mb_right);


if(mbr){
    if(exists(mark)){instance_destroy(mark);}
    mark = crt(mouse_x, mouse_y, omark)
}

if(exists(mark)){act_moveto(mark)}
var mbr = mbp(mb_right)



#define act_moveto
//follow unit 

target = argument0;
targetx = target.x;
targety = target.y;
min_range = 300
max_range = 400
run = false;

if(exists(target)){
    
    //check if targetis insight
    if(collision_line(x, y, target.x, target.y, oblock, true, true) != noone){insight = false;} else {insight = true;};

    
    //get distance to target
    dst = distance_to_object(target)
    
    /*if(dst > min_range or !insight){
        if(!run){run = true;}
    
    } else {
        if(run){run = false;}
    }*/
    
    run = true;
    
    if(!run){
        if(speed>0){speed -= 1;}
    }
    
    if(insight and run){ 
        direction = point_direction(x, y, target.x, target.y)
        if(speed<spd){speed = spd;}
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
    
    if(distance_to_object(target) < 1){
        instance_destroy(target);
        target = noone;
    }
    
}

#define act_recruit
//

var space = unit_width*2;

if (exists(target) and (distance_to_object(target)>space)){
    act_moveto(target);
} else {
    
    if(target.faction == noone){
        target.master = id;
        target.faction = faction;
        target.rank = rank_recruit;
        target.main_col = main_col;
        target.sec_col = sec_col;
    } else {
        target = noone;
    }
    
    speed = 0;
    if(exists(path)){
        path_end();
    }
     
}
