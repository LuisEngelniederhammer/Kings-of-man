Building =
  {
    towncenter =
    {
      level = 1,
      maxLevel = 2,
      menuStr = "Towncenter",
      activeModel = 12,
      models = {
        {
          love.graphics.newImage("/buildings/towncenter1.png"),
          32,
          32
        },
        {
          love.graphics.newImage("/buildings/towncenter2.png"),
          64,
          64
        }


      },

    }
  }

function Building:new(o)

  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.towncenter.activeModel = self.towncenter.models[self.towncenter.level][1];


  return o
end

function Building:test()
  print(self.level);
end

function Building:getWidth(building)
end

function Building:getHeight(building)
end

function Building:getObjectByIndex(index)
  return self[index];
end

function Building:getActiveModel(building)
  return self[building].activeModel;
end

function Building:getLevel(building)
  return self[building].level;
end

function Building:setLevel(building,level)
  if ( level > self[building].maxLevel) then
    return false
  end
  self[building].level = level;
  self[building].activeModel = self[building].models[level];
end
