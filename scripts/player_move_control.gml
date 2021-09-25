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
