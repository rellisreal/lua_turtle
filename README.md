# Computer-Craft Turtle end-crystal automation.
Automating crystal placement in modded minecraft ATM10

### Purpose

I made this to purely automate the dragon heart production for draconic evolution in ATM 10. 

Dragon hearts spawn in after the ender-dragon is beaten in ATM10 they don't spawn in naturally (So hostile-neural networks doesn't work)

So to ensure a steady-stream of dragon hearts the dragon needs to be manually respawned via end-crystals and then slain.

Initially I attempted to automatically place the end-crystals directly through modular routers, however the modded end-spawn structure regenerates upon the death of the ender dragon, causing the routers to de-spawn, which means we needed a method that will allow us to place the end-crystals remotely from a distance. 

The alternative option was a Just Dire Things advanced block-placer, however after attempting that, I noticed that it seemed incapable of placing end-crystals.

Final option that I came up with on the spot (Without using an annoying piston setup with a router attached) was a mining turtle with a custom lua script. 

The turtles would be placed on opposite corners of the end-structure outside of the spawn zone and navigate to the required area and place an end-crystal.

### How to use

Import script into a Mining Turtle via the following pastebin url:
https://pastebin.com/qb0Ty4X9

Mining Turtle Command:
```
pastebin get qb0Ty4X9 startup.lua
reboot
```

### My setup 
- AE2 to initiate the dragon heart crafting process
- AE2 Stock Export Bus refueling 64 Charcoal 
- Modular routers that emmit redstone signals when transporting end-crystals to the Turtles
- Turtle A COORDS (-8, 60, 8) 
- Turtle B COORDS (8, 60, -8)
- The dragon is killed via a Industrial Foregoing stasis chamber + a Sharpness 10 / Looting 10 Mob Masher from Mob Grinding Utils. 
- Absorption Hopper / Advanced Item Hopper for item collection
- Comparator on the gold barrel to notify the stasis chamber when to release (To allow the death animation to play and Dragon Heart to spawn) 

### Why

I am fully aware that the standard/traditional way to automate the process of awakend draconium is through Mystical Agriculture, however in my case I wanted a more chaotic and less-environmently friendly way.