--[[
┌─────────────────────────────────────────┐
│              LOOK AND FEEL              │
└─────────────────────────────────────────┘
]]--

local C = require("modules.colors")

hl.config({
  general = {
      gaps_in = 3,
      gaps_out = 12,
      border_size = 2,
      resize_on_border = true,
      allow_tearing = true,
      layout = "dwindle",

      col = {
        active_border = { colors = { C.primary, C.secondary }, angle = 45 },
        inactive_border = { colors = { C.on_primary, C.on_secondary }, angle = 45 },
      },
  },

  decoration = {
      rounding = 2,
      rounding_power = 2,
      active_opacity = 1.0,
      inactive_opacity = 1.0,
      dim_inactive = true,
      dim_strength = 0.1,

      shadow = {
          enabled = true,
  	    range = 4,
          render_power = 3,
          color = 0xee1a1a1a,
      },
      blur = {
          enabled = true,
          size = 4,
          passes = 1,
          vibrancy = 0.8,
          vibrancy_darkness = 0.1,
          new_optimizations = true,
          ignore_opacity = true
      },
  },

  animations = {
    enabled = true, -- yes, please :)
  }
})

hl.layer_rule({
  match = { namespace = "selection" },
  blur = false
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.curve("quickFill", { type = "bezier", points = { {0.68, 0.98}, {0.02, 0.81} } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 2.79, bezier = "quickFill" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 0.6, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 0.73, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.5, bezier = "easeInOutCubic", style = "slideFade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "easeInOutCubic", style = "slideFade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 1.5, bezier = "easeInOutCubic", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.94, bezier = "easeInOutCubic", style = "slide top" })
