///move player character by mouse

var mbr = mbp(mb_right);


if(mbr){
    if(exists(mark)){instance_destroy(mark);}
    mark = crt(mouse_x, mouse_y, omark)
}

if(exists(mark)){act_moveto(mark)}
var mbr = mbp(mb_right)


