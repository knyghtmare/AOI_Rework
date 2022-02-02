local _ = wesnoth.textdomain 'wesnoth-AOI_Rework'
local T = wml.tag
local on_event = wesnoth.require("on_event")

on_event("start", function()
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "<i>(He stands remembering the faces of his closed ones Reilen, mother, father of all who have stood by him so far and whom he will never see again)</i>",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "<i>(Finally the dam that holds his fear of meeting the inevitable death released and falling to his knees in front of a large tree begins to flood with tears)</i>",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _ "<i>(She says nothing, feeling sorry for him and from the very beginning expecting it, but was didn't even tried to prepare her friend to this)</i>",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "<i>(Finally he wipes his tears and, leaning against the tree trunk, looking at the faces of his companions mumble)</i> This is the end, even I am unable to see hope and terror has filled my heart.",
    }
    -- TODO: make Sunllis move next to Erlornas
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _ "<i>(Walks up to him)</i> As soon as you see a shadow around you, look at the high sky and see the glow of hope that will remain with you forever ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "(Hearing these words he looks at the sky full of stars and smiling towards the hope that has long since abandoned him says) You are there full of light and happiness of peace, and here I am facing fear and evil which I cannot resist.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "(Suddenly remembering the ring that his beloved gave him, he reaches into his pocket and pulls out a silver ring with a snow-white diamond and watching it he remembers Reilen face and imagines what their unborn child will look like)",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "(He remembers once again the happiness he denied them both and the moments he shared with her) Thank you for everything ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "Thank you for being with me this whole time. (Saying this, he puts the ring on his finger one last time and sheds one last tear saying soft farewell)",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "I am sorry ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "(Finally wiping his crystal tears and looking down from the starry sky on the faces of the last friends accompanying him, he was ready to come to terms with death, to fight for all those who participated in his journey through all live, to fight for those he loves)",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "My name is Erlornas, heir of Wesmere, all my life I have wanted the good of all of us, I have strove for this, I have followed this path, but tomorrow it will be time to fulfill my obligation to my people.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "Tomorrow we may die, we may die loaded on poisoned blacks, but we will be by our side until the end, we will fight for our loved ones.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "Will you go this last time with me, comrades? Will you stand with me this last time against the beasts from the sea that have come to plunder, murder and enslave our people, make them a shadow of former glory?",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "If my death can give them enough time to save them, I will do it. I will slaughter all these monsters and will never let them win, even if it means my end, even if the cost is never united with Reilen because I fight for her, I fight for those who were killed, our brothers and sisters who would have helped them if we were not here?",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "This whole council made from the ones that never experienced the love to their kin which suffered in front of their eyes here on the borders, condemning them to death?",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "I will not be like them, I will give a voice to those who can no longer sing with us, for those who are left alone.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "I ask again, will you join me one last time? Will you lend me your strength to bring it to those who have been left alone and to those who will live in this world after us!?",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _ "I ask again, will you join me!?",
    }
    -- end the cutscene
    wesnoth.wml_actions.endlevel {
		result = "victory",
        bonus = "no",
        carryover_report = "no",
        linger_mode = "no",
        replay_save = "no",
        save = "no",
        carryover_percentage = "0",
	}
end)