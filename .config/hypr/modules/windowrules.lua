--[[
┌──────────────────────────────────────────┐
│          WINDOW/WORKSPACE RULES          │
└──────────────────────────────────────────┘
]]--

-- Ignore maximize requests from apps
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*"},
    suppress_event = "maximize"
})
-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
      class = "^$",
      title = "^$",
      xwayland = true,
      float = true,
      fullscreen = false,
      pin = false
    },
    no_focus = true
})
-- Windowrules for screenshare
hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = { class = "xwaylandvideobridge" },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = "1 1",
    opacity = 0.0
})

-- Windowrule to add apps/games to run at 60fps in other workspaces
hl.window_rule({
    name = "steam-games-60fps",
    match = { class = [[^steam_app_\d+$]] },
    render_unfocused = true
})
hl.window_rule({
    name = "gamescope-60fps",
    match = { class = [[^gamescope\d+$"]] },
    render_unfocused = true
})
-- hl.window_rule({
--      name = "exe-60fps",
--      match = {class = [[^(nightreign.exe)$]]},
--      render_unfocused = "on"
-- })
hl.window_rule({
    name = "exe-60fps",
    match = { class = [[^.*\.exe$]] },
    render_unfocused = true
})
-- +No VRR
hl.window_rule ({ match = { class = "cs2" }, immediate = true })
hl.window_rule ({ match = { title = "ELDEN RING NIGHTREIGN" }, immediate = true })
hl.window_rule ({ match = { title = "HorizonMW v1.6.1" }, immediate = true })

-- Apps
hl.window_rule({
  name = "waypaper-float",
  float = true,
  size = { 800, 500 },
  xray = true,
  center = true,
  opacity = 0.7,
  match = { class = [[^(waypaper)$]] }
})
