#define scr_actions

#define act_move
//move 
targetx = argument0;
targety = argument1;

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

#define act_movecontrol
//controls
up = keyboard_check(vk_up) || keyboard_check(ord('W'));
down = keyboard_check(vk_down) || keyboard_check(ord('S'));
left = keyboard_check(vk_left) || keyboard_check(ord('A'));
right = keyboard_check(vk_right) || keyboard_check(ord('D'));
run = keyboard_check(vk_shift);


if(up){

    if(run){
        y -= spd;
    } else {
        y -= wspd;
    }
} 

else if(down){

    if(run){
        y += spd/2;
    } else {
        y += wspd;
    }
} 

else {speed = 0;} 

if(right){
    if(run){
        x += spd;
    } else {
        x += wspd;
    }
}
if(left){
    if(run){
        x -= spd;
    } else {
        x -= wspd;
    }
}