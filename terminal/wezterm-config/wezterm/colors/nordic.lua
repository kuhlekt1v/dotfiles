-- Nordic WezTerm theme

local C = {
  darker_black = "#1E222A",
  black = "#242933",
  black2 = "#2E3440",
  one_bg = "#222630",
  one_bg3 = "#3B4252",

  grey = "#434C5E",
  grey_fg = "#4C566A",
  grey_fg2 = "#60728A",

  light_grey = "#BBC3D4",

  red = "#BF616A",
  baby_pink = "#C5727A",
  pink = "#B74E58",

  green = "#A3BE8C",
  vibrant_green = "#B1C89D",

  blue = "#81A1C1",
  nord_blue = "#5E81AC",

  yellow = "#EBCB8B",
  sun = "#EFD49F",

  purple = "#B48EAD",
  dark_purple = "#A97EA1",

  teal = "#88C0D0",
  orange = "#D08770",
  cyan = "#8FBCBB",
}

local B = {
  base06 = "#D8DEE9",
  base07 = "#E5E9F0",
}

local P = {

  black0 = C.black,
  black1 = C.darker_black,
  black2 = C.one_bg,

  gray0 = C.black,
  gray1 = C.black2,
  gray2 = C.one_bg3,
  gray3 = C.grey,
  gray4 = C.grey_fg,
  gray5 = C.grey_fg2,

  white0 = C.light_grey,
  white1 = B.base06,
  white2 = B.base07,

  blue0 = C.nord_blue,
  blue1 = C.blue,
  blue2 = C.teal,

  cyan = {
    base = C.cyan,
    bright = "#9FC6C5",
  },

  red = {
    base = C.red,
    bright = C.baby_pink,
  },

  yellow = {
    base = C.yellow,
    bright = C.sun,
  },

  green = {
    base = C.green,
    bright = C.vibrant_green,
  },

  magenta = {
    base = C.purple,
    bright = "#BE9DB8",
  },
}

return {

  foreground = P.white0,
  background = P.gray0,

  cursor_bg = P.white1,
  cursor_border = P.white1,
  cursor_fg = P.gray0,

  selection_fg = P.white1,
  selection_bg = P.gray1,

  ansi = {
    P.black0,
    P.red.base,
    P.green.base,
    P.yellow.base,
    P.blue0,
    P.magenta.base,
    P.cyan.base,
    P.white0,
  },

  brights = {
    P.gray2,
    P.red.bright,
    P.green.bright,
    P.yellow.bright,
    P.blue2,
    P.magenta.bright,
    P.cyan.bright,
    P.white1,
  },
}
