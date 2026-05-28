--[[
┌──────────────────────────────────────────┐
│           ENVIRONMENT VARIABLE           │
└──────────────────────────────────────────┘
]]--

local env = {
  XCURSOR_SIZE = "24",
  HYPRCURSOR_SIZE = "24",
  AQ_DRM_DEVICES = "/dev/dri/card2:/dev/dri/card1",
  XDG_SESSION_TYPE = "wayland",
  XDG_CURRENT_DESKTOP = "Hyprland",
  XDG_SESSION_DESKTOP = "Hyprland",
  XDG_MENU_PREFIX = "arch-",
  ELECTRON_OZONE_PLATFORM_HINT = "auto",
  QT_QPA_PLATFORMTHEME = "qt6ct"
}

for k,v in pairs(env) do
  hl.env(k,v)
end


-- old hyprlang styff
-- # env = LIBVA_DRIVER_NAME,nvidia
-- # env = __GLX_VENDOR_LIBRARY_NAME,nvidia
-- # env = NVD_BACKEND,direct
-- # env = GBM_BACKEND,nvidia-drm
-- env = LSFG_DLL_PATH,/home/sven/MoarSpace/SteamLibrary/steamapps/common/Lossless Scaling/Lossless.dll 
-- # This is for x11 stuff
-- # env = GDK_SCALE,2
-- # env = GDK_DPI_SCALE,0.5
-- # env = QT_SCALE_FACTOR,2
-- # env = QT_AUTO_SCREEN_SCALE_FACTOR,0
-- # env = QT_ENABLE_HIGHDPI_SCALING,0
-- # env = _JAVA_OPTIONS,-Dsun.java2d.uiScale=2
-- # env = JDK_JAVAFX_SCALE_FACTOR,2
-- # env = TK_SCALE,2
