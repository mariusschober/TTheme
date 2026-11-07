-- TTheme Dark: attention lives in exactly one place.
-- The focused window is drawn in lamplight ink-blue; everything else is night.
local active_border_color   = "rgb(8297f2)"
local inactive_border_color = "rgba(2a323bcc)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  -- Dimming reads stronger on a dark ground, so it stays gentle.
  -- Raise toward 0.15 for deep-work sessions.
  decoration = {
    dim_inactive = true,
    dim_strength = 0.08,
  },
})
