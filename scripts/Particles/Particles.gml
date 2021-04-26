

function scr_particlesBGMist(hue, sat, val) {
    
    particle = part_type_create();
    
    part_type_blend(particle, true);
    part_type_shape(particle, pt_shape_pixel);
    part_type_alpha3(particle, 0, 1, 0);
    part_type_color_hsv(particle, hue, hue + 30, sat, sat + 30, val, val + 30);
    part_type_size(particle, 2, 2, 0.01, 0);
    part_type_direction(particle, 0, 360, 0, 0);
    part_type_speed(particle, 0.2, 0.3, 0, 0);
    part_type_life(particle, 120, 180);
    
    return particle;
}

function scr_particlesShooterBullet() {
    
    particle = part_type_create();
    
    part_type_blend(particle, true);
    part_type_shape(particle, pt_shape_pixel);
    part_type_alpha2(particle, 1, 0);
    part_type_orientation(particle, 0, 360, 1, 0, 0);
    part_type_color_hsv(particle, 150, 150, 180, 180, 255, 255);
    part_type_size(particle, 4, 6, 0, 0);
    part_type_life(particle, 20, 40);
    
    return particle;
}
