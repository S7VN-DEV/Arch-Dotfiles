--[[
┌──────────────────────────────────────────┐
│                AUTOSTART                 │
└──────────────────────────────────────────┘
]]--

local V = require("modules.vars")

hl.on("hyprland.start", function ()
  hl.exec_cmd([[
    waybar &
    hyprpaper &
    steam -silent &
  ]]) -- Foreground
  hl.exec_cmd([[
    hypridle & kdeconnectd & cliphist wipe &
    systemctl --user start hyprpolkitagent &
    wl-paste --type text --watch cliphist store &
    wl-paste --type image --watch cliphist store &
    xrandr --output ]] .. V.mainMon .. [[ --primary &
  ]]) -- Background

  hl.exec_cmd("kitty", {
    workspace = "1"
  })
  hl.exec_cmd("zen-browser", {
    workspace = "2 silent"
  })
  hl.exec_cmd("vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-blink-features=MiddleClickAutoscroll", {
    workspace = "3 silent"
  })
  hl.exec_cmd("kitty -e btop", {
    workspace = "10 silent"
  }) -- Workspace
end)
