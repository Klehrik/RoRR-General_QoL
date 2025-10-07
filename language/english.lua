return {
    ui = {
        options = {
            gqol = {
                header                  = "GENERAL QOL",

                fullDesc                = "Item Description Type",
                ["fullDesc.desc"]       = "Replace item pickup texts with their full log descriptions, or have a mix of both.\n\n<y>Client-sided</c>",
                ["fullDesc.choice"]     = {
                    pickup  = "Pickup",
                    desc    = "Description",
                    both    = "Pickup + Description"
                },

                holdInteract            = "Enable Holding Interact",
                ["holdInteract.desc"]   = "Allow using multiple interactables without having to press <y>Interact</c> for each one.\n\n<y>Client-sided</c>",

                blinkInv                = "Huntress <r>Blink</c> Invulnerability",
                ["blinkInv.desc"]       = "Grant <r>Blink</c> 15 i-frames.\n\n<y>Uses the host's setting.</c>",

                noRndDmg                = "Disable Random Damage Numbers",
                ["noRndDmg.desc"]       = "Remove variance from damage popup numbers.\n\n<y>Client-sided</c>",

                osp                     = "One-shot Protection",
                ["osp.desc"]            = "Prevent dying within a 0.5-second window while over 90% health.\n\n<y>Uses the host's setting.</c>",

                -- TODO: Get actual text color for Sniper
                snipeAuto               = "Sniper <b>Snipe</c> Autofire",
                ["snipeAuto.desc"]      = "Allow holding down <b>Snipe</c> for firing with perfect reloads, or as fast as possible.\n\n<y>Client-sided</c>",
                ["snipeAuto.choice"]    = {
                    manual  = "Manual",
                    perfect = "Auto (Perfect Reloads)",
                    fast    = "Auto (Fast)"
                },

                tpColor                 = "Teleporter Particle Color",
                ["tpColor.desc"]        = "Modify the color of the teleporter particles.\n\n<y>Client-sided</c>",
                ["tpColor.choice"]      = {
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