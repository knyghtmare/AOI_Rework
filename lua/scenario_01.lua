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
        message = _"The chief ordered us to scout, but it seems that more of these hideous creatures live here, and our wolves were running for hours without respite, it's time to rest during the fight!", 
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"A smelly creature that washes in its own mud, you won't cross these lands while I'm standing here!", 
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader1",
        message = _"This one here probably wants to be the first to make an appetizer! Burn the houses, and those who you manage get outside and cut their throats, we'll see how he will behave before this sight!", 
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"You mad beasts, as soon as you tried an evil on our countrymen, immediately you continued to do what you wanted!", 
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"We will see if the darkness is your ally, monsters from the sea!", 
    }
end)