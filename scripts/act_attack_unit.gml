//
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}
//show_message("")
if(attack_type==attack_ranged and !has_item("ammo")){
        target = noone;
        action = noone;
} else if (exists(target)){

    if (distance_to_object(target) > weapon_range*3){
        act_moveto(target);
    } else {

        if(attack_cooldown<=0){
        
            if(attack_type==attack_ranged){
                if(has_item("ammo")){
                    projec = crt(x, y, oprojec);
                    projec.master = id;
                    projec.target = id.target;
                    projec.tx = target.x;
                    projec.ty = target.y;
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
