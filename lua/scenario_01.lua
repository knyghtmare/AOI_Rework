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

-- when all side 3 units are dead
on_event("die", function()
    -- filter for side 3
    if wesnoth.wml_conditionals.have_unit { side = "3"} then
		return
	end
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"But you have heard and seen, there are many more of them than we thought, and more and more injured ones can come in the next fights.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"We must count and only we can count on our perseverance and the will that the light of our righteous hearts illuminate the darkness that begins to contaminate the house we have always lived in.",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"Tell me, do you ... (He looks at Erlornas, as he clean his sword of orcs blood against the body of his enemy, and wonders whether to ask)",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"What is it, is something bothering you?",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"No, it's nothing ... (Thinks)",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"(Looks into the distance) These beasts will only be more numerous and even more powerful, and what about the borders, when their scouts reach us already so far?",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"The darkness is getting bigger and our endurance has its limits ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"However, I will not stop, you yourself saw those unfortunates who were murdered by those dark children with cold blood only to sow the seeds of fear in us.",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"Maybe it is better to wait for the support that may come soon?",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"What support? Are you trying to build up your illusions? We have been sent to death from the beginning. (Everyone around is watching with fear)",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"Yes ... We all will die, so we had three days to leave, to say goodbye to those we love for the last time. (Looks at his ring)",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"I don't expect to see her again ... (You can see a tear in his eye)",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"Erlornas you ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"(He turns towards her and, not wanting to show his weakness, he rubs his eyes with his cape) So let's move on ...",
    }
    wesnoth.wml_actions.endlevel {
        result = "victory",
        bonus = "no",
        carryover_report = "no",
        linger_mode = "yes",
        carryover_percentage = "0",
    }
end)