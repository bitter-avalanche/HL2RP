-- If you make changes to this, back it up in case a new update overwrites it.

PLUGIN.config = {
    defaultCharData = [[Date of Birth: YYYY-MM-DD
Gender: ?
Housing: ?

Additional Info:
- None]],
    loyaltyLevels = {
        [-30] = {
            name = "UNDESIRABLE - NO RATION!",
            color = Color(155, 13, 13)
        },
        [-20] = {
            name = "ANTI-CITIZEN - MINIMAL RATION TIER.",
            color = Color(198, 13, 13)
        },
        [-10] = {
            name = "DISREPUTABLE - MINIMAL RATION TIER.",
            color = Color(255, 0, 0)
        },
        [0] = {
            name = "CITIZEN - NORMAL GRADE RATION UNIT.",
            color = Color(0, 0, 0)
        },
        [5] = {
            name = "HELPFUL CITIZEN - NORMAL GRADE RATION UNIT.",
            color = Color(133, 170, 99)
        },
        [10] = {
            name = "JUNIOR LOYALIST - NORMAL GRADE RATION UNIT.",
            color = Color(87, 135, 44)
        },
        [20] = {
            name = "LOYALIST - LOYALIST GRADE RATION UNIT.",
            color = Color(60, 104, 20)
        },
        [40] = {
            name = "SENIOR LOYALIST - LOYALIST GRADE RATION UNIT.",
            color = Color(48, 188, 193)
        },
        [80] = {
            name = "SUPPORTIVE LOYALIST - PRIORITY GRADE RATION UNIT.",
            color = Color(36, 148, 153)
        },
        [120] = {
            name = "SENIOR SUPPORTIVE LOYALIST - PRIORITY GRADE RATION UNIT.",
            color = Color(23, 101, 104)
        }
    }
};