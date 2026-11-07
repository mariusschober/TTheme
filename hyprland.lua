-- TTheme: attention lives in exactly one place.
-- The focused window is drawn in ink; everything else is paper.
local active_border_color   = "rgb(243fb0)"
local inactive_border_color = "rgba(e4e3dacc)"

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

  -- The periphery recedes but stays readable: context one glance away,
  -- no longer competing. Raise toward 0.15 for deep-work sessions.
  decoration = {
    dim_inactive = true,
    dim_strength = 0.06,
  },
})
