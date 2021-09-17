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






#define switch_actions
//switch actions

switch(action_name){

    case "face":
        {
        action = act_face(target)
        }
        break;
    case "follow":
        {
        action = act_follow_unit(target);
        }
        break;
    case "recruit":
        {
        action = act_recruit(target);
        }
        break;
    case "attack":
        {
        action = act_attack_unit(target);
        }
        break;
    case "pickup":
        {
        action = act_pickup(target);
        }
        break;
    
} 

#define act_attack_unit
target = argument0;
//
if(attack_type==attack_ranged and !has_item("ammo")){
        target = noone;
        action = noone;
} else

if (exists(target)){
    
    
    
    if (distance_to_object(target) > weapon_range*3){
        act_moveto(target);
    } else {
        
        /*if(target.faction == noone){
            target.master = id;
            target.faction = faction;
            target.rank = rank_recruit;
            target.main_col = main_col;
            target.sec_col = sec_col;
            
            target = noone;
            action_name = "";
        } else {
            target = noone;
        }*/
        //show_message(target.stat[hp])
        if(attack_cooldown<=0){
        
            if(attack_type==attack_ranged){
                if(has_item("ammo")){
                    projec = crt(x, y, oprojec);
                    projec.master = id;
                    attack_cooldown = weapon_cooldown;
                    inv[? "ammo"]--;
                }
                  
            } else {
            
            target.stat[hp] -= base_damage;
            target.is_attacked = true;
            target.attacker = id;
            attack_cooldown = weapon_cooldown;
            
            }
        } else {
            attack_cooldown--;
        }
        
        speed = 0;
        if(exists(path)){
            path_end();
        }
        
        act_face(target)
         
    }
}

#define act_avoid
//avoid solid objects
#define act_face
//face a unit or a point
var target, xx, yy;

if(argument_count==1){
    target = argument[0];
    
    if(exists(target)){
        xx = target.x;
        yy = target.y;
    } 
} 

if(argument_count>1){
    xx = argument[0];
    yy = argument[1];
}


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
min_range = unit_width
max_range = unit_width
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

if (exists(target)){

    if (distance_to_object(target)>space){
        act_moveto(target);
    } else {
        
        if(faction_capacity>0 and target.faction == noone){
            target.master = id;
            target.faction = faction;
            target.rank = rank_recruit;
            target.main_col = main_col;
            target.sec_col = sec_col;
            target.class = choose("")
            target.attack_type = choose(attack_melee, attack_ranged);
            target.base_damage = random(5);
            
            faction_members[array_length_1d(faction_members)] = target.id;
            faction_capacity--;
            //show_message(faction_capacity)
            target = noone;
            action_name = "";
        } else {
            target = noone;
        }
        
        speed = 0;
        if(exists(path)){
            path_end();
        }
         
    }
}

#define switch_weapon
//
switch(weapon_type){
    case fist:
    {
    weapon_type = noone;
    weapon_range = noone;
    weapon_damage = noone;
    }
    break;
    
    case sword:
    {
    wp_set(attack_melee, 128, base_damage);
    }
    break;
    
    case dagger:
    {
    wp_set(attack_melee, 98, base_damage);
    }
    break;
    
    case club:
    {
    wp_set(attack_melee, 98, base_damage);
    }
    break;
    
    case cleaver:
    {
    wp_set(attack_melee, 98, base_damage);
    }
    break;
    
    case bow:
    {
    wp_set(attack_ranged, 500, base_damage);
    }
    break;
    
    case handgun:
    {
    wp_set(attack_ranged, 500, base_damage);
    }
    break;
    
    case rifle:
    {
    wp_set(attack_ranged, 700, base_damage);
    }
    break;
}







#define wp_set
//
attack_type = argument[0];
weapon_range = argument[1];
weapon_damage = argument[2];

#define detect_objects
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

#define vision
//calculate and draw vision cone
if(exists(radd)){
    
    var width = 20;
    
    x2 = lengthdir_x(radd.rad, direction - width)
    y2 = lengthdir_y(radd.rad, direction - width)
    
    x1 = lengthdir_x(radd.rad, direction + width)
    y1 = lengthdir_y(radd.rad, direction + width)
    
    var dir = direction;
    
    if(x3 == noone){x3 = x1;}
    if(y3 == noone){y3 = y1;}
    
    if(diff < -width){
    
        turn = 1;
        draw_set_color(c_aqua)
    } 
    
    if(diff > width){
    
        turn = 0;
        draw_set_color(c_white)
    } 
    
    x3 = lengthdir_x(radd.rad, (dir) + diff)
    y3 = lengthdir_y(radd.rad, (dir) + diff)
    
    if(turn == 0){
        diff--;
        detected_obj = collision_line(x, y, x + x3, y + y3, oent, true, true)
        
    } else 
    
    if(turn == 1){
        diff++;
        detected_obj = collision_line(x, y, x + x3, y + y3, oent, true, true)
    }
    
    if(detected_obj != noone){
    
            exist = false
            for(i=1;i<array_length_1d(detected_objects);i++){
                if(detected_obj.id == detected_objects[i]){
                    exist = true;
                }
            }
            
            if(!exist){detected_objects[array_length_1d(detected_objects)] = detected_obj;}
            
            //instance_destroy(detected_objects[i]);
        }
        
    if(!id==o.player){
        //with(detected_obj){instance_destroy();}
    }

    if(id.draw_cone){
        draw_line(x, y, x + x1, y + y1)
        draw_line(x, y, x + x2, y + y2)
        
        draw_set_alpha(0.3)
        draw_triangle(x, y, x + x1, y + y1, x + x2, y + y2, false)
        draw_set_alpha(1)
        //draw_circle(x, y, radd.rad, true)
        
        if(collision_line(x, y, x3, y3, ounit, true, true)){
            draw_set_color(c_lime)
        }
        
        draw_arrow(x, y, x + x3, y + y3, 25)
    }
}

#define has_item
//
if(ds_map_exists(inv, argument[0]) or (inv[? argument[0]]>0)){
    return true;                    
} else {
    return false;
}

#define act_pickup
//pick up an item
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

#define scan_rad
for(i=0;i<360;i++){
    direction = i;
    vision();
}