--
-- Base Module
-- @module Base
Base =
  {
    gold = 0,
    happiness = 0,
    material = 0,
    reputation = 0,
    food = 0
  }

-- Base Constructor
-- @param nil
-- @param #string startGold
-- @param #string starthappiness
-- @param #string startmaterial
-- @param #string startrep
-- @param #string startfood
-- @return #table instance of class Base
function Base:new(o, startGold, starthappiness, startmaterial,startrep,startfood)

  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.food = startfood;
  self.happiness = starthappiness;
  self.material = startmaterial;
  self.reputation = startrep;
  self.gold = startGold;

  return o
end
--Setter
function Base:setFood(var)
  self.food = var;
end
function Base:setHappiness(var)
  self.happiness = var;
end
function Base:setMaterial(var)
  self.material = var;
end
function Base:setReputation(var)
  self.reputation = var;
end
function Base:setGold(var)
  self.gold = var;
end
--Getter
function Base:getFood()
  return self.food;
end
function Base:getHappiness()
  return self.happiness;
end
function Base:getMaterial()
  return self.material;
end
function Base:getReputation()
  return self.reputation;
end
function Base:getGold()
  return self.gold;
end




