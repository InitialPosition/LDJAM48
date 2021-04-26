/// @description Disable auto flicker

image_speed = 0;

// find a suitable space
x = random_range(128, 480);
y = random_range(128, 288);
        
while ((place_meeting(x, y, obj_wall)) || (place_meeting(x, y, obj_nextFloorButton)) || (place_meeting(x, y, obj_spikes)) || (place_meeting(x, y, obj_nextFloorTeleport)) || (distance_to_object(obj_player) < 100 || (distance_to_object(instance_nearest(x, y, obj_nextFloorButton)) < 100))) {
    x = random_range(128, 480);
    y = random_range(128, 288);
}

hp = 1;
