//
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

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
