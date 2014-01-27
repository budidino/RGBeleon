--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f94e8f12d6f46c72d337db4d5b1e69cd:d2abeeaffd90eeb7359d7515036f9eda:d80a56aff013b684fbb59b83c63ec4ba$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- Icon
            x=144,
            y=366,
            width=57,
            height=57,

        },
        {
            -- background
            x=2,
            y=2,
            width=480,
            height=320,

        },
        {
            -- glasses
            x=144,
            y=445,
            width=31,
            height=16,

            sourceX = 58,
            sourceY = 11,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grass
            x=2,
            y=324,
            width=480,
            height=37,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 480,
            sourceHeight = 40
        },
        {
            -- grey/grey06
            x=373,
            y=366,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey07
            x=288,
            y=366,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey08
            x=203,
            y=366,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey09
            x=484,
            y=314,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey10
            x=484,
            y=262,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey11
            x=484,
            y=210,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey12
            x=484,
            y=158,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey13
            x=484,
            y=106,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey14
            x=484,
            y=54,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- grey/grey15
            x=484,
            y=2,
            width=83,
            height=50,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 50
        },
        {
            -- pit-back
            x=177,
            y=445,
            width=140,
            height=11,

        },
        {
            -- pit-bottom
            x=2,
            y=363,
            width=140,
            height=98,

        },
        {
            -- pit
            x=144,
            y=425,
            width=140,
            height=18,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 140,
            sourceHeight = 20
        },
        {
            -- predator
            x=319,
            y=418,
            width=100,
            height=41,

            sourceX = 0,
            sourceY = 9,
            sourceWidth = 100,
            sourceHeight = 50
        },
    },
    
    sheetContentWidth = 569,
    sheetContentHeight = 463
}

SheetInfo.frameIndex =
{

    ["Icon"] = 1,
    ["background"] = 2,
    ["glasses"] = 3,
    ["grass"] = 4,
    ["grey/grey06"] = 5,
    ["grey/grey07"] = 6,
    ["grey/grey08"] = 7,
    ["grey/grey09"] = 8,
    ["grey/grey10"] = 9,
    ["grey/grey11"] = 10,
    ["grey/grey12"] = 11,
    ["grey/grey13"] = 12,
    ["grey/grey14"] = 13,
    ["grey/grey15"] = 14,
    ["pit-back"] = 15,
    ["pit-bottom"] = 16,
    ["pit"] = 17,
    ["predator"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
