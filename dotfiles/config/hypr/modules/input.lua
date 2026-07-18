

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ua",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        follow_mouse = 2,

        sensitivity = -0.2, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
            clickfinger_behavior = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


