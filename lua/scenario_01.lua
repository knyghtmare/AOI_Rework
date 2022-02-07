local _ = wesnoth.textdomain 'wesnoth-AOI_Rework'
local T = wml.tag
local on_event = wesnoth.require("on_event")

on_event("start", function()
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"Their darkness could be felt already a mile away, they look wild, but war is their job and they were made to war.", 
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"Dirty creatures, children of envy and evil from their first day of birth have been named!", 
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader1",
        message = _"Dirty creatures, children of envy and evil from their first day of birth have been named!", 
    }
end)