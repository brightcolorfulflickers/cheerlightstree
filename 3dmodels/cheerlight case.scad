/* Cheerlight Christmas Tree Electronics Box
 *
 * brightcolorfulflickers.tumblr.com
 * instagram.com/brightcolorfulflickers
 * github.com/brightcolorfulflickers
 * instructables.com/member/brightcolorfulflickers/
 * 
 * Dec 2016
 */

wallthick = 1.5;
fnval = 100;
box_width = 91;
box_depth = 57;
box_height = 38;
lid_height = 10;

lightplug_width = 13;
lightplug_height = 13;
lightplug_depth = wallthick;

lightplug_xtranslate = (box_width-lightplug_width)/2;
lightplug_ytranslate = box_depth;
lightplug_ztranslate = (box_height-lightplug_height)/2;

dcjack_r = 8.1/2;

dcjack_xtranslate = (box_width-2*dcjack_r)/2+dcjack_r;
dcjack_ytranslate = 0;
dcjack_ztranslate = (box_height-2*dcjack_r)/2+dcjack_r;

tolerance = .1;

box();
*translate([0,0,lid_height]) rotate([0,180,0]) lid();
// * disables a command, so disable one at a time to render box and lid separately

module lid() {
    difference() {
        cube([box_width+wallthick*2,box_depth+wallthick*2,lid_height], center=false);
        translate([wallthick+tolerance,wallthick+tolerance,0]) cube([box_width+tolerance*2,box_depth+tolerance*2,lid_height-wallthick], center=false);
    }
}

module box() {
    difference() {
        cube([box_width,box_depth,box_height], center=false);
        translate([wallthick,wallthick,wallthick]) cube([box_width-2*wallthick,box_depth-2*wallthick,box_height], center=false);
        translate([lightplug_xtranslate,lightplug_ytranslate,lightplug_ztranslate]) cube([lightplug_width, lightplug_depth, lightplug_height],center=false);
        translate([dcjack_xtranslate,dcjack_ytranslate,dcjack_ztranslate]) rotate([270,0,0]) cylinder(wallthick*1.1, dcjack_r, dcjack_r, false, $fn=fnval);
    }

}



