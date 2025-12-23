local spawn = {x = 0, z = 0};
local current_location = {x = 0, z = 0};
local target_A = {x = 0, z = 7}
local target_B = {x = -7, z = 0}
local block_A = {x = 0, z = 4}
local block_B = {x = -4,z = 0}

function zTraverse(target, current_location,block)
    for i = 1,target.z do 
        current_location.z = current_location.z + 1
        turtle.forward()
        if current_location.z == block.z then
            print("breaking block")
            turtle.dig()
        end
    end
    print ("current location is ", current_location.x, current_location.z)
    turtle.place()
    return current_location 
end

function zReturn(current_location, spawn)
    for i = -6,spawn.z do
        current_location.z = current_location.z - 1
        turtle.back()
    end
    print ("current location is ", current_location.x, current_location.z)
    return current_location
end

function xTraverse(target, current_location,block)
    for i = target.x,-1 do 
        current_location.x = current_location.x - 1
        turtle.forward()
        if current_location.x == block.x then
            print("breaking block")
            turtle.dig()
        end
    end
    print("current location is ", current_location.x, current_location.z)
    turtle.place()
    return current_location
end

function xReturn (current_location, spawn)
    for i = spawn.x,6 do 
        current_location.x = current_location.x + 1
        turtle.back()
    end;
    print ("current location is ", current_location.x, current_location.z)
    return current_location
end

function checkFuel()
    if turtle.getFuelLevel() == turtle.getFuelLimit() then
        turte.select(2)
        return true
    else
        turtle.select(1)
        turtle.refuel()
        turtle.select(2)
        return false
    end
end;

function reset()
    print("reseting")
    turtle.select(3)
    turtle.dropDown()
    turtle.select(1)
end

function workflow()
    -- Buffer timer to ensure that enderdragon death animation isn't being played while end-crystals are bieng placed
    sleep(10)
    -- Refuel if required 
    checkFuel();
    -- Traverse Z dimension
    zTraverse(target_A, current_location, block_A);
    zReturn(current_location, spawn);
    turtle.turnRight();
    -- Traverse X dimension
    xTraverse(target_B, current_location, block_B);
    xReturn(current_location, spawn);
    turtle.turnLeft();
    -- Drop mined blocks from end spawn.
    reset();
end

function main()
    while true do
        os.pullEvent("redstone")
        if redstone.getInput("back") then
            print("Signal received, running script")
            workflow()
            sleep(3)
        end
    end
end

main();

