Template =
  {
  	 gameClass = nil,
    amount = 0,
    -- requires
    rFood = 0,
    rSpace = 1,
    -- producing
    pTax = 0,
    

  }

function Template:new(o, GameLogic, startAmount, needsFood, needsSpace, producesTax)

  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.gameClass = GameLogic;
  self.amount = startAmount;
  self.rFood = needsFood;
  self.rSpace = needsSpace;
  self.pTax = producesTax;

  return o
end
-- Setter
function Template:setAmount(var)
  self.amount = var;
end
function Template:setRequiredFood(var)
  self.rFood = var;
end
function Template:setRequiredSpace(var)
  self.rSpace = var;
end
function Template:setProducingTax(var)
  self.pTax = var;
end
-- Getter
function Template:getAmount()
  return self.amount;
end
function Template:getRequiredFood()
  return self.rFood;
end
function Template:getRequiredSpace()
  return self.rSpace;
end
function Template:getProducingTax()
  return self.pTax;
end
