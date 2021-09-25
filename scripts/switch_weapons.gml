//
switch(weapon_type){
    case fist:
    {
    weapon_type = noone;
    weapon_range = noone;
    weapon_damage = noone;
    weapon_cooldown = 50;
    }
    break;
    
    case sword:
    {
    wp_set(attack_melee, 128, base_damage, 50);
    }
    break;
    
    case dagger:
    {
    wp_set(attack_melee, 98, base_damage, 50);
    }
    break;
    
    case club:
    {
    wp_set(attack_melee, 98, base_damage, 50);
    }
    break;
    
    case cleaver:
    {
    wp_set(attack_melee, 98, base_damage, 50);
    }
    break;
    
    case bow:
    {
    wp_set(attack_ranged, 500, base_damage, 50);
    }
    break;
    
    case handgun:
    {
    wp_set(attack_ranged, 500, base_damage, 50);
    }
    break;
    
    case rifle:
    {
    wp_set(attack_ranged, 700, base_damage, 50);
    }
    break;
}






