#define scr_general


#define kbrd

var key = argument0

if(is_string(key)){key = ord(key)}

if(keyboard_check(key)){return true;} else {return false;}

#define exists
if(instance_number(argument0)>0){return true;} else {return false;}

#define mbp
if(mouse_check_button_pressed(argument0)){return true;} else {return false;}
#define draw_array
var len = array_length_1d(argument0)
var str = "";

for(i=1; i<len - 1; i++){
    if(exists(argument0[i])){
        name = string(argument0[i].name)
        str += string(i) + ": " + name + "#";
    }
}

draw_set_color(c_white)
draw_text(100, 0, str)

#define crt
//create an instance
var inst = instance_create(argument0, argument1, argument2)
return inst;


#define kbrdp

var key = argument0

if(is_string(key)){key = ord(key)}

if(keyboard_check_pressed(key)){return true;} else {return false;}
#define clicked
/// lclicked(unit, centered)
//check for a click on a unit
var key, unit, centered, xx, yy, width, height;

unit = argument[0];
width = unit.unit_width;
height = unit.unit_height;
xx = unit.x;
yy = unit.y;

if(argument_count==2){
    centered = argument[1];
} else {
    centered = false;
}

if(argument_count==3){
    key = argument[2];
} else {
    key = noone;
}

if (centered){
    width /= 2;
    height /= 2;
    //xx = xx - (width);
    //yy = yy - (height);
} else {
    //
}
 
 if(mouse_check_button_pressed(key)) and (point_in_rectangle(mouse_x, mouse_y, xx-width, yy-height, xx+width, yy+height)){
    return true;
} else {
    return false;
}

#define lclicked
/// lclicked(unit, centered)
//check for a click on a unit
var key, unit, centered, xx, yy, width, height;

unit = argument[0];
width = unit.unit_width;
height = unit.unit_height;
xx = unit.x;
yy = unit.y;
key = mb_left;

if(argument_count>1){
    centered = argument[1];
} else {
    centered = false;
}

if (centered){
    width /= 2;
    height /= 2;
    //xx = xx - (width);
    //yy = yy - (height);
} else {
    //
}
 
 if(mouse_check_button_pressed(key)) and (point_in_rectangle(mouse_x, mouse_y, xx-width, yy-height, xx+width, yy+height)){
    return true;
} else {
    return false;
}

#define hover
/// hover(object)
//
var key, unit, centered, xx, yy, width, height;

unit = argument[0];
width = unit.unit_width;
height = unit.unit_height;
xx = unit.x;
yy = unit.y;
key = mb_left;

if(argument_count==2){
    centered = argument[1];
} else {
    centered = false;
}

if (centered){
    width /= 2;
    height /= 2;
    //xx = xx - (width);
    //yy = yy - (height);
} else {
    //
}

if(point_in_rectangle(mouse_x, mouse_y, xx-width, yy-height, xx+width, yy+height)){
    return true;
} else {
    return false;
}