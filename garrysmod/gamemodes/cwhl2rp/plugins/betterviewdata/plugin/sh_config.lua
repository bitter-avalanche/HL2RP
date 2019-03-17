-- If you make changes to this, back it up in case a new update overwrites it.

PLUGIN.config = {
    defaultCharData = [[Date of Birth: YYYY-MM-DD
Gender: ?
Housing: ?

Additional Info:
- None]],
    loyaltyLevels = {
        [-15] = {
            name = "ANTI-CITIZEN",
            color = Color(255, 0, 0)
        },
        [-10] = {
            name = "MALIGNANT",
            color = Color(255, 128, 0)
        },
        [5] = {
            name = "RED",
            color = Color(255, 0, 0)
        },
        [20] = {
            name = "BLUE",
            color = Color(0, 128, 255)
        },
        [50] = {
            name = "GREEN",
            color = Color(0, 255, 0)
        },
        [75] = {
            name = "WHITE",
            color = Color(128, 128, 128)
        },
        [100] = {
            name = "BLACK",
            color = Color(0, 0, 0)
        }
    }
};