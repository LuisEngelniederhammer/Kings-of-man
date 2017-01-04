Commoner =
  {
    gameClass = nil,
    amount = 0,
    -- requires
    rFood = 0,
    rSpace = 1,
    -- producing
    pTax = 0,


  }

function Commoner:new(o, GameLogic, startAmount, needsFood, needsSpace, producesTax)

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
--
--
function Commoner:update()
	
end
--
--
-- Setter
function Commoner:setAmount(var)
  self.amount = var;
end
function Commoner:setRequiredFood(var)
  self.rFood = var;
end
function Commoner:setRequiredSpace(var)
  self.rSpace = var;
end
function Commoner:setProducingTax(var)
  self.pTax = var;
end
-- Getter
function Commoner:getAmount()
  return self.amount;
end
function Commoner:getRequiredFood()
  return self.rFood;
end
function Commoner:getRequiredSpace()
  return self.rSpace;
end
function Commoner:getProducingTax()
  return self.pTax;
end
