--[[
https://wiki.factorio.com/Tutorial:Mod_settings

Types of settings:
* startup - game must be restarted if changed (such a setting may affect prototypes' changes)
* runtime-global - per-world setting
* runtime-per-user - per-user setting

Types of values:
* bool-setting
* double-setting
* int-setting
* string-setting

Files being processed by the game:
* settings.lua
* settings-updates.lua
* settings-final-fixes.lua

DATA:
data:extend({
   {
      type = "int-setting",
      name = "setting-name1",
      setting_type = "runtime-per-user",
      default_value = 25,
      minimum_value = -20,
      maximum_value = 100,
      per_user = true,
   },
   {
      type = "bool-setting",
      name = "setting-name2",
      setting_type = "startup",
      default_value = true,
      per_user = false,
   },
   {
      type = "double-setting",
      name = "setting-name3",
      setting_type = "runtime-per-user",
      default_value = -23,
      per_user = true,
   },
   {
      type = "string-setting",
      name = "setting-name4",
      setting_type = "runtime-per-user",
      default_value = "Hello",
      allowed_values = {"Hello", "foo", "bar"}, -- Optional
      allow_blank = false -- Optional
      per_user = true,
   },
})

Using in LOCALE.cfg:
* [mod-setting-name]
* setting-name1=Seting name
* [mod-setting-description]
* setting-name1=Seting description

Using in CONTROL.lua and in other code for reading:
* EVENT: on_runtime_mod_setting_changed - called when a player changed its setting
* * event.player_index
* * event.setting
* GET: settings.startup["setting-name"].value - current value of startup setting; can be used in DATA.lua
* GET: settings.global["setting-name"].value - current value of per-world setting
* GET: set = settings.get_player_settings(LuaPlayer) - current values for per-player settings; then use set["setting-name"].value
* GET: settings.player - default values

]]--