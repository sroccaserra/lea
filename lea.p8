pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
local letters = {
 1,2,3,11,
 4,3,3,5,6,7,8,9,4,5,8,7,11,
 10,7,4,
}

local c = 0

function _init()
 particules = {}
 x = 59
 y = 52
 for i=0,128 do
  add(particules, particule:new(i,-128*rnd(),2*rnd()))
 end
end

function _draw()
 cls(2)

 pal()
 line(0,7,128,7,3)
 line(0,8,128,8,11)
 line(0,9,128,9,3)

 line(0,119,128,119,3)
 line(0,120,128,120,11)
 line(0,121,128,121,3)
 
 spr(19,x,y,2,3)

 for i=1,#particules,2 do
  particules[i]:draw()
 end

 local r = c
 local p = -.3

 for i=1,#letters do
  local x = 63+32*cos(p-r/(6.5*#letters))
  local y = 63-32*sin(p-r/(6.5*#letters))
  pal(6,1)
  spr(letters[i], x-1, y+1)
  pal(6,8+((r/2)%7))
  spr(letters[i], x, y)
  r = r - 6
 end
 
 pal()
 for i=2,#particules,2 do
  particules[i]:draw()
 end
end

function _update()
 c = c + .5
 for particule in all(particules) do
  particule:update()
 end
 
 if btn(0) then
  x = x - 1
 end
 if btn(1) then
  x = x + 1
 end
 if btn(2) then
  y = y - 1
 end
 if btn(3) then
  y = y + 1
 end
 if btn(4) or btn(5) then
  _init()
 end
end

-->8
-- particules

particule = {}
particule.__index = particule 

function particule:new(x, y, r)
 local o = {
  x = x,
  y = y,
  r = rnd() > .5 and 0 or 1,
  p = rnd(),
  c = rnd() > .1 and 7 or 6
 }
 setmetatable(o, particule)
 return o
end

function particule:draw()
 circfill(self.x, self.y, self.r, self.c)
end

function particule:update()
 self.y = self.y +1
 self.x = self.x + cos(self.p+t())
 if self.y > 128 then
  self.y = 0
 end
end
__gfx__
00000000066666000066660006000060006666000006600006600060066666600666660000666660066000000000000000000000000000000000000000000000
00000000066000600660006006600060066000600006600006600060066000000660006006600000066000000000000000000000000000000000000000000000
00700700066000600660006006660060066000600006600000660600066000000660006006600000066000000000000000000000000000000000000000000000
00077000066666000660006006606060066666600006600000660600066666000666660000666600066000000000000000000000000000000000000000000000
00077000066000600660006006600660066000600006600000660600066000000660600000000060066000000000000000000000000000000000000000000000
00700700066000600660006006600060066000600006600000066000066000000660060000000060066000000000000000000000000000000000000000000000
00000000066000600660006006600060066000600006600000066000066000000660006000000060066000000000000000000000000000000000000000000000
00000000066666000066660006600060066000600006600000066000066666600660006006666600066666600000000000000000000000000000000000000000
00000004400000001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044ff44000001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000888ffff8880001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
044ff88f888ff4405555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4fffff8888fffff45555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444f888ff888f440dddddddd00008800008800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04488ffffff88994cccccccc00080880088080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4008844ff4488444dddddddd00080080080080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44488444499889942222222200088008800080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44488004944889942222222200008848848800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444884404998899488888888000888f88f8880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444884449998899499999999044ff888888ff4400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0448844499988440ffffffff4fffff8888fffff40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0008844499988000aaaaaaaa444f88888888f4400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000044494400000aaaaaaaa04488f8f8ff889940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000440000000aaaaaaaa4008884f844884440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000044488444499889940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000044488004944889940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000044488440499889940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000044488444999889940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000004488444999884400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000088444999880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000444944000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000004400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
22222222222222222222222222222222222222222222277722222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222227222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222227222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222dddd2222a2222a2222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222dd112d221aa221a2222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222221dd221d221aaa21a2222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222999992221dd221d221aa2a1a2222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222221991129221dd221d221aa12aa2222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222221992219221dd221d221aa211a2222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222221999992221dd221d221aa221a2222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222219911292211dddd2221aa221a222222222222bbbb222222222222222222222222222222222222222
222222222222222222222222222222222222222222222222199221922211112222112221222222222222bb112b22222222222222222222222222222222222222
222222222222222222222222222222222222222222222222199221922222222222222222222222222221bb221b22222222222222222222222222222222222222
222222222222222222222222222222222222222222222222199999222222222222222222222222222221bbbbbb22222222222222222222222222222222222222
222222222222222222222222222222222222222222222222111112222222222222222222222222222221bb111b22222222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222221bb221b22222222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222221bb221b22222222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222221bb221b82222822222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222112221188221822222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222188821822222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222188281822222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222188128822222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222188211822222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222188221822222222222222222222222222222222
22222222222222222222222222222222228888222222222222222222222222222222222222222222222222222188221822222222222222222222222222222222
2222222222222222222222222222222228811282222222222222222222222222222222222222222222222222211222c2222c2222222222222222222222222222
2222222222222222222222222222222218822182222222222222222222222222222222222222222222222222222221cc221c2222222222222222222222222222
2222222222222222222222222222222218888882222222222222222222222222222222222222222222222222222221ccc21c2222222222222222222222222222
2222222222222222222222222222222218811182222222222222222222222222222222222222222222222222222221cc2c1c2222222222222222222222222222
2222222222222222222222222222222218822182222222222222222222222228822228822222222222222222222221cc12cc2222222222222222222222222222
2222222222222222222222222222222218822182222222222222222222222282882288282222222222222222222221cc211c2222222222222222222222222222
2222222222222222222222222222222218822182222222222222222222222282282282282222222222222222222221cc221c2222222222222222222222222222
2222222222222222222222222222222211222122222222222222222222222288228822282222222222222222222221cc221c2222222222222222222222222222
22222222222222222222222222222222bbbbbb222222222222222222222222288488488222222222222222222222211222122222222222222222222222222222
22222222222222222222222222222221bb1112222222222222222222222222888f88f88822222222222222222222222222222222222222222222222222222222
22222222222222222222222222222221bb2222222222222222222222222244ff888888ff44222222222222222222222222992222222222222222222222222222
22222222222222222222222222222221bbbbb22222222222222222222224fffff8888fffff422222222222222222222221992222222222222222222222222222
22222222222222222222222222222221bb1122222222222222222222222444f88888888f44222222222222222222222221992222222222222222222222222222
22222222222222222222222222222221bb222222222222222222222222224488f8f8ff8899422222222222222222222221992222222222222222222222222222
22222222222222222222222222222221bb22222222222222222222222224228884f8448844422222222222222222222221992222222222222222222222222222
22222222222222222222222222222221bbbbbb222222222222222222222444884444998899422222222222222222222221992222222222222222222222222222
22222222222222222222222222222221111112222222222222222222222444882249448899422222222222222222222221992222222222222222222222222222
22222222222222222222222222222222ee2222222222222222222222222444884424998899422222222222222222222221992222222222222222222222222222
22222222222222222222222222222221ee2222222222222222222222222444884449998899422222222222222222222221122222222222222222222222222222
22222222222222222222222222222221ee222222222222222222222222224488444999884422222222222222222222dd222d2222222222222222222222222222
22222222222222222222222222222221ee222222222222222222222222222288444999882222222222222222222221dd221d2222222222222222222222222222
22222222222222222222222222222221ee2222222222222222222222222222224449442222222222222222222222211dd2d22222222222222222222222222222
22222222222222222222222222222221ee2222222222222222222222222222222244222222222222222222222222221dd1d22222222222222222222222222222
22222222222222222222222222222221ee2222222222222222222222222222222222222222222222222222222222221dd1d22222222222222222222222222222
22222222222222222222222222222221eeeeee2222222222222222222222222222222222222222222222222222222211dd222222222222222222222222222222
222222222222222222222222222222211111122222222222222222222222222222222222222222222222222222222221dd222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222221dd222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222aaaaaa12222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222222221aa111222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222222221aa222222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222222221aaaaa222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222222221aa112222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222222222222222222222222222222222221aa222222222222222222222222222222222222
222222222222222222222222222222222222222222dddddd222222222222222222222222222222222222222221aa222222222222222222222222222222222222
222222222222222222222222222222222222222221dd1112222222222222222222222222222222222222eeeee1aaaaaa22222222222222222222222222222222
222222222222222222222222222222222222222221dd2222222222222222222222222222222222222221ee112e11111222222222222222222222222222222222
222222222222222222222222222222222222222221ddddd2222222222222222222222222222222222221ee221e22222222222222222222222222222222222222
222222222222222222222222222222222222222221dd1122222222222222222222222222222222222221eeeee222222222222222222222222222222222222222
222222222222222222222222222222222222222221dd2222299999222222222222222222222222222221ee1e2222222222222222222222222222222222222222
222222222222222222222222222222222222222221dd222219911292222222222222222222222bbbbb21ee12e222222222222222222222222222222222222222
222222222222222222222222222222222222222221dddddd1992219222222222222222222222bb111221ee212e22222222222222222222222222222222222222
222222222222222222222222222222222222222221111112199999222222cc22222288882221bb222221ee221e22222222222222222222222222222222222222
222222222222222222222222222222222222222222222222199192222221cc222228811282211bbbb22112221222222222222222222222222222222222222222
222222222222222222222222222222222222222222222222199129222221cc2222188221822211112b2222222222222222222222222222222222222222222222
222222222222222222222222222222222222222222222222199212922221cc2222188888822222221b2222222222222222222222222222222222222222222222
222222222222222222222222222222222222222222222222199221922221cc2222188111822222221b2222222222222222222222222222222222222222222222
222222222222222222222222222222222222222222222222112221222221cc22221882218222bbbbb22222222222222222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222221cc222218822182211111222222222222222222222222222222222222222222222222
222222222222222222222222222222222222222222222222222222222221cc222218822182222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222112222211222122222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222

