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