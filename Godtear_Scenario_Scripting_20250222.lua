--Paste custom scenario array in the braces!
YOUR_CUSTOM_SCENARIO = {}

--Global GUIDs
HEXBAG_GUID = "c219f1"
BOARD_GUID = "3efde7"
SCEN_ZONE = "6a40d3"

--Scenario GUIDS
LIFE_CARD = "3f1dc6"
DEATH_CARD = "5a8c3a"
CHANGE_CARD = "db7b77"
CHAOS_CARD = "d01266"
KNOWLEDGE_CARD = "a67cb9"
QUEST_CARD = "90ed70"
CONSTRUCTION_CARD = "13b6c4"
CUSTOM_CARD = "cf9856"
BlueToken = "87fd37"
YellowToken = "93d3e7"

--FANMADE Scenario GUIDS
PLENTY_CARD = "2de877"
TRADE_CARD = "d403dc"
FANDEATH_CARD = "9e8bdb"
FANCHANGE_CARD = "0e827b"
FANKNOWLEDGE_CARD = "9d57d7"
FANCHAOS_CARD = "fdbc96"
FANCONSTRUCTION_CARD = "754d70"

--Draft Automation GUIDs
DRAFT_BOARD ="535075"
GUARDIAN_DRAFTBAG = "9cdb97"
MAELSTROM_DRAFTBAG = "c7ffd9"
SHAPER_DRAFTBAG = "0c01be"
SLAYER_DRAFTBAG = "856624"


function onLoad()

    --Initialize Setup Button
    local buttonPrep = { }
    buttonPrep.click_function ="setUpHexes"
    buttonPrep.function_owner = nil
    buttonPrep.label = "Setup Scenario"
    buttonPrep.width = 600
    buttonPrep.height = 250
    buttonPrep.position = {0.75, 0.2, 0.55}
    buttonPrep.font_size = 70
    getObjectFromGUID("013cb6").createButton(buttonPrep)

    --Initialize Draft Button
    local draftButton = { }
    draftButton.click_function ="setUpDraft"
    draftButton.function_owner = nil
    draftButton.label = "Setup Draft"
    draftButton.width = 250
    draftButton.height = 55
    draftButton.position = {0.5, 0.2, -0.75}
    draftButton.font_size = 30
    getObjectFromGUID("535075").createButton(draftButton)

end

-- Scenario Hex Placement Loop
function makeMap(token1_pos, token2_pos, scenario_array)
    Token1.setPosition({-18.71, 3, token1_pos})
    Token2.setPosition({-18.71, 3, token2_pos})
    for i, v in pairs(scenario_array) do
        hexBag.takeObject({position = {v[1], 1.68, v[2]}, rotation = {0, 270, 0}}).setLock(true)
    end
end

function setUpHexes()
    hexBag = getObjectFromGUID(HEXBAG_GUID)
    Token1 = getObjectFromGUID(BlueToken)
    Token2 = getObjectFromGUID(YellowToken)
    hexBag.randomize()

    --Life Scenario Setup
    if readZone().guid == LIFE_CARD then
        local life_array = {{0.23, 1.16}, {2.78, 1.16}, {-1.05, -1.13}, {1.5, -1.13}}
        makeMap(-13.02, 13.04, life_array)
    end

    --Death Scenario Setup
    if readZone().guid == DEATH_CARD then
        local death_array = {{0.23, 1.16}, {2.78, 1.16}, {-1.05, -1.13}, 
                                {1.5, -1.13}, {-12.52, 1.16}, {-13.8, -1.13}, {-11.25, -1.13}, 
                                {12.98, 1.16}, {15.53, 1.16}, {14.25, -1.13}}
        makeMap(-13.02, 13.04, death_array)
    end    

    --Change Scenario Setup
    if readZone().guid == CHANGE_CARD then
        local change_array = {{0.23, 1.16}, {2.78, 1.16}, 
                                {-1.05, -1.13}, {1.5, -1.13}, {-12.52, 1.16}, {-13.8, -1.13}, 
                                {15.53, 1.16}, {14.25, -1.13}}
        makeMap(-11.9, 11.96, change_array)
    end    

    --Knowledge Scenario Setup
    if readZone().guid == KNOWLEDGE_CARD then
        local knowledge_array = {{-9.97, -3.26}, {-8.7, -1.13}, {-7.42, 1.16}, {-6.15, 3.29}, 
                                    {7.88, -3.26}, {9.15, -1.13}, {10.43, 1.16}, {11.7, 3.29}}
        makeMap(-10.72, 10.73, knowledge_array)
    end    

    --Quest Scenario Setup
    if readZone().guid == QUEST_CARD then
        local quest_array = {{-9.97, 5.58}, {-7.42, 5.58}, {10.43, 5.58}, {12.98, 5.58}, 
                                {-11.25, -5.55}, {-8.7, -5.55}, {9.15, -5.55}, {11.7, -5.55}}
        makeMap(-9.5, 9.45, quest_array)
    end    

    --Chaos Scenario Setup
    if readZone().guid == CHAOS_CARD then
        local chaos_array = {{-4.87, 1.16}, {-6.15, -1.13}, {7.88, 1.16}, {6.6, -1.13}}
        makeMap(-9.5, 9.45, chaos_array)
    end    

    --Construction Scenario Setup
    if readZone().guid == CONSTRUCTION_CARD then
        local construction_array = {{-9.97, 1.16}, {-8.7, -1.13}, {-4.87, 1.16}, 
                                        {1.5, 3.29}, {0.23, 1.16}, {-1.05, -1.13}, 
                                        {2.78, 1.16}, {1.5, -1.13}, {0.23, -3.26}, 
                                        {6.6, -1.13}, {10.43, 1.16}, {11.7, -1.13}}
        makeMap(-11.9, 11.96, construction_array)
    end
    
    --FANMADE SCENARIO SETUPS

    --Custom Scenario Setup
    if readZone().guid == CUSTOM_CARD then
        makeMap(-13.02, 13.04, YOUR_CUSTOM_SCENARIO)
    end
    
    --Fanmade Plenty Scenario Setup
    if readZone().guid == PLENTY_CARD then
        local plenty_array = {{-11.25, -1.13}, {-8.7, -1.13}, {-7.42, 1.16}, 
                                {-1.05, -1.13}, {1.5, -1.13}, {0.23, 1.16}, {2.78, 1.16}, 
                                {9.15, -1.13}, {10.43, 1.16}, {12.98, 1.16}}
        makeMap(-9.5, 9.45, plenty_array)
    end   
    
    --Fanmade Trade Scenario Setup
    if readZone().guid == TRADE_CARD then
        local trade_array = {{-9.97, 1.16}, {-7.42, 1.16}, {-11.25, -1.13}, {-8.7, -1.13}, 
                                {-3.6, -1.13}, {-1.05, -1.13}, {-2.32, -3.26}, {0.23, -3.26}, 
                                {1.5, 3.29}, {4.05, 3.29}, {2.78, 1.16}, {5.33, 1.16}, 
                                {10.43, 1.16}, {12.98, 1.16}, {9.15, -1.13}, {11.7, -1.13}}
        makeMap(-8.26, 8.18, trade_array)
    end
    
    --Fanmade Death 2v2 Scenario Setup
    if readZone().guid == FANDEATH_CARD then
        local death_array = {{-6.15, -1.13}, {-4.87, 1.16}, {-3.6, -1.13}, 
                                {5.33, 1.16}, {7.88, 1.16}, {6.6, -1.13}}
        makeMap(-13.02, 13.04, death_array)
    end  
    
    --Fanmade 2v2 Change Scenario Setup
    if readZone().guid == FANCHANGE_CARD then
        local fanchange_array = {{-7.42, 1.16}, {-4.87, 1.16}, {-8.7, -1.13}, {-6.15, -1.13}, 
                                    {7.88, 1.16}, {10.43, 1.16}, {6.6, -1.13}, {9.15, -1.13}}
        makeMap(-11.9, 11.96, fanchange_array)
    end   

    --Fanmade 2v2 Knowledge Scenario Setup
    if readZone().guid == FANKNOWLEDGE_CARD then
        local knowledge_array = {{-7.42, -3.26}, {-6.15, -1.13}, {-4.87, 1.16}, {-3.6, 3.29}, 
                                    {5.33, -3.26}, {6.6, -1.13}, {7.88, 1.16}, {9.15, 3.29}}
        makeMap(-10.72, 10.73, knowledge_array)
    end  

    --Fanmade 2v2 Chaos Scenario Setup
    if readZone().guid == FANCHAOS_CARD then
        local chaos_array = {{-3.6, -1.13}, {-2.32, 1.16}, {4.05, -1.13}, {5.33, 1.16}}
        makeMap(-9.5, 9.45, chaos_array)
    end   

    --Fanmade Construction 2v2 Scenario Setup
    if readZone().guid == FANCONSTRUCTION_CARD then
        local construction_array = {{-4.87, 1.16}, 
                                        {1.5, 3.29}, {0.23, 1.16}, {-1.05, -1.13}, 
                                        {2.78, 1.16}, {1.5, -1.13}, {0.23, -3.26}, 
                                        {6.6, -1.13}}
        makeMap(-11.9, 11.96, construction_array)
    end
end

--Reads Scenario Zone Card
function readZone()
    local zone = getObjectFromGUID(SCEN_ZONE)
    local zoneObjects = zone.getObjects()
    
    for _, item in ipairs(zoneObjects) do
        if item.tag == 'Card' then
            return item
        end
    end
    return nil
end

--Execute Draft Setup
function setUpDraft()
    local GuarDraftBag = getObjectFromGUID(GUARDIAN_DRAFTBAG)
    local MaelDraftBag = getObjectFromGUID(MAELSTROM_DRAFTBAG)
    local ShapDraftBag = getObjectFromGUID(SHAPER_DRAFTBAG)
    local SlayDraftBag = getObjectFromGUID(SLAYER_DRAFTBAG)
    
    GuarDraftBag.randomize()
    GuarDraftBag.takeObject({position = {75.41, 1.64, -2.87}, rotation = {0, 270, 0}})
    GuarDraftBag.takeObject({position = {75.41, 1.64, -6.47}, rotation = {0, 270, 0}})
    GuarDraftBag.takeObject({position = {75.41, 1.64, -10.11}, rotation = {0, 270, 0}})

    MaelDraftBag.randomize()
    MaelDraftBag.takeObject({position = {72.59, 1.64, -2.87}, rotation = {0, 270, 0}})
    MaelDraftBag.takeObject({position = {72.59, 1.64, -6.47}, rotation = {0, 270, 0}})
    MaelDraftBag.takeObject({position = {72.59, 1.64, -10.11}, rotation = {0, 270, 0}})

    ShapDraftBag.randomize()
    ShapDraftBag.takeObject({position = {69.78, 1.64, -2.87}, rotation = {0, 270, 0}})
    ShapDraftBag.takeObject({position = {69.78, 1.64, -6.47}, rotation = {0, 270, 0}})
    ShapDraftBag.takeObject({position = {69.78, 1.64, -10.11}, rotation = {0, 270, 0}})

    SlayDraftBag.randomize()
    SlayDraftBag.takeObject({position = {66.98, 1.64, -2.87}, rotation = {0, 270, 0}})
    SlayDraftBag.takeObject({position = {66.98, 1.64, -6.47}, rotation = {0, 270, 0}})
    SlayDraftBag.takeObject({position = {66.98, 1.64, -10.11}, rotation = {0, 270, 0}})

end
