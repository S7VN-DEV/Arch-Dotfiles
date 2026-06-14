--[[
┌────────────────────────────────────────┐
│                  MISC                  │
└────────────────────────────────────────┘
]]--

hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
    middle_click_paste = false,
    allow_session_lock_restore = true,
    vrr = 1,
    render_unfocused_fps = 60
  },
  -- To not make apps running in xwayland look like shit
  xwayland = {
  -- force_zero_scaling = true
    use_nearest_neighbor = true,
  },
  render = {
    direct_scanout = 0
  }
})
