---------------------
---- KEYBINDINGS ----
---------------------

require("conf.programs")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

--------------------------------------------------------------------
-- More binds at https://wiki.hypr.land/Configuring/Basics/Binds/ --
--------------------------------------------------------------------

-------------------
--- SHORTCUTS
-------------------

-- hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Open terminal"})
hl.bind(mainMod .. " + C", hl.dsp.window.close(), { description = "Close window"})
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open file manager"})
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu), { description = "Open application menus"})
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle window split way"})    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }), { description = "Move focus to left"})
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus to right"})
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }), { description = "Move focus to up"})
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }), { description = "Move focus to down"})


-------------------
--- WORKSPACE
-------------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}), { description = "Jump to workpace number $i"})
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }), { description = "Move window to workspace number $i"})
end
-- Navigate the workspaces
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "e-1" }), { description = "Move to previous workspace" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "e+1" }), { description = "Move to next workspace" })


--- WINDOWS
-- To switch between windows in a floating workspace:
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next(), { description = "Move focus to next window" })     -- Change focus to another window
    hl.dispatch(hl.dsp.window.bring_to_top(), { description = "Move focus to first window" })   -- Bring it to the top
end)

-- -- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Drag window with mouse" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window with mouse" })

-------------------
--- MULTIMEDIA KEYS
-------------------

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-------------------
--- WMENU
-------------------
hl.bind(mainMod .. " + m", hl.dsp.exec_cmd("$HOME/.config/wmenu/custom-scripts/open-script-menu"), { description = "Open wmenu"})
