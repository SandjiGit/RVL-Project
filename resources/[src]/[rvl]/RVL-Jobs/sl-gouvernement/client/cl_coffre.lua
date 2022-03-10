local mainMenu = RageUI.CreateMenu(Config.NomDesMenu.cl_coffre, "Quel actions voulez vous faire")
local PutMenu = RageUI.CreateSubMenu(mainMenu,"Inventory", "Choisissez l'objet à déposer")
local GetMenu = RageUI.CreateSubMenu(mainMenu,"Coffre", "Choisissez l'objet à prendre")

local open = false

mainMenu:DisplayGlare(false)
mainMenu.Closed = function()
    open = false
end

all_items = {}

    
function OpenChestGouv() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(mainMenu, function()


            RageUI.Button("Prendre un objet", " ", {RightLabel = "→"}, true, {onSelected = function()
                getStock()
            end},GetMenu);

            RageUI.Button("Déposer un objet", " ", {RightLabel = "→"}, true, {onSelected = function()
                getInventory()
            end},PutMenu);
            

        end)

        RageUI.IsVisible(GetMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, " ", {RightLabel = "~g~x"..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    if count <= v.nb then
                        TriggerServerEvent("gouv:takeStockItems",v.item, count)
                    else
                        ESX.ShowNotification("~r~Vous n'en avez pas assez sur vous")
                    end
                    getStock()
                end});
            end

        end)

        RageUI.IsVisible(PutMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, " ", {RightLabel = "~g~x"..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    TriggerServerEvent("gouv:putStockItems",v.item, count)
                    getInventory()
                end});
            end
            

       end)


        Wait(0)
    end
 end)
 end
 end


