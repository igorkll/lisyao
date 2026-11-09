$fn = 128;

use <Symbola_old/Symbola.ttf>;

wall = 1.25;
wall_down = 4;
wall_up = 3;

margin = 0.25;
margin_height = 0.3;

screenhole_width = 34.5 - margin;
screenhole_height = 44 - margin_height;
thickness = 1;

// -----------------------------------------------

difference() {
    cube([screenhole_height, screenhole_width, thickness]);
    
    translate([wall_up, wall, -0.5])
        cube([screenhole_height - wall_down - wall_up, screenhole_width - (wall * 2), thickness + 1]);
}
