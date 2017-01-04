DayCycle = {
  dayLength = nil,
  isCycleStarted = false,
  startTime = nil,
  debug = false,
  cycleCount = 0,
  suspended = false,
  suspendedStart = nil,
  suspendedLength = nil
}

function DayCycle:new(o,dayLength)

  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.dayLength = dayLength

  return o
end

function DayCycle:getDayLength()
  return self.dayLength
end

function DayCycle:start()
  if not self.isCycleStarted and not self.suspended then
    self.startTime = love.timer.getTime()
    self.isCycleStarted = true
  end
  if debug == true then
    print("Cycle started: " .. self.startTime .. " | Current Cycle: " .. self:currentCycle() .. " | Cycle Count: " .. self.cycleCount .. "| Is suspended: " .. string.format("%s",self.suspended))
  end
end

function DayCycle:_end()
  self.isCycleStarted = false
  self.startTime = nil
  self.suspendedStart = nil
  self.cycleCount = self.cycleCount + 1
end

function DayCycle:getCurrentDayCount()
  return self.cycleCount;
end

function DayCycle:currentCycle()
  if (self.startTime ~= nil) then
    if self.debug == true then
      print(love.timer.getTime() - self.startTime)
    end
    return love.timer.getTime() - self.startTime
  else
    return false
  end
end

function DayCycle:suspend()
  if self.suspended then
    -- ist schon suspended, nichts mahcne
    return false
  end
  self.suspended = true
  self.suspendedStart = love.timer.getTime()
end

function DayCycle:resume()
  if not self.suspended then
    -- nicht suspended, kann also nicht vortfahren
    return false
  end

  self.suspendedLength = love.timer.getTime() - self.suspendedStart
  self.startTime = self.startTime + self.suspendedLength
  self.suspended = false
end

function DayCycle:isOver()
  if (((love.timer.getTime() - self.startTime) >= self.dayLength) and not self.suspended) then
    return true
  else
    return false
  end
end
