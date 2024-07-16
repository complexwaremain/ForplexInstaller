local cloneref = (cloneref or function(data) return data end)
local executor = (identifyexecutor or getexecutorname or function() return 'Roblox Studio' end)()
local isfile = function(file)
    local suc, res = pcall(readfile, file)
    return (suc and typeof(res) == 'string')
end

if ria == nil then 
    return cloneref(game:GetService('StarterGui')):SetCore('SendNotification', ({
        Title = 'Forplex Installer', 
        Text = 'Please execute the full installer script, not just the loadstring.', 
        Icon = 'rbxassetid://16498204245',
        Duration = 20
    })) 
end;

local getasync = function(...)
    return game.HttpGet(game, ...)
end

local httpservice = cloneref(game.GetService(game, 'HttpService'))
local api = loadstring(getasync('https://raw.githubusercontent.com/complexwaremain/ForplexInstaller/main/.lua'..ria))()

local creategradient = function(pos, color, pos2, color2)
    return ColorSequence.new({ColorSequenceKeypoint.new(pos, color), ColorSequenceKeypoint.new(pos2, color2)})
end

local forplexwrite = function(file, data)
    local directories = file:split('/')
    local last
    if riabypass == nil then 
        writefile('ria.ren', ria)
    end
    for i,v in next, ({'vape', 'vape/forplex', 'vape/assets', 'vape/Profiles', 'vape/CustomModules', 'vape/Libraries'}) do 
        if not isfolder(v) then 
            makefolder(v)
        end
    end
    writefile('vape/commithash.txt', 'main')
    return writefile('vape/'..file, data)
end

local window = api:createwindow()
window:createtab({
    name = 'Loader',
    callback = function(visible)
        if visible then 
            local cheatenginetrash;
            local headers = Instance.new('TextLabel', api.window.Instance.Frame)
            local installbutton = Instance.new('ImageButton', api.window.Instance.Frame)
            local installerbuttontext = Instance.new('TextLabel', installbutton)
            local installbuttonicon = Instance.new('ImageLabel', installbutton)
            local forplexicon = Instance.new('ImageLabel', api.window.Instance.Frame)  
            local description = Instance.new('TextLabel', headers)
            local gradient = Instance.new('UIGradient', description)
            local exitbutton
            headers.Position = UDim2.new(0.077, 0, 0.206, 0)
            headers.TextColor3 = Color3.fromRGB(255, 255, 255)
            headers.Text = 'forplex\n    VapeV4'
            headers.TextSize = 14
            headers.TextScaled = true 
            headers.Font = Enum.Font.GothamBlack
            headers.BackgroundTransparency = 1
            headers.TextColor3 = Color3.fromRGB(255, 255, 255)
            headers.Size = UDim2.new(0, 238, 0, 82)
            headers.ZIndex = 2
            headers.TextXAlignment = Enum.TextXAlignment.Left
            forplexicon.Image = 'rbxassetid://18512595913'
            forplexicon.Size = UDim2.new(0, 35, 0, 35)
            forplexicon.Position = UDim2.new(0.078, 0, 0.33, 0)
            forplexicon.BackgroundTransparency = 1
            forplexicon.ZIndex = 2
            installbutton.Size = UDim2.new(0, 127, 0, 35)
            installbutton.ZIndex = 3
            installbutton.Position = UDim2.new(0.077, 0, 0.586, 0)
            installbutton.BackgroundColor3 = Color3.fromRGB(36, 11, 120)
            installbutton.AutoButtonColor = false
            installbuttonicon.Position = UDim2.new(0.15, 0, 0.143, 0)
            installbuttonicon.Image = 'rbxassetid://8992030918'
            installbuttonicon.Size = UDim2.new(0, 26.8, 0, 26.8)
            installbuttonicon.BackgroundTransparency = 1
            installbuttonicon.ZIndex = 4
            installerbuttontext.Text = 'Install'
            installerbuttontext.TextScaled = true 
            installerbuttontext.TextSize = 14
            installerbuttontext.Size = UDim2.new(0, 77, 0, 17)
            installerbuttontext.Position = UDim2.new(0.236, 0, 0.257, 0)
            installerbuttontext.TextColor3 = Color3.fromRGB(255, 255, 255)
            installerbuttontext.BackgroundTransparency = 1
            installerbuttontext.ZIndex = 4
            installerbuttontext.Font = Enum.Font.GothamBold
            description.Text = 'The best option on the market for a feature rich experience.'
            description.Position = UDim2.new(0, 0, 1.122, 0)
            description.Size = UDim2.new(0, 200, 0, 44)
            description.TextSize = 14 
            description.TextScaled = true 
            description.ZIndex = 2
            description.BackgroundTransparency = 1
            description.Font = Enum.Font.GothamMedium
            description.TextXAlignment = Enum.TextXAlignment.Left
            description.TextColor3 = Color3.fromRGB(255, 255, 255)
            gradient.Rotation = 1
            gradient.Color = creategradient(0, Color3.fromRGB(255, 255, 255), 1, Color3.fromRGB(255, 255, 255))
            gradient.Transparency = NumberSequence.new(0, 0.784)
            Instance.new('UICorner', installbutton).CornerRadius = UDim.new(0, 10)
            exitbutton = installbutton:Clone()
            exitbutton.Parent = api.window.Instance.Frame
            exitbutton.TextLabel.Text = 'Exit'
            exitbutton.ImageLabel.Image = 'rbxassetid://18512595913'
            exitbutton.BackgroundColor3 = Color3.fromRGB(7, 2, 31)
            exitbutton.Position = UDim2.new(0.078, 0, 0.704, 0)
            local moverequired, moduleresult = pcall(require, cloneref(game:FindService('Players')).LocalPlayer.PlayerScripts:WaitForChild('PlayerModule'));
            if moverequired and moduleresult == nil then 
                cheatenginetrash = true;
            end;
            installbutton.MouseButton1Click:Connect(function()
                local installation = api:install()
                local profiles, assets, libraries = {}, {}, {}
                local modules = {'Universal.lua', 'NewMainScript.lua', '6872274481.lua', 'GuiLibrary.lua', 'MainScript.lua'}
                installation:addstep(function() 
                    installation:updatetitle('Testing your Executor')
                    installation:updatedesc('Testing if your functions are good enough for forplex.')
                    installation:updatestatus('global functions')
                    task.wait(0.5)
                end)
                installation:addstep(function() 
                    if isfolder('vape/forplex') then 
                        delfolder('vape/forplex')
                    end
                    installation:updatedesc('Installation shouldn\'t take too long, hang tight!')
                end)
                installation:addstep(function()
                    installation:updatetitle('Fetching Profiles from Github')
                    installation:updatestatus('These are for the settings.')
                    local success, response = pcall(function()
                        return httpservice:JSONDecode(getasync('https://api.github.com/repos/complexwaremain/ForplexForVapeV4/contents/Libraries/Settings'))
                    end)
                    assert(typeof(response) == 'table', 'Failed to fetch profile files')
                    for i,v in next, response do
                        if v.name then 
                            table.insert(profiles, v.name)
                        end 
                    end
                end)
                installation:addstep(function()
                    installation:updatetitle('Fetching assets from Github')
                    installation:updatestatus('These are for the images.')
                    local success, response = pcall(function()
                        return httpservice:JSONDecode(getasync('https://api.github.com/repos/7GrandDadPGN/VapeV4ForRoblox/contents/assets'))
                    end)
                    assert(typeof(response) == 'table', 'Failed to fetch asset files')
                    for i,v in next, response do
                        if v.name then 
                            table.insert(assets, v.name)
                        end 
                    end
                end)
                installation:addstep(function()
                    installation:updatetitle('Fetching Libraries from Github')
                    installation:updatestatus('These are for the config to work properly.')
                    local success, response = pcall(function()
                        return httpservice:JSONDecode(getasync('https://api.github.com/repos/7GrandDadPGN/VapeV4ForRoblox/contents/Libraries'))
                    end)
                    assert(typeof(response) == 'table', 'Failed to fetch library files')
                    for i,v in next, response do
                        if v.name then 
                            table.insert(libraries, v.name)
                        end 
                    end
                end)
                installation:addstep(function()
                    installation:updatetitle('Downloading Custom Features')
                    for i,v in next, modules do 
                        local id = v:gsub('.lua', '')
                        if tonumber(id) then 
                            installation:updatestatus('Writing vape/CustomModules/'..v)
                            forplexwrite('CustomModules/'..v, ([[return loadstring(game:HttpGet('renurl'))()]]):gsub('renurl', 'https://raw.githubusercontent.com/complexwaremain/ForplexForVapeV4/main/CustomModules/6872274481.luas/'..v..'?ria='..ria))
                        else
                            installation:updatestatus('Writing vape/CustomModules/'..v)
                            forplexwrite(v, ([[return loadstring(game:HttpGet('renurl'))()]]):gsub('renurl', 'https://raw.githubusercontent.com/complexwaremain/ForplexForVapeV4/main/CustomModules/6872274481.lua/'..v..'?ria='..ria))
                        end
                    end
                end)
                installation:addstep(function() 
                    installation:updatetitle('Downloading Libraries')
                    installation:updatedesc('These are required for forplex to work properly.')
                    makefolder('vape/forplex');
                    makefolder('vape/forplex/lib');
                    for i,v in ({'utils.lua', 'forplexlib.lua', 'solarapoop.lua'}) do 
                        installation:updatestatus('Writing vape/forplex/lib/'..v)
                        writefile('vape/forplex/lib/'..v, getasync('https://raw.githubusercontent.com/complexwaremain/ForplexForVapeV4/main/CustomModules/6872274481.lua/'..v..'?ria='..ria))
                    end;
                end);
                installation:addstep(function()
                    installation:updatetitle('Downloading default settings')
                    for i,v in next, profiles do 
                        installation:updatestatus('Writing vape/Profiles/'..v)
                        forplexwrite('Profiles/'..v, getasync('https://raw.githubusercontent.com/complexwaremain/ForplexForBedwars/source/Libraries/Settings/'..v))
                    end
                end)
                installation:addstep(function()
                    if cheatenginetrash then 
                        return 
                    end;
                    installation:updatetitle('Downloading assets')
                    for i,v in next, assets do 
                        installation:updatestatus('Writing vape/assets/'..v)
                        forplexwrite('assets/'..v, getasync('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/assets/'..v))
                    end
                end)
                installation:addstep(function()
                    installation:updatetitle('Downloading Libraries')
                    for i,v in next, libraries do 
                        installation:updatestatus('Writing vape/Libraries/'..v)
                        forplexwrite('Libraries/'..v, getasync('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/'..v))
                    end
                end)
                installation:start()
            end)
            exitbutton.MouseButton1Click:Connect(function() api:destroy() end)
            for i,v in next, ({headers, forplexicon, installbutton, exitbutton}) do 
                table.insert(api.window.recycle, v)
            end
        end
    end
})

--[[
    window:createtab({
    name = 'Profiles',
    callback = function(visible)
        if visible then 
            local headers = Instance.new('TextLabel', api.window.Instance.Frame)
            local forplexicon = Instance.new('ImageLabel', headers)
            local listframe = Instance.new('Frame', api.window.Instance.Frame)
            local listlayout = Instance.new('UIListLayout', listframe)
            local legitbutton = api:createbutton({name = 'Legit', noimageyield = true, solo = true, parent = listframe, icon = 'rbxassetid://18512595913'}).Instance
            local blatantbutton = api:createbutton({name = 'Blatant', solo = true, noimageyield = true, parent = listframe, icon = 'rbxassetid://18512595913'}).Instance
            local mobilebutton = api:createbutton({name = 'Mobile', solo = true, noimageyield = true, parent = listframe, icon = 'rbxassetid://18512595913'}).Instance
            headers.Position = UDim2.new(0.061, 0, 0.198, 0)
            headers.TextColor3 = Color3.fromRGB(255, 255, 255)
            headers.Text = 'forplex\n    VapeV4'
            headers.TextSize = 14
            headers.TextScaled = true 
            headers.Font = Enum.Font.GothamBlack
            headers.BackgroundTransparency = 1
            headers.TextColor3 = Color3.fromRGB(255, 255, 255)
            headers.Size = UDim2.new(0, 238, 0, 82)
            headers.ZIndex = 2
            headers.TextXAlignment = Enum.TextXAlignment.Left
            forplexicon.Image = 'rbxassetid://18512595913'
            forplexicon.Size = UDim2.new(0, 35, 0, 35)
            forplexicon.Position = UDim2.new(0, 0, 0.535, 0)
            forplexicon.BackgroundTransparency = 1
            forplexicon.ZIndex = 2
            listframe.Position = UDim2.new(0.051, 0, 0.449, 0)
            listframe.Size = UDim2.new(0, 187, 0, 187)
            listframe.BackgroundTransparency = 1
            listlayout.Padding = UDim.new(0, 8)
            table.insert(api.window.recycle, headers)
            table.insert(api.window.recycle, listframe)
        end
    end
})
]]


api:switchtab('Loader')
