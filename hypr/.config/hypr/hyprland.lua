-- Hyprland Lua Configuration
-- Replicated from Niri configuration (config.kdl, keybindings.kdl, startup.kdl, input.kdl, windowrules.kdl, animations.kdl)

------------------
---- MONITORS ----
------------------

-- eDP-1: 1920x1080@60 scale 1.1
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "1.1",
})

-- HDMI-A-1: scale 1, position x=1280 y=0
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "1280x0",
    scale    = "1",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "nemo"
local menu        = "anyrun"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar -c ~/.config/niri/waybar/config.jsonc -s ~/.config/niri/waybar/style.css")
    hl.exec_cmd("battwatch")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("swayidle -w")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    -- Commented startup items from Niri config:
    -- hl.exec_cmd("qs -c ~/.config/quickshell/noctalia-shell/")
    -- hl.exec_cmd("swaybg -i .config/walpapers/cartoon.jpg")
    -- hl.exec_cmd("phonto ~/videos/walpapers/whispering-lights-forest.3840x2160.mp4")
    -- hl.exec_cmd("/usr/lib/xfce-polkit/xfce-polkit")
    -- hl.exec_cmd("blueman-applet")
    -- hl.exec_cmd("kdeconnect-cli --refresh")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 3,

        border_size = 1,

        col = {
            active_border   = "rgb(7aa2f7)",
            inactive_border = "rgb(414868)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "scrolling",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 4,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Fast & Snappy Curves & Springs
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("snappy",         { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.05}  } })

-- Fast responsive springs
hl.curve("fastSpring", { type = "spring", mass = 0.6, stiffness = 750, dampening = 32 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 8,    bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 7,    spring = "fastSpring" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 8,    bezier = "snappy",       style = "popin 90%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 8,    bezier = "quick",        style = "popin 90%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 7,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 7,    bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 7,    bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 8,    bezier = "snappy" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 9,    bezier = "snappy",       style = "popin 95%" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 8,    bezier = "quick",        style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 8,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 8,    bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 6,    spring = "fastSpring" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 6,    bezier = "almostLinear" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 6,    bezier = "almostLinear" })


-----------------
---- LAYOUTS ----
-----------------

hl.config({
    scrolling = {
        fullscreen_on_one_column = false,
        follow_focus = true,
        explicit_column_widths = "0.5, 0.75, 1.0, 0.25",
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
})


--------------
---- MISC ----
--------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            tap_to_click   = true,
            natural_scroll = true,
        },
    },
    cursor = {
        hide_on_key_press = true,
        inactive_timeout  = 5,
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Helper hotkey overlay (Mod+Shift+/)
hl.bind(mainMod .. " + SHIFT + slash", hl.dsp.exec_cmd("notify-send 'Keybindings' 'Mod+Shift+/ pressed'"))

-- Toggle floating & focus floating
hl.bind(mainMod .. " + SHIFT + space", function() hl.dispatch("focuscurrentorlast", "") end)
hl.bind(mainMod .. " + space",       hl.dsp.window.float({ action = "toggle" }))

-- Applications & Custom Launchers
hl.bind(mainMod .. " + T",           hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + T",   hl.dsp.exec_cmd("kitty zellij"))
hl.bind(mainMod .. " + SHIFT + B",   hl.dsp.exec_cmd("floorp"))
hl.bind(mainMod .. " + P",           hl.dsp.exec_cmd("wl-color-picker"))
hl.bind(mainMod .. " + O",           function() hl.dispatch("layoutmsg", "toggleoverview") end)
hl.bind(mainMod .. " + B",           hl.dsp.exec_cmd("brave --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind(mainMod .. " + J",           hl.dsp.exec_cmd("joplin-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind(mainMod .. " + ALT + C",     hl.dsp.exec_cmd("cursor --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind(mainMod .. " + A",           hl.dsp.exec_cmd("~/.local/bin/open_chatbots"))
hl.bind(mainMod .. " + SHIFT + D",   hl.dsp.exec_cmd("~/.local/bin/define.sh"))
hl.bind(mainMod .. " + SHIFT + C",   hl.dsp.exec_cmd("zeditor"))
hl.bind(mainMod .. " + SHIFT + P",   hl.dsp.exec_cmd("postman --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind(mainMod .. " + SHIFT + M",   hl.dsp.exec_cmd("mongodb-compass --password-store='gnome-libsecret' --ignore-additional-command-line-flags"))
hl.bind(mainMod .. " + G",           hl.dsp.exec_cmd("github-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind(mainMod .. " + V",           hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + D",           hl.dsp.exec_cmd("pkill anyrun || anyrun"))
hl.bind(mainMod .. " + F",           hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + F",   hl.dsp.exec_cmd("kitty yazi"))
hl.bind("ALT + J",                   hl.dsp.exec_cmd("kitty nvim sample.js"))
hl.bind("ALT + M",                   hl.dsp.exec_cmd("kitty mongosh"))
hl.bind(mainMod .. " + SHIFT + W",   hl.dsp.exec_cmd("~/.local/bin/toggle_waybar"))
hl.bind(mainMod .. " + ALT + K",     hl.dsp.exec_cmd("~/.local/bin/killport 3000"))
hl.bind(mainMod .. " + SHIFT + R",   hl.dsp.exec_cmd("~/.local/bin/gammastep-toggle"))
hl.bind(mainMod .. " + ALT + S",     hl.dsp.exec_cmd("kitty speedtest-rs"))

-- Audio & Brightness Controls
hl.bind("F3",                   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"),        { locked = true })
hl.bind("F2",                   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"),        { locked = true })
hl.bind("F1",                   hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),       { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true })
hl.bind("SHIFT + F6",           hl.dsp.exec_cmd("brightnessctl s 1%+"),                              { locked = true })
hl.bind("SHIFT + F5",           hl.dsp.exec_cmd("brightnessctl s 1%-"),                              { locked = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl s 1%+"),                              { locked = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl s 1%-"),                              { locked = true })
hl.bind("F5",                   hl.dsp.exec_cmd("brightnessctl s 5%-"),                              { locked = true })
hl.bind("F6",                   hl.dsp.exec_cmd("brightnessctl s 5%+"),                              { locked = true })

-- Window & System Controls
hl.bind(mainMod .. " + N",         function() hl.dispatch("layoutmsg", "toggle-tabbed") end)
hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind(mainMod .. " + L",         hl.dsp.exec_cmd("swaylock"))
hl.bind("CTRL + ALT + H",          hl.dsp.exec_cmd("swaylock & systemctl hibernate"))
hl.bind("CTRL + ALT + I",          hl.dsp.exec_cmd("~/.local/bin/idle_inhibitor"))
hl.bind("CTRL + ALT + P",          hl.dsp.exec_cmd("poweroff"))
hl.bind("CTRL + ALT + R",          hl.dsp.exec_cmd("reboot"))
hl.bind("CTRL + ALT + L",          hl.dsp.exit())

-- Focus Navigation
hl.bind(mainMod .. " + left",      hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",     hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",        hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",      hl.dsp.focus({ direction = "down" }))

-- Swapping Window Positions
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + H",     hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + J",     hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + K",     hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + L",     hl.dsp.window.swap({ direction = "right" }))

-- Workspace / Window Focus Up/Down
hl.bind(mainMod .. " + SHIFT + down", function() hl.dispatch("workspace", "+1") end)
hl.bind(mainMod .. " + SHIFT + up",   function() hl.dispatch("workspace", "-1") end)

-- Column Navigation (First/Last)
hl.bind(mainMod .. " + Home",        hl.dsp.layout("focus beg"))
hl.bind(mainMod .. " + End",         hl.dsp.layout("focus end"))
hl.bind(mainMod .. " + CTRL + Home", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + CTRL + End",  hl.dsp.layout("move +col"))

-- Monitor Movements
hl.bind(mainMod .. " + SHIFT + CTRL + left",  function() hl.dispatch("movewindow", "mon:l") end)
hl.bind(mainMod .. " + SHIFT + CTRL + down",  function() hl.dispatch("movewindow", "mon:d") end)
hl.bind(mainMod .. " + SHIFT + CTRL + up",    function() hl.dispatch("movewindow", "mon:u") end)
hl.bind(mainMod .. " + SHIFT + CTRL + right", function() hl.dispatch("movewindow", "mon:r") end)
hl.bind(mainMod .. " + SHIFT + CTRL + H",     function() hl.dispatch("movewindow", "mon:l") end)
hl.bind(mainMod .. " + SHIFT + CTRL + J",     function() hl.dispatch("movewindow", "mon:d") end)
hl.bind(mainMod .. " + SHIFT + CTRL + K",     function() hl.dispatch("movewindow", "mon:u") end)
hl.bind(mainMod .. " + SHIFT + CTRL + L",     function() hl.dispatch("movewindow", "mon:r") end)

-- Workspace Navigation
hl.bind(mainMod .. " + U",                function() hl.dispatch("workspace", "+1") end)
hl.bind(mainMod .. " + I",                function() hl.dispatch("workspace", "-1") end)
hl.bind(mainMod .. " + CTRL + Page_Down", function() hl.dispatch("movetoworkspace", "+1") end)
hl.bind(mainMod .. " + CTRL + Page_Up",   function() hl.dispatch("movetoworkspace", "-1") end)
hl.bind(mainMod .. " + CTRL + U",         function() hl.dispatch("movetoworkspace", "+1") end)
hl.bind(mainMod .. " + CTRL + I",         function() hl.dispatch("movetoworkspace", "-1") end)
hl.bind(mainMod .. " + SHIFT + U",        function() hl.dispatch("movecurrentworkspacetomonitor", "+1") end)

-- Mouse Wheel Bindings
hl.bind(mainMod .. " + mouse_down",         function() hl.dispatch("workspace", "+1") end)
hl.bind(mainMod .. " + mouse_up",           function() hl.dispatch("workspace", "-1") end)
hl.bind(mainMod .. " + CTRL + mouse_down",  function() hl.dispatch("movetoworkspace", "+1") end)
hl.bind(mainMod .. " + CTRL + mouse_up",    function() hl.dispatch("movetoworkspace", "-1") end)

-- Switch Workspaces 1-9 & Move Window to Workspace 1-9
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,        function() hl.dispatch("workspace", tostring(i)) end)
    hl.bind(mainMod .. " + CTRL + " .. i, function() hl.dispatch("movetoworkspace", tostring(i)) end)
end

-- Mouse Drag & Resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Stacking, Resizing, Fullscreen, Screenshots
hl.bind(mainMod .. " + comma",         hl.dsp.layout("consume"))
hl.bind(mainMod .. " + period",        hl.dsp.layout("expel"))
hl.bind(mainMod .. " + C",             hl.dsp.layout("fit_into_view"))
hl.bind(mainMod .. " + CTRL + W",      hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + W",             hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + R",             hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + minus",         hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + equal",         hl.dsp.layout("colresize +0.1"))
hl.bind(mainMod .. " + SHIFT + minus", function() hl.dispatch("resizeactive", "0 -10%") end)
hl.bind(mainMod .. " + SHIFT + equal", function() hl.dispatch("resizeactive", "0 10%") end)

hl.bind("Print",         hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"))
hl.bind("CTRL + Print",  hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"))
hl.bind("ALT + Print",   hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"))


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Workspace Rules
hl.workspace_rule({ workspace = "1" })
hl.workspace_rule({ workspace = "2" })
hl.workspace_rule({ workspace = "3" })
hl.workspace_rule({ workspace = "4" })

-- Open Maximized Rules
hl.window_rule({
    name  = "open-maximized-apps",
    match = { class = "^(code|Code|kdenlive)$" },
    fullscreen = true,
})

-- Open on Workspaces
hl.window_rule({
    name  = "open-on-browse",
    match = { class = "^(brave-browser|Brave-browser|firefox|chromium)$" },
    workspace = "2",
})

hl.window_rule({
    name  = "open-on-note",
    match = { class = "^(Joplin|joplin)$" },
    workspace = "3",
})

hl.window_rule({
    name  = "open-on-code",
    match = { class = "^(GitHub Desktop|github-desktop)$" },
    workspace = "1",
})

-- Floating Window Rules
hl.window_rule({
    name  = "float-polkit",
    match = { class = "^(xfce-polkit)$" },
    float = true,
})

hl.window_rule({
    name  = "float-pip",
    match = { title = "^([Pp]icture-[I-i]n-[Pp]icture)$" },
    float = true,
    pin   = true,
})

-- Window Opacity Rules
hl.window_rule({
    name  = "window-opacity",
    match = { class = "^(helium|GitHub Desktop|github-desktop)$" },
    opacity = 0.97,
})

-- Layer Rules for Blur
hl.layer_rule({
    name  = "layer-blur-opacity",
    match = { namespace = "^(anyrun|waybar)$" },
    blur  = true,
})
