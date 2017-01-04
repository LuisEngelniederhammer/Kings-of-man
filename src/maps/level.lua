return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 15,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 32,
  properties = {},
  tilesets = {
    {
      name = "towncenter1",
      firstgid = 1,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "../buildings/towncenter1.png",
      imagewidth = 64,
      imageheight = 64,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "tileset",
      firstgid = 2,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "tileset.png",
      imagewidth = 640,
      imageheight = 480,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 300,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "terrain",
      x = 0,
      y = 0,
      width = 30,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["test"] = "testCustomAttribute"
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUjIJRMAoQgAWImYCYGYmNjJmRaJgaZMwEpZnRxND1MqHZxTpAGABp7ADv"
    },
    {
      type = "objectgroup",
      name = "InteractObjects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 23,
          name = "ort",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "TownLeft",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 256,
          width = 192,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "TownCenter",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 256,
          width = 192,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "TownRight",
          type = "",
          shape = "rectangle",
          x = 736,
          y = 256,
          width = 192,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "WallLeft",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 320,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "WallRight",
          type = "",
          shape = "rectangle",
          x = 928,
          y = 320,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
