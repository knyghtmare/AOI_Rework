local _ = wesnoth.textdomain "wesnoth-AOI_Rework"

-- first, we take all xp_gainers
local xp_gainers = wesnoth.units.find_on_map { side = wesnoth.current.side }

-- create a for loop  
for i, xp_gainer in ipairs(xp_gainers) do
    -- scroll to each one
    wesnoth.interface.scroll_to_hex(xp_gainer.x, xp_gainer.y)

    -- state how much XP you want to add
    local xp_to_add = math.floor(xp_gainer.max_experience/2)

    if xp_to_add > 0 then
        xp_gainer.experience = xp_gainer.experience + xp_to_add
        wesnoth.interface.float_label(xp_gainer.x, xp_gainer.y, "<span color='cyan'>" .. tostring(_ "+%d XP"):format(xp_to_add) .. "</span>")
        if xp_gainer.experience >= xp_gainer.max_experience then
            xp_gainer:advance(true, true)
        end
    end
end