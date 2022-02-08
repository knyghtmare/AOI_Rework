local _ = wesnoth.textdomain 'wesnoth-AOI_Rework'
local T = wml.tag
local on_event = wesnoth.require("on_event")

on_event("enemies defeated", function()
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"What a terrible sight, so much life has been destroyed all around, and the children of darkness, born of the eternal shadow on distant islands, have burnt our forest chapel! The flames above the bald trees are rising, and the screams are not even heard, which means that there is no hope for the priestesses of the red moon. (She covers her face drowning in tears)",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"The death of these demons of the night is not enough to compensate for the lives of all these innocent womens, which could foretell us for hundreds of years and pray to the distant moon in thanksgiving and rewarding! (Only anger is visible on his face, and the sadness is far deep inside him)",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"(She notices the hand of Erlornas, trembling with anger and the will to kill the orcs, who is almost ready to throw himself into a crazy fight, but she, to calm him down for fear, immobilizes him with her hand) Not now, do not leave me alone in this scorched and stolen from any dream place.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"(His eyes full of anger, anger which has already started to become him, began to slowly leave as if his friend's hand touch was a moment of respite in these times full of fear and a shadow trumph) Sunllis ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"You're right ... If I have to do my duty to the end I can't stop being who I have always been, however ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"I understand your pain and I feel the suffering that is placed in you and is looking for an outlet through a bloody duel with the creatures of the former evil, but wait for us to know more about their numbers and size.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"Right ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"Sorry, I ... I just stopped knowing myself and finding my way.",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"We have been shaking each other's hand since we were a child and we will continue to do so now.",
    }
end)