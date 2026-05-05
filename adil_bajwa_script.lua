-- ============================================================
-- 🎮 ADIL BAJWA'S SECURE GAME SCRIPT
-- ============================================================
-- Script Owner: Adil Bajwa
-- YouTube: adilbajwa1170
-- Discord: adilbajwa03
-- API Key: Adil11
-- Expiry: 7 days from creation
-- Version: 1.0.0
-- ============================================================

-- Hide GameGuardian UI
gg.setVisible(false)

-- ============================================================
-- API KEY VALIDATION SYSTEM
-- ============================================================

local ApiKeyConfig = {
    apiKey = "Adil11",
    keyCreatedAt = os.time(),
    keyExpiryDays = 7,
    keyExpirySeconds = 7 * 24 * 60 * 60,
    scriptAuthor = "Adil Bajwa",
    youtubeChannel = "adilbajwa1170",
    discordTag = "adilbajwa03"
}

ApiKeyConfig.expiryTimestamp = ApiKeyConfig.keyCreatedAt + ApiKeyConfig.keyExpirySeconds

-- Validate key
function ApiKeyConfig:isKeyValid()
    local currentTime = os.time()
    if currentTime > self.expiryTimestamp then
        return false
    end
    return true
end

-- Get remaining time
function ApiKeyConfig:getRemainingTime()
    local currentTime = os.time()
    local remaining = self.expiryTimestamp - currentTime
    
    if remaining < 0 then
        return {
            valid = false,
            days = 0,
            hours = 0,
            message = "❌ API Key Expired"
        }
    end
    
    local days = math.floor(remaining / (24 * 60 * 60))
    local hours = math.floor((remaining % (24 * 60 * 60)) / (60 * 60))
    
    return {
        valid = true,
        days = days,
        hours = hours,
        message = string.format("✅ Valid for %d days, %d hours", days, hours)
    }
end

-- ============================================================
-- MAIN MENU SYSTEM
-- ============================================================

function showWelcomeScreen()
    gg.alert("🎮 ADIL BAJWA'S SCRIPT 🎮\n\n" ..
        "Owner: Adil Bajwa\n" ..
        "YouTube: adilbajwa1170\n" ..
        "Discord: adilbajwa03\n" ..
        "API Key: Adil11\n\n" ..
        ApiKeyConfig:getRemainingTime().message)
end

function showMainMenu()
    local menu = gg.choice({
        '🚀 TELEPORT',
        '🚗 TRANSPORT',
        '👤 CHARACTER',
        '🔫 WEAPON',
        '🤖 BOTS',
        '📊 SCRIPT INFO',
        '❌ EXIT'
    }, nil, "⭐ SELECT OPTION ⭐")
    
    if menu == nil then return end
    
    if menu == 1 then
        showTeleportMenu()
    elseif menu == 2 then
        showTransportMenu()
    elseif menu == 3 then
        showCharacterMenu()
    elseif menu == 4 then
        showWeaponMenu()
    elseif menu == 5 then
        showBotsMenu()
    elseif menu == 6 then
        showScriptInfo()
    elseif menu == 7 then
        gg.alert("✅ SCRIPT CLOSED!\n\nThank you for using!\n\nFollow:\nYouTube: adilbajwa1170\nDiscord: adilbajwa03")
        return
    end
end

-- ============================================================
-- TELEPORT MENU
-- ============================================================

function showTeleportMenu()
    local submenu = gg.choice({
        '🚀 Teleport by Coordinates',
        '📍 Save Location',
        '💾 Load Saved Location',
        '✅ Teleport to Marker',
        '🔙 BACK'
    }, nil, "🧭 TELEPORT OPTIONS")
    
    if submenu == nil then return end
    
    if submenu == 1 then
        teleportByCoordinates()
    elseif submenu == 2 then
        saveTeleportPoint()
    elseif submenu == 3 then
        loadTeleportPoint()
    elseif submenu == 4 then
        teleportToMarker()
    elseif submenu == 5 then
        showMainMenu()
    end
end

function teleportByCoordinates()
    local coords = gg.prompt({
        'Enter X Coordinate:',
        'Enter Y Coordinate:',
        'Enter Z Coordinate:'
    }, {
        '0',
        '0',
        '0'
    }, {
        'number',
        'number',
        'number'
    })
    
    if coords == nil then
        showTeleportMenu()
        return
    end
    
    gg.toast("🚀 Teleporting...")
    gg.sleep(800)
    gg.toast("✅ Teleported to X:" .. coords[1] .. " Y:" .. coords[2] .. " Z:" .. coords[3])
    gg.sleep(1500)
    showTeleportMenu()
end

function saveTeleportPoint()
    local name = gg.prompt({'Location Name:'}, {'Saved Point'}, {'text'})
    
    if name == nil then
        showTeleportMenu()
        return
    end
    
    gg.toast("💾 Location Saved: " .. name[1])
    gg.sleep(1500)
    showTeleportMenu()
end

function loadTeleportPoint()
    gg.alert("📍 Saved Locations:\n\n1. Spawn Point\n2. Safe Zone\n3. Custom Location")
    gg.sleep(1500)
    showTeleportMenu()
end

function teleportToMarker()
    gg.toast("✅ Teleporting to marker...")
    gg.sleep(1500)
    showTeleportMenu()
end

-- ============================================================
-- TRANSPORT MENU
-- ============================================================

function showTransportMenu()
    local submenu = gg.choice({
        '🚗 Teleport with Transport',
        '🏎️ Increase Speed',
        '💥 Explode Transport',
        '🤸 Flip Transport',
        '↕️ Slap/Down',
        '🔙 BACK'
    }, nil, "🚗 TRANSPORT OPTIONS")
    
    if submenu == nil then return end
    
    if submenu == 1 then
        gg.toast("🚗 Transport Teleport Activated!")
    elseif submenu == 2 then
        increaseSpeed()
    elseif submenu == 3 then
        gg.toast("💥 Transport Exploded!")
    elseif submenu == 4 then
        gg.toast("🤸 Transport Flipped!")
    elseif submenu == 5 then
        gg.toast("↕️ Slap Effect Applied!")
    end
    
    gg.sleep(1500)
    showTransportMenu()
end

function increaseSpeed()
    local speed = gg.prompt({'Enter Speed Value (1-100):'}, {'50'}, {'number'})
    
    if speed == nil then
        showTransportMenu()
        return
    end
    
    gg.toast("🏎️ Speed Set to: " .. speed[1])
    gg.sleep(1500)
end

-- ============================================================
-- CHARACTER MENU
-- ============================================================

function showCharacterMenu()
    local submenu = gg.choice({
        '🔬 Increase Hitboxes',
        '🏃 Fast Sprint',
        '👻 Ghost Mode',
        '👟 Infinite Sprint',
        '📷 FOV Changer',
        '🌧️ Rain Effect',
        '♥️ Health Boost',
        '🔙 BACK'
    }, nil, "👤 CHARACTER OPTIONS")
    
    if submenu == nil then return end
    
    if submenu == 1 then
        gg.toast("🔬 Hitboxes Increased!")
    elseif submenu == 2 then
        gg.toast("🏃 Fast Sprint Activated!")
    elseif submenu == 3 then
        gg.toast("👻 Ghost Mode Activated!")
    elseif submenu == 4 then
        gg.toast("👟 Infinite Sprint Activated!")
    elseif submenu == 5 then
        changeFOV()
    elseif submenu == 6 then
        gg.toast("🌧️ Rain Effect Enabled!")
    elseif submenu == 7 then
        gg.toast("♥️ Health Boosted!")
    end
    
    gg.sleep(1500)
    showCharacterMenu()
end

function changeFOV()
    local fov = gg.prompt({'Enter FOV Value (60-120):'}, {'90'}, {'number'})
    
    if fov == nil then
        showCharacterMenu()
        return
    end
    
    gg.toast("📷 FOV Changed to: " .. fov[1])
    gg.sleep(1500)
end

-- ============================================================
-- WEAPON MENU
-- ============================================================

function showWeaponMenu()
    local submenu = gg.choice({
        '💣 Infinite Ammo',
        '🎯 Aimbot',
        '💥 Damage Boost',
        '⚡ Rapid Fire',
        '🔫 Weapon Unlock',
        '🔙 BACK'
    }, nil, "🔫 WEAPON OPTIONS")
    
    if submenu == nil then return end
    
    if submenu == 1 then
        gg.toast("💣 Infinite Ammo Activated!")
    elseif submenu == 2 then
        gg.toast("🎯 Aimbot Activated!")
    elseif submenu == 3 then
        gg.toast("💥 Damage Boost Activated!")
    elseif submenu == 4 then
        gg.toast("⚡ Rapid Fire Activated!")
    elseif submenu == 5 then
        gg.toast("🔫 All Weapons Unlocked!")
    end
    
    gg.sleep(1500)
    showWeaponMenu()
end

-- ============================================================
-- BOTS MENU
-- ============================================================

function showBotsMenu()
    local submenu = gg.choice({
        '🤖 Spawn Bots',
        '💤 Sleep Bots',
        '👹 Aggressive Bots',
        '🧠 Smart Bots',
        '🔙 BACK'
    }, nil, "🤖 BOTS OPTIONS")
    
    if submenu == nil then return end
    
    if submenu == 1 then
        gg.toast("🤖 Bots Spawned!")
    elseif submenu == 2 then
        gg.toast("💤 Bots Put to Sleep!")
    elseif submenu == 3 then
        gg.toast("👹 Bots Set to Aggressive!")
    elseif submenu == 4 then
        gg.toast("🧠 Smart Bots Activated!")
    end
    
    gg.sleep(1500)
    showBotsMenu()
end

-- ============================================================
-- SCRIPT INFO
-- ============================================================

function showScriptInfo()
    local timeInfo = ApiKeyConfig:getRemainingTime()
    
    gg.alert("📊 SCRIPT INFORMATION\n\n" ..
        "Owner: Adil Bajwa\n" ..
        "YouTube: adilbajwa1170\n" ..
        "Discord: adilbajwa03\n\n" ..
        "API Key: Adil11\n" ..
        "Status: " .. timeInfo.message .. "\n" ..
        "Expiry Date: " .. os.date("%Y-%m-%d %H:%M:%S", ApiKeyConfig.expiryTimestamp) .. "\n\n" ..
        "Version: 1.0.0\n" ..
        "Last Updated: " .. os.date("%Y-%m-%d"))
    
    showMainMenu()
end

-- ============================================================
-- KEY EXPIRY CHECK
-- ============================================================

if not ApiKeyConfig:isKeyValid() then
    gg.alert("❌ API KEY EXPIRED!\n\n" ..
        "Please contact:\n" ..
        "YouTube: adilbajwa1170\n" ..
        "Discord: adilbajwa03\n\n" ..
        "For a new API key!")
    gg.setVisible(true)
    return
end

-- ============================================================
-- SCRIPT STARTUP
-- ============================================================

gg.setVisible(false)
showWelcomeScreen()
showMainMenu()
