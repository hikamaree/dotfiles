hl.monitor({ output = "eDP-1", mode = "2880x1800@90", position = "0x0", scale = 1.5 })

hl.config({
	general = {
		gaps_in  = 4,
		gaps_out = 8,
		allow_tearing = false,
		col = {
			active_border   = "rgba(A1DBF8FF)",
			inactive_border = "rgba(4F5258FF)",
		},
	},
	input =  {
		kb_layout = "us,rs,rs",
		kb_variant = ",latin,",
		repeat_rate = 50,
		repeat_delay = 200,
		touchpad = { disable_while_typing = false }
	},
	decoration = {
		shadow = { enabled = false },
		blur = { enabled = false },
	},
	animations = { enabled = false },
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		background_color = 0x111111,
	}
})

hl.on("hyprland.start", function ()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("noctalia msg wallpaper-set .local/share/wallpapers/w5.svg")
end)

hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true, pin = true, center = true })
hl.workspace_rule({ workspace = "special:music", gaps_out = 120 })

local function on_created_empty(workspace, cmd)
	hl.on("workspace.created", function (ws)
		if ws.name == workspace and ws.is_empty then hl.exec_cmd(cmd) end
	end)
end

on_created_empty("1", "flatpak run app.zen_browser.zen")
on_created_empty("2", "alacritty -e sh -c 'tmux new-session -A -s $USER'")
on_created_empty("special:music", "flatpak run org.jeffvli.feishin")

hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + GRAVE", hl.dsp.workspace.toggle_special("music"))
hl.bind("CTRL + SUPER + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout at-translated-set-2-keyboard next"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("wallpaper"))

hl.bind("ALT_R",                 hl.dsp.exec_cmd("noctalia msg panel-open launcher"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("noctalia msg brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down"))
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("noctalia msg volume-up"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("noctalia msg volume-down"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("noctalia msg volume-mute"))
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("noctalia msg mic-mute"))

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("flatpak run app.zen_browser.zen"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("flatpak run com.discordapp.Discord"))

hl.bind("SUPER + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | satty -f - --copy-command wl-copy -o "~/pictures/screenshots/%b%d_%H%M%S.png"'))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('grim - | satty -f - --copy-command wl-copy -o "~/pictures/screenshots/%b%d_%H%M%S.png"'))
hl.bind("SUPER + R", hl.dsp.exec_cmd("killall -SIGINT gpu-screen-recorder || gpu-screen-recorder -a default_output -w screen -f 60 -o ~/pictures/videos/$(date +%b%d_%H%M%S).mp4"))

for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i}))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock & sleep 0.3 && systemctl suspend"), { locked = true })
