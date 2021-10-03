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
        
    case "talk":
        {
        action = act_talk_to(target);
        }
        break;
    
} 
