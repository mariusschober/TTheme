# TTheme Dark

**TSurfing for Omarchy, after sunset.** Night ink, paper text, and still one meaning per color.

![TTheme Dark](preview.png)

This branch is the dark companion to [TTheme](https://github.com/mariusschober/TTheme) (`main`). Install it next to the light theme as `ttheme-dark`:

```bash
git clone -b dark https://github.com/mariusschober/TTheme ~/.config/omarchy/themes/ttheme-dark   # quick try; see "Keep hyprland.lua" below
omarchy theme set ttheme-dark
```

## Same grammar, darker ground

At night the paper becomes ink and the ink becomes paper. The six colors keep their jobs; each is lifted just enough to stay readable on a dark ground without starting to glow.

| Color | Meaning |
|---|---|
| **Ink blue** `#8297F2` | You: human intent, the focused window, the next action |
| **Violet** `#A88BF0` | AI: delegated work, a machine's voice |
| **Green** `#6DB894` | Met: a done-when line satisfied, work accepted |
| **Amber** `#D4A35C` | Gate: waiting for your judgment |
| **Red** `#E5786E` | Not met: real failures only, never ornament |
| **The dot** `#E2643F` | The period in "Tsurfing.", a sentence finished |

The ground `#20272E` is the night sky of the **Ink** wallpaper, so the desktop and the windows on it are one surface.

## Wallpapers

1. **Ink**: the horizon at night. The default.
2. **Horizon**, 3. **One thing.**, 4. **Two gates**, 5. **Tide**, 6. **Ledger**: the light set, redrawn for the dark.

## Switching with the sun

[NightMan](https://github.com/codefriendly/omarchy-nightman) flips the system light/dark preference at sunrise and sunset, but it does not change the Omarchy theme. `nightman/` closes that gap: a small watcher that sets `ttheme` by day and `ttheme-dark` by night, and stays out of the way when any other theme is active.

```bash
omarchy plugin add https://github.com/codefriendly/omarchy-nightman.git --enable
install -Dm755 nightman/ttheme-follow-nightman ~/.local/bin/ttheme-follow-nightman
install -Dm644 nightman/ttheme-follow-nightman.service ~/.config/systemd/user/ttheme-follow-nightman.service
systemctl --user daemon-reload
systemctl --user enable --now ttheme-follow-nightman.service
```

Both themes must be installed under the slugs `ttheme` and `ttheme-dark`.

To override the schedule, use NightMan's sun/moon panel (a temporary light or dark lasts until the next sunrise or sunset). Picking the other TTheme in the theme menu does not stick: Omarchy writes the light/dark preference when it sets a theme, NightMan's Auto mode puts it back, and the watcher follows NightMan.

**Keep `hyprland.lua`.** Omarchy drops every `.lua` file from a theme folder that is a git clone, so a plain `git clone` loses the focus border and dimming. Clone elsewhere and symlink the folders in; Omarchy treats a symlinked theme as your own:

```bash
git clone https://github.com/mariusschober/TTheme ~/src/TTheme
git -C ~/src/TTheme worktree add ../TTheme-dark dark
ln -s ~/src/TTheme ~/.config/omarchy/themes/ttheme
ln -s ~/src/TTheme-dark ~/.config/omarchy/themes/ttheme-dark
```

With a transparent bar, the bar can keep the previous theme's text color after a switch ([omacom/omarchy#10289](https://github.com/omacom/omarchy/issues/10289)). Until that fix lands, `nightman/bar-text-resample.sh` works around it: `omarchy hook install theme-set nightman/bar-text-resample.sh`.

## Files

`colors.toml` is the single source of truth (`mode = "dark"`); Omarchy generates terminals, Neovim, VS Code, the bar, menus and notifications from it. `hyprland.lua` draws the focus border in ink blue and dims inactive windows gently. `btop.theme`, `chromium.theme`, `shell.lock.toml`, `unlock.png`, `icons.theme` (Yaru-blue-dark) and `keyboard.rgb` complete the set.
