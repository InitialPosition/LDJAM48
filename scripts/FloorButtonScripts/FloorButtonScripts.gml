function scr_floorButtonInit() {
    image_speed = 0;

    minButtonDistance = 64;
    minOtherDistance = 32;
    
    number = instance_number(obj_nextFloorButton);
    
    // find a suitable space
    do {
        x = random_range(128, 480);
        y = random_range(128, 288);
        
        // snap to grid
        move_snap(32, 32);
        
        nextButton = scr_getNextButtonThatIsNotSelf();
    } until (   !place_meeting(x, y, obj_wall) && 
                !place_meeting(x, y, obj_spikes) &&
                distance_to_object(instance_nearest(x, y, obj_hurt)) >= minOtherDistance && 
                distance_to_object(obj_nextFloorTeleport) >= minOtherDistance && 
                distance_to_object(obj_player) >= minOtherDistance &&
                distance_to_object(instance_nearest(x, y, obj_shooter)) >= minOtherDistance &&
                distance_to_object(nextButton) >= minButtonDistance);
    
    hp = 1;
}

function scr_getNextButtonThatIsNotSelf() {
    // save instance x position
    var _x = x;
    
    // move instance far away
    x -= 10000000;
    
    // search for next instance using saved var. this will return the next object that isnt the caller.
    var _inst = instance_nearest(_x, y, obj_nextFloorButton);
    
    // return the object to its original position
    x = _x;
    
    // return if we found a new instance
    if _inst != id && _inst != noone {
        return _inst;
    }
    return self;
}