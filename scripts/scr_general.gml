#define scr_general

#define kbrd

var key = argument0

if(is_string(key)){key = ord(key)}

if(keyboard_check(key)){return true;} else {return false;}

#define exists
if(instance_number(argument0)>0){return true;} else {return false;}

#define mbp
if(mouse_check_button_pressed(argument0)){return true;} else {return false;}