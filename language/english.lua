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

                osp                 = "One-shot Protection",
                ["osp.desc"]        = "Prevent dying within a 0.5-second window while over 90% health.\n\n<y>Uses the host's setting.</c>"
            }
        }
    }
}