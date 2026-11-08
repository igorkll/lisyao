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
    
    translate([height - screenhole_height - screenhole_offset, (width / 2) - (screenhole_width / 2), -0.5])
        cube([screenhole_height, screenhole_width, thickness + 1]);
    
    translate([label_offset, width / 2, thickness - label_depth])
        linear_extrude(label_depth + 0.01)
            rotate([0, 0, -90])
                offset(delta = 0.08, $fn = 12)
                    text(label_text,
                         size = label_size,
                         halign = "center",
                         valign = "center",
                         font = "Symbola");
    
    for (p = screw_positions)
        translate([p[0], p[1], -0.5])
            cylinder(h = thickness + 1, d = screw_d, $fn = 32);
}
