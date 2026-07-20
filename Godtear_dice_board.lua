DICE_BAG = "cba1af"
local spawnedDice = {} --object for tracking dice spawned with tool (for deletion)
local defaultCameraVector = {0, 0 , 1}

function onLoad()
    self.clearButtons()
    
    --Initialize Dice Board Buttons
    local rowXPosition =  {-.18, .44, 1.02, 1.68, 2.3}
    for i = 1, 10 do

        _G["buttonClick_" .. i] = function(obj, player_color, alt_click)
            rollDice(i, obj, player_color, alt_click)
        end

        if i < 6 then
            self.createButton({
                click_function = "buttonClick_" .. i,
                function_owner = self,
                label = tostring(i),
                position = {rowXPosition[i], .2, -.4},
                width = 250,
                height = 250,
                font_size = 70,
                tooltip = "Roll " .. i .. " dice"
            })
        else
            self.createButton({
                click_function = "buttonClick_" .. i,
                function_owner = self,
                label = tostring(i),
                position = {rowXPosition[i - 5], .2, .5},
                width = 250,
                height = 250,
                font_size = 70,
                tooltip = "Roll " .. i .. " dice"
            })
        end
    end
end

function rollDice(numDice, obj, player_color, alt_click)
    local diceBag = getObjectFromGUID(DICE_BAG)
    if not diceBag then
        print("Error finding dice bag.")
        return
    end

    local basePosition = self.getPosition()
    local baseRotation = self.getRotation()

    clearDice()

    local forward = self.getTransformForward()
    local dot = forward.x * defaultCameraVector[1] 
                + forward.y * defaultCameraVector[2]
                + forward.z * defaultCameraVector[3]
    local facingPlayerTwo = dot > 0

    for i = 1, numDice do
        local column = (i - 1) % 3
        local row = math.floor((i - 1) / 3)

        local sideModifier = facingPlayerTwo and 1 or -1
        local localOffset = {
            sideModifier * (4 + (column * 1.5)),
            3,
            row * -1.5
        }
                
        local spawnPosition = self.positionToWorld(localOffset)

        local die = diceBag.takeObject({
            position = spawnPosition,
            rotation = {0, 0, 0},
            smooth = false
        })

        if die ~= nil then
            table.insert(spawnedDice, die) --tracking spawned dice
            Wait.frames(function()
                die.randomize()
            end, 5)
        end
    end
end

function clearDice()
    for _, die in ipairs(spawnedDice) do
        if die ~= nil and die.isDestroyed() == false then
            die.destruct()
        end
    end
    spawnedDice = {}
end
