$fn = 128;

wall = 2;
wall_up = 1.5;

screenhole_width = 34.5;
screenhole_height = 44;
screen_board_len = 9;

width = (screenhole_width + 0.5) + (wall * 2);
height = (screenhole_height + screen_board_len) + wall + wall_up;
thickness = wall;

screenhole_offset = -0.2 + wall_up;

// -----------------------------------------------

difference() {
    cube([height, width, thickness]);
    
    translate([height - screenhole_height - screenhole_offset, (width / 2) - (screenhole_width / 2), -0.5])
        cube([screenhole_height, screenhole_width, thickness + 1]);
}
