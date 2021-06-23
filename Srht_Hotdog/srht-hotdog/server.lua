ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('srht-hotdog:sosisver')
AddEventHandler('srht-hotdog:sosisver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.canCarryItem('sosis', 1) then
        xPlayer.addInventoryItem('sosis', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)

RegisterServerEvent('srht-hotdog:ekmekver')
AddEventHandler('srht-hotdog:ekmekver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.canCarryItem('hotdogekmegi', 1) then
        xPlayer.addInventoryItem('hotdogekmegi', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)

RegisterServerEvent('srht-hotdog:malzemever')
AddEventHandler('srht-hotdog:malzemever', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.canCarryItem('hotdogmalzemesi', 1) then
        xPlayer.addInventoryItem('hotdogmalzemesi', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)

RegisterServerEvent('srht-hotdog:hotdogver')
AddEventHandler('srht-hotdog:hotdogver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('sosis').count >= 1 then
        if xPlayer.getInventoryItem('hotdogekmegi').count >= 1 then
            if xPlayer.getInventoryItem('hotdogmalzemesi').count >= 1 then
                if xPlayer.canCarryItem('hotdog', 1) then
                    xPlayer.removeInventoryItem('sosis', 1)
                    Citizen.Wait(250)
                    xPlayer.removeInventoryItem('hotdogekmegi', 1)
                    Citizen.Wait(250)
                    xPlayer.removeInventoryItem('hotdogmalzemesi', 1)
                    Citizen.Wait(500)
                    xPlayer.addInventoryItem('hotdog', 1)
                else
                    TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
                end
            else
                TriggerClientEvent('esx:showNotification', src, 'Üzerinde yeterli hotdog malzemesi yok!')
            end
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde yeterli hotdog ekmeği yok!')
        end
    end
end)

RegisterServerEvent('srht-hotdog:paketver')
AddEventHandler('srht-hotdog:paketver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('hotdog').count >= 1 then
        if xPlayer.canCarryItem('hotdogpaket', 1) then
            xPlayer.removeInventoryItem('hotdog', 1)
            Citizen.Wait(500)
            xPlayer.addInventoryItem('hotdogpaket', 1)
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
        end
    end
end)

RegisterServerEvent('srht-hotdog:hotdogsat')
AddEventHandler('srht-hotdog:hotdogsat', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = math.random(Config.MinParaMiktar, Config.MaxParaMiktar)
    if xPlayer.getInventoryItem('hotdogpaket').count >= 1 then
        xPlayer.removeInventoryItem('hotdogpaket', 1)
        Citizen.Wait(500)
        xPlayer.addMoney(money)
    end
end)

ESX.RegisterServerCallback('srht-hotdog:malzemekontrol', function(source, cb, item, gereklisayi)
	local xPlayer = ESX.GetPlayerFromId(source)
    local itemcount = xPlayer.getInventoryItem(item).count
    local itemname = xPlayer.getInventoryItem(item).label
	if itemcount >= gereklisayi then
		cb(true)
	else
        activity = 0
        TriggerClientEvent('esx:showNotification', source, 'Üzerinde yeterli '..itemname..' yok!')
	end
end)



print("^2[SRHT_HOTDOG] ^1HOTDOG SISTEMI HAZIR YAZANA KADAR KULLANMAYINIZ")
print("^1%10 [===    ]")
print("^3%50 [=====  ]")
print("^5%90 [====== ]")
print("^2%100[=======]")
print("^2[SRHT_HOTDOG] HOTDOG SISTEMI HAZIR")
print("^7IYI ROLLER DILERIZ ^2[SRHT_DEVELOPMENT]")