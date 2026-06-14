--[[
┌────────────────────────────────────────┐
│                MONITORS                │
└────────────────────────────────────────┘
]]--

local V = require("modules.vars")

local function update_monitors()
    local monitors = hl.get_monitors()

    V.mainMon = nil
    V.lapMon = nil

    for _, m in ipairs(monitors) do
        if m.name:find("^eDP") then
            V.lapMon = m.name
        else
            if not V.mainMon or m.description:find("Samsung") then
                V.mainMon = m.name
            end
        end
    end

    -- Fallbacks for safety
    V.lapMon = V.lapMon or "eDP-1"
    V.mainMon = V.mainMon or "DP-9"

    -- Monitor Configurations
    hl.monitor({
        output = "desc:Samsung Electric Company Odyssey G40B HCJX701187",
        mode = "1920x1080@239.75999",
        position = "-2560x0",
        scale = 1,
        vrr = 1
    })
    hl.monitor({
        output = "desc:California Institute of Technology 0x161D 0x00006001",
        mode = "2560x1600@165",
        position = "0x0",
        scale = 1.6,
        vrr = 1,
        icc = os.getenv("HOME") .. "/.config/hypr/extras/rtings-icc-profile.icm"
    })
    hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@60Hz",
        position = "1600x0",
        scale = 1,
    })
    hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = 1
    })

    -- Workspace Rules
    hl.workspace_rule({ workspace = "1", default_name = "Home", monitor = V.mainMon, default = true })
    hl.workspace_rule({ workspace = "2", default_name = "Browse", monitor = V.mainMon, default = true })
    hl.workspace_rule({ workspace = "3", default_name = "Chat", monitor = V.mainMon, default = true })
    hl.workspace_rule({ workspace = "10", default_name = "PerfMon", monitor = V.lapMon, default = true })

    -- Update mainMon on monitor change
    hl.exec_cmd(
        [[  xrandr --output ]] .. V.mainMon .. [[ --primary ]]
    )
end

update_monitors()
hl.on("monitor.added", update_monitors)
hl.on("monitor.removed", update_monitors)
