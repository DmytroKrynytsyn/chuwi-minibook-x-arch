------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DSI-1",
    mode     = "1200x1920@50",
    position = "auto",
    scale    = "1.875",
    transform = 3,
})

hl.device({
    name = "goodix-capacitive-touchscreen-1",
    transform = 3,
})