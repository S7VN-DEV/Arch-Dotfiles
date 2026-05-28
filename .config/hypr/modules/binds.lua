--[[
┌──────────────────────────────────────────┐
│                 KEYBINDS                 │
└──────────────────────────────────────────┘
]]--

local V = require("modules.vars")

hl.bind(V.mainMod .. " + C", hl.dsp.window.close())
hl.bind(V.mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(V.mainMod .. " + p", hl.dsp.window.pseudo())
hl.bind(V.mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(V.mainMod .. " + Q", hl.dsp.exec_cmd(V.terminal))
hl.bind(V.mainMod .. " + E", hl.dsp.exec_cmd(V.fileManager))
hl.bind(V.mainMod .. " + Space", hl.dsp.exec_cmd(V.menu))
hl.bind(V.mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(V.screenCap))
hl.bind(V.mainMod .. " + CTRL + S", hl.dsp.exec_cmd(V.screenRec))
hl.bind(V.mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(V.clipHist))
hl.bind(V.mainMod .. " + Period", hl.dsp.exec_cmd(V.emojiPicker))
hl.bind(V.mainMod .. " + L", hl.dsp.exec_cmd(V.lockscreenManager))
hl.bind(V.mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(V.clipHist))
hl.bind(V.mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(V.OCR))
hl.bind(V.mainMod .. " + CTRL + T", hl.dsp.exec_cmd(V.colorPicker))
hl.bind(V.mainMod .. " + SHIFT + TAB", hl.dsp.exec_cmd(V.layoutSwitcher)) -- change this to use lua in the future
-- # bind = $mainMod SHIFT, Space, exec, ~/.config/kitty/kitty_session_manager.sh -l | ya this needs some work in the future


-- Move focus with mainMod + arrow keys
hl.bind(V.mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(V.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(V.mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(V.mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())

-- Move windows around and resize them in scrolling layout
hl.bind(V.mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(V.mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(V.mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(V.mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down", group_aware = true }))
hl.bind(V.mainMod .. " + SHIFT + KP_ADD", hl.dsp.layout("colresize +0.2"))
hl.bind(V.mainMod .. " + SHIFT + KP_SUBTRACT", hl.dsp.layout("colresize -0.2"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(V.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(V.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(V.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(V.mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(V.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(V.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(V.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(V.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Toggle laptop monitor (like win + shift + p) used to use edp1_toggle.sh
hl.bind(V.mainMod .. " + SHIFT + P", hl.dsp.dpms({ monitor = V.lapMon, action = "toggle"}))

-- Reset hyprconf incase shit breaks (and it will)
hl.bind(V.mainMod .. " + SHIFT + F1", hl.dsp.exec_cmd("hyprctl reload"))

-- Set refresh rate to 60 (might make a scrpit to auto change this with ac on or off)
hl.bind(V.mainMod .. " + R", function()
    hl.monitor({
        output = "desc:California Institute of Technology 0x161D 0x00006001",
        mode = "2560x1600@60",
        position = "1920x0",
        scale = 1.6,
        vrr = 1
    })
end)

-- Make the laptop lock when the lid opens
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock --grace 0"), { locked = true })
