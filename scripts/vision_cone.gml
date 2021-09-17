#define vision_cone
/*
caculate and draw vision cone
get all surrounding objects
we need to check every single pixel-line between width and -width
*/


if(exists(radd)){
    

    width = 20; //this is the width of the vision cone *2
    
    x2 = lengthdir_x(radd.rad, direction - width)
    y2 = lengthdir_y(radd.rad, direction - width)
    
    x1 = lengthdir_x(radd.rad, direction + width)
    y1 = lengthdir_y(radd.rad, direction + width)
    
    dir = direction;
    
   
    /*
    if(diff < -width){
    
        turn = 1;
        draw_set_color(c_aqua)
    } 
    
    //if(diff > width){
    
        turn = 0;
        draw_set_color(c_white)
    } 
    
    if(x3 == noone){x3 = x1;}
    if(y3 == noone){y3 = y1;}
    */
    // = lengthdir_x(radd.rad, (dir) + diff)
    // = lengthdir_y(radd.rad, (dir) + diff)
//------------------------------------------------------------------
    //if(turn == 0){
        //var stop = false;
        var rad = 15;
        
        
        for(diff=-width;diff<=width;diff+=5){
            //diff--;
            var active = true;
            
            for(ii=0;ii<radd.rad;ii+=32){
                
                if(active){
                    x3 = lengthdir_x(ii, (dir) + diff)
                    y3 = lengthdir_y(ii, (dir) + diff)
                    detected_obj = collision_circle(x + x3, y + y3, rad, oent, true, true)
                    
                    if(exists(detected_obj)){
                        add_detected()
                        //stop = true;
                        if(detected_obj.object_index!=oitem){
                            break;
                        }
                    }
                    
                    
                    draw_circle(x+x3, y+y3, rad, false)
                }
                active = !active;
                
            }
        }
        
        draw_vision_cone()
    
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
if(id==o.player and exists(detected_obj)){detected_obj.image_blend = c_red;;}

if(exists(detected_obj)){
    //check whether the object is already detected or not
    exist = false
    for(i=1;i<array_length_1d(detected_objects);i++){
        if(detected_obj.id == detected_objects[i]){
            exist = true;
        }
    }
    //if the object is not already detected, add it to detected_objects
    if(!exist){detected_objects[array_length_1d(detected_objects)] = detected_obj;}
    
    //instance_destroy(detected_objects[i]);
}
