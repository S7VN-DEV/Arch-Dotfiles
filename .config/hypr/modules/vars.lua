--[[
┌─────────────────────────────────────────┐
│                VARIABLES                │
└─────────────────────────────────────────┘
]]--

local V = {}
local hypr = os.getenv("HOME") .. "/.config/hypr"

V.mainMod = "SUPER"
V.terminal = "kitty"
V.menu = "rofi -show drun"
V.fileManager = "dolphin"
V.lockscreenManager = "hyprlock"
V.emojiPicker = "reofi -show emoji"
V.colorPicker = "hyprpicker -an"
V.screenRec = "wf-recorder-gui"
V.screenCap = hypr .. "/scripts/scnshot_notify.sh"
V.layoutSwitcher = hypr .. "/scripts/toggle_layout.sh"
V.OCR = [[grim -g "$(slurp)" - | tesseract - - -l eng+rus+ara+heb+hin+chi_sim+chi_tra+jpn+kor+tha+ell+amh+tam+equ | wl-copy]]
V.clipHist = [[cliphist list | rofi -dmenu -p "󱃕 Clipboard" -display-columns 2 | cliphist decode | wl-copy]]

return V
