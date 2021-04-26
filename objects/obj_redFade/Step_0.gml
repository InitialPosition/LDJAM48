/// @description 

if (fading) {
    a -= 0.01;
    
    if (a <= 0) {
        instance_destroy();
    }
}