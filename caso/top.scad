$fn = 128;

use <Symbola_old/Symbola.ttf>;

wall = 4;
wall_up = 1.5;

screenhole_width = 34.5;
screenhole_height = 44;
screen_board_len = 9;

width = (screenhole_width + 0.5) + (wall * 2);
height = (screenhole_height + screen_board_len) + wall + wall_up;
thickness = wall;

screenhole_offset = -0.2 + wall_up;

label_size = 5;
label_depth = 0.8;
label_offset = (screen_board_len / 2) + (wall / 2);
label_text = "🎁ЛИСЯО🎈";

// -----------------------------------------------

difference() {
    cube([height, width, thickness]);
    
    translate([height - screenhole_height - screenhole_offset, (width / 2) - (screenhole_width / 2), -0.5])
        cube([screenhole_height, screenhole_width, thickness + 1]);
    
    translate([label_offset, width / 2, thickness - label_depth])
        linear_extrude(label_depth + 0.01)
            rotate([0, 0, -90])
                text(label_text,
                     size = label_size,
                     halign = "center",
                     valign = "center",
                     font = "Symbola");
}
