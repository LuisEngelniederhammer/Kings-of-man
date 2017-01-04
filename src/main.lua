-- Tile map loader
local sti = require ("sti");
-- suit || include GUI
local suit = require ('suit');
-- Gameplay Mechanics
-- Alles rund ums gameplay
require("shared/App");
--

--
--
--
--
--
function love.load()

  local startLoader = love.timer.getTime();

  print("Loading map...");
  map = sti("maps/test.lua");
  print("Map loaded...");

  print("Loading Objects...");
  interactiveObjects = {}


  for k, object in pairs(map.objects) do
    if object.name == "TownCenter" then
      interactiveObjects.TownCenter = object;
      print("TownCenter found");
    elseif object.name == "TownLeft" then
      interactiveObjects.TownLeft = object;
      print("TownLeft found");
    elseif object.name == "TownRight" then
      interactiveObjects.TownRight = object;
      print("TownRight found");
    elseif object.name == "ort" then
      interactiveObjects.ort = object;
      print("orientation found");
    elseif object.name == "WallLeft" then
      interactiveObjects.WallLeft = object;
      print("WallLeft found");
    elseif object.name == "WallRight" then
      interactiveObjects.WallRight = object;
      print("WallRight found");
    end
  end

  print("Objects loaded and processed...");

  print("Initializing Gameplay mechanics...");
  _App = App:new(nill);
  print("Initialized Gameplay mechanics...");

  font = love.graphics.newFont("fonts/OpenSans-Regular.ttf", 15);
  love.graphics.setFont(font);

  --particle system test
  local img = love.graphics.newImage('assets/particle.png');

  psystem = love.graphics.newParticleSystem(img, 32);
  psystem:setParticleLifetime(2, 10); -- Particles live at least 2s and at most 5s.
  psystem:setEmissionRate(220);
  psystem:setSizeVariation(1);
  --psystem:setSpeed(100);
  --psystem:setLinearAcceleration(-150, -150, 150, 150); -- Random movement in all directions.
  psystem:setColors(255, 255, 255, 255, 255, 255, 255, 0); -- Fade to transparency.
  psystem:setRotation( 1, 10 );
  psystem:setRadialAcceleration( 12, 100 );

  ps = getPS("assets/Fire",love.graphics.newImage("assets/square.png"));

  -- creating the main menu

  mainMenu = suit.new();
  pauseMenu = suit.new();
  hud = suit.new();

  print("***********************************************************************");
  print("*Loading took " .. love.timer.getTime() - startLoader .. " seconds.*");
  print("***********************************************************************");

  globals =
    {
      tx = 0,
      ty = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight(),
      widthHalf = love.graphics.getWidth() / 2,
      heightHalf = love.graphics.getHeight() / 2,
      offsetX = 0,
      offsetY = 0
    }

  -- print ( map.layers["terrain"].y);
  --love.graphics.translate(0,0);
  mouse3IsDown = false;
  map:resize(globals.width,globals.height);
end
--
--
--
--
function love.update(dt)
  --
  -- Game läuft nicht, main menu anzeigen
  --
  --
  --

  if ( _App:getGameState() == _App.GameState.mainmenu ) then

    mainMenu.layout:reset((love.graphics.getWidth() / 2 ) - 150,(love.graphics.getHeight() / 2 ) - 45);
    mainMenu.layout:padding(8);
    mainMenu:Label("Kings of Man", mainMenu.layout:row(300,30));
    -- construct a cell of size 300x30 px and put the button into it
    if (mainMenu:Button( "Start", mainMenu.layout:row() ).hit) then
      _App:setGameState(_App.GameState.running);


    elseif (mainMenu:Button("Exit", mainMenu.layout:row()).hit) then
      os.exit();
    end
    return;
  end
  --
  --pausen/esc menu
  --
  --
  --
  if ( _App:getGameState() == _App.GameState.pause) then

    pauseMenu.layout:reset((love.graphics.getWidth() / 2 ) - 150,(love.graphics.getHeight() / 2 ) - 45);
    pauseMenu.layout:padding(8);
    pauseMenu:Label("Pause", pauseMenu.layout:row(300,30));
    -- construct a cell of size 300x30 px and put the button into it


    if ( pauseMenu:Button( "Resume",{}, pauseMenu.layout:row() ).hit ) then




      _App.DayCycleClassObject:resume();
      _App:setGameState(_App.GameState.running);

    elseif (pauseMenu:Button("Exit", pauseMenu.layout:row()).hit) then
      os.exit();
    end

    return;
  end

  --
  --
  --HUD
  --
  --
  --hud.layout:reset(300,0,20,20);
  hud.layout:push();
  hud.layout:padding(3);
  -- construct a cell of size 300x30 px and put the button into it
  if (hud:Button( "Population",hud.layout:col(160,20) ).hit) then

    print("HUD Menu clicked");
  end
  if (hud:Button("Town",  hud.layout:col()).hit) then

    print("HUD Town clicked");

  end
  hud:Label("Gold: " .. _App.BaseClassObject:getGold() , hud.layout:col(90));
  hud:Label("happiness: " .. _App.BaseClassObject:getHappiness() , hud.layout:col(100));
  hud:Label("material: " .. _App.BaseClassObject:getMaterial() , hud.layout:col(90));
  hud:Label("reputation: " .. _App.BaseClassObject:getReputation() , hud.layout:col(100));
  hud:Label("food: " .. _App.BaseClassObject:getFood() , hud.layout:col(90));

  hud.layout:pop();


  --
  --Update loop läuft
  --
  --
  --
  for k, object in pairs(map.objects) do
    print(object.name)
  end
  --ps test
  if showPS == true then
    psystem:update(dt);
  end
  ps:update(dt);
  --
  _App.DayCycleClassObject:start();
  map:update(dt);
  if _App.DayCycleClassObject:isOver() then
    print("Day over/Tag vorbei. Current Day/Cycle: " .. _App.DayCycleClassObject:getCurrentDayCount());

    _App.DayCycleClassObject:_end();
  end
end

--
--
--
--
function love.draw()

  -- Draw gui
  love.graphics.setBackgroundColor(0, 100, 200, 0.2);
  mainMenu:draw();
  if ( _App:getGameState() == _App.GameState.mainmenu ) then
    return;
  end

  love.graphics.setBackgroundColor(0, 100, 200, 0.2);
  pauseMenu:draw();
  if ( _App:getGameState() == _App.GameState.pause ) then
    return;
  end
  love.graphics.setColor(255, 255, 255, 255);

  love.graphics.push( );
  if (mouse3IsDown == true) then

    globals.tx = love.mouse.getX() - ((map.layers["terrain"].width * 32) / 2);

    globals.ty = love.mouse.getY() - ((map.layers["terrain"].height * 32) / 2);

    love.graphics.translate(love.mouse.getX() - ((map.layers["terrain"].width * 32) / 2),love.mouse.getY() - ((map.layers["terrain"].height * 32) / 2));

  else
    love.graphics.translate(globals.tx, globals.ty);
  end
  map:draw();

  love.graphics.pop();
  hud:draw();

  --align the map to 0,0 in the window
  --local tx = math.floor(interactiveObjects.ort.x);
  --local ty = math.floor(interactiveObjects.ort.y);

  -- only draw this one layer
  --map:drawTileLayer("terrain");

  -- particle test
  --love.graphics.draw(psystem, love.mouse.getX(), love.mouse.getY())
  -- Reset color
  love.graphics.setColor(255, 255, 255, 255);
  love.graphics.setBackgroundColor(0, 100, 100, 0.7);


--love.graphics.setBlendMode( "add", "alphamultiply" );
--love.graphics.draw(ps, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)
--love.graphics.setBlendMode( "alpha" );
--love.graphics.draw( _App.BuildingClassObject:getActiveModel("towncenter") ,interactiveObjects.TownCenter.x + interactiveObjects.TownCenter.width / 2 - 32, interactiveObjects.TownCenter.y + interactiveObjects.TownCenter.height / 2 + 16);
end

--
--
--
--
function love.mousereleased( x, y, button, istouch )
  if ( button == 2 ) then
    showPS = false;
    psystem:reset();

  elseif ( button == 3 ) then
    mouse3IsDown = false;
    globals.offsetX = love.mouse.getX();
    globals.offsetY = love.mouse.getY();

  end
end
--
--


function love.mousepressed( x, y, button, istouch )

  if ( _App:getGameState() == App.GameState.mainmenu or _App:getGameState() == App.GameState.pause) then
    return;
  end

  if  (button == 3) then
    mouse3IsDown = true;
  end
  if  (button == 1) then
    map.objects["test" .. math.random(1,10)] = {
      id = 1,
      name = "test" .. math.random(1,10),
      type = "",
      shape = "rectangle",
      x = love.mouse.getX(),
      y = love.mouse.getY(),
      width = 32,
      height = 32,
      rotation = 0,
      visible = true,
      properties = {}
    }
  end

  if ( (button == 1) and (isClickOnObject(interactiveObjects.ort,x,y) == true) ) then
  --_App.DayCycleClassObject:suspend();
  --_App:setGameState(_App.GameState.pause);
  end

  if ( button == 2 ) then
    local tmpx,tmpy = map:convertPixelToTile(love.mouse.getX(),love.mouse.getY());

    print( "clicked on tile x/y: " .. math.floor(tmpx) .. "/" .. math.floor(tmpy));
  end
end
--
--
--
--
function isClickOnObject(_obj,x,y)

  if ( _obj == nil) then
    return false;
  end
  local tmpX, tmpY = map:convertPixelToTile(x,y);

  local minX = _obj.x;
  local maxX = _obj.x + _obj.width;

  local minY = _obj.y;
  local maxY = _obj.y + _obj.height;

  if ( ((x >= minX) and ( x <= maxX )) and ((y >= minY) and (y <= maxY)) ) then

    return true;
  else

    return false;
  end

end
--
--
--
--
function love.textinput(t)
  -- forward text input to SUIT
  mainMenu:textinput(t);
  pauseMenu:textinput(t);
end
--
--
--
--
function love.keypressed(key)
  if key == "escape" and (_App:getGameState() ~= App.GameState.mainmenu) then
    _App.DayCycleClassObject:suspend();
    _App:setGameState(_App.GameState.pause);
  elseif key == "left" then
    globals.tx = globals.tx - 32;
  elseif key == "right" then
    globals.tx = globals.tx + 32;
  elseif key == "up" then
    globals.ty = globals.ty + 32;
  elseif key == "down" then
    globals.ty = globals.ty - 32;
  end

  --foreward keyboard input to GUI system
  --mainMenu:keypressed(key);
  --pauseMenu:keypressed(key);

end


































































































































































































































































































































































































































































































































































































































