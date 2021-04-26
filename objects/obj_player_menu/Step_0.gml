/// @description Update function run every frame

PAUSABLE_TRANSITION

scr_playerGetInput();
scr_playerUpdateMovementVectors();
scr_playerCollisionChecks();
scr_playerApplyMovement();
