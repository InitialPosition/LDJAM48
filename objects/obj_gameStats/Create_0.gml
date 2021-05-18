/// @description 

// default new game stats
hitpoints = 10;
maxHitpoints = 10;

nextShopFloor = global.FIRST_SHOP - 1;

objective = "FIX THIS BUG!";

playerSpeed = 3;

currentFloor = 0;

gold = 0;
totalGold = 0;

attackLength = 1.2;

baseAttackSpeed = 20;
attackSpeedLevel = 0;
attackSpeed = max(baseAttackSpeed - attackSpeedLevel, 2);

frames = 0;
timerRunning = true;

batRepellant = 5;
guaranteedBatFloor = irandom_range(2, global.FIRST_SHOP - 1);

currentDifficulty = 1;
difficultyIncrease = 1.05;

godMode = 0

quitTimer = 0;
quitTimerThreshold = 60;
quitBarLength = 50;
