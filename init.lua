-- Require the sketchybar module
SBar = require("sketchybar")

-- Require the resources module
require("resources")

-- Bundle the entire initial configuration into a single message to sketchybar
SBar.begin_config()
require("configs")
SBar.end_config()

-- Run the event loop of the sketchybar module (without this there will be no
-- callback functions executed in the lua module)
SBar.event_loop()
