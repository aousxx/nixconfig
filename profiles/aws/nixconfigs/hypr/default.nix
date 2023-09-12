{config, inputs , lib, outputs, pkgs, ...}: {
  wayland.windowManager.hyprland.extraConfig = ''
  
monitor=,1920x1080@144,auto,auto

# Execute your favorite apps at launch
# exec-once = waybar & hyprpaper & firefox

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24
monitor=,addreserved,0,15,10,10

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us,ara
    kb_options = grp:alt_shift_toggle
    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}
init {
  
  exec-once = wl-paste --watch cliphist store
  exec-once = swww init
  exec-once = waybar
  exec-once = noisetorch -i
  exec-once = /nix/store/xxnd89gcsjn3z93z452icpq49rl7zaby-polkit-gnome-0.105/libexec/polkit-gnome-authentication-agent-1 
  exec-once = way-displays -c .config/waydisplay/conf.yaml 
  exec-once = swww img ~/Pictures/main.gif
  
  exec-once = [workspace 5 silent] blueberry
  exec-once = [workspace 5 silent] connman-gtk 
  exec-once = [workspace 5 silent] pavucontrol
  exec-once = [workspace 1 silent] telegram-desktop
  exec-once = [workspace 1 silent] discordcanary
  exec-once = [workspace 3 silent] steam -nochatui -nofriendsui  
  exec-once = [workspace 2 silent] microsoft-edge
  exec-once = [workspace 4 silent] spotify
}


general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 5
    border_size = 2
    col.active_border = rgba(${config.colorScheme.colors.base05}ee) rgba(${config.colorScheme.colors.base00}ee) 45deg
    col.inactive_border = rgba(${config.colorScheme.colors.base01}aa)

    layout = dwindle
}

windowRules{
    #windowrulev2 = float,class:(pavucontrol)
    #windowrulev2 = float,class:(connman-gtk)
    #windowrulev2 = float,class:(blueberry)

}

decoration {
  
    windowrulev2 = opacity 0.8 override 0.5,class:(kitty)

    rounding = 3
    blur {
          enabled = yes
          size = 1
          passes = 1
          new_optimizations = on
    }
    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = true

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    new_is_master = true
}

gestures {
    workspace_swipe = off
}

device:epic-mouse-v1 {
    sensitivity = -0.5
}


misc {
vrr=1
}


$mainMod = SUPER

bind = $mainMod, T, exec, kitty
bind = $mainMod, Q, killactive, 
bind = $mainMod SHIFT, M, exit, 
bind = $mainMod, E, exec, thunar
bind = $mainMod, V, exec, cliphist list | bemenu | cliphist decode | wl-copy

bind = ALT, V, togglefloating, 
bind = $mainMod, R, exec, bemenu-run
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod, F, fullscreen
bind = $mainMod, z, pin

# Move focus with mainMod + WASD
bind = $mainMod, A, movefocus, l
bind = $mainMod, D, movefocus, r
bind = $mainMod, W, movefocus, u
bind = $mainMod, S, movefocus, d

bind = $mainMod SHIFT, A, movewindow, l
bind = $mainMod SHIFT, D, movewindow, r
bind = $mainMod SHIFT, W, movewindow, u
bind = $mainMod SHIFT, S, movewindow, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Volume Keybinds
binde = , XF86AudioRaiseVolume,    exec, amixer set Master 5%+
binde = , XF86AudioLowerVolume,    exec, amixer set Master 5%-
bind = , XF86AudioMute,    exec, amixer set Master toggle

#screenshot
bind = CTRL SHIFT, S, exec, grimblast --freeze copy area


# brightness keybinds
#bind = , XF86MonBrightnessUp,     exec, brightnessctl set 10%+
#bind = , XF86MonBrightnessDown,   exec, brightnessctl set 10%-


#DROPDOWN KITTY CONFIG
exec-once=kitty --class=kitty-dropdown
$dropterm=kitty-dropdown
windowrule=workspace 1,$dropterm
windowrule=float,$dropterm
windowrule=size 75% 20%,$dropterm
windowrule=move 12.5% -469,$dropterm
bind=,49,exec,bash $HOME/scripts/dropdown.sh


'';
}
