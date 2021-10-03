#define act_talk_to
/// act_talk_to(target)
//talk to an NPC
action_name = "talk to";
//set target
if(argument_count>0){
    target = argument[0];
} else {
    target = target;
}

//
if (exists(target) and (is_unit(target))){

    if (distance_to_object(target) > unit_width){
        act_moveto(target);
    } else {
        id.talk_with = target;
        target.talk_with = id;  
    }
}

#define act_talk_with
if(talk and talk_with and exists(talk_width)){
    act_face(talk_with);
    if(!dlg){
        dlg = crt(x, y, otalk);
    }
}