//move 
action_name = "move to point";

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
