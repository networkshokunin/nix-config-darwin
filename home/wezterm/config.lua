local wezterm = require('wezterm')
return {
    color_scheme = 'Catppuccin Mocha',
    default_prog = { 'zsh' },
    font = wezterm.font('JetBrainsMono Nerd Font Mono'),
    front_end = "WebGpu",
    font_size = 18.0,
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    enable_scroll_bar = true,
    scrollback_lines = 4000,
    keys = {
        -- -- Create a new tab in the same domain as the current tab
        -- {key="t", mods="CTRL", action=wezterm.action{SpawnTab="CurrentTabDomain"}},
        -- -- Create a new tab in the default domain
        -- {key="t", mods="ALT", action=wezterm.action{SpawnTab="DefaultDomain"}},
        -- move tabs
        {key="LeftArrow", mods="CTRL", action=wezterm.action{MoveTabRelative=-1}},
        {key="RightArrow", mods="CTRL", action=wezterm.action{MoveTabRelative=1}},
        -- move focus between tabs
        {key="LeftArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
        {key="RightArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
        -- {key='R', mods = 'ALT', action = act.PromptInputLine { description = 'Enter new name for tab', initial_value = 'My Tab Name',
        --                                                         action = wezterm.action_callback(function(window, pane, line)
        --                                                                 if line then
        --                                                                     window:active_tab():set_title(line)
        --                                                                 end
        --                                                         end)},},
        },
}