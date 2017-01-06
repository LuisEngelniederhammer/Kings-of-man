Mapguard =
  {
    mapInstance = nil,
    currentX = 0,
    currentY = 0,
    clickedX = 0,
    clickedY = 0,
    releasedX = 0,
    releasedY = 0,
    origin = {
      x = 0,
      y = 0
    }

  }

function Mapguard:new(o, myMap)

  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.mapInstance = myMap;
  self.origin.x =  0;
  self.origin.y =  0;
  return o

end

function Mapguard:pixleToTile(x,y)
  local tmpx = math.floor( (-self.mapInstance.layers["terrain"].x + x) / 32);
  local tmpy = math.floor( (-self.mapInstance.layers["terrain"].y + y) / 32);

  return tmpx,tmpy;
end

function Mapguard:pixleToMapPixle(x,y)
  print("x: " .. x .. " origin x: " .. self.origin.x .. " to " .. self.origin.x + (self.mapInstance.width * 32) .. " | y: ".. y .. " origin y:" .. self.origin.y .. " to " .. self.origin.y + (self.mapInstance.height * 32));
  if ( (x >= self.origin.x and x <= self.origin.x + (self.mapInstance.width * 32)) and (y >= self.origin.y and y <= self.origin.y + (self.mapInstance.height * 32))) then
    return (x - self.origin.x), (y - self.origin.y);
  else
    return false,false; -- not on the map
  end


end

function Mapguard:updateReleased(x,y)
  self.releasedX = x;
  self.releasedY = y;

  ------- FALSCH !!!!!!!!!
  -- Origin muss mein "draggen" geupdatedt werden, relative zum released X/Y
  -- Map wird richtig angezeigt, der mapguard berechnet aber falsch
  --
  self.currentX = self.releasedX;
  self.currentY = self.releasedY;

  self:debug();
end

function Mapguard:updateClicked(x,y)
  self.clickedX = x;
  self.clickedY = y;

  self:debug();
end

function Mapguard:debug()
  print("Clicked at " .. self.clickedX .. " | " .. self.clickedY);
  print("Released at " .. self.releasedX .. " | " .. self.releasedY);
end
-- returns x/y
function Mapguard:getOrigin()
  return self.releasedX, self.releasedY;
end

function Mapguard:getClicked()
  return self.clickedX, self.clickedY;
end

function Mapguard:updateOrigin()

  if ( self.releasedX > self.origin.x) then
    -- wenn wieter nach rechts verschoben
    self.origin.x = self.origin.x + ( self.releasedX - self.origin.x);

  elseif ( self.releasedX < self.origin.x ) then
    -- wenn weiter nach links verschoben
    self.origin.x = self.origin.x - ( self.origin.x - self.releasedX);

  end

  if ( self.releasedY > self.origin.y) then
    -- weiter nach unten verschoben
    self.origin.y = self.origin.y + ( self.releasedY - self.origin.y);

  elseif ( self.releasedY < self.origin.y ) then
    -- weiter nach oeb nverschoben
    self.origin.y = self.origin.y - ( self.origin.y - self.releasedY);

  end

  ---self.origin.x = 1
  --self.origin.y = 2
end

function Mapguard:getCurrentFocus()
  return self.currentX, self.currentY;
end
