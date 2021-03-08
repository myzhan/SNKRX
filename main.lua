require 'engine'
require 'shared'
require 'arena'
require 'buy_screen'
require 'objects'
require 'player'
require 'enemies'


function init()
  shared_init()

  input:bind('move_left', {'a', 'left'})
  input:bind('move_right', {'d', 'right'})
  input:bind('move_up', {'w', 'up'})
  input:bind('move_down', {'s', 'down'})
  input:bind('enter', {'space', 'return'})

  local s = {tags = {sfx}}
  ui_switch1 = Sound('Switch.ogg', s)
  ui_switch2 = Sound('Switch 3.ogg', s)
  ui_transition1 = Sound('Wind Bolt 8.ogg', s)
  ui_transition2 = Sound('Wind Bolt 12.ogg', s)
  coins1 = Sound('Coins 7.ogg', s)
  coins2 = Sound('Coins 8.ogg', s)
  coins3 = Sound('Coins 9.ogg', s)
  shoot1 = Sound('Shooting Projectile (Classic) 11.ogg', s)
  archer1 = Sound('Releasing Bow String 1.ogg', s)
  wizard1 = Sound('Wind Bolt 20.ogg', s)
  swordsman1 = Sound('Heavy sword woosh 1.ogg', s)
  swordsman2 = Sound('Heavy sword woosh 19.ogg', s)
  scout1 = Sound('Throwing Knife (Thrown) 3.ogg', s)
  scout2 = Sound('Throwing Knife (Thrown) 4.ogg', s)
  arrow_hit_wall1 = Sound('Arrow Impact wood 3.ogg', s)
  arrow_hit_wall2 = Sound('Arrow Impact wood 1.ogg', s)
  hit1 = Sound('Player Takes Damage 17.ogg', s)
  hit2 = Sound('Body Head (Headshot) 1.ogg', s)
  hit3 = Sound('Kick 16.ogg', s)
  proj_hit_wall1 = Sound('Player Takes Damage 2.ogg', s)
  enemy_die1 = Sound('Bloody punches 7.ogg', s)
  enemy_die2 = Sound('Bloody punches 10.ogg', s)
  magic_area1 = Sound('Fire bolt 10.ogg', s)
  magic_hit1 = Sound('Shadow Punch 1.ogg', s)
  magic_die1 = Sound('Magical Impact 27.ogg', s)
  knife_hit_wall1 = Sound('Shield Impacts Sword 1.ogg', s)
  blade_hit1 = Sound('Sword impact (Flesh) 2.ogg', s)
  player_hit1 = Sound('Body Fall 2.ogg', s)
  player_hit2 = Sound('Body Fall 18.ogg', s)
  player_hit_wall1 = Sound('Wood Heavy 5.ogg', s)
  pop1 = Sound('Pop sounds 10.ogg', s)
  heal1 = Sound('Buff 3.ogg', s)
  spawn1 = Sound('Buff 13.ogg', s)
  alert1 = Sound('Click.ogg', s)
  elementor1 = Sound('Wind Bolt 18.ogg', s)
  saboteur_hit1 = Sound('Explosion Flesh_01.ogg', s)
  saboteur_hit2 = Sound('Explosion Flesh_02.ogg', s)
  saboteur1 = Sound('Male Jump 1.ogg', s)
  saboteur2 = Sound('Male Jump 2.ogg', s)
  saboteur3 = Sound('Male Jump 3.ogg', s)
  spark1 = Sound('Spark 1.ogg', s)
  spark2 = Sound('Spark 2.ogg', s)
  spark3 = Sound('Spark 3.ogg', s)
  stormweaver1 = Sound('Buff 8.ogg', s)
  cannoneer1 = Sound('Cannon shots 1.ogg', s)
  cannoneer2 = Sound('Cannon shots 7.ogg', s)
  cannon_hit_wall1 = Sound('Cannon impact sounds (Hitting ship) 4.ogg', s)
  pet1 = Sound('Wolf barks 5.ogg', s)
  turret1 = Sound('Sci Fi Machine Gun 7.ogg', s)
  turret2 = Sound('Sniper Shot_09.ogg', s)
  turret_hit_wall1 = Sound('Concrete 6.ogg', s)
  turret_hit_wall2 = Sound('Concrete 7.ogg', s)
  turret_deploy = Sound('321215__hybrid-v__sci-fi-weapons-deploy.ogg', s)
  rogue_crit1 = Sound('Dagger Stab (Flesh) 4.ogg', s)
  rogue_crit2 = Sound('Sword hits another sword 6.ogg', s)

  warrior = Image('warrior')
  ranger = Image('ranger')
  healer = Image('healer')
  mage = Image('mage')
  rogue = Image('rogue')
  nuker = Image('nuker')
  conjurer = Image('conjurer')
  enchanter = Image('enchanter')
  psy = Image('psy')

  class_colors = {
    ['warrior'] = yellow[0],
    ['ranger'] = green[0],
    ['healer'] = green[0],
    ['conjurer'] = yellow[0],
    ['mage'] = blue[0],
    ['nuker'] = blue[0],
    ['rogue'] = red[0],
    ['enchanter'] = red[0],
    ['psy'] = fg[0],
  }

  class_color_strings = {
    ['warrior'] = 'yellow',
    ['ranger'] = 'green',
    ['healer'] = 'green',
    ['conjurer'] = 'yellow',
    ['mage'] = 'blue',
    ['nuker'] = 'blue',
    ['rogue'] = 'red',
    ['enchanter'] = 'red',
    ['psy'] = 'fg',
  }

  character_colors = {
    ['vagrant'] = fg[0],
    ['swordsman'] = yellow[0],
    ['wizard'] = blue[0],
    ['archer'] = green[0],
    ['scout'] = red[0],
    ['cleric'] = green[0],
    ['outlaw'] = red[0],
    ['blade'] = yellow[0],
    ['elementor'] = blue[0],
    ['saboteur'] = red[0],
    ['stormweaver'] = red[0],
    ['sage'] = blue[0],
    ['squire'] = yellow[0],
    ['cannoneer'] = green[0],
    ['dual_gunner'] = green[0],
    ['hunter'] = green[0],
    ['chronomancer'] = blue[0],
    ['spellblade'] = blue[0],
    ['psykeeper'] = fg[0],
    ['engineer'] = yellow[0],
  }

  character_color_strings = {
    ['vagrant'] = 'fg',
    ['swordsman'] = 'yellow',
    ['wizard'] = 'blue',
    ['archer'] = 'green',
    ['scout'] = 'red',
    ['cleric'] = 'green',
    ['outlaw'] = 'red',
    ['blade'] = 'yellow',
    ['elementor'] = 'blue',
    ['saboteur'] = 'red',
    ['stormweaver'] = 'red',
    ['sage'] = 'blue',
    ['squire'] = 'yellow',
    ['cannoneer'] = 'green',
    ['dual_gunner'] = 'green',
    ['hunter'] = 'green',
    ['chronomancer'] = 'blue',
    ['spellblade'] = 'blue',
    ['psykeeper'] = 'fg',
    ['engineer'] = 'yellow',
  }

  character_classes = {
    ['vagrant'] = {'ranger', 'warrior', 'psy'},
    ['swordsman'] = {'warrior'},
    ['wizard'] = {'mage'},
    ['archer'] = {'ranger'},
    ['scout'] = {'rogue'},
    ['cleric'] = {'healer'},
    ['outlaw'] = {'warrior', 'rogue'},
    ['blade'] = {'warrior', 'nuker'},
    ['elementor'] = {'mage', 'nuker'},
    ['saboteur'] = {'rogue', 'conjurer', 'nuker'},
    ['stormweaver'] = {'enchanter'},
    ['sage'] = {'mage', 'nuker'},
    ['squire'] = {'warrior', 'healer', 'enchanter'},
    ['cannoneer'] = {'ranger', 'nuker'},
    ['dual_gunner'] = {'ranger', 'rogue'},
    ['hunter'] = {'ranger', 'conjurer'},
    ['chronomancer'] = {'mage', 'enchanter'},
    ['spellblade'] = {'mage', 'rogue'},
    ['psykeeper'] = {'healer', 'psy'},
    ['engineer'] = {'conjurer'},
  }

  character_descriptions = {
    ['vagrant'] = function(dmg) return '[fg]shoots a projectile that deals [yellow]' .. dmg .. '[fg] damage' end,
    ['swordsman'] = function(dmg) return '[fg]deals [yellow]' .. dmg .. '[fg] damage in an area around the unit' end,
    ['wizard'] = function(dmg) return '[fg]shoots a projectile that deals [yellow]' .. dmg .. ' AoE[fg] damage' end,
    ['archer'] = function(dmg) return '[fg]shoots an arrow that deals [yellow]' .. dmg .. '[fg] damage and pierces' end,
    ['scout'] = function(dmg) return '[fg]throws a knife that deals [yellow]' .. dmg .. '[fg] damage and chains [yellow]3[fg] times' end,
    ['cleric'] = function() return '[fg]heals every unit for [yellow]10%[fg] max hp when any one drops below [yellow]50%[fg] max hp' end,
    ['outlaw'] = function(dmg) return '[fg]throws a fan of [yellow]5[] knives, each dealing [yellow]' .. dmg .. '[fg] damage' end,
    ['blade'] = function(dmg) return '[fg]throws multiple blades that deal [yellow]' .. dmg .. ' AoE[fg] damage' end,
    ['elementor'] = function(dmg) return '[fg]deals [yellow]' .. dmg .. ' AoE[fg] damage to a random target' end,
    ['saboteur'] = function(dmg) return '[fg]calls [yellow]4[] saboteus to seek targets and deal [yellow]' .. dmg .. ' AoE[fg] damage' end,
    ['stormweaver'] = function(dmg) return '[fg]infuses all allied projectiles with chain lightning that deals [yellow]+' .. dmg .. '[fg] damage on hit' end,
    ['sage'] = function(dmg) return '[fg]shoots a slow projectile that draws enemies in' end,
    ['squire'] = function(dmg) return '[yellow]+10 dmg[fg] & [yellow]+25 def[fg] to adjacent units, heal them for [yellow]10%[fg] max hp every 8 seconds' end, 
    ['cannoneer'] = function(dmg) return '[fg]shoots a projectile that deals [yellow]' .. dmg .. ' AoE[fg] damage' end,
    ['dual_gunner'] = function() return '[fg]shoots two parallel projectiles' end,
    ['hunter'] = function(dmg) return '[fg]shoots an arrow that deals [yellow]' .. dmg .. '[fg] damage and has a [yellow]20%[fg] chance to summon a pet' end,
    ['chronomancer'] = function() return '[yellow]+25% aspd[fg] to adjacent units' end,
    ['spellblade'] = function(dmg) return '[fg]throws knives that deal [yellow]' .. dmg .. '[fg] damage, pierce and spiral outwards' end,
    ['psykeeper'] = function() return '[fg]all damage taken is stored and distributed as healing to all allies' end,
    ['engineer'] = function(dmg) return '[fg]drops sentries that shoot bursts of projectiles, each dealing [yellow]' .. dmg .. '[fg] damage' end,
  }

  get_character_stat_string = function(character, level)
    local group = Group():set_as_physics_world(32, 0, 0, {'player', 'enemy', 'projectile', 'enemy_projectile'})
    local mock = Player{group = group, leader = true, character = character, level = level}
    mock:update(1/60)
    return '[red]HP: [red]' .. mock.max_hp .. '[fg], [red]DMG: [red]' .. mock.dmg .. '[fg], [green]ASPD: [green]' .. math.round(mock.aspd_m, 2) .. 'x[fg], [blue]AREA: [blue]' ..
    math.round(mock.area_dmg_m*mock.area_size_m, 2) ..  'x[fg], [yellow]DEF: [yellow]' .. math.round(mock.def, 2) .. '[fg], [green]MVSPD: [green]' .. math.round(mock.v, 2) .. '[fg]'
  end

  get_character_stat = function(character, level, stat)
    print(character)
    local group = Group():set_as_physics_world(32, 0, 0, {'player', 'enemy', 'projectile', 'enemy_projectile'})
    local mock = Player{group = group, leader = true, character = character, level = level}
    mock:update(1/60)
    return math.round(mock[stat], 2)
  end

  character_stats = {
    ['vagrant'] = function(lvl) return get_character_stat_string('vagrant', lvl) end,
    ['swordsman'] = function(lvl) return get_character_stat_string('swordsman', lvl) end, 
    ['wizard'] = function(lvl) return get_character_stat_string('wizard', lvl) end, 
    ['archer'] = function(lvl) return get_character_stat_string('archer', lvl) end, 
    ['scout'] = function(lvl) return get_character_stat_string('scout', lvl) end, 
    ['cleric'] = function(lvl) return get_character_stat_string('cleric', lvl) end, 
    ['outlaw'] = function(lvl) return get_character_stat_string('outlaw', lvl) end, 
    ['blade'] = function(lvl) return get_character_stat_string('blade', lvl) end, 
    ['elementor'] = function(lvl) return get_character_stat_string('elementor', lvl) end, 
    ['saboteur'] = function(lvl) return get_character_stat_string('saboteur', lvl) end, 
    ['stormweaver'] = function(lvl) return get_character_stat_string('stormweaver', lvl) end, 
    ['sage'] = function(lvl) return get_character_stat_string('sage', lvl) end, 
    ['squire'] = function(lvl) return get_character_stat_string('squire', lvl) end, 
    ['cannoneer'] = function(lvl) return get_character_stat_string('cannoneer', lvl) end, 
    ['dual_gunner'] = function(lvl) return get_character_stat_string('dual_gunner', lvl) end, 
    ['hunter'] = function(lvl) return get_character_stat_string('hunter', lvl) end, 
    ['chronomancer'] = function(lvl) return get_character_stat_string('chronomancer', lvl) end, 
    ['spellblade'] = function(lvl) return get_character_stat_string('spellblade', lvl) end, 
    ['psykeeper'] = function(lvl) return get_character_stat_string('psykeeper', lvl) end, 
    ['engineer'] = function(lvl) return get_character_stat_string('engineer', lvl) end, 
  }

  class_stat_multipliers = {
    ['warrior'] = {hp = 1.4, dmg = 1.1, aspd = 0.9, area_dmg = 1, area_size = 1, def = 1.25, mvspd = 0.9},
    ['ranger'] = {hp = 1, dmg = 1.2, aspd = 1.5, area_dmg = 1, area_size = 1, def = 0.9, mvspd = 1.2},
    ['healer'] = {hp = 1.2, dmg = 1, aspd = 0.5, area_dmg = 1, area_size = 1, def = 1.2, mvspd = 1},
    ['mage'] = {hp = 0.6, dmg = 1.4, aspd = 1, area_dmg = 1.25, area_size = 1.2, def = 0.75, mvspd = 1},
    ['rogue'] = {hp = 0.8, dmg = 1.3, aspd = 1.1, area_dmg = 0.6, area_size = 0.6, def = 0.8, mvspd = 1.4},
    ['nuker'] = {hp = 0.9, dmg = 1, aspd = 0.75, area_dmg = 1.5, area_size = 1.5, def = 1, mvspd = 1},
    ['conjurer'] = {hp = 1, dmg = 1, aspd = 1, area_dmg = 1, area_size = 1, def = 1, mvspd = 1},
    ['enchanter'] = {hp = 1.2, dmg = 1, aspd = 1, area_dmg = 1, area_size = 1, def = 1.2, mvspd = 1.2},
    ['psy'] = {hp = 1.5, dmg = 1, aspd = 1, area_dmg = 1, area_size = 1, def = 0.5, mvspd = 1},
    ['seeker'] = {hp = 0.5, dmg = 1, aspd = 1, area_dmg = 1, area_size = 1, def = 1, mvspd = 0.3},
    ['saboteur'] = {hp = 1, dmg = 1, aspd = 1, area_dmg = 1, area_size = 1, def = 1, mvspd = 1.4},
  }

  local ylb1 = function(lvl) return (lvl == 1 and 'yellow' or 'light_bg') end
  local ylb2 = function(lvl) return (lvl == 2 and 'yellow' or 'light_bg') end
  class_descriptions = {
    ['ranger'] = function(lvl) return '[' .. ylb1(lvl) .. ']2[' .. ylb2(lvl) .. ']/4 [fg]- [' .. ylb1(lvl) .. ']10%[' .. ylb2(lvl) .. ']/20% [fg]chance to release a barrage on attack' end,
    ['warrior'] = function(lvl) return '[' .. ylb1(lvl) .. ']2[' .. ylb2(lvl) .. ']/4 [fg]- [' .. ylb1(lvl) .. ']+25[' .. ylb2(lvl) .. ']/+50 [fg]defense to allied warriors' end,
    ['mage'] = function(lvl) return '[' .. ylb1(lvl) .. ']2[' .. ylb2(lvl) .. ']/4 [fg]- [' .. ylb1(lvl) .. ']-15[' .. ylb2(lvl) .. ']/-30 [fg]enemy defense' end,
    ['nuker'] = function(lvl) return '[' .. ylb1(lvl) .. ']2[' .. ylb2(lvl) .. ']/4 [fg]- [' .. ylb1(lvl) .. ']+15%[' .. ylb2(lvl) .. ']/+25% [fg]area damage and size' end,
    ['rogue'] = function(lvl) return '[' .. ylb1(lvl) .. ']2[' .. ylb2(lvl) .. ']/4 [fg]- [' .. ylb1(lvl) .. ']10%[' .. ylb2(lvl) .. ']/20% [fg]chance to crit, dealing [yellow]4x[] damage' end,
    ['healer'] = function(lvl) return '[' .. ylb1(lvl) .. ']3 [fg]- [' .. ylb1(lvl) .. ']+25% [fg]healing effectiveness' end,
    ['conjurer'] = function(lvl) return '[' .. ylb1(lvl) .. ']2 [fg]- [' .. ylb1(lvl) .. ']+25% [fg]construct damage and duration' end,
    ['enchanter'] = function(lvl) return '[' .. ylb1(lvl) .. ']3 [fg]- [' .. ylb1(lvl) .. ']+25% [fg]damage to all allies' end,
    ['psy'] = function(lvl) return 'damage taken by psy units is reflected to enemies at double its value' end,
  }

  resource = 0

  main = Main()
  main:add(BuyScreen'buy_screen')
  main:go_to('buy_screen', 0)
end


function update(dt)
  main:update(dt)
end


function draw()
  shared_draw(function()
    main:draw()
  end)
end


function love.run()
  return engine_run({
    game_name = 'SNAKRX',
    window_width = 480*3,
    window_height = 270*3,
  })
end
