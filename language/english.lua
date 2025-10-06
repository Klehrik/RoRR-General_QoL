return {
    ui = {
        options = {
            gqol = {
                header              = "GENERAL QOL",

                fullDesc            = "Item Description Type",
                ["fullDesc.desc"]   = "Replace item pickup texts with their full log descriptions, or have a mix of both.\n\n<y>Client-sided</c>",
                ["fullDesc.choice"] = {
                    pickup  = "Pickup",
                    desc    = "Description",
                    both    = "Pickup + Description"
                },

                blinkInv            = "Huntress <r>Blink</c> Invulnerability",
                ["blinkInv.desc"]   = "Grant <r>Blink</c> 15 i-frames.\n\n<y>Uses the host's setting.</c>",

                noRndDmg            = "Disable Random Damage Numbers",
                ["noRndDmg.desc"]   = "Remove variance from damage popup numbers.\n\n<y>Client-sided</c>",

                osp                 = "One-shot Protection",
                ["osp.desc"]        = "Prevent dying within a 0.5-second window while over 90% health.\n\n<y>Uses the host's setting.</c>",

                tpColor             = "Teleporter Particle Color",
                ["tpColor.desc"]    = "Modify the color of the teleporter particles.\n\n<y>Client-sided</c>",
                ["tpColor.choice"]  = {
                    red     = "Red",
                    yellow  = "Yellow",
                    blue    = "Blue",
                    cyan    = "Cyan",
                    white   = "White"
                },
            }
        }
    }
}