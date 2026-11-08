$fn = 128;

use <Symbola_old/Symbola.ttf>;

wall = 4;
wall_up = 1.5;

screenhole_width = 34.5;
screenhole_height = 44;
screen_board_len = 9;

width = (screenhole_width + 0.5) + (wall * 2);
height = (screenhole_height + screen_board_len) + wall + wall_up;
thickness = 2;

screenhole_offset = -0.2 + wall_up;

label_size = 5;
label_depth = 0.8;
label_offset = (screen_board_len / 2) + (wall / 2);
label_text = "🎁ЛИСЯО🎈";

image_pos = (height / 2) + 5;
image_depth = 1;
image_size_x = 40;
image_size_y = 40;

sound_hole_diameter = 3;

// -----------------------------------------------

difference() {
    cube([height, width, thickness]);
    
    translate([label_offset, width / 2, thickness - label_depth])
        linear_extrude(label_depth + 0.01)
            rotate([0, 0, -90])
                text(label_text,
                     size = label_size,
                     halign = "center",
                     valign = "center",
                     font = "Symbola");
    
    translate([image_pos, width / 2, thickness - 0.9])
        rotate([0, 0, -90])
            resize([image_size_y, image_size_x, image_depth])
                surface(file = "bodyimage.png", center = true, convexity = 5);
    
    translate([label_offset, width / 2, -0.1])
        cylinder(h = (thickness - label_depth) + 0.11, d = sound_hole_diameter);
}
