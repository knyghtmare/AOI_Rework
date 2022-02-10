local _ = wesnoth.textdomain 'wesnoth-AOI_Rework'
local T = wml.tag
local on_event = wesnoth.require("on_event")

on_event("start", function()
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
    wesnoth.wml_actions.message {
        speaker = "narrator",
        image = "wesnoth-icon.png",
        message = _"From afar, suddenly a wild and ominous laugh can be heard.",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader2",
        message = _"Ha, hi, ha... I feel... I feel... The blood of those clutching their trees of white-skinned woods sprites, which I will feed on, and from which I am going to make a drink!",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader3",
        message = _"Agh, ugh, agh… Yes they are, those damn nature ghosts waiting for our swords…!",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader4",
        message = _"Khe, kha, khe ... Their shamans begged ... They begged for mercy, and when they were still tortured alive, they turned to their gods, but it only gives us joy ... Their plea, this lack of all hope!",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"(He can not stand and the wrath in him starts to burn his whole insides) You weed, unworthy of life in this beautiful world! Your death will only be a respite for it, you all shall perish and your bodies will be devoured by your own brothers!",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader3",
        message = _"You, what do you want? To make me laugh!? Agh, ugh, agh ... I will play with your corpse, and the evil that will arise in these lands will only be our pleasure!",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader2",
        message = _"Suffering will enter your interior, and we will remind you of the pain of your entire existence every day! Ha, hi, ha…!",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader4",
        message = _"Life will be your end and death will be the beginning! Khe, kha, khe...! The time of the orcs has come ...!",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = _"I am not able to see any good in you … This place used to be teeming with life, and now it will rest forever in the rubble of eternal glory ... It is hideous that such creatures, with darkness and suffering written in their destiny, at all exist!",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"It is not time for tears, but for the death of these three tormentors who will be my cup, which I will fill with wrath! Slaughter you is no art, and my gift to you will be long tortures that will reveal your deeply hidden nightmares! (His anger slowly begins to take over him, darkness and madness transforming into a shadow full of power, but Sunllis grabs his hand again and tries to calm him down, and the magic that wanted to turn him into an evil demon starts to fade away from moment to moment)",
    }
    wesnoth.wml_actions.message {
        speaker = "narrator",
        image = "wesnoth-icon.png",
        message = _"Erlornas, holding the hand of his friend, which saved him from internal evil, comes out on the golden sun covered with a clearing and soaking his goodness. His hair begins to shine with light, and his body is filled with a glow that blinds the orcs.",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader2",
        message = _"What is this evil… !?",
    }
    wesnoth.wml_actions.message {
        speaker = "OrcLeader3",
        message = _"The forest devil is trying to weaken us with his magic, we must deprive him of his power by cutting in half!",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = _"(He opens his so far closed eyes, which shimmer with the golden glow of the sun close to him, which gave him the strength to go on, and after a while his luminous coating that soaked into him led to the harmony of the mind) The darkness only arises when the light goes out, but seeing the rays of destiny begins to hide again into the shadows! (Pulls out the sword)",
    }
end)

on_event("enemies defeated",function()
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = "This is the end of this fight, but what I saw here and what I looked at in my dreams I will forever remember, I will never erase it from my memory ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = "But it was a fair fight, even though we weren't able to help anyone.",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = "You're wrong.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = "(Understands her expressive look and looks at his hands) I ... Thank you ... It's thanks to you ... I ...",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = "Are you yourself again?",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = "Yes ... But I don't know what would have happened if you hadn't stopped me then.",
    }
    wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = "Those of the noble elves, who have great power inside them, are also susceptible to evil spells, which our enemies constantly control. They can choose light or dark, and you have chosen what is right.",
    }
     wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = "Glad you came back to us, I was really scared to see your wrath, justified but too cruel. Even the noblest of elves could become soaked with evil, knowing that I was truly afraid.",
    }
     wesnoth.wml_actions.message {
        speaker = "Sunllis",
        message = "These creatures that moor to our shores are overflowing with it and we should be those who oppose them, but not the ones who start to become them.",
    }
    wesnoth.wml_actions.message {
        speaker = "Erlornas",
        message = "Now, when the courage in my heart, which was dancing not so long ago in bad feelings, returned, I am ready to go on fulfilling my mission.",
    }
    wesnoth.wml_actions.endlevel {
        result = "victory",
        bonus = "no",
        carryover_report = "no",
        linger_mode = "yes",
        carryover_percentage = 0,
    }
end)