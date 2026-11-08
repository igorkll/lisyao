$fn = 128;

use <Symbola_old/Symbola.ttf>;

wall = 4;
wall_up = 1.5;

screenhole_width = 34.5;
screenhole_height = 44;
screen_board_len = 9;

width = (screenhole_width + 0.5) + (wall * 2);
height = (screenhole_height + screen_board_len) + wall + wall_up;
thickness = 18;

port_offset_top = 6.5;
port_offset_left = 10;
port_width = 13;
port_height = 8;

screw_d         = 2.4;   // отверстие под M2 (для самореза M2 -> 1.7)
screw_inset     = 2.5;     // отступ от краёв
screw_positions = [
    [screw_inset,     screw_inset],
    [screw_inset,     width - screw_inset],
    [height - screw_inset, screw_inset],
    [height - screw_inset, width - screw_inset],
];

// -----------------------------------------------

difference() {
    cube([height, width, thickness]);
    
    translate([wall, wall, -1])
        cube([height - wall - wall_up, width - (wall * 2), thickness + 2]);
    
    translate([height - wall_up - 1, width - wall, 0])
        cube([wall_up + 2, 10, 10]);
    
    for (p = screw_positions)
        translate([p[0], p[1], -0.5])
            cylinder(h = thickness + 1, d = screw_d, $fn = 32);
}
