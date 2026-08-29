-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 2

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- 1. Left Display: Dell P3223QE 32" 4K (Unknown-2, USB-C, Placed auto-left of Center)
hl.monitor({
  output = "Unknown-2",
  mode = "preferred",
  position = "auto-left",
  scale = omarchy_monitor_scale,
})

-- 2. Center Display: Dell P3223QE 32" 4K (HDMI-A-1, Placed auto-left of DP-1)
hl.monitor({
  output = "HDMI-A-1",
  mode = "preferred",
  position = "auto-left",
  scale = omarchy_monitor_scale,
})

-- 3. Right Display: Lenovo T32UD-40 32" 4K (DP-1, Portrait 90°, Hardware Anchor ID 0)
hl.monitor({
  output = "DP-1",
  mode = "preferred",
  position = "auto-right",
  scale = omarchy_monitor_scale,
  transform = 1, -- Change to 3 if upside down
})

-- 4. Catch-all fallback for any additional or hotplugged displays
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto-right",
  scale = omarchy_monitor_scale,
})

-- Workspace-to-Monitor Mappings
-- Left Display (Unknown-2): Workspaces 1, 4, 7,
for _, ws in ipairs({1,4,7}) do
  hl.workspace_rule({
    workspace = tostring(ws),
    monitor = "Unknown-2",
    default = (ws == 1),
  })
end

-- Center Display (HDMI-A-1): Workspaces 2, 5, 8,
for _, ws in ipairs({2,5,8}) do
  hl.workspace_rule({
    workspace = tostring(ws),
    monitor = "HDMI-A-1",
    default = (ws == 2),
  })
end

-- Right Display (DP-1 Portrait): Workspaces 3, 6, 8, 10
for _,ws in ipairs({3,6,9,10}) do
  hl.workspace_rule({
    workspace = tostring(ws),
    monitor = "DP-1",
    default = (ws == 3),
  })
end





