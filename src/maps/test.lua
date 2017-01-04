return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.0",
  orientation = "orthogonal",
  renderorder = "right-up",
  width = 32,
  height = 32,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 2,
  properties = {},
  tilesets = {
    {
      name = "tileset_ground",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "tileset_ground.png",
      imagewidth = 192,
      imageheight = 192,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 36,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "terrain",
      x = 0,
      y = 0,
      width = 32,
      height = 32,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxtl+lS3EAMhJVsCD7AY4OPrA8CIe//jBlX+qvp3eKHysvM6JZa4ltE/BB9F52/HzJd9Puiv7/r6/cX43cZD3Z2uZPN2c9Mr5lSpi7TLtoy1TpbMvWZhkxjpjbTpLNNvIPOz7eV7kZRLZlJ1Ojdkekp07PukYH8Tt9TxqzvKv4knlV3q2w5pL8TIasSDeIdZeOb/B/FW+vr7zqdHeJBdpLOVt/KfNvMrlpvDt01Oj/fv8h/4tqJdzP/k77YxPkhHZX+bqWrF00W11XfQbJ36Tz9f9QZvo6mF38myejNh97iTx2gc5Ytg961Ohvucvqi+A+mlzfUzS59s77EnpiR19XyRA4O8eB7b/IP6b9aTmbJH6S/1jn1ukaptUZn5G3/wv/GfDlMD3l4U/473bW6W0xvI/7FZMymP0Xpj1Fy3WZqM0XpS/ThP/lv7uQkyVnEQ28Rb/hmo9Zsni1ug/jXKLX6K/7XH/I6y2Or39TVYvxe743lmLrGF3JyROlb/Kf/Xs3vw/zZFa86bnNJb5ND8kGtoBPspFbxwzHpyfQPUWoA+3u98x6b7R4esJrcT6bb8bfVb3roSfEHw9FFTyGDGBPbymSAbeASuEe9oRt83E3Wmf9n6aKWwQBwF3vqKLh/mIwmCmb2Fjf3n3mGHOJF/ucocw7bwWD0Q/QG8wqbwLnNzlKUueF+Y/MZ/6vukI8fzFhqizpixlFT6D3MDuQxr+hfcgrPm/SDL+APODmbDuoOPCCnKUp/+6z1uQ0GOv5Pyv+r2VPFLVYRB/zj673nvQJeMsupRzCI3uyj1P81bucEsjirTI7nBWwFD3iLbvxgZrs9i3SB/8QNW+mFzfJSm25y1Jl+apV8+I5EfhwHuyj7F3ixRMEHnzk+i8F18uuxAPu9PpgJLp86Zf/AbzACP+Gnd7y+OQf32Q3pEWqEvtmMF+xi/jAjiDuzhz1tNzlgH7hAXbKfOs5jwxRlJuDTIP3XKDXB3Ca3zBRiyp7hNceeQ26oG2bhHrc7CjPmfAf+YWsyOYu966LUHTO6NR2D6aFe2DGojWRvwXbmH/FhV3HMpHaIIzZiE/sC82szfuIEDtdR6oP97zFu8ZP4biaXmHr9VPYObKnsfo6yN7sNHmv6/77ndst3Mh1LlP1lNR3+fwrzH/zynm+jYC3713MUrOX/B99rmKnkkFlAzft+T425D8RoNF5sAX/Z/ZirS9zuXNSi7//gLdhEXMmF/w/bmNzJfDv1/870J9Nnpg/9vqcP3b/bm3c78/MPo097+5Wsv5n+AdpZSnw="
    },
    {
      type = "objectgroup",
      name = "defObjects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "ort",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
