$fn = 128;

use <Symbola_old/Symbola.ttf>;

wall = 1;
wall_down = 4;

margin = 0.5;

screenhole_width = 34.5 - margin;
screenhole_height = 44 - margin;
thickness = 1;

// -----------------------------------------------

difference() {
    cube([screenhole_height, screenhole_width, thickness]);
    
    translate([wall, wall, -0.5])
        cube([screenhole_height - wall_down - wall, screenhole_width - (wall * 2), thickness + 1]);
}
