# Solar Library Documentation
Below is an in-depth explanation of how to properly use Solar Library.

For recent updates, view [here](https://github.com/xurel7/Solar-Library/blob/main/changelog.md).

## Initialization
```lua
local SolarLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/xurel7/Solar-Library/main/src.lua'))()
```

## Creating the UI
```lua
local UI = SolarLib:Create {
  Name = "Solar Library", -- This will be the name of your script that users will see. This will also be your config file name if config is enabled.
  GameName = "A Cool Game", -- This is pointless unless you are making a script hub and have configs enabled, this will just make a config file with that name. If you delete this, the GameName will automatically be assigned as the games PlaceId.
  SaveData = true -- Enabling this will enable configs (AKA UI SAVES). Everything gets automatically updated when data needs to be updated. Delete if you dont want data to save. (DATA WILL ONLY SAVE IF EXECUTOR SUPPORTS FILESYSTEM)
}
```

## Updating the UI Toggle Keybind
```lua
SolarLib:UpdateKeybind {
  Keybind = Enum.KeyCode.RightControl -- Make sure its in keycode form, or else this wont work.
}
```

## Creating a Page
```lua
local Page1 = UI:CreatePage { -- Make sure to assign a new variable name for each page you create.
  Name = "Page 1" -- The name of the page.
}
```

## Creating a Header
```lua
Page1:CreateHeader {
  Text = "A Header" -- The text that the label displays.
}
```

## Creating a Button
```lua
Page1:CreateButton {
  Name = "A Button", -- The name of your button.
  Callback = function () 
    -- You would put the code you want to be ran here.
  end
}
```

## Creating a Toggle
```lua
Page1:CreateToggle {
  Name = "A Toggle", -- The name of your toggle.
  Flag = nil, -- You can leave nil or simply delete if you dont have multiple elements with the same name or your UI doesnt save. If you have multiple elements with the same name, make sure to give each one a different flag as it will cause save overlapping if you dont.
  Callback = function ()
    -- You would put the code you want to be looped here.
  end,
  CallbackEnd = function ()
    -- You can delete this if you don't want your toggle to run a code after the toggle has completed. An example where this could be used is if you have a script that prints Hello while toggled, but once it gets disabled it prints Goodbye.
  end
}
```

## Creating an Input Button
```lua
local input1 = Page1:CreateInputButton {
  Name = "An Input Button", -- The name of your input button.
  PlaceholderText = "Input Placeholder", -- What the placeholder for the inputbox says. You can delete if you dont want a custom placeholder.
  Flag = nil, -- You can leave nil or simply delete if you dont have multiple elements with the same name or your UI doesnt save. If you have multiple elements with the same name, make sure to give each one a different flag as it will cause save overlapping if you dont.
  InputType = nil, -- Delete or leave nil if you want to accept all types of input. If you want to only accept numbers, set InputType to "number"
  MaxNumber = nil, -- Delete or leave nil unless you are accepting only numbers for input, and want a max number.
  MinNumber = nil, -- Delete or leave nil unless you are accepting only numbers for input, and want a min number.
  Callback = function ()
    -- You would put the code you want to be ran here. Below is an example of printing input.
    local input = input1:GetInput() -- Make sure you make the input button a variable, so you can run the function. If your getting an error, just put "local input1" and then below paste this and remove the variable redefine.
    print(input)
  end
}
```

## Creating an Input Toggle
```lua
local inputToggle1 = Page1:CreateInputToggle {
  Name = "An Input Toggle", -- The name of your input toggle.
  PlaceholderText = "Input Placeholder", -- What the placeholder for the inputbox says. You can delete if you dont want a custom placeholder.
  Flag = nil, -- You can leave nil or simply delete if you dont have multiple elements with the same name or your UI doesnt save. If you have multiple elements with the same name, make sure to give each one a different flag as it will cause save overlapping if you dont.
  InputType = nil, -- Delete or leave nil if you want to accept all types of input. If you want to only accept numbers, set InputType to "number"
  MaxNumber = nil, -- Delete or leave nil unless you are accepting only numbers for input, and want a max number.
  MinNumber = nil, -- Delete or leave nil unless you are accepting only numbers for input, and want a min number.
  Callback = function ()
    -- You would put the code you want to be ran here. Below is an example of printing input.
    local input = input1:GetInput() -- Make sure you make the input button a variable, so you can run the function. If your getting an error, just put "local input1" and then below paste this and remove the variable redefine.
    print(input)
  end,
  CallbackEnd = function ()
    -- You can delete this if you don't want your toggle to run a code after the toggle has completed. An example where this could be used is if you have a script that prints Hello while toggled, but once it gets disabled it prints Goodbye.
  end
}
```

## Creating a Keybind Button
```lua
Page1:CreateKeybindButton {
  Name = "A Keybind Button", -- The name of your keybind button.
  Flag = nil, -- You can leave nil or simply delete if you dont have multiple elements with the same name or your UI doesnt save. If you have multiple elements with the same name, make sure to give each one a different flag as it will cause save overlapping if you dont.
  Callback = function ()
    -- You would put the code you want to be ran here.
  end
}
```

## Creating a Keybind Toggle
```lua
Page1:CreateKeybindToggle {
  Name = "A Keybind Toggle", -- The name of your keybind toggle.
  Flag = nil, -- You can leave nil or simply delete if you dont have multiple elements with the same name or your UI doesnt save. If you have multiple elements with the same name, make sure to give each one a different flag as it will cause save overlapping if you dont.
  Callback = function ()
    -- You would put the code you want to be ran here.
  end,
  CallbackEnd = function ()
    -- You can delete this if you don't want your toggle to run a code after the toggle has completed. An example where this could be used is if you have a script that prints Hello while toggled, but once it gets disabled it prints Goodbye.
  end
}
```

## Creating a Label
```lua
Page1:CreateLabel{
  Text = "A Label" -- The text that the label displays.
}
```

## End of Documentation
Thats it! All new features that are added will be added to the documentation.

Last Updated: April 23rd, 2024
