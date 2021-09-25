//face a unit or a point
action_name = "face";

var target, xx, yy;

if(argument_count>0){
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




