#define vision_cone
/*
caculate and draw vision cone
get all surrounding objects

*/

if(exists(radd)){
    
    width = 20; //this is the width of the vision cone *2
    
    x2 = lengthdir_x(radd.rad, direction - width)
    y2 = lengthdir_y(radd.rad, direction - width)
    
    x1 = lengthdir_x(radd.rad, direction + width)
    y1 = lengthdir_y(radd.rad, direction + width)
    
    dir = direction;

    frequency--;
    if(frequency<=0){
        frequency = base_frequency;
        var rad = 15;
        
        for(diff=-width;diff<=width;diff+=1){
            //diff--;
            var active = true;
            
            for(ii=0;ii<radd.rad;ii+=16){
                
                if(active){
                    x3 = lengthdir_x(ii, (dir) + diff)
                    y3 = lengthdir_y(ii, (dir) + diff)
                    detected_obj = collision_point(x + x3, y + y3, oent, true, true)
                    
                    if(exists(detected_obj)){
                        add_detected()
                        //stop = true;
                        if(!is_item(detected_obj)){
                            break;
                        }
                    }
                    
                    
                    draw_circle(x+x3, y+y3, 1, false)
                    
                }
                active = !active;
                
            }
        }
    
        draw_vision_cone()
    }

//}  
}




#define draw_vision_cone
//draw the actual cone
if(id.draw_cone){
    draw_line(x, y, x + x1, y + y1)
    draw_line(x, y, x + x2, y + y2)
    
    draw_set_alpha(0.3)
    draw_triangle(x, y, x + x1, y + y1, x + x2, y + y2, false)
    draw_set_alpha(1)
    //draw_circle(x, y, radd.rad, true)
    
    if(collision_line(x, y, x3, y3, ounit, true, true)){
        draw_set_color(c_lime)
    }
    
    //draw_arrow(x, y, x + x3, y + y3, 25)
}

#define add_detected
///
//if(id==o.player and exists(detected_obj)){detected_obj.image_blend = c_red;;}

if(exists(detected_obj)){
    //check whether the object is already detected or not
    exist = false
    for(i=1;i<array_length_1d(detected_objects);i++){
        if(detected_obj.id == detected_objects[i]){
            exist = true;
        }
    }
    //if the object is not already detected, add it to detected_objects
    if(!exist){id.detected_objects[array_length_1d(id.detected_objects)] = id.detected_obj;}
    
    //instance_destroy(detected_objects[i]);
}

#define vision_radius
/*

*/

var xx, yy, xx2, yy2, p, pp;
xx = 0;
yy = 0;
yy2 = 0
xx2 = 0
radius_frequency--;
p = 16;
pp = 32;

if(o.player==id){
    //draw_radius=true;
}

if(exists(radd) and (radius_frequency<=0)){
    //radius_frequency = base_frequency;
    //move the line around    
    //detect following the line
    rad_direction+=random(p); 
    
    for(ii=64;ii<radd.rad;ii+=pp){
        //
        xx = lengthdir_x(ii, rad_direction)
        yy = lengthdir_y(ii, rad_direction)
        //check point for entities
        detected_obj = collision_point(x + xx, y + yy, oent, true, true)
        if(exists(detected_obj)){add_detected()}
        
        //draw collision point
        if(draw_radius){
            draw_set_color(theme_col)
            if(detected_obj){draw_set_color(c_red)}
            draw_circle(x + xx, y+ yy, 5, false)
        }
        //
        xx2 = lengthdir_x(-ii, rad_direction)
        yy2 = lengthdir_y(-ii, rad_direction)
        //check point for entities
        detected_obj = collision_point(x + xx2, y + yy2, oent, true, true)
        if(exists(detected_obj)){add_detected();}
        
        //draw collision point
        if(draw_radius){
            draw_set_color(theme_col)
            if(detected_obj){draw_set_color(c_red); }
            draw_circle(x + xx2, y+ yy2, 5, false)
        }
        
        

        
    
    }

}
//draw radius circle
if(draw_radius){
    draw_set_color(theme_col)
    draw_line_width(x, y, x+xx, y+yy, 2)
    draw_circle(x, y, radd.rad, true)
    draw_line_width(x, y, x+xx2, y+yy2, 2)
    
}


    





#define collision_line_first
/// collision_line_first(x1,y1,x2,y2,object,prec,notme)
//
//  Returns the instance id of an object colliding with a given line and
//  closest to the first point, or noone if no instance found.
//  The solution is found in log2(range) collision checks.
//
//      x1,y2       first point on collision line, real
//      x2,y2       second point on collision line, real
//      object      which objects to look for (or all), real
//      prec        if true, use precise collision checking, bool
//      notme       if true, ignore the calling instance, bool
//
/// GMLscripts.com/license
{
    var ox,oy,dx,dy,object,prec,notme,sx,sy,inst,i;
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = dx - ox;
    sy = dy - oy;
    inst = collision_line(ox,oy,dx,dy,object,prec,notme);
    if (inst != noone) {
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            i = collision_line(ox,oy,dx,dy,object,prec,notme);
            if (i) {
                dx -= sx;
                dy -= sy;
                inst = i;
            }else{
                dx += sx;
                dy += sy;
            }
        }
    }
    return inst;
}
#define vision_cone_2
/*
caculate and draw vision cone
get all surrounding objects

*/

if(exists(radd)){
    
    width = 40; //this is the width of the vision cone *2
    
    //x2 = lengthdir_x(radd.rad, direction - width)
    //y2 = lengthdir_y(radd.rad, direction - width)
    
    //x1 = lengthdir_x(radd.rad, direction + width)
    //y1 = lengthdir_y(radd.rad, direction + width)
    
    dir = direction;

    frequency--;
    if(frequency<=0){
        //frequency = base_frequency;
        var rad = radd.rad;
        
        for(diff=-width;diff<=width;diff+=0.5){
            //diff--;
            var active = true;
            
            //for(ii=0;ii<radd.rad;ii+=16){

                if(active){
                    x3 = lengthdir_x(rad, (dir) + diff)
                    y3 = lengthdir_y(rad, (dir) + diff)
                    detected_obj = collision_line_first(x, y, x + x3, y + y3, oent, true, true)
                    //rad /= rad
                    if(exists(detected_obj)){
                        add_detected()
                        //stop = true;
                        if(detected_obj.object_index!=oitem){
                            //break;
                        }
                    }
                    draw_line(x, y, x+x3, y+y3)
                }
                //active = !active;
                
            //}
        }
    
        //draw_vision_cone()
    }

//}  
}




#define vision_cone_3
 /*
caculate and draw vision cone
get all surrounding objects

*/
if(exists(radd)){
    width = 20; //this is the width of the vision cone *2
    x2 = lengthdir_x(radd.rad, direction - width)
    y2 = lengthdir_y(radd.rad, direction - width)
    x1 = lengthdir_x(radd.rad, direction + width)
    y1 = lengthdir_y(radd.rad, direction + width) 
    var ray_num = 6; //should set this number based on how many units are in radius/view 
    dir = direction;
    frequency--;
    if(frequency<=0){
        //frequency = base_frequency;
        //var rad = 15;
        for(diff=-width;diff<=width;diff+=ray_num){
            //diff--;
            var active = true;
            //for(ii=0;ii<radd.rad;ii+=16){
                if(active){
                    x3 = lengthdir_x(radd.rad, (dir) + diff)
                    y3 = lengthdir_y(radd.rad, (dir) + diff)
                    detected_obj = collision_line_first(x, y, x + x3, y + y3, oent, true, true)
                    //detected_obj = check_line(x, y, x+x3, y+y3, oent)
                    if(exists(detected_obj)){
                        add_detected()
                        //stop = true;
                        if(!is_item(detected_obj)){
                            //ii=radd.rad;
                            //break;
                        }
                    }
                }
                //active = !active;
            //}
        }
        
    }
    //draw_vision_cone()
//}  
}




#define check_line
/// check_line(startx, starty, endx, endy, object)
var startx, starty, endx, endy, object;
startx = argument[0]
starty = argument[1]
endx = argument[2]
endy = argument[3]
object = argument[4]
distx = endx - startx;
disty = endy - starty;
ent = collision_line(startx, starty, endx, endy, object, true, true);
draw_set_color(c_white)
if(ent){
    while(abs(distx)>=1 || abs(disty)>=1){
        distx /= 2;
        disty /= 2;
        i = collision_line(startx, starty, endx, endy, object, true, true);
        if(exists(i) and i.object_index==oitem){
            //instance_deactivate_object(i)
            //ii = collision_line(startx, starty, endx, endy, object, true, true);
            //instance_activate_object(i)
            i=ii
        }
        //draw_set_color(c_black)
        //draw_line(endx+distx, endy+disty, endx+x3, endy+y3)
        draw_set_color(c_red)
        if(i){
            endx -= distx;
            endy -= disty;
            ent = i;
        } else{
            endx += distx;
            endy += disty;   
        }
    }
}
if(draw_cone){draw_line(startx, starty, endx, endy);}
return ent;

#define vision
//calculate and draw vision cone
if(exists(radd)){
    
    var width = 20;
    
    x2 = lengthdir_x(radd.rad, direction - width)
    y2 = lengthdir_y(radd.rad, direction - width)
    
    x1 = lengthdir_x(radd.rad, direction + width)
    y1 = lengthdir_y(radd.rad, direction + width)
    
    var dir = direction;
    
    if(x3 == noone){x3 = x1;}
    if(y3 == noone){y3 = y1;}
    
    if(diff < -width){
    
        turn = 1;
        draw_set_color(c_aqua)
    } 
    
    if(diff > width){
    
        turn = 0;
        draw_set_color(c_white)
    } 
    
    x3 = lengthdir_x(radd.rad, (dir) + diff)
    y3 = lengthdir_y(radd.rad, (dir) + diff)
    
    if(turn == 0){
        diff--;
        detected_obj = collision_line(x + x3, y + y3, x, y, oent, true, true)
        
    } else 
    
    if(turn == 1){
        diff++;
        detected_obj = collision_line(x + x3, y + y3, x, y, oent, true, true)
    }
    
    add_detected()

    if(id.draw_cone){
        draw_line(x, y, x + x1, y + y1)
        draw_line(x, y, x + x2, y + y2)
        
        draw_set_alpha(0.3)
        draw_triangle(x, y, x + x1, y + y1, x + x2, y + y2, false)
        draw_set_alpha(1)
        //draw_circle(x, y, radd.rad, true)
        
        if(collision_line(x, y, x3, y3, ounit, true, true)){
            draw_set_color(c_lime)
        }
        
        draw_arrow(x, y, x + x3, y + y3, 25)
    }
}