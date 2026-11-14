--[[
    AVATAR INSPECTOR v7.9.69

    NEW: Glass Lens accessory preview
    - Optional eye button next to copy for equipped items
    - Reuses central ViewportFrame, free orbit and bounded zoom
    - Keeps avatar model, pose and camera intact when returning
    - Attempts source accessory / executor-compatible asset loading safely
    - Unsupported assets show status instead of blanking the avatar

    CHANGES IN v7.9.69:
    - Restored a visible gap between OUTFITS label and unchanged hanger icon
    - Repositioned ITEMS title horizontally and vertically beside unchanged icon
    - Kept search changes and all functional code intact

    CHANGES IN v7.9.68:
    - Raised ITEMS title a further 5 px for optical alignment with unchanged icon
    - Enlarged and repositioned search icon to 23 px at the left inset
    - Narrowed search field 12 px to leave a visible gap before OUTFITS button
    - Preserved the current OUTFITS button alignment and other functions

    CHANGES IN v7.9.67:
    - Moved OUTFITS button label 14 px toward unchanged hanger icon via right text padding
    - Raised ITEMS label 4 px to align with unchanged panel icon
    - Preserved all other GUI behavior and styling

    CHANGES IN v7.9.66:
    - Raised ITEMS panel heading icon by 4 px for cleaner vertical alignment
    - Moved OUTFITS button text 7 px left toward its hanger icon
    - Preserved UI behavior and all other visuals

    CHANGES IN v7.9.65:
    - Enlarged OUTFITS hanger PNG from 17 to 26 px and centered it vertically
    - Preserved all existing controls and visuals

    CHANGES IN v7.9.64:
    - Embedded supplied transparent PNG hanger icon for the OUTFITS button
    - Preserved its action and the original folder glyph as safe fallback

    CHANGES IN v7.9.63:
    - Added four original copper/peach PNG icons: save, edit, search and delete
    - Kept one icon per slot and original button handlers; geometry used only as fallback

    CHANGES IN v7.9.62:
    - Replaced background with the newly uploaded large black-hole artwork
    - Cropped black bars and framed the hole at readable size for 800x520 UI
    - Warm glow dimmed, preserved PNG registration and existing UI layers

    CHANGES IN v7.9.61:
    - Fixed background invisibility by replacing JPEG with verified PNG bytes
    - Exposed wallpaper through translucent player and item surfaces
    - Kept ViewportFrame opaque to protect the avatar 3D preview
    - Preserved all controls, scan, favorites, and the floating window

    CHANGES IN v7.9.60:
    - Embedded user-selected Photon Horizon black-hole background as Base64 JPG
    - Cropped large blank margins and dimmed the glow for comfortable readability
    - Background rendered behind all interactive panels; loading is protected
    - Preserves v7.9.59 PNG icons, button actions, viewer, startup and layouts

    CHANGES IN v7.9.59:
    - Original stacked-layers PNG moved to ITEMS header, not outfit-saving buttons
    - New original overlapping-squares PNG replaces copy pictograms on ID buttons
    - Outfit-save and outfits-folder buttons restore their corresponding v7.9.54 icons
    - PNG has a single-instance geometry fallback; no overlays or changed button actions

    CHANGES IN v7.9.58:
    - Three supplied PNG images embedded as Base64, auto-saved and registered
    - Replaces geometric viewer, players and save/folder icons without overlays
    - Protected fallback (no PNG) if executor local assets are not supported
    - Startup, saved outfits, scanner, poses, 3D and button actions unchanged

    CHANGES IN v7.9.54:
    - Animated copper/rose neon border on the players list and item panel
    - Slightly brighter outlines for player and accessory cards
    - Two shared lightweight border animations, no per-card loops
    - No floating-button, camera, saved outfit or avatar logic changes

    CHANGES IN v7.9.53:
    - Two-person icon rebuilt with symmetrical curved shoulders and clean circular heads
    - Rename-pencil icon redrawn at a consistent 45-degree angle with aligned tip
    - Removed jagged gradient-masked shoulder outlines, preserving the chosen copper palette
    - Preserves v7.9.52 Signature Labels, layout, camera, favorites, and icon button actions

    PRESERVED FEATURES:
    - Event Horizon Signature: integrated frames, dark animated controls and empty-preview avatar
    - Players, 3D face-scan, item layers, search, copy, pencil, trash, save
    - No unsupported Unicode glyphs for rename, delete, save, or copy
    - Built on working v7.9.49; preserved startup and Cosmic Orbit floating button
    - All icon calls are optional and exception-isolated
    - Original scanning, 3D preview, poses, camera, languages and JSON saves unchanged
    - No additional animated loops; decorative changes are optional
    - Event Horizon Refined 2.0: app-like section modules, panel symbols and cleaner edge geometry
    - One continuous gently animated header contour
    - Unified rounded borders, no fragmented corner rails
    - Recessed player and item cards with clean single outlines
    - Preserves preview size, input, scanning, saved outfits and all translations
    - Replaced older decorative overlays rather than stacking duplicate effects
    - Single FREE LOOK camera control; removed redundant ORBIT button
    - Event Horizon black/copper/rose style using existing panels
    - One animated header accent and one lower bridge
    - Reused branded status console; removed redundant decorative layers
    - Removed unreachable preview helper and write-only pose/bounds fields
    - Branded close, rename and delete controls
    - Updated graphite/navy styling and persistent selection indicators
    - Fixed scaled-window dragging and confirmation dialog
    - Replaced fixed camera with 360-degree orbit
    - 12-language localization: added Simplified Chinese and Belarusian
    - Language picker now shows flags and fits complete native language names
    - Wider language button and larger worn-items counter
    - Preserved v7.9.26 functionality
    - Green, larger and bold asset IDs
    - Separate AVATAR ITEMS and ANIMATIONS sections
    - Walk, Run, Idle, Jump, Fall, Climb, Swim and Mood IDs
    - Animation categories preserved in favorites

    PRESERVED:
    - Adaptive universal pose system
    - R6 / R15 / custom rig support
    - Parent-side shoulder pivot preservation
    - AnimationConstraint reading support
    - Player search and thumbnails
    - 3D avatar preview
    - Avatar ID scanner
    - Automatic clipboard
    - Simple persistent JSON outfit storage
    - Multiple saved outfits (up to 50)
    - Player selection scans manually; per-player SAVE button saves the selected avatar
    - Per-player SAVE button with automatic avatar scan
    - Persistent 3D avatar appearance snapshots in outfit JSON
    - Legacy accessory property capture and restoration
    - Async saved-avatar reconstruction with synchronous fallback
    - Live clothing and face fallback capture
    - Correct Color3 capture/restoration for skin and body colors
    - Face asset, layered accessory metadata and Puffiness preservation
    - Rebuild saved avatar previews after restarting the executor
    - Mobile layout
    - Draggable interface
    - Protected initialization
    - Orbit 360 and free-look camera modes
    - Bounded zoom controls and viewport clipping
    - Success notifications with precisely aligned checkmark
    - Delete confirmation dialog for saved outfits
    - Persistent custom names for saved outfits
    - Canonical account-avatar description lookup to avoid game morphs
    - Exact HumanoidDescription accessory count and live server player count
    - Larger saved outfit names
    - Black/copper Event Horizon theme and profile-style floating toggle
    - Lightweight button press/hover animations
    - Smooth main-window open/close transitions
    - Small UI performance refinements without removing features
    - Close confirmation with explicit full shutdown
    - Smooth floating-button entrance and refined profile icon proportions
    - v7.9.34 premium graphite interface baseline
    - Restrained cyan/blue/violet accent system and refined component borders
    - Rainbow top-hat floating icon with sparkle details, built from native Roblox UI
]]

local AI_DIAG_STAGE = "SCRIPT_PARSED"
local function AIDiag(message)
    pcall(function()
        print("[AI-DIAG] " .. tostring(message))
    end)
end

AIDiag("01 SCRIPT EXECUTION STARTED")

--===============================================
-- BUNDLED EVENT HORIZON ANIMATION CONTROLLER
-- Static build of the private Luau module; no token or private HTTP request.
-- This code runs only when the main GUI has finished its original startup.
--===============================================
local function AI_CreateBundledAnimationController()
    local Controller = {}
    Controller.__index = Controller
    
    local OPEN_DURATION = 0.80
    local CLOSE_DURATION = 0.88
    local PANEL_OPEN_DELAY = {0.13, 0.27, 0.41}
    local PANEL_CLOSE_DELAY = {0.00, 0.15, 0.30}
    local FADE_OPEN_TIME = 0.27
    local FADE_CLOSE_TIME = 0.22
    local MAX_FADE_OBJECTS_PER_GROUP = 65
    
    local function validGui(gui)
        return typeof(gui) == "Instance" and gui:IsA("GuiObject")
    end
    
    local function getScale(gui)
        local scale = gui:FindFirstChild("AI_CascadeScale")
        if scale and scale:IsA("UIScale") then return scale end
        scale = Instance.new("UIScale")
        scale.Name = "AI_CascadeScale"
        scale.Scale = 1
        scale.Parent = gui
        return scale
    end
    
    local function remember(entry, key, original)
        if original ~= nil then
            entry[key] = original
        end
    end
    
    local function snapshot(root, maximum)
        local entries = {}
        local function capture(obj)
            if #entries >= maximum then return end
            if not obj.Parent then return end
            local props = {}
            if obj:IsA("GuiObject") then
                if not obj.Visible then return end
                remember(props, "BackgroundTransparency", obj.BackgroundTransparency)
                if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                    remember(props, "TextTransparency", obj.TextTransparency)
                    remember(props, "TextStrokeTransparency", obj.TextStrokeTransparency)
                end
                if obj:IsA("ImageLabel") or obj:IsA("ImageButton")
                    or obj:IsA("ViewportFrame") then
                    remember(props, "ImageTransparency", obj.ImageTransparency)
                end
                if obj:IsA("ScrollingFrame") then
                    remember(props, "ScrollBarImageTransparency", obj.ScrollBarImageTransparency)
                end
            elseif obj:IsA("UIStroke") and obj.Enabled then
                remember(props, "Transparency", obj.Transparency)
            else
                return
            end
            entries[#entries + 1] = {object = obj, props = props}
        end
        capture(root)
        for _, child in ipairs(root:GetDescendants()) do
            capture(child)
            if #entries >= maximum then break end
        end
        return entries
    end
    
    local function apply(entries, hidden)
        for _, entry in ipairs(entries) do
            local obj = entry.object
            if obj.Parent then
                for property, original in pairs(entry.props) do
                    obj[property] = hidden and 1 or original
                end
            end
        end
    end
    
    function Controller.new(config)
        assert(type(config) == "table", "Animation Controller: config required")
        assert(config.TweenService, "Animation Controller: TweenService required")
        assert(validGui(config.Main), "Animation Controller: Main required")
        assert(config.UIScale and config.UIScale:IsA("UIScale"), "Animation Controller: UIScale required")
        for _, name in ipairs({"PlayerList", "Viewport", "PoseBar", "ItemsPanel"}) do
            assert(validGui(config[name]), "Animation Controller: " .. name .. " required")
        end
    
        local self = setmetatable({}, Controller)
        self.tweenService = config.TweenService
        self.main = config.Main
        self.mainScale = config.UIScale
        self.baseScaleGetter = config.getBaseScale
        self.savedBaseScale = config.UIScale.Scale
        self.position = config.Main.Position
        self.state = config.Main.Visible and "Visible" or "Hidden"
        self.generation = 0
        self.activeTweens = {}
        self.captured = nil
        self.groups = {
            {config.PlayerList},
            {config.Viewport, config.PoseBar},
            {config.ItemsPanel},
        }
        self.scales = {}
        for _, group in ipairs(self.groups) do
            for _, panel in ipairs(group) do
                local existingScale = getScale(panel)
                self.scales[panel] = {scale = existingScale, initial = existingScale.Scale}
            end
        end
        return self
    end
    
    function Controller:_baseScale()
        if type(self.baseScaleGetter) == "function" then
            local ok, value = pcall(self.baseScaleGetter)
            if ok and type(value) == "number" and value > 0 then return value end
        end
        return self.savedBaseScale > 0 and self.savedBaseScale or 1
    end
    
    function Controller:_tween(object, duration, easing, direction, goals)
        if not object.Parent then return end
        local ok, result = pcall(function()
            return self.tweenService:Create(object,
                TweenInfo.new(duration, easing, direction), goals)
        end)
        if ok then
            self.activeTweens[#self.activeTweens + 1] = result
            result:Play()
        end
    end
    
    function Controller:_fade(entries, hidden, duration)
        for _, entry in ipairs(entries) do
            local goals = {}
            for property, original in pairs(entry.props) do
                goals[property] = hidden and 1 or original
            end
            self:_tween(entry.object, duration, Enum.EasingStyle.Quad,
                hidden and Enum.EasingDirection.In or Enum.EasingDirection.Out, goals)
        end
    end
    
    function Controller:_restore()
        for _, tween in ipairs(self.activeTweens) do
            pcall(function() tween:Cancel() end)
        end
        table.clear(self.activeTweens)
        if self.captured then
            for _, group in ipairs(self.captured.groups) do
                apply(group, false)
            end
            apply(self.captured.shell, false)
            self.captured = nil
        end
        for _, info in pairs(self.scales) do
            if info.scale.Parent then info.scale.Scale = info.initial end
        end
        if self.main.Parent then self.main.Position = self.position end
        self.mainScale.Scale = self:_baseScale()
    end
    
    function Controller:_capture()
        local captured = {}
        for i, group in ipairs(self.groups) do
            local entries = {}
            for _, panel in ipairs(group) do
                local records = snapshot(panel, MAX_FADE_OBJECTS_PER_GROUP)
                for _, entry in ipairs(records) do
                    entries[#entries + 1] = entry
                end
            end
            captured[i] = entries
        end
        local shell = snapshot(self.main, 1)
        for _, child in ipairs(self.main:GetChildren()) do
            local isPanel = false
            for _, group in ipairs(self.groups) do
                for _, panel in ipairs(group) do
                    if child == panel then
                        isPanel = true
                        break
                    end
                end
                if isPanel then break end
            end
            if not isPanel and child:IsA("GuiObject") then
                for _, entry in ipairs(snapshot(child, 35)) do
                    shell[#shell + 1] = entry
                end
            end
        end
        return captured, shell
    end
    
    function Controller:_valid(generation)
        return generation == self.generation and self.main.Parent ~= nil
    end
    
    function Controller:show()
        if self.state == "Visible" or self.state == "Opening" then return end
        self.generation += 1
        local generation = self.generation
        local interrupted = self.captured ~= nil
        local dragged = (not interrupted) and self.main.Visible
            and self.main.Position or nil
        self:_restore()
        if dragged then self.position = dragged end
    
        self.main.Visible = true
        self.state = "Opening"
        local base = self:_baseScale()
        local records, shell = self:_capture()
        self.captured = {groups = records, shell = shell}
        self.main.Position = self.position + UDim2.fromOffset(0, 13)
        self.mainScale.Scale = base * 0.91
    
        apply(shell, true)
        for i, entries in ipairs(records) do
            apply(entries, true)
            for _, panel in ipairs(self.groups[i]) do
                local info = self.scales[panel]
                info.initial = info.scale.Scale
                info.scale.Scale = info.initial * 0.96
            end
        end
    
        self:_tween(self.main, 0.39, Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out, {Position = self.position})
        self:_tween(self.mainScale, 0.39, Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out, {Scale = base})
        self:_fade(shell, false, 0.36)
    
        for i, entries in ipairs(records) do
            task.delay(PANEL_OPEN_DELAY[i], function()
                if not self:_valid(generation) then return end
                self:_fade(entries, false, FADE_OPEN_TIME)
                for _, panel in ipairs(self.groups[i]) do
                    local info = self.scales[panel]
                    self:_tween(info.scale, 0.28, Enum.EasingStyle.Quart,
                        Enum.EasingDirection.Out, {Scale = info.initial})
                end
            end)
        end
    
        task.delay(OPEN_DURATION, function()
            if not self:_valid(generation) then return end
            self:_restore()
            self.state = "Visible"
        end)
    end
    
    function Controller:hide()
        if self.state == "Hidden" or self.state == "Closing" then return end
        self.generation += 1
        local generation = self.generation
        local interrupted = self.captured ~= nil
        local dragged = (not interrupted) and self.main.Position or nil
        self:_restore()
        if dragged then self.position = dragged end
        self.state = "Closing"
        local base = self:_baseScale()
        local records, shell = self:_capture()
        self.captured = {groups = records, shell = shell}
    
        for order, groupIndex in ipairs({3, 2, 1}) do
            task.delay(PANEL_CLOSE_DELAY[order], function()
                if not self:_valid(generation) then return end
                self:_fade(records[groupIndex], true, FADE_CLOSE_TIME)
                for _, panel in ipairs(self.groups[groupIndex]) do
                    local info = self.scales[panel]
                    self:_tween(info.scale, FADE_CLOSE_TIME,
                        Enum.EasingStyle.Quad, Enum.EasingDirection.In,
                        {Scale = info.initial * 0.95})
                end
            end)
        end
    
        task.delay(0.53, function()
            if not self:_valid(generation) then return end
            self:_tween(self.mainScale, 0.32,
                Enum.EasingStyle.Quad, Enum.EasingDirection.In,
                {Scale = base * 0.93})
            self:_tween(self.main, 0.32,
                Enum.EasingStyle.Quad, Enum.EasingDirection.In,
                {Position = self.position + UDim2.fromOffset(0, 11)})
            self:_fade(shell, true, 0.32)
        end)
        task.delay(CLOSE_DURATION, function()
            if not self:_valid(generation) then return end
            self.main.Visible = false
            self:_restore()
            self.state = "Hidden"
        end)
    end
    
    function Controller:toggle()
        if self.state == "Hidden" or self.state == "Closing" then
            self:show()
        else
            self:hide()
        end
    end
    
    function Controller:getState()
        return self.state
    end
    
    function Controller:destroy()
        self.generation += 1
        self:_restore()
        self.state = self.main.Visible and "Visible" or "Hidden"
    end
    
    return Controller
end

local function StartAvatarInspector()

AI_DIAG_STAGE = "START_FUNCTION_ENTERED"
AIDiag("02 StartAvatarInspector entered")

local Players = game:GetService("Players")
AI_DIAG_STAGE = "PLAYERS_SERVICE_OK"
AIDiag("03 Players service OK")
local UserInputService = game:GetService("UserInputService")
AI_DIAG_STAGE = "USER_INPUT_SERVICE_OK"
AIDiag("04 UserInputService OK")
local TweenService = game:GetService("TweenService")
AI_DIAG_STAGE = "TWEEN_SERVICE_OK"
AIDiag("05 TweenService OK")
local HttpService = nil

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then error("LocalPlayer unavailable") end
AI_DIAG_STAGE = "LOCAL_PLAYER_OK"
AIDiag("06 LocalPlayer OK: " .. tostring(LocalPlayer.Name))

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 15)
if not PlayerGui then error("PlayerGui unavailable") end
AI_DIAG_STAGE = "PLAYER_GUI_OK"
AIDiag("07 PlayerGui OK")

-- EVENT HORIZON REFINED: obsidian black / antique copper / muted rose.
local BG = Color3.fromRGB(17, 16, 15)
local PANEL = Color3.fromRGB(27, 25, 23)
local LIGHT = Color3.fromRGB(43, 37, 30)
local ACCENT = Color3.fromRGB(192, 142, 88)
local ACCENT_PURPLE = Color3.fromRGB(196, 151, 97)
local OUTLINE = Color3.fromRGB(112, 84, 56)
local WHITE = Color3.fromRGB(242, 236, 226)
local MUTED = Color3.fromRGB(179, 166, 148)
local GREEN = Color3.fromRGB(39, 132, 108)
local ID_GREEN = Color3.fromRGB(118, 236, 165)
local RED = Color3.fromRGB(137, 61, 85)

local selectedPlayer = nil
local selectedFavorite = nil
local currentItems = {}
local favorites = {}
local currentModel = nil

local currentMode = "Players"
local rotating = false
local lastPointer = nil
local viewportMode = "Free"
local orbitYaw = 0
local orbitPitch = 0
local orbitDistance = 10
local baseCameraDistance = 10
local minimumCameraDistance = 8
local maximumCameraDistance = 40
local toastToken = 0
local windowBaseScale = 1

local jointBases = {}
local poseTweens = {}
local externalConnections = {}
local function trackExternalConnection(connection)
    if connection then
        table.insert(externalConnections, connection)
    end
    return connection
end
local shutdownAvatarInspector

local refreshPlayerList
local saveFavorite
local refreshFavoritesList
local showFavorite
local applyPose
local persistFavorites

--==================================================
-- HELPERS
--==================================================

--==================================================
-- LOCALIZATION (12 LANGUAGES)
--==================================================

local currentLanguage = "en"
local languageOptions = {
    {code = "en", name = "🇬🇧 English"},
    {code = "ru", name = "🇷🇺 Русский"},
    {code = "es", name = "🇪🇸 Español (Latinoamérica)"},
    {code = "pt", name = "🇧🇷 Português (Brasil)"},
    {code = "fr", name = "🇫🇷 Français (France)"},
    {code = "de", name = "🇩🇪 Deutsch (Deutschland)"},
    {code = "pl", name = "🇵🇱 Polski"},
    {code = "tr", name = "🇹🇷 Türkçe"},
    {code = "ja", name = "🇯🇵 日本語"},
    {code = "ko", name = "🇰🇷 한국어"},
    {code = "zh", name = "🇨🇳 中文（简体）"},
    {code = "be", name = "🇧🇾 Беларуская"}
}

local translations = {
    ru = {
        ["AVATAR INSPECTOR"]="АВАТАР ИНСПЕКТОР", ["Search players..."]="Поиск игроков...", ["PLAYERS"]="ИГРОКИ", ["📁 OUTFITS"]="📁 НАРЯДЫ",
        ["3D-PREVIEW"]="3D-ПРОСМОТР", ["FREE LOOK"]="ОБЗОР", ["MODEL READY"]="МОДЕЛЬ ГОТОВА", ["SELECT PLAYER"]="ВЫБЕРИТЕ ИГРОКА", ["SCAN ACTIVE"]="СКАН АКТИВЕН", ["SYSTEM STATUS"]="СТАТУС",
        ["FIXED"]="ФИКСИРОВАННАЯ", ["FREE"]="СВОБОДНАЯ", ["T-POSE"]="Т-ПОЗА", ["A-POSE"]="А-ПОЗА", ["NEUTRAL"]="НЕЙТРАЛЬНАЯ",
        ["AVATAR ITEMS / ANIMATIONS"]="ПРЕДМЕТЫ / АНИМАЦИИ", ["AVATAR ITEMS"]="ПРЕДМЕТЫ АВАТАРА", ["ANIMATIONS"]="АНИМАЦИИ", ["COPY"]="КОПИРОВАТЬ", ["SAVE"]="СОХРАНИТЬ",
        ["Select a player"]="Выберите игрока", ["Select a player first"]="Сначала выберите игрока", ["Loading player..."]="Загрузка игрока...", ["Character not loaded"]="Персонаж ещё не загружен",
        ["No Humanoid found"]="Humanoid не найден", ["Could not read avatar details"]="Не удалось прочитать данные аватара", ["Could not load avatar"]="Не удалось загрузить аватар",
        ["Could not position avatar preview"]="Не удалось расположить модель аватара", ["Avatar loaded"]="Аватар загружен", ["This player is no longer available"]="Игрок больше недоступен",
        ["PLAYERS ON SERVER: "]="ИГРОКОВ НА СЕРВЕРЕ: ", ["WORN ITEMS: "]="НАДЕТО ПРЕДМЕТОВ: ", ["LANGUAGE"]="ЯЗЫК", ["Choose language"]="Выберите язык",
        ["Language changed successfully!"]="Язык успешно изменён!", ["Confirmation"]="Подтверждение", ["Are you sure?"]="Вы уверены?", ["New outfit name"]="Новое название наряда",
        ["No"]="Нет", ["Yes"]="Да", ["Confirm deletion"]="Подтверждение удаления", ["Are you sure you want to delete this outfit?"]="Вы действительно хотите удалить этот наряд?",
        ["Rename outfit"]="Переименовать наряд", ["Enter a new name for this saved outfit:"]="Введите новое название сохранённого наряда:", ["Save"]="Сохранить", ["Cancel"]="Отмена",
        ["The name cannot be empty"]="Название не может быть пустым", ["Outfit name changed"]="Название наряда изменено", ["Action completed successfully"]="Операция успешно выполнена",
        ["Accessory ID copied"]="ID аксессуара скопирован", ["Avatar saved successfully"]="Аватар успешно сохранён", ["Outfit deleted"]="Наряд удалён",
        ["Clipboard is not available"]="Буфер обмена недоступен", ["Outfit renamed successfully"]="Наряд успешно переименован", ["Could not save the new name: "]="Не удалось сохранить новое название: ",
        ["Could not save deletion: "]="Не удалось сохранить удаление: ", ["Outfit removed"]="Наряд удалён", ["Outfit saved permanently"]="Наряд сохранён постоянно",
        ["Session only: "]="Только до перезапуска: ", ["Saved avatar loaded: @"]="Сохранённый аватар загружен: @", ["Saved avatar could not be fully restored: @"]="Не удалось полностью восстановить аватар: @",
        ["Legacy outfit (IDs only): @"]="Старый формат наряда (только ID): @", ["No saved outfits yet"]="Сохранённых нарядов пока нет", ["Storage unavailable: "]="Хранилище недоступно: ",
        ["Shirt"]="Рубашка", ["Pants"]="Штаны", ["T-Shirt"]="Футболка", ["Face"]="Лицо", ["Head"]="Голова", ["Torso"]="Торс", ["Left Arm"]="Левая рука", ["Right Arm"]="Правая рука", ["Left Leg"]="Левая нога", ["Right Leg"]="Правая нога",
        ["Idle Animation"]="Анимация покоя", ["Walk Animation"]="Анимация ходьбы", ["Run Animation"]="Анимация бега", ["Jump Animation"]="Анимация прыжка", ["Fall Animation"]="Анимация падения", ["Climb Animation"]="Анимация лазания", ["Swim Animation"]="Анимация плавания", ["Mood Animation"]="Анимация настроения"
    },
    es = {
        ["Search players..."]="Buscar jugadores...", ["PLAYERS"]="JUGADORES", ["📁 OUTFITS"]="📁 CONJUNTOS", ["FIXED"]="FIJA", ["FREE"]="LIBRE", ["T-POSE"]="POSE T", ["A-POSE"]="POSE A", ["NEUTRAL"]="NEUTRAL",
        ["AVATAR ITEMS / ANIMATIONS"]="OBJETOS / ANIMACIONES", ["AVATAR ITEMS"]="OBJETOS DEL AVATAR", ["ANIMATIONS"]="ANIMACIONES", ["COPY"]="COPIAR", ["SAVE"]="GUARDAR", ["Select a player"]="Selecciona un jugador", ["Select a player first"]="Primero selecciona un jugador",
        ["Loading player..."]="Cargando jugador...", ["Character not loaded"]="El personaje no está cargado", ["No Humanoid found"]="No se encontró el Humanoid", ["Could not read avatar details"]="No se pudieron leer los datos del avatar", ["Could not load avatar"]="No se pudo cargar el avatar", ["Could not position avatar preview"]="No se pudo colocar la vista previa del avatar", ["Avatar loaded"]="Avatar cargado", ["This player is no longer available"]="Este jugador ya no está disponible",
        ["LANGUAGE"]="IDIOMA", ["Choose language"]="Elegir idioma", ["Language changed successfully!"]="¡El idioma se cambió correctamente!", ["Confirmation"]="Confirmación", ["Are you sure?"]="¿Estás seguro?", ["New outfit name"]="Nuevo nombre del conjunto", ["No"]="No", ["Yes"]="Sí", ["Confirm deletion"]="Confirmar eliminación", ["Are you sure you want to delete this outfit?"]="¿Seguro que quieres eliminar este conjunto?", ["Rename outfit"]="Cambiar nombre del conjunto", ["Enter a new name for this saved outfit:"]="Escribe un nuevo nombre para este conjunto guardado:", ["Save"]="Guardar", ["Cancel"]="Cancelar", ["The name cannot be empty"]="El nombre no puede estar vacío", ["Outfit name changed"]="Nombre del conjunto cambiado", ["Action completed successfully"]="La operación se completó correctamente", ["Accessory ID copied"]="ID del accesorio copiado", ["Avatar saved successfully"]="Avatar guardado correctamente", ["Outfit deleted"]="Conjunto eliminado", ["Clipboard is not available"]="El portapapeles no está disponible", ["Outfit renamed successfully"]="Conjunto renombrado correctamente", ["Outfit removed"]="Conjunto eliminado", ["Outfit saved permanently"]="Conjunto guardado permanentemente", ["No saved outfits yet"]="Aún no hay conjuntos guardados",
        ["Shirt"]="Camisa", ["Pants"]="Pantalones", ["T-Shirt"]="Camiseta", ["Face"]="Cara", ["Head"]="Cabeza", ["Torso"]="Torso", ["Left Arm"]="Brazo izquierdo", ["Right Arm"]="Brazo derecho", ["Left Leg"]="Pierna izquierda", ["Right Leg"]="Pierna derecha", ["Idle Animation"]="Animación inactiva", ["Walk Animation"]="Animación al caminar", ["Run Animation"]="Animación al correr", ["Jump Animation"]="Animación de salto", ["Fall Animation"]="Animación de caída", ["Climb Animation"]="Animación de escalada", ["Swim Animation"]="Animación de natación", ["Mood Animation"]="Animación de estado de ánimo"
    },
    pt = {
        ["Search players..."]="Buscar jogadores...", ["PLAYERS"]="JOGADORES", ["📁 OUTFITS"]="📁 VISUAIS", ["FIXED"]="FIXA", ["FREE"]="LIVRE", ["T-POSE"]="POSE T", ["A-POSE"]="POSE A", ["NEUTRAL"]="NEUTRA",
        ["AVATAR ITEMS / ANIMATIONS"]="ITENS / ANIMAÇÕES", ["AVATAR ITEMS"]="ITENS DO AVATAR", ["ANIMATIONS"]="ANIMAÇÕES", ["COPY"]="COPIAR", ["SAVE"]="SALVAR", ["Select a player"]="Selecione um jogador", ["Select a player first"]="Selecione um jogador primeiro", ["Loading player..."]="Carregando jogador...", ["Character not loaded"]="Personagem não carregado", ["No Humanoid found"]="Humanoid não encontrado", ["Could not read avatar details"]="Não foi possível ler os dados do avatar", ["Could not load avatar"]="Não foi possível carregar o avatar", ["Could not position avatar preview"]="Não foi possível posicionar a prévia do avatar", ["Avatar loaded"]="Avatar carregado", ["This player is no longer available"]="Este jogador não está mais disponível",
        ["LANGUAGE"]="IDIOMA", ["Choose language"]="Escolher idioma", ["Language changed successfully!"]="Idioma alterado com sucesso!", ["Confirmation"]="Confirmação", ["Are you sure?"]="Tem certeza?", ["New outfit name"]="Novo nome do visual", ["No"]="Não", ["Yes"]="Sim", ["Confirm deletion"]="Confirmar exclusão", ["Are you sure you want to delete this outfit?"]="Tem certeza de que deseja excluir este visual?", ["Rename outfit"]="Renomear visual", ["Enter a new name for this saved outfit:"]="Digite um novo nome para este visual salvo:", ["Save"]="Salvar", ["Cancel"]="Cancelar", ["The name cannot be empty"]="O nome não pode ficar vazio", ["Outfit name changed"]="Nome do visual alterado", ["Action completed successfully"]="Ação concluída com sucesso", ["Accessory ID copied"]="ID do acessório copiado", ["Avatar saved successfully"]="Avatar salvo com sucesso", ["Outfit deleted"]="Visual excluído", ["Clipboard is not available"]="A área de transferência não está disponível", ["Outfit renamed successfully"]="Visual renomeado com sucesso", ["Outfit removed"]="Visual removido", ["Outfit saved permanently"]="Visual salvo permanentemente", ["No saved outfits yet"]="Ainda não há visuais salvos",
        ["Shirt"]="Camisa", ["Pants"]="Calça", ["T-Shirt"]="Camiseta", ["Face"]="Rosto", ["Head"]="Cabeça", ["Torso"]="Tronco", ["Left Arm"]="Braço esquerdo", ["Right Arm"]="Braço direito", ["Left Leg"]="Perna esquerda", ["Right Leg"]="Perna direita", ["Idle Animation"]="Animação parada", ["Walk Animation"]="Animação de caminhada", ["Run Animation"]="Animação de corrida", ["Jump Animation"]="Animação de pulo", ["Fall Animation"]="Animação de queda", ["Climb Animation"]="Animação de escalada", ["Swim Animation"]="Animação de natação", ["Mood Animation"]="Animação de humor"
    },
    fr = {
        ["Search players..."]="Rechercher des joueurs...", ["PLAYERS"]="JOUEURS", ["📁 OUTFITS"]="📁 TENUES", ["FIXED"]="FIXE", ["FREE"]="LIBRE", ["T-POSE"]="POSE T", ["A-POSE"]="POSE A", ["NEUTRAL"]="NEUTRE", ["AVATAR ITEMS / ANIMATIONS"]="OBJETS / ANIMATIONS", ["AVATAR ITEMS"]="OBJETS DE L’AVATAR", ["ANIMATIONS"]="ANIMATIONS", ["COPY"]="COPIER", ["SAVE"]="ENREGISTRER", ["Select a player"]="Sélectionnez un joueur", ["Select a player first"]="Sélectionnez d’abord un joueur", ["Loading player..."]="Chargement du joueur...", ["Character not loaded"]="Personnage non chargé", ["No Humanoid found"]="Humanoid introuvable", ["Could not read avatar details"]="Impossible de lire les données de l’avatar", ["Could not load avatar"]="Impossible de charger l’avatar", ["Could not position avatar preview"]="Impossible de positionner l’aperçu de l’avatar", ["Avatar loaded"]="Avatar chargé", ["This player is no longer available"]="Ce joueur n’est plus disponible",
        ["LANGUAGE"]="LANGUE", ["Choose language"]="Choisir la langue", ["Language changed successfully!"]="Langue modifiée avec succès !", ["Confirmation"]="Confirmation", ["Are you sure?"]="Êtes-vous sûr ?", ["New outfit name"]="Nouveau nom de tenue", ["No"]="Non", ["Yes"]="Oui", ["Confirm deletion"]="Confirmer la suppression", ["Are you sure you want to delete this outfit?"]="Voulez-vous vraiment supprimer cette tenue ?", ["Rename outfit"]="Renommer la tenue", ["Enter a new name for this saved outfit:"]="Saisissez un nouveau nom pour cette tenue enregistrée :", ["Save"]="Enregistrer", ["Cancel"]="Annuler", ["The name cannot be empty"]="Le nom ne peut pas être vide", ["Outfit name changed"]="Nom de la tenue modifié", ["Action completed successfully"]="Opération effectuée avec succès", ["Accessory ID copied"]="ID de l’accessoire copié", ["Avatar saved successfully"]="Avatar enregistré avec succès", ["Outfit deleted"]="Tenue supprimée", ["Clipboard is not available"]="Presse-papiers indisponible", ["Outfit renamed successfully"]="Tenue renommée avec succès", ["Outfit removed"]="Tenue supprimée", ["Outfit saved permanently"]="Tenue enregistrée définitivement", ["No saved outfits yet"]="Aucune tenue enregistrée pour le moment",
        ["Shirt"]="Chemise", ["Pants"]="Pantalon", ["T-Shirt"]="T-shirt", ["Face"]="Visage", ["Head"]="Tête", ["Torso"]="Torse", ["Left Arm"]="Bras gauche", ["Right Arm"]="Bras droit", ["Left Leg"]="Jambe gauche", ["Right Leg"]="Jambe droite", ["Idle Animation"]="Animation d’attente", ["Walk Animation"]="Animation de marche", ["Run Animation"]="Animation de course", ["Jump Animation"]="Animation de saut", ["Fall Animation"]="Animation de chute", ["Climb Animation"]="Animation d’escalade", ["Swim Animation"]="Animation de nage", ["Mood Animation"]="Animation d’humeur"
    },
    de = {
        ["Search players..."]="Spieler suchen...", ["PLAYERS"]="SPIELER", ["📁 OUTFITS"]="📁 OUTFITS", ["FIXED"]="FEST", ["FREE"]="FREI", ["T-POSE"]="T-POSE", ["A-POSE"]="A-POSE", ["NEUTRAL"]="NEUTRAL", ["AVATAR ITEMS / ANIMATIONS"]="AVATAR-ITEMS / ANIMATIONEN", ["AVATAR ITEMS"]="AVATAR-ITEMS", ["ANIMATIONS"]="ANIMATIONEN", ["COPY"]="KOPIEREN", ["SAVE"]="SPEICHERN", ["Select a player"]="Spieler auswählen", ["Select a player first"]="Wähle zuerst einen Spieler", ["Loading player..."]="Spieler wird geladen...", ["Character not loaded"]="Charakter nicht geladen", ["No Humanoid found"]="Kein Humanoid gefunden", ["Could not read avatar details"]="Avatar-Daten konnten nicht gelesen werden", ["Could not load avatar"]="Avatar konnte nicht geladen werden", ["Could not position avatar preview"]="Avatar-Vorschau konnte nicht positioniert werden", ["Avatar loaded"]="Avatar geladen", ["This player is no longer available"]="Dieser Spieler ist nicht mehr verfügbar",
        ["LANGUAGE"]="SPRACHE", ["Choose language"]="Sprache auswählen", ["Language changed successfully!"]="Sprache erfolgreich geändert!", ["Confirmation"]="Bestätigung", ["Are you sure?"]="Bist du sicher?", ["New outfit name"]="Neuer Outfitname", ["No"]="Nein", ["Yes"]="Ja", ["Confirm deletion"]="Löschen bestätigen", ["Are you sure you want to delete this outfit?"]="Möchtest du dieses Outfit wirklich löschen?", ["Rename outfit"]="Outfit umbenennen", ["Enter a new name for this saved outfit:"]="Gib einen neuen Namen für dieses gespeicherte Outfit ein:", ["Save"]="Speichern", ["Cancel"]="Abbrechen", ["The name cannot be empty"]="Der Name darf nicht leer sein", ["Outfit name changed"]="Outfitname geändert", ["Action completed successfully"]="Aktion erfolgreich abgeschlossen", ["Accessory ID copied"]="Accessoire-ID kopiert", ["Avatar saved successfully"]="Avatar erfolgreich gespeichert", ["Outfit deleted"]="Outfit gelöscht", ["Clipboard is not available"]="Zwischenablage nicht verfügbar", ["Outfit renamed successfully"]="Outfit erfolgreich umbenannt", ["Outfit removed"]="Outfit entfernt", ["Outfit saved permanently"]="Outfit dauerhaft gespeichert", ["No saved outfits yet"]="Noch keine Outfits gespeichert",
        ["Shirt"]="Hemd", ["Pants"]="Hose", ["T-Shirt"]="T-Shirt", ["Face"]="Gesicht", ["Head"]="Kopf", ["Torso"]="Oberkörper", ["Left Arm"]="Linker Arm", ["Right Arm"]="Rechter Arm", ["Left Leg"]="Linkes Bein", ["Right Leg"]="Rechtes Bein", ["Idle Animation"]="Leerlaufanimation", ["Walk Animation"]="Gehanimation", ["Run Animation"]="Laufanimation", ["Jump Animation"]="Sprunganimation", ["Fall Animation"]="Fallanimation", ["Climb Animation"]="Kletteranimation", ["Swim Animation"]="Schwimmanimation", ["Mood Animation"]="Stimmungsanimation"
    },
    pl = {
        ["Search players..."]="Szukaj graczy...", ["PLAYERS"]="GRACZE", ["📁 OUTFITS"]="📁 STROJE", ["FIXED"]="STAŁA", ["FREE"]="SWOBODNA", ["T-POSE"]="POZA T", ["A-POSE"]="POZA A", ["NEUTRAL"]="NEUTRALNA", ["AVATAR ITEMS / ANIMATIONS"]="PRZEDMIOTY / ANIMACJE", ["AVATAR ITEMS"]="PRZEDMIOTY AWATARA", ["ANIMATIONS"]="ANIMACJE", ["COPY"]="KOPIUJ", ["SAVE"]="ZAPISZ", ["Select a player"]="Wybierz gracza", ["Select a player first"]="Najpierw wybierz gracza", ["Loading player..."]="Wczytywanie gracza...", ["Character not loaded"]="Postać nie została wczytana", ["No Humanoid found"]="Nie znaleziono obiektu Humanoid", ["Could not read avatar details"]="Nie udało się odczytać danych awatara", ["Could not load avatar"]="Nie udało się wczytać awatara", ["Could not position avatar preview"]="Nie udało się ustawić podglądu awatara", ["Avatar loaded"]="Awatar wczytany", ["This player is no longer available"]="Ten gracz jest już niedostępny",
        ["LANGUAGE"]="JĘZYK", ["Choose language"]="Wybierz język", ["Language changed successfully!"]="Język został pomyślnie zmieniony!", ["Confirmation"]="Potwierdzenie", ["Are you sure?"]="Czy na pewno?", ["New outfit name"]="Nowa nazwa stroju", ["No"]="Nie", ["Yes"]="Tak", ["Confirm deletion"]="Potwierdź usunięcie", ["Are you sure you want to delete this outfit?"]="Czy na pewno chcesz usunąć ten strój?", ["Rename outfit"]="Zmień nazwę stroju", ["Enter a new name for this saved outfit:"]="Wpisz nową nazwę zapisanego stroju:", ["Save"]="Zapisz", ["Cancel"]="Anuluj", ["The name cannot be empty"]="Nazwa nie może być pusta", ["Outfit name changed"]="Zmieniono nazwę stroju", ["Action completed successfully"]="Operacja zakończona pomyślnie", ["Accessory ID copied"]="Skopiowano ID akcesorium", ["Avatar saved successfully"]="Awatar został zapisany", ["Outfit deleted"]="Strój usunięty", ["Clipboard is not available"]="Schowek jest niedostępny", ["Outfit renamed successfully"]="Zmieniono nazwę stroju", ["Outfit removed"]="Strój usunięty", ["Outfit saved permanently"]="Strój zapisano na stałe", ["No saved outfits yet"]="Nie zapisano jeszcze żadnych strojów",
        ["Shirt"]="Koszula", ["Pants"]="Spodnie", ["T-Shirt"]="Koszulka", ["Face"]="Twarz", ["Head"]="Głowa", ["Torso"]="Tułów", ["Left Arm"]="Lewa ręka", ["Right Arm"]="Prawa ręka", ["Left Leg"]="Lewa noga", ["Right Leg"]="Prawa noga", ["Idle Animation"]="Animacja bezczynności", ["Walk Animation"]="Animacja chodzenia", ["Run Animation"]="Animacja biegu", ["Jump Animation"]="Animacja skoku", ["Fall Animation"]="Animacja spadania", ["Climb Animation"]="Animacja wspinania", ["Swim Animation"]="Animacja pływania", ["Mood Animation"]="Animacja nastroju"
    },
    tr = {
        ["Search players..."]="Oyuncu ara...", ["PLAYERS"]="OYUNCULAR", ["📁 OUTFITS"]="📁 KIYAFETLER", ["FIXED"]="SABİT", ["FREE"]="SERBEST", ["T-POSE"]="T POZU", ["A-POSE"]="A POZU", ["NEUTRAL"]="NÖTR", ["AVATAR ITEMS / ANIMATIONS"]="AVATAR ÖĞELERİ / ANİMASYONLAR", ["AVATAR ITEMS"]="AVATAR ÖĞELERİ", ["ANIMATIONS"]="ANİMASYONLAR", ["COPY"]="KOPYALA", ["SAVE"]="KAYDET", ["Select a player"]="Bir oyuncu seç", ["Select a player first"]="Önce bir oyuncu seç", ["Loading player..."]="Oyuncu yükleniyor...", ["Character not loaded"]="Karakter yüklenmedi", ["No Humanoid found"]="Humanoid bulunamadı", ["Could not read avatar details"]="Avatar bilgileri okunamadı", ["Could not load avatar"]="Avatar yüklenemedi", ["Could not position avatar preview"]="Avatar önizlemesi konumlandırılamadı", ["Avatar loaded"]="Avatar yüklendi", ["This player is no longer available"]="Bu oyuncu artık mevcut değil",
        ["LANGUAGE"]="DİL", ["Choose language"]="Dil seç", ["Language changed successfully!"]="Dil başarıyla değiştirildi!", ["Confirmation"]="Onay", ["Are you sure?"]="Emin misin?", ["New outfit name"]="Yeni kıyafet adı", ["No"]="Hayır", ["Yes"]="Evet", ["Confirm deletion"]="Silmeyi onayla", ["Are you sure you want to delete this outfit?"]="Bu kıyafeti silmek istediğinden emin misin?", ["Rename outfit"]="Kıyafeti yeniden adlandır", ["Enter a new name for this saved outfit:"]="Kaydedilen kıyafet için yeni bir ad gir:", ["Save"]="Kaydet", ["Cancel"]="İptal", ["The name cannot be empty"]="Ad boş olamaz", ["Outfit name changed"]="Kıyafet adı değiştirildi", ["Action completed successfully"]="İşlem başarıyla tamamlandı", ["Accessory ID copied"]="Aksesuar kimliği kopyalandı", ["Avatar saved successfully"]="Avatar başarıyla kaydedildi", ["Outfit deleted"]="Kıyafet silindi", ["Clipboard is not available"]="Pano kullanılamıyor", ["Outfit renamed successfully"]="Kıyafet başarıyla yeniden adlandırıldı", ["Outfit removed"]="Kıyafet kaldırıldı", ["Outfit saved permanently"]="Kıyafet kalıcı olarak kaydedildi", ["No saved outfits yet"]="Henüz kaydedilmiş kıyafet yok",
        ["Shirt"]="Gömlek", ["Pants"]="Pantolon", ["T-Shirt"]="Tişört", ["Face"]="Yüz", ["Head"]="Kafa", ["Torso"]="Gövde", ["Left Arm"]="Sol kol", ["Right Arm"]="Sağ kol", ["Left Leg"]="Sol bacak", ["Right Leg"]="Sağ bacak", ["Idle Animation"]="Bekleme animasyonu", ["Walk Animation"]="Yürüme animasyonu", ["Run Animation"]="Koşma animasyonu", ["Jump Animation"]="Zıplama animasyonu", ["Fall Animation"]="Düşme animasyonu", ["Climb Animation"]="Tırmanma animasyonu", ["Swim Animation"]="Yüzme animasyonu", ["Mood Animation"]="Ruh hâli animasyonu"
    },
    ja = {
        ["Search players..."]="プレイヤーを検索...", ["PLAYERS"]="プレイヤー", ["📁 OUTFITS"]="📁 コーデ", ["FIXED"]="固定", ["FREE"]="フリー", ["T-POSE"]="Tポーズ", ["A-POSE"]="Aポーズ", ["NEUTRAL"]="ニュートラル", ["AVATAR ITEMS / ANIMATIONS"]="アバターアイテム / アニメーション", ["AVATAR ITEMS"]="アバターアイテム", ["ANIMATIONS"]="アニメーション", ["COPY"]="コピー", ["SAVE"]="保存", ["Select a player"]="プレイヤーを選択", ["Select a player first"]="先にプレイヤーを選択してください", ["Loading player..."]="プレイヤーを読み込み中...", ["Character not loaded"]="キャラクターが読み込まれていません", ["No Humanoid found"]="Humanoidが見つかりません", ["Could not read avatar details"]="アバター情報を読み取れませんでした", ["Could not load avatar"]="アバターを読み込めませんでした", ["Could not position avatar preview"]="アバターのプレビューを配置できませんでした", ["Avatar loaded"]="アバターを読み込みました", ["This player is no longer available"]="このプレイヤーは利用できません",
        ["LANGUAGE"]="言語", ["Choose language"]="言語を選択", ["Language changed successfully!"]="言語を変更しました！", ["Confirmation"]="確認", ["Are you sure?"]="よろしいですか？", ["New outfit name"]="新しいコーデ名", ["No"]="いいえ", ["Yes"]="はい", ["Confirm deletion"]="削除の確認", ["Are you sure you want to delete this outfit?"]="このコーデを削除してもよろしいですか？", ["Rename outfit"]="コーデ名を変更", ["Enter a new name for this saved outfit:"]="保存したコーデの新しい名前を入力してください：", ["Save"]="保存", ["Cancel"]="キャンセル", ["The name cannot be empty"]="名前を入力してください", ["Outfit name changed"]="コーデ名を変更しました", ["Action completed successfully"]="正常に完了しました", ["Accessory ID copied"]="アクセサリーIDをコピーしました", ["Avatar saved successfully"]="アバターを保存しました", ["Outfit deleted"]="コーデを削除しました", ["Clipboard is not available"]="クリップボードを利用できません", ["Outfit renamed successfully"]="コーデ名を変更しました", ["Outfit removed"]="コーデを削除しました", ["Outfit saved permanently"]="コーデを保存しました", ["No saved outfits yet"]="保存されたコーデはありません",
        ["Shirt"]="シャツ", ["Pants"]="パンツ", ["T-Shirt"]="Tシャツ", ["Face"]="顔", ["Head"]="頭", ["Torso"]="胴体", ["Left Arm"]="左腕", ["Right Arm"]="右腕", ["Left Leg"]="左脚", ["Right Leg"]="右脚", ["Idle Animation"]="待機アニメーション", ["Walk Animation"]="歩行アニメーション", ["Run Animation"]="走行アニメーション", ["Jump Animation"]="ジャンプアニメーション", ["Fall Animation"]="落下アニメーション", ["Climb Animation"]="登るアニメーション", ["Swim Animation"]="泳ぐアニメーション", ["Mood Animation"]="ムードアニメーション"
    },
    ko = {
        ["Search players..."]="플레이어 검색...", ["PLAYERS"]="플레이어", ["📁 OUTFITS"]="📁 의상", ["FIXED"]="고정", ["FREE"]="자유", ["T-POSE"]="T 포즈", ["A-POSE"]="A 포즈", ["NEUTRAL"]="중립", ["AVATAR ITEMS / ANIMATIONS"]="아바타 아이템 / 애니메이션", ["AVATAR ITEMS"]="아바타 아이템", ["ANIMATIONS"]="애니메이션", ["COPY"]="복사", ["SAVE"]="저장", ["Select a player"]="플레이어 선택", ["Select a player first"]="먼저 플레이어를 선택하세요", ["Loading player..."]="플레이어 불러오는 중...", ["Character not loaded"]="캐릭터가 로드되지 않았습니다", ["No Humanoid found"]="Humanoid를 찾을 수 없습니다", ["Could not read avatar details"]="아바타 정보를 읽을 수 없습니다", ["Could not load avatar"]="아바타를 불러올 수 없습니다", ["Could not position avatar preview"]="아바타 미리보기를 배치할 수 없습니다", ["Avatar loaded"]="아바타를 불러왔습니다", ["This player is no longer available"]="이 플레이어는 더 이상 사용할 수 없습니다",
        ["LANGUAGE"]="언어", ["Choose language"]="언어 선택", ["Language changed successfully!"]="언어가 성공적으로 변경되었습니다!", ["Confirmation"]="확인", ["Are you sure?"]="확실합니까?", ["New outfit name"]="새 의상 이름", ["No"]="아니요", ["Yes"]="예", ["Confirm deletion"]="삭제 확인", ["Are you sure you want to delete this outfit?"]="이 의상을 삭제하시겠습니까?", ["Rename outfit"]="의상 이름 변경", ["Enter a new name for this saved outfit:"]="저장된 의상의 새 이름을 입력하세요:", ["Save"]="저장", ["Cancel"]="취소", ["The name cannot be empty"]="이름을 입력해야 합니다", ["Outfit name changed"]="의상 이름이 변경되었습니다", ["Action completed successfully"]="작업이 성공적으로 완료되었습니다", ["Accessory ID copied"]="액세서리 ID를 복사했습니다", ["Avatar saved successfully"]="아바타가 저장되었습니다", ["Outfit deleted"]="의상이 삭제되었습니다", ["Clipboard is not available"]="클립보드를 사용할 수 없습니다", ["Outfit renamed successfully"]="의상 이름이 변경되었습니다", ["Outfit removed"]="의상이 제거되었습니다", ["Outfit saved permanently"]="의상이 영구 저장되었습니다", ["No saved outfits yet"]="저장된 의상이 없습니다",
        ["Shirt"]="셔츠", ["Pants"]="바지", ["T-Shirt"]="티셔츠", ["Face"]="얼굴", ["Head"]="머리", ["Torso"]="몸통", ["Left Arm"]="왼팔", ["Right Arm"]="오른팔", ["Left Leg"]="왼쪽 다리", ["Right Leg"]="오른쪽 다리", ["Idle Animation"]="대기 애니메이션", ["Walk Animation"]="걷기 애니메이션", ["Run Animation"]="달리기 애니메이션", ["Jump Animation"]="점프 애니메이션", ["Fall Animation"]="낙하 애니메이션", ["Climb Animation"]="등반 애니메이션", ["Swim Animation"]="수영 애니메이션", ["Mood Animation"]="기분 애니메이션"
    }
    ,zh = {
        ["AVATAR INSPECTOR"]="头像检查器", ["Search players..."]="搜索玩家...", ["PLAYERS"]="玩家", ["📁 OUTFITS"]="📁 服装搭配",
        ["FIXED"]="固定视角", ["FREE"]="自由视角", ["T-POSE"]="T字姿势", ["A-POSE"]="A字姿势", ["NEUTRAL"]="自然姿势",
        ["AVATAR ITEMS / ANIMATIONS"]="头像物品 / 动画", ["AVATAR ITEMS"]="头像物品", ["ANIMATIONS"]="动画", ["COPY"]="复制", ["SAVE"]="保存",
        ["Select a player"]="选择一名玩家", ["Select a player first"]="请先选择玩家", ["Loading player..."]="正在加载玩家...", ["Character not loaded"]="角色尚未加载",
        ["No Humanoid found"]="未找到 Humanoid", ["Could not read avatar details"]="无法读取头像信息", ["Could not load avatar"]="无法加载头像",
        ["Could not position avatar preview"]="无法调整头像预览位置", ["Avatar loaded"]="头像已加载", ["This player is no longer available"]="该玩家已不可用",
        ["PLAYERS ON SERVER: "]="服务器玩家数：", ["WORN ITEMS: "]="已穿戴物品：", ["LANGUAGE"]="语言", ["Choose language"]="选择语言",
        ["Language changed successfully!"]="语言已成功切换！", ["Confirmation"]="确认", ["Are you sure?"]="确定吗？", ["New outfit name"]="新搭配名称",
        ["No"]="否", ["Yes"]="是", ["Confirm deletion"]="确认删除", ["Are you sure you want to delete this outfit?"]="确定要删除这套搭配吗？",
        ["Rename outfit"]="重命名搭配", ["Enter a new name for this saved outfit:"]="请输入已保存搭配的新名称：", ["Save"]="保存", ["Cancel"]="取消",
        ["The name cannot be empty"]="名称不能为空", ["Outfit name changed"]="搭配名称已更改", ["Action completed successfully"]="操作成功完成",
        ["Accessory ID copied"]="配件 ID 已复制", ["Avatar saved successfully"]="头像已成功保存", ["Outfit deleted"]="搭配已删除",
        ["Clipboard is not available"]="剪贴板不可用", ["Outfit renamed successfully"]="搭配已成功重命名", ["Outfit removed"]="搭配已移除",
        ["Outfit saved permanently"]="搭配已永久保存", ["No saved outfits yet"]="尚无已保存的搭配",
        ["Shirt"]="衬衫", ["Pants"]="裤子", ["T-Shirt"]="T恤", ["Face"]="脸部", ["Head"]="头部", ["Torso"]="躯干",
        ["Left Arm"]="左臂", ["Right Arm"]="右臂", ["Left Leg"]="左腿", ["Right Leg"]="右腿",
        ["Idle Animation"]="待机动画", ["Walk Animation"]="行走动画", ["Run Animation"]="奔跑动画", ["Jump Animation"]="跳跃动画",
        ["Fall Animation"]="下落动画", ["Climb Animation"]="攀爬动画", ["Swim Animation"]="游泳动画", ["Mood Animation"]="情绪动画"
    },
    be = {
        ["AVATAR INSPECTOR"]="АГЛЯДАЛЬНІК АВАТАРА", ["Search players..."]="Пошук гульцоў...", ["PLAYERS"]="ГУЛЬЦЫ", ["📁 OUTFITS"]="📁 ВОБРАЗЫ",
        ["FIXED"]="ФІКСАВАНАЯ", ["FREE"]="СВАБОДНАЯ", ["T-POSE"]="Т-ПОЗА", ["A-POSE"]="А-ПОЗА", ["NEUTRAL"]="НЕЙТРАЛЬНАЯ",
        ["AVATAR ITEMS / ANIMATIONS"]="ПРАДМЕТЫ / АНІМАЦЫІ", ["AVATAR ITEMS"]="ПРАДМЕТЫ АВАТАРА", ["ANIMATIONS"]="АНІМАЦЫІ", ["COPY"]="КАПІЯВАЦЬ", ["SAVE"]="ЗАХАВАЦЬ",
        ["Select a player"]="Выберыце гульца", ["Select a player first"]="Спачатку выберыце гульца", ["Loading player..."]="Загрузка гульца...", ["Character not loaded"]="Персанаж яшчэ не загружаны",
        ["No Humanoid found"]="Humanoid не знойдзены", ["Could not read avatar details"]="Не ўдалося прачытаць звесткі пра аватар", ["Could not load avatar"]="Не ўдалося загрузіць аватар",
        ["Could not position avatar preview"]="Не ўдалося размясціць папярэдні прагляд аватара", ["Avatar loaded"]="Аватар загружаны", ["This player is no longer available"]="Гулец больш недаступны",
        ["PLAYERS ON SERVER: "]="ГУЛЬЦОЎ НА СЕРВЕРЫ: ", ["WORN ITEMS: "]="НАДЗЕТА ПРАДМЕТАЎ: ", ["LANGUAGE"]="МОВА", ["Choose language"]="Выберыце мову",
        ["Language changed successfully!"]="Мова паспяхова зменена!", ["Confirmation"]="Пацвярджэнне", ["Are you sure?"]="Вы ўпэўненыя?", ["New outfit name"]="Новая назва вобраза",
        ["No"]="Не", ["Yes"]="Так", ["Confirm deletion"]="Пацвердзіць выдаленне", ["Are you sure you want to delete this outfit?"]="Вы сапраўды хочаце выдаліць гэты вобраз?",
        ["Rename outfit"]="Перайменаваць вобраз", ["Enter a new name for this saved outfit:"]="Увядзіце новую назву захаванага вобраза:", ["Save"]="Захаваць", ["Cancel"]="Скасаваць",
        ["The name cannot be empty"]="Назва не можа быць пустой", ["Outfit name changed"]="Назва вобраза зменена", ["Action completed successfully"]="Дзеянне паспяхова выканана",
        ["Accessory ID copied"]="ID аксэсуара скапіяваны", ["Avatar saved successfully"]="Аватар паспяхова захаваны", ["Outfit deleted"]="Вобраз выдалены",
        ["Clipboard is not available"]="Буфер абмену недаступны", ["Outfit renamed successfully"]="Вобраз паспяхова перайменаваны", ["Outfit removed"]="Вобраз выдалены",
        ["Outfit saved permanently"]="Вобраз захаваны пастаянна", ["No saved outfits yet"]="Пакуль няма захаваных вобразаў",
        ["Shirt"]="Кашуля", ["Pants"]="Штаны", ["T-Shirt"]="Футболка", ["Face"]="Твар", ["Head"]="Галава", ["Torso"]="Тулава",
        ["Left Arm"]="Левая рука", ["Right Arm"]="Правая рука", ["Left Leg"]="Левая нага", ["Right Leg"]="Правая нага",
        ["Idle Animation"]="Анімацыя спакою", ["Walk Animation"]="Анімацыя хады", ["Run Animation"]="Анімацыя бегу", ["Jump Animation"]="Анімацыя скачка",
        ["Fall Animation"]="Анімацыя падзення", ["Climb Animation"]="Анімацыя лажання", ["Swim Animation"]="Анімацыя плавання", ["Mood Animation"]="Анімацыя настрою"
    }
}

local extraTranslations = {
    ru = {
        ["The name cannot be empty"]="Название не может быть пустым", ["Outfit renamed successfully"]="Наряд успешно переименован", ["Clipboard is not available"]="Буфер обмена недоступен",
        ["Saved outfit has no 3D snapshot (legacy save)"]="В старом сохранении нет 3D-снимка аватара", ["Could not frame saved avatar"]="Не удалось настроить отображение сохранённого аватара", ["Saved 3D avatar loaded"]="3D-модель сохранённого аватара загружена",
        ["Scan the player before saving"]="Сначала просканируйте игрока", ["No valid outfit IDs to save"]="Нет действительных ID предметов для сохранения", ["Player left"]="Игрок покинул сервер",
        ["Language changed, but this executor cannot save language settings"]="Язык изменён, но этот Executor не может сохранить настройку языка",
        ["Could not rebuild saved avatar: "]="Не удалось восстановить сохранённый аватар: ", ["Could not recreate saved 3D avatar: "]="Не удалось заново создать 3D-модель аватара: ", ["3D appearance was not saved: "]="Не удалось сохранить 3D-внешность: ", ["Copied ID: "]="Скопирован ID: ",
        [" | Original account avatar"]=" | Аватар из профиля", [" | Live fallback"]=" | Текущая внешность в игре"
    },
    es = {
        ["The name cannot be empty"]="El nombre no puede estar vacío", ["Outfit renamed successfully"]="El conjunto se renombró correctamente", ["Clipboard is not available"]="El portapapeles no está disponible",
        ["Saved outfit has no 3D snapshot (legacy save)"]="Este conjunto antiguo no contiene una captura 3D del avatar", ["Could not frame saved avatar"]="No se pudo ajustar la vista del avatar guardado", ["Saved 3D avatar loaded"]="Vista 3D del avatar guardado cargada",
        ["Scan the player before saving"]="Escanea al jugador antes de guardar", ["No valid outfit IDs to save"]="No hay IDs de objetos válidos para guardar", ["Player left"]="El jugador abandonó el servidor",
        ["Language changed, but this executor cannot save language settings"]="El idioma cambió, pero este executor no puede guardar la preferencia",
        ["Could not rebuild saved avatar: "]="No se pudo reconstruir el avatar guardado: ", ["Could not recreate saved 3D avatar: "]="No se pudo volver a crear el avatar 3D: ", ["3D appearance was not saved: "]="No se pudo guardar la apariencia 3D: ", ["Copied ID: "]="ID copiado: ", [" | Original account avatar"]=" | Avatar del perfil", [" | Live fallback"]=" | Apariencia actual del juego"
    },
    pt = {
        ["The name cannot be empty"]="O nome não pode ficar vazio", ["Outfit renamed successfully"]="Visual renomeado com sucesso", ["Clipboard is not available"]="A área de transferência não está disponível",
        ["Saved outfit has no 3D snapshot (legacy save)"]="Este visual antigo não contém uma captura 3D do avatar", ["Could not frame saved avatar"]="Não foi possível ajustar a visualização do avatar salvo", ["Saved 3D avatar loaded"]="Visualização 3D do avatar salvo carregada",
        ["Scan the player before saving"]="Escaneie o jogador antes de salvar", ["No valid outfit IDs to save"]="Não há IDs de itens válidos para salvar", ["Player left"]="O jogador saiu do servidor",
        ["Language changed, but this executor cannot save language settings"]="O idioma foi alterado, mas este executor não consegue salvar a preferência",
        ["Could not rebuild saved avatar: "]="Não foi possível reconstruir o avatar salvo: ", ["Could not recreate saved 3D avatar: "]="Não foi possível recriar o avatar 3D: ", ["3D appearance was not saved: "]="Não foi possível salvar a aparência 3D: ", ["Copied ID: "]="ID copiado: ", [" | Original account avatar"]=" | Avatar da conta", [" | Live fallback"]=" | Aparência atual do jogo"
    },
    fr = {
        ["The name cannot be empty"]="Le nom ne peut pas être vide", ["Outfit renamed successfully"]="Tenue renommée avec succès", ["Clipboard is not available"]="Presse-papiers indisponible",
        ["Saved outfit has no 3D snapshot (legacy save)"]="Cette ancienne tenue ne contient pas de capture 3D de l’avatar", ["Could not frame saved avatar"]="Impossible d’ajuster l’affichage de l’avatar enregistré", ["Saved 3D avatar loaded"]="Aperçu 3D de l’avatar enregistré chargé",
        ["Scan the player before saving"]="Scannez le joueur avant l’enregistrement", ["No valid outfit IDs to save"]="Aucun ID d’objet valide à enregistrer", ["Player left"]="Le joueur a quitté le serveur",
        ["Language changed, but this executor cannot save language settings"]="La langue a changé, mais cet exécuteur ne peut pas enregistrer ce choix",
        ["Could not rebuild saved avatar: "]="Impossible de reconstruire l’avatar enregistré : ", ["Could not recreate saved 3D avatar: "]="Impossible de recréer l’avatar 3D : ", ["3D appearance was not saved: "]="L’apparence 3D n’a pas été enregistrée : ", ["Copied ID: "]="ID copié : ", [" | Original account avatar"]=" | Avatar du compte", [" | Live fallback"]=" | Apparence actuelle en jeu"
    },
    de = {
        ["The name cannot be empty"]="Der Name darf nicht leer sein", ["Outfit renamed successfully"]="Outfit erfolgreich umbenannt", ["Clipboard is not available"]="Zwischenablage nicht verfügbar",
        ["Saved outfit has no 3D snapshot (legacy save)"]="Dieses ältere Outfit enthält keinen 3D-Schnappschuss des Avatars", ["Could not frame saved avatar"]="Die Ansicht des gespeicherten Avatars konnte nicht angepasst werden", ["Saved 3D avatar loaded"]="3D-Vorschau des gespeicherten Avatars geladen",
        ["Scan the player before saving"]="Scanne den Spieler vor dem Speichern", ["No valid outfit IDs to save"]="Keine gültigen Item-IDs zum Speichern vorhanden", ["Player left"]="Der Spieler hat den Server verlassen",
        ["Language changed, but this executor cannot save language settings"]="Sprache geändert, aber dieser Executor kann die Einstellung nicht speichern",
        ["Could not rebuild saved avatar: "]="Gespeicherter Avatar konnte nicht wiederhergestellt werden: ", ["Could not recreate saved 3D avatar: "]="3D-Avatar konnte nicht neu erstellt werden: ", ["3D appearance was not saved: "]="3D-Erscheinungsbild wurde nicht gespeichert: ", ["Copied ID: "]="ID kopiert: ", [" | Original account avatar"]=" | Konto-Avatar", [" | Live fallback"]=" | Aktuelles Spiel-Aussehen"
    },
    pl = {
        ["The name cannot be empty"]="Nazwa nie może być pusta", ["Outfit renamed successfully"]="Pomyślnie zmieniono nazwę stroju", ["Clipboard is not available"]="Schowek jest niedostępny",
        ["Saved outfit has no 3D snapshot (legacy save)"]="Ten starszy strój nie zawiera migawki 3D awatara", ["Could not frame saved avatar"]="Nie udało się ustawić widoku zapisanego awatara", ["Saved 3D avatar loaded"]="Wczytano podgląd 3D zapisanego awatara",
        ["Scan the player before saving"]="Zeskanuj gracza przed zapisaniem", ["No valid outfit IDs to save"]="Brak prawidłowych identyfikatorów przedmiotów do zapisania", ["Player left"]="Gracz opuścił serwer",
        ["Language changed, but this executor cannot save language settings"]="Język zmieniono, ale ten executor nie może zapisać ustawienia",
        ["Could not rebuild saved avatar: "]="Nie udało się odtworzyć zapisanego awatara: ", ["Could not recreate saved 3D avatar: "]="Nie udało się ponownie utworzyć awatara 3D: ", ["3D appearance was not saved: "]="Nie udało się zapisać wyglądu 3D: ", ["Copied ID: "]="Skopiowano ID: ", [" | Original account avatar"]=" | Awatar z konta", [" | Live fallback"]=" | Wygląd z bieżącej gry"
    },
    tr = {
        ["The name cannot be empty"]="Ad boş olamaz", ["Outfit renamed successfully"]="Kıyafet başarıyla yeniden adlandırıldı", ["Clipboard is not available"]="Pano kullanılamıyor",
        ["Saved outfit has no 3D snapshot (legacy save)"]="Bu eski kayıtta avatarın 3D görüntüsü bulunmuyor", ["Could not frame saved avatar"]="Kaydedilen avatarın görünümü ayarlanamadı", ["Saved 3D avatar loaded"]="Kaydedilen avatarın 3D önizlemesi yüklendi",
        ["Scan the player before saving"]="Kaydetmeden önce oyuncuyu tara", ["No valid outfit IDs to save"]="Kaydedilecek geçerli öğe kimliği yok", ["Player left"]="Oyuncu sunucudan ayrıldı",
        ["Language changed, but this executor cannot save language settings"]="Dil değiştirildi ancak bu executor dil tercihini kaydedemiyor",
        ["Could not rebuild saved avatar: "]="Kaydedilen avatar yeniden oluşturulamadı: ", ["Could not recreate saved 3D avatar: "]="3D avatar yeniden oluşturulamadı: ", ["3D appearance was not saved: "]="3D görünüm kaydedilemedi: ", ["Copied ID: "]="Kopyalanan kimlik: ", [" | Original account avatar"]=" | Hesap avatarı", [" | Live fallback"]=" | Oyundaki mevcut görünüm"
    },
    ja = {
        ["The name cannot be empty"]="名前を入力してください", ["Outfit renamed successfully"]="コーデ名を変更しました", ["Clipboard is not available"]="クリップボードを利用できません",
        ["Saved outfit has no 3D snapshot (legacy save)"]="この古い保存データにはアバターの3Dスナップショットがありません", ["Could not frame saved avatar"]="保存したアバターの表示位置を調整できませんでした", ["Saved 3D avatar loaded"]="保存したアバターの3Dプレビューを読み込みました",
        ["Scan the player before saving"]="保存する前にプレイヤーをスキャンしてください", ["No valid outfit IDs to save"]="保存できる有効なアイテムIDがありません", ["Player left"]="プレイヤーがサーバーから退出しました",
        ["Language changed, but this executor cannot save language settings"]="言語は変更されましたが、このExecutorでは設定を保存できません",
        ["Could not rebuild saved avatar: "]="保存したアバターを復元できませんでした：", ["Could not recreate saved 3D avatar: "]="アバターの3Dモデルを再作成できませんでした：", ["3D appearance was not saved: "]="3Dの外見を保存できませんでした：", ["Copied ID: "]="コピーしたID：", [" | Original account avatar"]=" | アカウントのアバター", [" | Live fallback"]=" | ゲーム内の現在の外見"
    },
    ko = {
        ["The name cannot be empty"]="이름을 입력해야 합니다", ["Outfit renamed successfully"]="의상 이름이 변경되었습니다", ["Clipboard is not available"]="클립보드를 사용할 수 없습니다",
        ["Saved outfit has no 3D snapshot (legacy save)"]="이전 저장 데이터에 아바타 3D 스냅샷이 없습니다", ["Could not frame saved avatar"]="저장된 아바타의 화면 위치를 조정할 수 없습니다", ["Saved 3D avatar loaded"]="저장된 아바타의 3D 미리보기를 불러왔습니다",
        ["Scan the player before saving"]="저장하기 전에 플레이어를 스캔하세요", ["No valid outfit IDs to save"]="저장할 수 있는 유효한 아이템 ID가 없습니다", ["Player left"]="플레이어가 서버를 나갔습니다",
        ["Language changed, but this executor cannot save language settings"]="언어는 변경되었지만 이 Executor에서는 설정을 저장할 수 없습니다",
        ["Could not rebuild saved avatar: "]="저장된 아바타를 복원할 수 없습니다: ", ["Could not recreate saved 3D avatar: "]="아바타 3D 모델을 다시 만들 수 없습니다: ", ["3D appearance was not saved: "]="3D 외형을 저장하지 못했습니다: ", ["Copied ID: "]="복사한 ID: ", [" | Original account avatar"]=" | 계정 아바타", [" | Live fallback"]=" | 게임 내 현재 외형"
    }
}

extraTranslations.zh = {
    ["The name cannot be empty"]="名称不能为空", ["Outfit renamed successfully"]="搭配已成功重命名", ["Clipboard is not available"]="剪贴板不可用",
    ["Saved outfit has no 3D snapshot (legacy save)"]="此旧版保存记录没有头像 3D 快照", ["Could not frame saved avatar"]="无法调整已保存头像的显示位置", ["Saved 3D avatar loaded"]="已加载保存的头像 3D 模型",
    ["Scan the player before saving"]="保存前请先扫描玩家", ["No valid outfit IDs to save"]="没有可保存的有效物品 ID", ["Player left"]="玩家已离开",
    ["Language changed, but this executor cannot save language settings"]="语言已更改，但此执行器无法保存语言设置",
    ["Could not rebuild saved avatar: "]="无法重建已保存的头像：", ["Could not recreate saved 3D avatar: "]="无法重新创建头像 3D 模型：", ["3D appearance was not saved: "]="未能保存 3D 外观：", ["Copied ID: "]="已复制 ID：",
    [" | Original account avatar"]=" | 账户头像", [" | Live fallback"]=" | 游戏中的当前外观"
}
extraTranslations.be = {
    ["The name cannot be empty"]="Назва не можа быць пустой", ["Outfit renamed successfully"]="Вобраз паспяхова перайменаваны", ["Clipboard is not available"]="Буфер абмену недаступны",
    ["Saved outfit has no 3D snapshot (legacy save)"]="У старым захаванні няма 3D-здымка аватара", ["Could not frame saved avatar"]="Не ўдалося наладзіць адлюстраванне захаванага аватара", ["Saved 3D avatar loaded"]="3D-мадэль захаванага аватара загружана",
    ["Scan the player before saving"]="Спачатку праскануйце гульца", ["No valid outfit IDs to save"]="Няма сапраўдных ID прадметаў для захавання", ["Player left"]="Гулец пакінуў сервер",
    ["Language changed, but this executor cannot save language settings"]="Мова зменена, але гэты Executor не можа захаваць налады мовы",
    ["Could not rebuild saved avatar: "]="Не ўдалося аднавіць захаваны аватар: ", ["Could not recreate saved 3D avatar: "]="Не ўдалося нанова стварыць 3D-мадэль аватара: ", ["3D appearance was not saved: "]="Не ўдалося захаваць 3D-знешнасць: ", ["Copied ID: "]="Скапіяваны ID: ",
    [" | Original account avatar"]=" | Аватар з профілю", [" | Live fallback"]=" | Бягучая знешнасць у гульні"
}

local countLabelTranslations = {
    ru = {
        ['PLAYERS ON SERVER: '] = 'ИГРОКОВ НА СЕРВЕРЕ: ',
        ['WORN ITEMS: '] = 'НАДЕТО ПРЕДМЕТОВ: ',
        ['ITEMS'] = 'ПРЕДМЕТЫ',
    },
    es = {
        ['PLAYERS ON SERVER: '] = 'JUGADORES EN EL SERVIDOR: ',
        ['WORN ITEMS: '] = 'OBJETOS EQUIPADOS: ',
        ['ITEMS'] = 'OBJETOS',
    },
    pt = {
        ['PLAYERS ON SERVER: '] = 'JOGADORES NO SERVIDOR: ',
        ['WORN ITEMS: '] = 'ITENS EM USO: ',
        ['ITEMS'] = 'ITENS',
    },
    fr = {
        ['PLAYERS ON SERVER: '] = 'JOUEURS SUR LE SERVEUR : ',
        ['WORN ITEMS: '] = 'OBJETS PORTÉS : ',
        ['ITEMS'] = 'OBJETS',
    },
    de = {
        ['PLAYERS ON SERVER: '] = 'SPIELER AUF DEM SERVER: ',
        ['WORN ITEMS: '] = 'GETRAGENE ITEMS: ',
        ['ITEMS'] = 'ITEMS',
    },
    pl = {
        ['PLAYERS ON SERVER: '] = 'GRACZE NA SERWERZE: ',
        ['WORN ITEMS: '] = 'ZAŁOŻONE PRZEDMIOTY: ',
        ['ITEMS'] = 'PRZEDMIOTY',
    },
    tr = {
        ['PLAYERS ON SERVER: '] = 'SUNUCUDAKİ OYUNCULAR: ',
        ['WORN ITEMS: '] = 'TAKILI ÖĞELER: ',
        ['ITEMS'] = 'ÖĞELER',
    },
    ja = {
        ['PLAYERS ON SERVER: '] = 'サーバー内のプレイヤー：',
        ['WORN ITEMS: '] = '装着アイテム：',
        ['ITEMS'] = 'アイテム',
    },
    ko = {
        ['PLAYERS ON SERVER: '] = '서버 플레이어: ',
        ['WORN ITEMS: '] = '착용 아이템: ',
        ['ITEMS'] = '아이템',
    },
    zh = { ['PLAYERS ON SERVER: '] = '服务器玩家数：', ['WORN ITEMS: '] = '已穿戴物品：', ['ITEMS'] = '物品' },
    be = { ['PLAYERS ON SERVER: '] = 'ГУЛЬЦОЎ НА СЕРВЕРЫ: ', ['WORN ITEMS: '] = 'НАДЗЕТА ПРАДМЕТАЎ: ', ['ITEMS'] = 'ПРАДМЕТЫ' },
}

for languageCode, labels in pairs(countLabelTranslations) do
    extraTranslations[languageCode] = extraTranslations[languageCode] or {}
    for key, value in pairs(labels) do extraTranslations[languageCode][key] = value end
end

local dynamicPrefixTranslations = {
    ru = { ["Could not save the new name: "]="Не удалось сохранить новое название: ", ["Could not save deletion: "]="Не удалось сохранить удаление: ", ["Copied ID: "]="Скопирован ID: ", ["Storage unavailable: "]="Хранилище недоступно: ", ["Session only: "]="Только до перезапуска: ", ["Saved avatar loaded: @"]="Сохранённый аватар загружен: @", ["Saved avatar could not be fully restored: @"]="Не удалось полностью восстановить аватар: @", ["Legacy outfit (IDs only): @"]="Старый формат наряда (только ID): @" },
    es = { ["Could not save the new name: "]="No se pudo guardar el nuevo nombre: ", ["Could not save deletion: "]="No se pudo guardar la eliminación: ", ["Copied ID: "]="ID copiado: ", ["Storage unavailable: "]="Almacenamiento no disponible: ", ["Session only: "]="Solo durante esta sesión: ", ["Saved avatar loaded: @"]="Avatar guardado cargado: @", ["Saved avatar could not be fully restored: @"]="No se pudo restaurar por completo el avatar: @", ["Legacy outfit (IDs only): @"]="Conjunto antiguo (solo IDs): @" },
    pt = { ["Could not save the new name: "]="Não foi possível salvar o novo nome: ", ["Could not save deletion: "]="Não foi possível salvar a exclusão: ", ["Copied ID: "]="ID copiado: ", ["Storage unavailable: "]="Armazenamento indisponível: ", ["Session only: "]="Apenas nesta sessão: ", ["Saved avatar loaded: @"]="Avatar salvo carregado: @", ["Saved avatar could not be fully restored: @"]="Não foi possível restaurar totalmente o avatar: @", ["Legacy outfit (IDs only): @"]="Visual antigo (somente IDs): @" },
    fr = { ["Could not save the new name: "]="Impossible d’enregistrer le nouveau nom : ", ["Could not save deletion: "]="Impossible d’enregistrer la suppression : ", ["Copied ID: "]="ID copié : ", ["Storage unavailable: "]="Stockage indisponible : ", ["Session only: "]="Session uniquement : ", ["Saved avatar loaded: @"]="Avatar enregistré chargé : @", ["Saved avatar could not be fully restored: @"]="Impossible de restaurer complètement l’avatar : @", ["Legacy outfit (IDs only): @"]="Ancienne tenue (ID uniquement) : @" },
    de = { ["Could not save the new name: "]="Neuer Name konnte nicht gespeichert werden: ", ["Could not save deletion: "]="Löschung konnte nicht gespeichert werden: ", ["Copied ID: "]="ID kopiert: ", ["Storage unavailable: "]="Speicher nicht verfügbar: ", ["Session only: "]="Nur für diese Sitzung: ", ["Saved avatar loaded: @"]="Gespeicherter Avatar geladen: @", ["Saved avatar could not be fully restored: @"]="Gespeicherter Avatar konnte nicht vollständig wiederhergestellt werden: @", ["Legacy outfit (IDs only): @"]="Altes Outfit (nur IDs): @" },
    pl = { ["Could not save the new name: "]="Nie udało się zapisać nowej nazwy: ", ["Could not save deletion: "]="Nie udało się zapisać usunięcia: ", ["Copied ID: "]="Skopiowano ID: ", ["Storage unavailable: "]="Pamięć niedostępna: ", ["Session only: "]="Tylko w tej sesji: ", ["Saved avatar loaded: @"]="Wczytano zapisanego awatara: @", ["Saved avatar could not be fully restored: @"]="Nie udało się w pełni przywrócić awatara: @", ["Legacy outfit (IDs only): @"]="Starszy strój (tylko ID): @" },
    tr = { ["Could not save the new name: "]="Yeni ad kaydedilemedi: ", ["Could not save deletion: "]="Silme işlemi kaydedilemedi: ", ["Copied ID: "]="Kopyalanan kimlik: ", ["Storage unavailable: "]="Depolama kullanılamıyor: ", ["Session only: "]="Yalnızca bu oturumda: ", ["Saved avatar loaded: @"]="Kaydedilen avatar yüklendi: @", ["Saved avatar could not be fully restored: @"]="Kaydedilen avatar tamamen geri yüklenemedi: @", ["Legacy outfit (IDs only): @"]="Eski kıyafet (yalnızca kimlikler): @" },
    ja = { ["Could not save the new name: "]="新しい名前を保存できませんでした：", ["Could not save deletion: "]="削除を保存できませんでした：", ["Copied ID: "]="コピーしたID：", ["Storage unavailable: "]="ストレージを利用できません：", ["Session only: "]="このセッションのみ：", ["Saved avatar loaded: @"]="保存したアバターを読み込みました：@", ["Saved avatar could not be fully restored: @"]="保存したアバターを完全に復元できませんでした：@", ["Legacy outfit (IDs only): @"]="旧形式のコーデ（IDのみ）：@" },
    ko = { ["Could not save the new name: "]="새 이름을 저장하지 못했습니다: ", ["Could not save deletion: "]="삭제를 저장하지 못했습니다: ", ["Copied ID: "]="복사한 ID: ", ["Storage unavailable: "]="저장소를 사용할 수 없습니다: ", ["Session only: "]="현재 세션에서만 사용 가능: ", ["Saved avatar loaded: @"]="저장된 아바타 불러옴: @", ["Saved avatar could not be fully restored: @"]="저장된 아바타를 완전히 복원하지 못했습니다: @", ["Legacy outfit (IDs only): @"]="이전 의상 형식(ID만): @" },
    zh = { ["Could not save the new name: "]="无法保存新名称：", ["Could not save deletion: "]="无法保存删除操作：", ["Copied ID: "]="已复制 ID：", ["Storage unavailable: "]="存储不可用：", ["Session only: "]="仅限本次会话：", ["Saved avatar loaded: @"]="已加载保存的头像：@", ["Saved avatar could not be fully restored: @"]="无法完全恢复已保存的头像：@", ["Legacy outfit (IDs only): @"]="旧版搭配（仅含 ID）：@" },
    be = { ["Could not save the new name: "]="Не ўдалося захаваць новую назву: ", ["Could not save deletion: "]="Не ўдалося захаваць выдаленне: ", ["Copied ID: "]="Скапіяваны ID: ", ["Storage unavailable: "]="Сховішча недаступнае: ", ["Session only: "]="Толькі на гэты сеанс: ", ["Saved avatar loaded: @"]="Захаваны аватар загружаны: @", ["Saved avatar could not be fully restored: @"]="Не ўдалося цалкам аднавіць захаваны аватар: @", ["Legacy outfit (IDs only): @"]="Стары фармат вобраза (толькі ID): @" }
}

for languageCode, prefixes in pairs(dynamicPrefixTranslations) do
    extraTranslations[languageCode] = extraTranslations[languageCode] or {}
    for key, value in pairs(prefixes) do extraTranslations[languageCode][key] = value end
end

for languageCode, extra in pairs(extraTranslations) do
    translations[languageCode] = translations[languageCode] or {}
    for key, value in pairs(extra) do
        translations[languageCode][key] = value
    end
end

local poseStatusTranslations = {
    ru = { ["T-POSE | %s | %d shoulders"]="Т-ПОЗА | %s | плеч: %d", ["A-POSE | %s | %d shoulders"]="А-ПОЗА | %s | плеч: %d", ["Neutral | %s | %d shoulders"]="Нейтральная | %s | плеч: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: плечевые суставы не найдены | M:%d AC:%d" },
    es = { ["T-POSE | %s | %d shoulders"]="POSE T | %s | hombros: %d", ["A-POSE | %s | %d shoulders"]="POSE A | %s | hombros: %d", ["Neutral | %s | %d shoulders"]="Neutral | %s | hombros: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: sin articulaciones de hombro | M:%d AC:%d" },
    pt = { ["T-POSE | %s | %d shoulders"]="POSE T | %s | ombros: %d", ["A-POSE | %s | %d shoulders"]="POSE A | %s | ombros: %d", ["Neutral | %s | %d shoulders"]="Neutra | %s | ombros: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: sem juntas de ombro | M:%d AC:%d" },
    fr = { ["T-POSE | %s | %d shoulders"]="POSE T | %s | épaules : %d", ["A-POSE | %s | %d shoulders"]="POSE A | %s | épaules : %d", ["Neutral | %s | %d shoulders"]="Neutre | %s | épaules : %d", ["%s: no shoulders | M:%d AC:%d"]="%s : aucune articulation d’épaule | M:%d AC:%d" },
    de = { ["T-POSE | %s | %d shoulders"]="T-POSE | %s | Schultern: %d", ["A-POSE | %s | %d shoulders"]="A-POSE | %s | Schultern: %d", ["Neutral | %s | %d shoulders"]="Neutral | %s | Schultern: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: keine Schultergelenke | M:%d AC:%d" },
    pl = { ["T-POSE | %s | %d shoulders"]="POZA T | %s | barki: %d", ["A-POSE | %s | %d shoulders"]="POZA A | %s | barki: %d", ["Neutral | %s | %d shoulders"]="Neutralna | %s | barki: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: brak stawów barkowych | M:%d AC:%d" },
    tr = { ["T-POSE | %s | %d shoulders"]="T POZU | %s | omuz: %d", ["A-POSE | %s | %d shoulders"]="A POZU | %s | omuz: %d", ["Neutral | %s | %d shoulders"]="Nötr | %s | omuz: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: omuz eklemi yok | M:%d AC:%d" },
    ja = { ["T-POSE | %s | %d shoulders"]="Tポーズ | %s | 肩：%d", ["A-POSE | %s | %d shoulders"]="Aポーズ | %s | 肩：%d", ["Neutral | %s | %d shoulders"]="ニュートラル | %s | 肩：%d", ["%s: no shoulders | M:%d AC:%d"]="%s：肩関節なし | M:%d AC:%d" },
    ko = { ["T-POSE | %s | %d shoulders"]="T 포즈 | %s | 어깨: %d", ["A-POSE | %s | %d shoulders"]="A 포즈 | %s | 어깨: %d", ["Neutral | %s | %d shoulders"]="중립 | %s | 어깨: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: 어깨 관절 없음 | M:%d AC:%d" },
    zh = { ["T-POSE | %s | %d shoulders"]="T字姿势 | %s | 肩部：%d", ["A-POSE | %s | %d shoulders"]="A字姿势 | %s | 肩部：%d", ["Neutral | %s | %d shoulders"]="自然姿势 | %s | 肩部：%d", ["%s: no shoulders | M:%d AC:%d"]="%s：未找到肩部关节 | M:%d AC:%d" },
    be = { ["T-POSE | %s | %d shoulders"]="Т-ПОЗА | %s | плячэй: %d", ["A-POSE | %s | %d shoulders"]="А-ПОЗА | %s | плячэй: %d", ["Neutral | %s | %d shoulders"]="Нейтральная | %s | плячэй: %d", ["%s: no shoulders | M:%d AC:%d"]="%s: плечавыя суставы не знойдзены | M:%d AC:%d" }
}

for languageCode, poseMessages in pairs(poseStatusTranslations) do
    translations[languageCode] = translations[languageCode] or {}
    for key, value in pairs(poseMessages) do translations[languageCode][key] = value end
end

local accessoryTypeTranslations = {
    ru = {Hat="Шляпа", Hair="Волосы", Neck="Шея", Shoulder="Плечо", Front="Спереди", Back="Сзади", Waist="Пояс", Jacket="Куртка", Sweater="Свитер", Shorts="Шорты", LeftShoe="Левый ботинок", RightShoe="Правый ботинок", DressSkirt="Юбка"},
    es = {Hat="Sombrero", Hair="Cabello", Neck="Cuello", Shoulder="Hombro", Front="Frontal", Back="Espalda", Waist="Cintura", Jacket="Chaqueta", Sweater="Suéter", Shorts="Pantalones cortos", LeftShoe="Zapato izquierdo", RightShoe="Zapato derecho", DressSkirt="Falda"},
    pt = {Hat="Chapéu", Hair="Cabelo", Neck="Pescoço", Shoulder="Ombro", Front="Frente", Back="Costas", Waist="Cintura", Jacket="Jaqueta", Sweater="Suéter", Shorts="Bermuda", LeftShoe="Sapato esquerdo", RightShoe="Sapato direito", DressSkirt="Saia"},
    fr = {Hat="Chapeau", Hair="Cheveux", Neck="Cou", Shoulder="Épaule", Front="Avant", Back="Dos", Waist="Taille", Jacket="Veste", Sweater="Pull", Shorts="Short", LeftShoe="Chaussure gauche", RightShoe="Chaussure droite", DressSkirt="Jupe"},
    de = {Hat="Hut", Hair="Haare", Neck="Hals", Shoulder="Schulter", Front="Vorderseite", Back="Rücken", Waist="Taille", Jacket="Jacke", Sweater="Pullover", Shorts="Shorts", LeftShoe="Linker Schuh", RightShoe="Rechter Schuh", DressSkirt="Rock"},
    pl = {Hat="Kapelusz", Hair="Włosy", Neck="Szyja", Shoulder="Ramię", Front="Przód", Back="Tył", Waist="Pas", Jacket="Kurtka", Sweater="Sweter", Shorts="Szorty", LeftShoe="Lewy but", RightShoe="Prawy but", DressSkirt="Spódnica"},
    tr = {Hat="Şapka", Hair="Saç", Neck="Boyun", Shoulder="Omuz", Front="Ön", Back="Arka", Waist="Bel", Jacket="Ceket", Sweater="Kazak", Shorts="Şort", LeftShoe="Sol ayakkabı", RightShoe="Sağ ayakkabı", DressSkirt="Etek"},
    ja = {Hat="帽子", Hair="髪", Neck="首", Shoulder="肩", Front="前面", Back="背面", Waist="腰", Jacket="ジャケット", Sweater="セーター", Shorts="ショートパンツ", LeftShoe="左の靴", RightShoe="右の靴", DressSkirt="スカート"},
    ko = {Hat="모자", Hair="머리카락", Neck="목", Shoulder="어깨", Front="앞면", Back="뒷면", Waist="허리", Jacket="재킷", Sweater="스웨터", Shorts="반바지", LeftShoe="왼쪽 신발", RightShoe="오른쪽 신발", DressSkirt="치마"},
    zh = {Hat="帽子", Hair="头发", Neck="颈部", Shoulder="肩部", Front="前部", Back="背部", Waist="腰部", Jacket="夹克", Sweater="毛衣", Shorts="短裤", LeftShoe="左鞋", RightShoe="右鞋", DressSkirt="裙子"},
    be = {Hat="Капялюш", Hair="Валасы", Neck="Шыя", Shoulder="Плячо", Front="Спераду", Back="Ззаду", Waist="Пояс", Jacket="Куртка", Sweater="Швэдар", Shorts="Шорты", LeftShoe="Левы чаравік", RightShoe="Правы чаравік", DressSkirt="Спадніца"}
}

for languageCode, itemNames in pairs(accessoryTypeTranslations) do
    translations[languageCode] = translations[languageCode] or {}
    for key, value in pairs(itemNames) do translations[languageCode][key] = value end
end

local function translateText(text)
    text = tostring(text or "")
    local dictionary = translations[currentLanguage]
    if dictionary and dictionary[text] then
        return dictionary[text]
    end

    local rig, shoulderCount = text:match("^T%-POSE | ([%w%d]+) | (%d+) shoulders$")
    if rig then
        local template = dictionary and dictionary["T-POSE | %s | %d shoulders"]
        if template then return string.format(template, rig, tonumber(shoulderCount)) end
    end
    rig, shoulderCount = text:match("^A%-POSE | ([%w%d]+) | (%d+) shoulders$")
    if rig then
        local template = dictionary and dictionary["A-POSE | %s | %d shoulders"]
        if template then return string.format(template, rig, tonumber(shoulderCount)) end
    end
    rig, shoulderCount = text:match("^Neutral | ([%w%d]+) | (%d+) shoulders$")
    if rig then
        local template = dictionary and dictionary["Neutral | %s | %d shoulders"]
        if template then return string.format(template, rig, tonumber(shoulderCount)) end
    end
    local noShoulderRig, motorCount, constraintCount = text:match("^([%w%d]+): no shoulders | M:(%d+) AC:(%d+)$")
    if noShoulderRig then
        local template = dictionary and dictionary["%s: no shoulders | M:%d AC:%d"]
        if template then return string.format(template, noShoulderRig, tonumber(motorCount), tonumber(constraintCount)) end
    end

    local onlineCount = text:match("^(%d+) ONLINE$")
    if onlineCount and currentLanguage == "ru" then
        return "СЕЙЧАС ОНЛАЙН: " .. onlineCount
    end
    local count = text:match("^PLAYERS ON SERVER: (%d+)$")
    if count then
        local prefix = dictionary and dictionary["PLAYERS ON SERVER: "] or "PLAYERS ON SERVER: "
        return prefix .. count
    end
    count = text:match("^WORN ITEMS: (.+)$")
    if count then
        local prefix = dictionary and dictionary["WORN ITEMS: "] or "WORN ITEMS: "
        return prefix .. count
    end
    local items, animations, worn, suffix = text:match("^Items: (%d+) | Animations: (%d+) | Worn items: (%d+)(.*)$")
    local labels = {
        en = {"Items", "Animations", "Worn items"}, ru = {"Предметы", "Анимации", "Надето"}, es = {"Objetos", "Animaciones", "Equipados"}, pt = {"Itens", "Animações", "Em uso"},
        fr = {"Objets", "Animations", "Portés"}, de = {"Items", "Animationen", "Getragen"}, pl = {"Przedmioty", "Animacje", "Założone"},
        tr = {"Öğeler", "Animasyonlar", "Takılı"}, ja = {"アイテム", "アニメーション", "装着中"}, ko = {"아이템", "애니메이션", "착용 중"},
        zh = {"物品", "动画", "已穿戴"}, be = {"Прадметы", "Анімацыі", "Надзета"}
    }
    local l = labels[currentLanguage] or labels.en
    if items then
        return string.format("%s: %s | %s: %s | %s: %s%s", l[1], items, l[2], animations, l[3], worn, suffix)
    end
    items, animations, suffix = text:match("^Items: (%d+) | Animations: (%d+)(.*)$")
    if items then
        local suffixTranslations = dictionary or {}
        local translatedSuffix = suffix
        for source, translated in pairs(suffixTranslations) do
            if source:sub(1, 3) == " | " and suffix == source then
                translatedSuffix = translated
                break
            end
        end
        return string.format("%s: %s | %s: %s%s", l[1], items, l[2], animations, translatedSuffix)
    end
    if dictionary then
        for source, translated in pairs(dictionary) do
            if #source > 0 and (source:sub(-1) == " " or source:sub(-1) == "@") and text:sub(1, #source) == source then
                return translated .. text:sub(#source + 1)
            end
        end
    end
    return text
end

local function applyLocalization(root)
    for _, object in ipairs(root:GetDescendants()) do
        if object:IsA("TextLabel") or object:IsA("TextButton") then
            local baseText = object:GetAttribute("AIBaseText")
            if type(baseText) == "string" then
                object.Text = translateText(baseText)
            end
        elseif object:IsA("TextBox") then
            local basePlaceholder = object:GetAttribute("AIBasePlaceholderText")
            if type(basePlaceholder) == "string" then
                object.PlaceholderText = translateText(basePlaceholder)
            end
        end
    end
end

local function create(className, props, parent)
    local obj = Instance.new(className)

    for key, value in pairs(props or {}) do
        obj[key] = value
    end

    obj.Parent = parent

    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        local initialText = tostring(obj.Text or "")
        obj:SetAttribute("AIBaseText", initialText)
        obj:GetPropertyChangedSignal("Text"):Connect(function()
            local currentText = tostring(obj.Text or "")
            local savedBase = obj:GetAttribute("AIBaseText")
            if type(savedBase) == "string" and currentText == translateText(savedBase) then
                return
            end
            obj:SetAttribute("AIBaseText", currentText)
            local localized = translateText(currentText)
            if localized ~= currentText then
                obj.Text = localized
            end
        end)
        obj.Text = translateText(initialText)
    elseif obj:IsA("TextBox") then
        local initialPlaceholder = tostring(obj.PlaceholderText or "")
        obj:SetAttribute("AIBasePlaceholderText", initialPlaceholder)
        obj:GetPropertyChangedSignal("PlaceholderText"):Connect(function()
            local currentPlaceholder = tostring(obj.PlaceholderText or "")
            local savedBase = obj:GetAttribute("AIBasePlaceholderText")
            if type(savedBase) == "string" and currentPlaceholder == translateText(savedBase) then
                return
            end
            obj:SetAttribute("AIBasePlaceholderText", currentPlaceholder)
            local localized = translateText(currentPlaceholder)
            if localized ~= currentPlaceholder then
                obj.PlaceholderText = localized
            end
        end)
        obj.PlaceholderText = translateText(initialPlaceholder)
    end

    return obj
end

local function round(obj, radius)
    create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8)
    }, obj)
end

local function addStroke(obj)
    create("UIStroke", {
        Color = OUTLINE,
        Thickness = 1,
        Transparency = 0.22,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, obj)
end

-- EVENT HORIZON REFINED.
-- Shared presentation routines replace previous 7.9.38-7.9.42 decorative layers.
-- No RenderStepped animation and no avatar or input logic lives here.
local EH = {}

-- Feature lifecycle and executor capability probe; kept within the single build.
-- The UI does not depend on optional exploit-specific APIs being present.
do
    local activeControllers = {}
    local diagnosticRecords = {}
    EH.capabilities = {
        compile = type(loadstring) == "function",
        fileRead = type(readfile) == "function",
        fileWrite = type(writefile) == "function",
        fileCheck = type(isfile) == "function",
        clipboard = type(setclipboard) == "function"
            or type(toclipboard) == "function",
        httpRequest = type(request) == "function"
            or type(http_request) == "function"
            or (type(syn) == "table" and type(syn.request) == "function"),
        protectedGui = type(gethui) == "function"
    }
    EH.logDiagnostic = function(area, detail)
        local message = "[" .. tostring(area) .. "] " .. tostring(detail)
        diagnosticRecords[#diagnosticRecords + 1] = message
        if #diagnosticRecords > 60 then table.remove(diagnosticRecords, 1) end
        warn("[HORIZON] " .. message)
    end
    EH.getDiagnostics = function()
        return table.clone(diagnosticRecords)
    end
    EH.registerController = function(name, controller)
        if type(name) == "string" and type(controller) == "table" then
            activeControllers[name] = controller
        end
    end
    EH.releaseController = function(name)
        activeControllers[name] = nil
    end
    EH.cleanupControllers = function()
        for name, controller in pairs(activeControllers) do
            activeControllers[name] = nil
            if type(controller.destroy) == "function" then
                local ok, err = pcall(controller.destroy, controller)
                if not ok then EH.logDiagnostic("Cleanup/" .. name, err) end
            elseif type(controller.disable) == "function" then
                pcall(controller.disable, controller)
            end
        end
    end
    EH.logDiagnostic("Capabilities",
        "compile=" .. tostring(EH.capabilities.compile)
        .. ", files=" .. tostring(EH.capabilities.fileRead and EH.capabilities.fileWrite)
        .. ", request=" .. tostring(EH.capabilities.httpRequest))
end

function EH.accentRule(parent, position, size, transparency, tone)
    return create("Frame", {
        Name = "EHAccent",
        Position = position,
        Size = size,
        BackgroundColor3 = tone or ACCENT_PURPLE,
        BackgroundTransparency = transparency or 0,
        BorderSizePixel = 0,
        Active = false,
        ZIndex = parent.ZIndex + 1
    }, parent)
end

function EH.ehStroke(parent, tone, transparency, thickness)
    local edge = parent:FindFirstChildOfClass("UIStroke")
    if edge then
        edge.Color = tone or Color3.fromRGB(144, 106, 67)
        edge.Transparency = transparency or 0.16
        edge.Thickness = thickness or 1.25
    end
end

function EH.ehPanel(parent, kind)
    EH.ehStroke(parent,
        kind == "viewer" and Color3.fromRGB(155, 114, 72)
            or Color3.fromRGB(126, 94, 63),
        kind == "viewer" and 0.09 or 0.2,
        kind == "viewer" and 1.55 or 1.25)
    -- A single UICorner + UIStroke gives continuous frames without detached rails.
end

-- List neon stays on existing panel strokes. No child Frames in ScrollingFrames,
-- no extra fragmented side strips, and no per-item animation loops.
function EH.listNeon(panel)
    -- Clean Bronze: static thin bronze border, without neon or animation loops.
    local stroke = panel:FindFirstChildOfClass("UIStroke")
    if stroke then
        stroke.Color = Color3.fromRGB(155, 116, 76)
        stroke.Thickness = 1.2
        stroke.Transparency = 0.30
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    end
end

function EH.listCardEdge(card)
    local stroke = card:FindFirstChildOfClass("UIStroke")
    if stroke then
        stroke.Color = Color3.fromRGB(139, 103, 69)
        stroke.Transparency = 0.31
        stroke.Thickness = 1.25
    end
end


-- Event Horizon Signature Labels: reusable rounded status chip.
-- A real frame and one small dot, never Unicode or decorative loose strips.
function EH.statusChip(parent, name, position, size, indicatorColor)
    local chip = create("Frame", {
        Name = name,
        Position = position,
        Size = size,
        BackgroundColor3 = Color3.fromRGB(40, 34, 28),
        BorderSizePixel = 0,
        Active = false,
        ZIndex = parent.ZIndex + 1
    }, parent)
    round(chip, 8)
    create("UIStroke", {
        Color = Color3.fromRGB(147, 109, 72),
        Transparency = 0.35,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, chip)
    local dot = create("Frame", {
        Name = "EHStatusDot",
        Position = UDim2.new(0, 9, 0.5, -3),
        Size = UDim2.fromOffset(6, 6),
        BackgroundColor3 = indicatorColor or Color3.fromRGB(145, 225, 179),
        BorderSizePixel = 0,
        Active = false,
        ZIndex = chip.ZIndex + 1
    }, chip)
    round(dot, 6)
    return chip
end

-- v7.9.58: Embedded original PNG icons, independent of Roblox asset uploads.
-- Kept separate from the geometry renderer; no duplicate pictograms.
-- File creation and executor-specific asset registration are both protected.
local EH_PNG_DATA = {
    hanger = [=[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]=],
    outfits = [=[iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAAAM1BMVEX0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5f0u5etPWRDAAAAEXRSTlMAECAwQFBgcICPn6+/z9/v//JOcLwAAAGrSURBVHja7VbbloMgDDQoFxEC//+1WyKIKCL2ac+u89aUTEkyEzoML178XgBXmu8DXCsO3dnS+IAphyYKGNnDAcr5FToHdQw5dUsxWr9BpKDIMTu288X6824hHiMYABNUkV3iV6KZT2dQwMCcL+DYAALLi53B6YBcaykYcL25og/8Kp967VLzQed8nXo3ucN8iv6FL92uSSC0RbRaQONQBlXtprsx0R0+HTnPH5vlHRqFJz2Ayf27AY3KHhmWEFV9WqdZmDKmD9ptYz6dpsjS71a675w/y2pVLceVHeNP8z8MdidqEiCyZyuH4SZJdq2tpu83QekuAV5IMowC+wRYlyRGAvENgYgEc7eGS8ikhdVF8qt8B3n3qN1evmCTu51MfkizKxlGLFRa6B3HWv6ak7J4YLM1giA+x7N3cDzqSqfSqLkn4LZy9Vm7kQFmf0fgZ9A17TNbbPEGQXyhWN1focwWQXosat5dPf6hbhHEi5q696V1Vg7QIoB4qLkr2gQdy+YleAn+BsEQLGsqCG7uWtjGX8L0PZvXBJ1P8Gjr6bb/CQdWwaN/IP8KP3OlLRivSKYXAAAAAElFTkSuQmCC]=],
    save = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAABV3ElEQVR4nO39e3AlWX7fiX2/v5N578WzCqgq1KPf3dM9M4XhaEY9JCVq7a12bFgOxg4lW0bZ3oiVl2EFGeEIml7Pcl/+4967u5I4WsuKocJ/DO2wYr1hO6LAJSlKSy53FdGlXQW9Ck1zRbJRM9M93V39qCfqhTfuvXl+X/+RmRcXKKAKqKruQgH5iQYaBdzMPJl5zu/8zu91gIqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiopDB592A55VVD47Dfym4guG5X/Vw39EKgGwR6Siv7VaRAvA7CUCM7h4Yo7ntvn8O++d4ZsA8OZ2f/z82nmQeKf4/uYbp/sD/eJF4Nz0tDAzp1YLaLXaIitBUFFRUVHxpJDAZrNpUtPUbNrTbk/FzkhN04WZoGbTJFXabUVFRcWDqKTkDpQzCMn71pX6/e/VL3fuDDUctV5M02S4niRaqwWv1WCRinB4ENMYolQjLOTnciIaASAxeM9dkAtpen8DsvhMvpueWb/dqbs2/y0S2HqvPaQeNj/jZODfPUAhCh7k9OhCNpIyUydGT9Jep7e27imWz/xCe22rMVACW60mW62WQFbGwm1InnYD9iN9C//srEnyvhAQeOef/Pr4tU736FGkE5LGlfpoUBxGtPEY4hgig4ExhuiWsW7BhiXUJJiMBsIAoOfMYCGD6BAA36qyhl0LAOf+UXeDONCW4OVPTpEibcuc40jgpOCAlc85amOgGmUIDlOU0AuGlV6m9QzWAeJy3Wq3s268fu93mvP6n7cWiA2BPTs7Y60WhFaLEFRNd/dTPZJdoLebyc35Ew2rzY9H1o5LybGQdadonHBggokdpTApaAJCDQBAiEIN5DCgVIBBMmM+QwqKoGVwF7jNa9B2v9yhfftIAAAbbaHMN34rapubEgCCyqVuMXiZCwACUP6BKLAHaE3yJQOXQSwLvEfXTZM+iRaud5XdGh6dWpxIrnZwrt3ZzisggZW3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]=],
    edit = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAABtnUlEQVR4nOz9aYwk6ZqdBz7nM3P32CMjct/3rKrMukv3vWSTBDmqAihy1COS4giRwGAgYfjnXmAg6kJsLpIwgkf84EADqkE1ewaYamBAgvoxQAQwIkXwtqangSpK7GaTXXXXilpyq6zMqtwzIjNWX8y+Mz/M3MMjMzJr6VoysvzcmxWrm5tZ2Pd+73Le80IfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx99fFOhr/sE+vhmwiBcfgZMT08LYLr3l6Yf/cbGtzd9PT1tECqP2EcfffTRRx99fM2QjWwX/+r14Ho92P5SPE8b1Xveo/iH3Pd0n4j+jenjS0N3oU9Pi2lg7tzG8zY/b2ZmLL4Yt70IKerqvMccc0xNnXURRvRDhCehbwD6+Nphs2EHpqfFuXfE7rN668JNfe/MfnP3nOeYY2r+bCdh0PmoaYocgKT+4v4c6BuAPr4w2Ijpernrz/iTdly/Xk/fWqZ6NK4lWh4SOydJmgthvV2tZLg6nDusjihODCpbWmvlw2Egd7vhhfagASZX1+VDg24vrud7dtPQqzPZ089vI/ToG4wCfQPQxxeKjd38yS63Z6cSqt8fupOuDcd8ZDC2V2q1tBqkRCJPcqnm3AMiJk5DHhK3HZN2YjKCojMiAFmuVpp4kNhM8PLI2IGHevVvNLZ8z27VAaTOt/roG4A+/sSw0VaL3bZ4Yzp56wLVY4dJq9lotSXVYnN1qJJWRhyy4YYZqUQP2KGCQhBOYlBFURWFPFhJNFlOnmRpIMttJzGJOTkAIUmyGGPD5A+CqveHYPlBSFpD+XK2Y2ikzcGVNufIpJn4ld+YbYC+AejjTwTbYu58YP6sNbOxyOzZ5M4bdwZja30orDZGFTwmkh0ojBE8gj0iazCKYcc4JKgKpUiKWBAIsrtmxTaSiUCQbRsR7dAW+bqlB45e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]=],
    search = [=[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]=],
    delete = [=[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]=],
    viewer = [=[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]=],
    players = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAABkKUlEQVR42u39aZBd6XkeCD7P+5275I5MILFWoVB7EUkWF5RILZaFmpZMiZblrRMRbU90jGYiyIgZW4wZWS1RGse9d8ayzJFoBS1HRxS7e+SwRx0dmZYlUhIptiUXZC3cqopronYAVdiRCeS+3HvP9z7z45x782YigSoWq6hC4TxBEMisvCfP+c73vfv7vECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAn/tYLEE338IIHTj6hNQsToFCrwDD7wKYVugsADujDWVhHq9znodwPQEMT6zuc6zp4SZo0K9vlXb1+vExCkCkwCmgcmjQh3Ifo4gC+ugQIECBQoUFsDbyLyv1QwTmZZ/+oVLXH7ogE6ehDcaDb/5Z2Q4+JkAPI2nAQDHcOyjH01JakeLYmrKMD7DkwCOH4cDdd3kZwsUKATA20k4PH3wYNhdvhiOvAd29hzKfUPliq57f+grJ2g2IU8ko5dCqd2sNDcWW8nGIw/c28TETAo2VAQGCxQC4O10qAUCNeIkDLMT4okT8cafEa+erA/YYv9wLGl3aGm3JepXZMVNZROqDiUGAAoueSpD6uYbQVwKtDmI82ZaHlnbWOWJRmv79TE9nVkFJ4HjgPMWFkeBAoUAeCuFwpO15NzscCmOW6W0sDKUmI0aMSrHOI0HEXWXGYclVAQFUiUYCZEQXfA2BKehSWER4EXKLitpzynlgrvm+5J0cegaVnAWreKwFygEwPdb69drxMQEMTnpvf737O9/cigEvw+we2KqA7K426VRgsOUxsxs1KXdJPoBliEZmKUFmV0bNKRyOMgWoXUK8wLnAV1zYgXQCsSrJjzHSnh+90+tXyS3CgHVajY9cYqT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]=],
    items = [=[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]=],
    copy = [=[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uPra670d/vTiPXX9VEykqhj/r47nwgh4PzgWMIilS7a0tISikMeqoLUbl/4v67Umr8XUjrPmxyGeToAzLj9BYprkFMhjoo5Bms48TmUDn+img3Kxy1CsJ2L5xH5PlTvt0QdICRLz5m6iyDwRr1y7iFA+uQaLHB2BZcpR7pgojGX4YmJgj7H04YE2IjkgMHCoB6EvogdYj0CPwrqkW5B95Mg+q5E3BuCa17AxiNjo16d23/2bv9bfc8J22/J6/vldKKRzxVfIC3H78/mziE7nHkOT/ujbE599PGhOzDaaA+9NG3GsNtAUTFMWrSXTFICWqKaIJjJrOTVlZI2ESUoITrg0RaAOAAQylzKjZUA+jwaQAUwB1QhMKt+3y3yRUxMwISgY2KOpP1rsrHBIuBvIkAuPYWzi48G8NlcuQR482SjM8RnJVPA+hZ4Du2a2Ze4bElYo3nHjShTWorT18tnGLn7x7/Tu58MvpTGwVxhVfHW8EALgUchHp3levrxc++mNVi2tZ806QmOnlzYmEAItI5O69bpqssFJs1hrIkH0WAM14xEnLK9EBLlSmfo0SwGAdHrkwIL1PXqDASckNAFtGZN1zzwAnCaVwLBD+C5EwWCQCUYxKji9BjCwsMA9/o+Uco1DfJS040g4UjhNqYGDGNVNAjcT4u7G9ubd1841tjqX4Z3OYpWqe0R54QSAJC4tXTQAuPjQun7ipUtLBixheXlJnY70wXe/m7x6Im3UTmwHALBYC5mnrUFvMN1UrQ4AfXiMIaY1b+bLWoeMtRDTWK+nYTCo9WXTLtXr4C6Tqe3B7maowSasFkIWrRe000e9JoSE6AKo18RMNrBuYrFhCBkRk8fucKpHoQegCXAQHvzsm0DDo3o9QAEekcXEbJBsDron/5eLWw/q8GXZdGABS1jCwvJ5oTNyy1YcHl44AfCkkcS8UOly+GQnX2ot3ZzV4KVV9dbOCQDeew/A1nVhZV6YW+aPurOhNrHKnRX4PObj5bllzq3A6jdmudls+nsnThxsFZ9b5gcfnuN77wEffPBFrvYDvPfuS/rgwxsE3nuk/QHgvXdf0uXLwIUOvHLfPV+80AJAAjudNjsAluavcGG85vTCstDBcHXi3GWVv3/RRzK124YLMHx4jni3EGx77tfQvflC36eKI4Dy+P/iT/m/L7hgfBQksN1uW37Pqvt2VKke2AMYNuj93uv9DLWD8v3B5+uMf9S5/36HkQ6ATqkNFR7Jr/SCKp4IR2Z58IqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioonx/8fIsh2tj9WIn8AAAAASUVORK5CYII=]=],    -- User-supplied reference icons, compressed PNG with transparent background.
    placeholder = [=[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]=],
    avatar_return = [=[iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAMAAADVRocKAAAASFBMVEUAAAD6uoyzdXuzcIj+x5Wvb4arY5jttIt7d3mtboX////lrIbeo3f9fn7no5r/AACrqaj//Kz/AP//+3+zjXLVnH3la6jAepKFu8z7AAAAGHRSTlMA+g3a/psVqANTAWwZAhIBBAMBAhNhBOUetBmqAAADQklEQVR42u1aDZOiMAyNKS0lLQWFXf//P72EL0EX8WhZb2/2jeOA1feapG2wKcAdLMagruAp7CfEgurLOn3gN1NordUe8O90gUyBK/wlNxXjN/dBXZUuAAJ9xY9gmV6DjXEQFizCEuYrflSqYPYKdofY1kKklcZHNxkorprpA1KMBRbF0Uoh1MuGAIViy+LYb0NFX83S1abjNxaSoCZWWNhg2aoCPiEVLCuoxQA1PHpMlUwASrTCeBtAWlmykBTik8FJtpKbxPyldLoeI8wOK9Pyy2ySYXOLcGIDBFpDKXGteYhiegEkM9DWIoXJ+1+BHR1zSToHZpNXfDRGI70FTFmoMcbmfmlKJYCdgATDvDCyz2GCf1ng8rIAPblLIWDB5ze45BbU4E/ZDDmc0wo0kGenGTIPIaVA9SDgEgvQGwT8rwU/SsD8/y5itqNmMjVl0xB/+24tsg23lYwNAdoQaHqVUla7xWp6hsEEHyXAy75n9P9+Zg8ecs0/bVtsJenuFiBwvct53uanBTgj9G25X3nkEQHzXMCK47uQnlAusuyU3YaRk1t+deHYZ4EHNxJ+nO6Q5dOwqr9+7kwnEFIIuPcK2F8XfYMFbxXwb4yBOdpF5p+OgYuPQTWlsbzNszs4PyU3isgHQxrjtOK6C0kA/MrzjykftE/ywXbKnLzlnGMNx2nyI2ctvsUXkr7ZFLD+zJCH9wHeTXm/PBNRQxSV9IeNjXZMZSIwRhk8EUHkU8VTgXMCFw0CuFOgtwCPFvjJLvqmGPwK/AiB9vssCEcI8H+ZcTU9+TBlHGiTCRD5Pt/kYcw8uduqNfxdwtm9KfiqAIWSJL3wn5m66a58tSkAR1twsICdFrtZKeGIGMCRW8sDrdLHCAyFom6XnNILkPDWkyk2fYzHGstBUZ4VVg4pEjHhVEnry1yYfhbgPN6Y1gYb7HxsljgvDKaJgFaGqvmcSFoo+uyru/cFnVQKtufHpaTuCtYJKrLExAW7fNndCrsP4YJxo4lq2SqUNeKhrzwxrmJEzNmQboNQzjYUK8cSNDfFWWANc+iV/MIfSvPGuQ141iDHPqSLK7202J88UXuhdSFdD+srJ4b4UbR1tgHj8MD+ByTlNgutsgdiAAAAAElFTkSuQmCC]=],
    eye = [=[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]=],
}
local EH_PNG_URI_CACHE = {}
local EH_PNG_FAILED = {}
local function EH_decodePNG64(data)
    local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local map = {}
    for i = 1, #alphabet do map[alphabet:sub(i, i)] = i - 1 end
    local chunks = {}
    for i = 1, #data, 4 do
        local a = map[data:sub(i, i)] or 0
        local b = map[data:sub(i + 1, i + 1)] or 0
        local c = map[data:sub(i + 2, i + 2)] or 0
        local d = map[data:sub(i + 3, i + 3)] or 0
        local value = a * 262144 + b * 4096 + c * 64 + d
        local byte1 = math.floor(value / 65536) % 256
        local byte2 = math.floor(value / 256) % 256
        local byte3 = value % 256
        local quad = data:sub(i, i + 3)
        if quad:sub(3, 3) == "=" then
            chunks[#chunks + 1] = string.char(byte1)
        elseif quad:sub(4, 4) == "=" then
            chunks[#chunks + 1] = string.char(byte1, byte2)
        else
            chunks[#chunks + 1] = string.char(byte1, byte2, byte3)
        end
    end
    return table.concat(chunks)
end

local function EH_customPNGAsset(kind)
    if EH_PNG_URI_CACHE[kind] then return EH_PNG_URI_CACHE[kind] end
    if EH_PNG_FAILED[kind] then return nil end
    local writer = writefile
    local assetGetter = getcustomasset or getsynasset
    if type(writer) ~= "function" or type(assetGetter) ~= "function" then
        EH_PNG_FAILED[kind] = true
        return nil
    end
    local encoded = EH_PNG_DATA[kind]
    if not encoded then return nil end
    local ok, assetOrError = pcall(function()
        local path = "AvatarInspector_EH_v7959_" .. kind .. ".png"
        -- Always restore the exact embedded PNG; no manual user file setup.
        writer(path, EH_decodePNG64(encoded))
        return assetGetter(path)
    end)
    if ok and type(assetOrError) == "string" and assetOrError ~= "" then
        EH_PNG_URI_CACHE[kind] = assetOrError
        return assetOrError
    end
    EH_PNG_FAILED[kind] = true
    warn("[Avatar Inspector] Optional PNG unavailable (" .. kind .. "): " .. tostring(assetOrError))
    return nil
end

local function EH_pngIcon(parent, kind, position, size)
    local imageKind = kind
    local uri = EH_customPNGAsset(imageKind)
    if not uri then return nil end
    local sz = size or 22
    local img = create("ImageLabel", {
        Name = "EHIcon_" .. kind,
        Size = UDim2.fromOffset(sz, sz),
        Position = position,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = uri,
        ImageColor3 = Color3.new(1, 1, 1),
        ScaleType = Enum.ScaleType.Fit,
        Active = false,
        ZIndex = parent.ZIndex + 1
    }, parent)
    return img
end

-- Event Horizon line-icon system for the remaining non-PNG icons.
-- unicode pictograms or external assets. Every piece is decorative and
-- does not intercept pointer/touch input. The icon's parent remains the button.
function EH.icon(parent, kind, position, size)
    local sz = size or 22
    local u = sz / 24
    local z = parent.ZIndex + 1
    local ink = Color3.fromRGB(216, 173, 115)
    local root = create("Frame", {
        Name = "EHIcon_" .. tostring(kind),
        Size = UDim2.fromOffset(sz, sz),
        Position = position,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = z,
        Active = false
    }, parent)

    local function strokeLine(x1, y1, x2, y2, width)
        local dx, dy = x2 - x1, y2 - y1
        local length = math.sqrt(dx * dx + dy * dy) * u
        local thickness = math.max(1.5, (width or 2) * u)
        local angle = math.deg(math.atan2(dy, dx))
        local part = create("Frame", {
            Name = "Line",
            Size = UDim2.fromOffset(length, thickness),
            Position = UDim2.fromOffset(
                (x1 + x2) * 0.5 * u - length * 0.5,
                (y1 + y2) * 0.5 * u - thickness * 0.5
            ),
            Rotation = angle,
            BorderSizePixel = 0,
            BackgroundColor3 = ink,
            Active = false,
            ZIndex = z + 1
        }, root)
        create("UICorner", {CornerRadius = UDim.new(1, 0)}, part)
        return part
    end

    local function outline(x, y, w, h, radius, thickness)
        local part = create("Frame", {
            Name = "Outline",
            Size = UDim2.fromOffset(w * u, h * u),
            Position = UDim2.fromOffset(x * u, y * u),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Active = false,
            ZIndex = z + 1
        }, root)
        create("UICorner", {CornerRadius = UDim.new(0, (radius or 2) * u)}, part)
        create("UIStroke", {
            Color = ink,
            Thickness = math.max(1.5, (thickness or 2) * u),
            Transparency = 0,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }, part)
        return part
    end

    local function dot(x, y, diameter)
        local part = create("Frame", {
            Name = "Dot",
            Position = UDim2.fromOffset(x * u, y * u),
            Size = UDim2.fromOffset(diameter * u, diameter * u),
            BackgroundColor3 = ink,
            BorderSizePixel = 0,
            Active = false,
            ZIndex = z + 1
        }, root)
        create("UICorner", {CornerRadius = UDim.new(1, 0)}, part)
        return part
    end

    if kind == "home" then
        strokeLine(3, 11, 12, 3.5, 2)
        strokeLine(12, 3.5, 21, 11, 2)
        strokeLine(5.5, 10, 5.5, 21, 2)
        strokeLine(18.5, 10, 18.5, 21, 2)
        strokeLine(5.5, 21, 18.5, 21, 2)
        outline(10, 14, 4, 7, 1, 1.6)
    elseif kind == "user_round_cog" then
        -- User with a small settings cog; native Luau shapes, no external asset.
        outline(6.8, 2.0, 8.2, 8.2, 8, 1.9)
        strokeLine(3.0, 21, 3.4, 17.6, 2)
        strokeLine(3.4, 17.6, 6.3, 13.9, 2)
        strokeLine(6.3, 13.9, 13, 13.9, 2)
        outline(15.3, 15.0, 6, 6, 6, 1.6)
        dot(17.5, 17.2, 1.7)
        strokeLine(18.3, 12.9, 18.3, 14.8, 1.4)
        strokeLine(18.3, 21.2, 18.3, 23, 1.4)
        strokeLine(13.2, 18, 15.0, 18, 1.4)
        strokeLine(21.3, 18, 23, 18, 1.4)
    elseif kind == "ghost" then
        -- Minimal bronze ghost pictogram, matching the native HORIZON line icons.
        outline(4, 2.5, 16, 19, 8, 2)
        dot(8, 10, 2.5)
        dot(14, 10, 2.5)
        strokeLine(5, 20, 8, 17.5, 2)
        strokeLine(8, 17.5, 12, 21, 2)
        strokeLine(12, 21, 16, 17.5, 2)
        strokeLine(16, 17.5, 19, 20, 2)
    elseif kind == "fly" then
        -- Outline airplane for the player tools card.
        strokeLine(2.8, 12.2, 21, 4.5, 1.9)
        strokeLine(21, 4.5, 14.3, 21, 1.9)
        strokeLine(14.3, 21, 11, 14.8, 1.9)
        strokeLine(11, 14.8, 2.8, 12.2, 1.9)
        strokeLine(11, 14.8, 21, 4.5, 1.9)
    elseif kind == "search" then
        outline(3.1, 2.8, 14.4, 14.4, 10, 2.2)
        strokeLine(16.3, 16.4, 21.5, 21.5, 2.5)
    elseif kind == "eye" then
        -- Small curved-looking eye silhouette, with a centered iris.
        strokeLine(2, 12, 6, 8, 1.8)
        strokeLine(6, 8, 12, 6, 1.8)
        strokeLine(12, 6, 18, 8, 1.8)
        strokeLine(18, 8, 22, 12, 1.8)
        strokeLine(22, 12, 18, 16, 1.8)
        strokeLine(18, 16, 12, 18, 1.8)
        strokeLine(12, 18, 6, 16, 1.8)
        strokeLine(6, 16, 2, 12, 1.8)
        outline(9, 9, 6, 6, 6, 1.8)
    elseif kind == "copy" then
        outline(3.2, 3.0, 12.8, 13.8, 2.7, 2.15)
        outline(9.0, 9.1, 12.0, 12.4, 2.7, 2.15)
    elseif kind == "edit" then
        -- Geometrically aligned 45-degree pencil: parallel sides,
        -- identical stroke widths, a clear cap and a centered sharp nib.
        local tipX, tipY = 4.55, 21.25
        local leftX, leftY = 6.8, 15.9
        local rightX, rightY = 9.9, 19.0
        local upperLeftX, upperLeftY = 16.0, 6.7
        local upperRightX, upperRightY = 19.1, 9.8
        strokeLine(leftX, leftY, upperLeftX, upperLeftY, 2.25)
        strokeLine(upperLeftX, upperLeftY, upperRightX, upperRightY, 2.25)
        strokeLine(upperRightX, upperRightY, rightX, rightY, 2.25)
        strokeLine(rightX, rightY, tipX, tipY, 2.05)
        strokeLine(tipX, tipY, leftX, leftY, 2.05)
        strokeLine(leftX, leftY, rightX, rightY, 1.9)
        -- Small ferrule seam, perpendicular to the pencil barrel.
        strokeLine(13.9, 8.8, 17.0, 11.9, 1.65)
    elseif kind == "delete" then
        strokeLine(3.5, 6.8, 20.5, 6.8, 2.1)
        strokeLine(9, 4.1, 15, 4.1, 2.1)
        strokeLine(9, 4.1, 8.2, 6.8, 2.1)
        strokeLine(15, 4.1, 15.8, 6.8, 2.1)
        strokeLine(6.5, 8.8, 7.1, 20.3, 2)
        strokeLine(17.5, 8.8, 16.9, 20.3, 2)
        strokeLine(7.1, 20.3, 16.9, 20.3, 2)
        strokeLine(10.2, 10.6, 10.2, 17.2, 1.7)
        strokeLine(13.8, 10.6, 13.8, 17.2, 1.7)
    elseif kind == "save" then
        -- Bookmark with plus sign, not a text glyph.
        strokeLine(6.0, 3.2, 18.0, 3.2, 2.2)
        strokeLine(6.0, 3.2, 6.0, 21.0, 2.2)
        strokeLine(18.0, 3.2, 18.0, 21.0, 2.2)
        strokeLine(6.0, 21.0, 12.0, 17.4, 2.2)
        strokeLine(12.0, 17.4, 18.0, 21.0, 2.2)
        strokeLine(12, 7, 12, 14, 2.1)
        strokeLine(8.5, 10.5, 15.5, 10.5, 2.1)
    elseif kind == "close" then
        strokeLine(5, 5, 19, 19, 2.4)
        strokeLine(19, 5, 5, 19, 2.4)
    elseif kind == "outfits" or kind == "shirt_tab" then
        -- Native shirt outline when executor PNG loading is unavailable.
        strokeLine(8, 4, 6, 5, 1.9)
        strokeLine(6, 5, 2, 10, 1.9)
        strokeLine(2, 10, 5, 13.5, 1.9)
        strokeLine(5, 13.5, 8, 11.5, 1.9)
        strokeLine(8, 11.5, 8, 21, 1.9)
        strokeLine(8, 21, 16, 21, 1.9)
        strokeLine(16, 21, 16, 11.5, 1.9)
        strokeLine(16, 11.5, 19, 13.5, 1.9)
        strokeLine(19, 13.5, 22, 10, 1.9)
        strokeLine(22, 10, 18, 5, 1.9)
        strokeLine(18, 5, 16, 4, 1.9)
        strokeLine(16, 4, 14.5, 6, 1.9)
        strokeLine(14.5, 6, 9.5, 6, 1.9)
        strokeLine(9.5, 6, 8, 4, 1.9)
    elseif kind == "hanger" then
        -- Original clothes-hanger symbol as a native fallback only.
        strokeLine(12, 6.5, 12, 5.2, 2)
        strokeLine(12, 5.2, 14, 3.5, 2)
        strokeLine(14, 3.5, 13, 2.4, 2)
        strokeLine(12, 6.5, 2.8, 15.6, 2)
        strokeLine(2.8, 15.6, 3.5, 18, 2)
        strokeLine(3.5, 18, 20.5, 18, 2)
        strokeLine(20.5, 18, 21.2, 15.6, 2)
        strokeLine(21.2, 15.6, 12, 6.5, 2)
    elseif kind == "folder" then
        strokeLine(2.5, 7.5, 2.5, 20, 2)
        strokeLine(2.5, 7.5, 9.5, 7.5, 2)
        strokeLine(9.5, 7.5, 12, 10, 2)
        strokeLine(12, 10, 21.5, 10, 2)
        strokeLine(21.5, 10, 21.5, 20, 2)
        strokeLine(2.5, 20, 21.5, 20, 2)
    elseif kind == "placeholder" then
        -- Clear single-user pictogram on an empty 3D viewport.
        outline(8.1, 2, 7.8, 7.8, 8, 2)
        strokeLine(4.0, 20, 4.0, 17.0, 2.2)
        strokeLine(4.0, 17.0, 7.2, 13.1, 2.2)
        strokeLine(7.2, 13.1, 16.8, 13.1, 2.2)
        strokeLine(16.8, 13.1, 20.0, 17.0, 2.2)
        strokeLine(20.0, 17.0, 20.0, 20.0, 2.2)
    elseif kind == "status" then
        outline(2.5, 3, 19, 18, 4, 2)
        strokeLine(5, 13, 8.5, 13, 1.7)
        strokeLine(8.5, 13, 11.3, 9.5, 1.7)
        strokeLine(11.3, 9.5, 14.3, 16, 1.7)
        strokeLine(14.3, 16, 16.9, 12.6, 1.7)
        strokeLine(16.9, 12.6, 19.2, 12.6, 1.7)
    end
    return root
end

function EH.safeIcon(parent, kind, position, size)
    local usePNG = (kind == "hanger" or kind == "outfits" or kind == "viewer" or kind == "players" or kind == "items" or kind == "copy" or kind == "save" or kind == "edit" or kind == "search" or kind == "delete" or kind == "eye" or kind == "placeholder")
    if usePNG then
        local okPNG, resultPNG = pcall(EH_pngIcon, parent, kind, position, size)
        if okPNG and resultPNG then return resultPNG end
        -- Native fallback is created only if PNG registration failed; no duplicate icon.
    end
    local fallbackKind = kind
    local ok, result = pcall(EH.icon, parent, fallbackKind, position, size)
    if not ok then
        warn("[Avatar Inspector] Decorative icon skipped: " .. tostring(result))
    end
    return ok and result or nil
end

function EH.ehCard(card)
    -- Cards have one coherent rounded outline and a restrained recessed finish.
    round(card, 10)
    create("UIStroke", {
        Color = Color3.fromRGB(115, 88, 61),
        Thickness = 1.1,
        Transparency = 0.48,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, card)
    create("UIGradient", {Enabled = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(44, 37, 30)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(34, 30, 25))
        }),
        Rotation = 25
    }, card)
end

function EH.styleIconAction(button)
    button:SetAttribute("EHActionButton", true)
    button.BackgroundColor3 = Color3.fromRGB(35, 30, 25)
    button.TextColor3 = Color3.fromRGB(234, 216, 182)
    local edge = button:FindFirstChildOfClass("UIStroke")
    if edge then
        edge.Color = Color3.fromRGB(179, 131, 82)
        edge.Transparency = 0.12
        edge.Thickness = 1.4
    end
end

function EH.setModeButtonLabel(button, mode)
    local base = mode == "Players" and "📁 OUTFITS" or "PLAYERS"
    local localized = translateText(base)
    button.Text = localized:gsub("^📁%s*", "")
end

function EH.ehSectionLabel(label, marker)
    if not label then return end
    label.Font = Enum.Font.GothamBold
    if marker then
        label.Text = marker .. "  " .. label.Text
    end
end

local function makeLabel(parent, text, size, position, textSize)
    return create("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = WHITE,
        TextSize = textSize or 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Size = size,
        Position = position
    }, parent)
end

-- Physical Press #16: one shared implementation, no permanent root locals.
-- Target may be a visible card behind a transparent selection button.
function EH.bindPhysicalPress(button, target, moveTarget)
    target = target or button
    local scale = target:FindFirstChildOfClass("UIScale")
    if not scale then
        scale = create("UIScale", {Scale = 1}, target)
    end
    local outline = target:FindFirstChildOfClass("UIStroke")
    local downTween, upTween, downMove, upMove
    local pressed = false
    local originalPosition
    local originalScale = scale.Scale

    local function release()
        if not pressed then return end
        pressed = false
        if downTween then downTween:Cancel() end
        if downMove then downMove:Cancel() end
        if upTween then upTween:Cancel() end
        if upMove then upMove:Cancel() end
        upTween = TweenService:Create(scale,
            TweenInfo.new(0.20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Scale = originalScale})
        upTween:Play()
        if moveTarget and originalPosition and target.Parent then
            upMove = TweenService:Create(target,
                TweenInfo.new(0.20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = originalPosition})
            upMove:Play()
        end
        if outline and button:GetAttribute("EHActionButton") then
            TweenService:Create(outline,
                TweenInfo.new(0.20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.12, Thickness = 1.4}):Play()
        end
    end

    button.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then return end
        if pressed or not target.Parent then return end
        pressed = true
        originalScale = scale.Scale
        originalPosition = target.Position
        if upTween then upTween:Cancel() end
        if upMove then upMove:Cancel() end
        downTween = TweenService:Create(scale,
            TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Scale = originalScale * 0.97})
        downTween:Play()
        if moveTarget then
            downMove = TweenService:Create(target,
                TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = originalPosition + UDim2.fromOffset(0, 3)})
            downMove:Play()
        end
        if outline and button:GetAttribute("EHActionButton") then
            TweenService:Create(outline,
                TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0, Thickness = 1.7}):Play()
        end
    end)
    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            release()
        end
    end)
    button.MouseLeave:Connect(release)
    -- Gamepad/keyboard activation and cancelled touch must not leave a button pressed.
    button.Activated:Connect(release)
end

local function makeButton(parent, text, size, position, color)
    local baseColor = color or LIGHT
    local obj = create("TextButton", {
        Size = size,
        Position = position,
        BackgroundColor3 = baseColor,
        BorderSizePixel = 0,
        Text = text,
        TextColor3 = WHITE,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextTruncate = Enum.TextTruncate.AtEnd,
        AutoButtonColor = false,
        Active = true,
        Selectable = true
    }, parent)

    round(obj, 10)
    local outline = create("UIStroke", {
        Color = OUTLINE,
        Thickness = 1,
        Transparency = 0.28,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, obj)
    local hoverInfo = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    -- Floating toggle is draggable: scale it without altering its coordinates.
    EH.bindPhysicalPress(obj, obj, not parent:IsA("ScreenGui"))

    obj.MouseEnter:Connect(function()
        if not obj.Parent then return end
        if not obj:GetAttribute("SelectedControl") then TweenService:Create(obj, hoverInfo, {BackgroundColor3 = obj.BackgroundColor3:Lerp(WHITE, 0.055)}):Play() end
        TweenService:Create(outline, hoverInfo, {Transparency = 0.08}):Play()
    end)
    obj.MouseLeave:Connect(function()
        if not obj.Parent then return end
        local chosen = obj:GetAttribute("SelectedControl")
        if not chosen then
            TweenService:Create(obj, hoverInfo, {BackgroundColor3 = baseColor}):Play()
        end
        TweenService:Create(outline, hoverInfo, {
            Transparency = chosen and 0.02
                or (obj:GetAttribute("EHActionButton") and 0.12 or 0.28)
        }):Play()
    end)
    return obj
end

local function clearGuiList(container)
    for _, child in ipairs(container:GetChildren()) do
        if child:IsA("Frame")
        or child:IsA("TextButton")
        or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

local function countParts(model)
    local count = 0

    for _, object in ipairs(model:GetDescendants()) do
        if object:IsA("BasePart") then
            count += 1
        end
    end

    return count
end

local function isPoseJoint(object)
    if not object then return false end
    if object:IsA("Motor6D") then return true end

    return object.ClassName == "AnimationConstraint"
end

--==================================================
-- GUI
--==================================================

do -- release construction-only local: oldGui
local oldGui = PlayerGui:FindFirstChild("AvatarInspector")
if oldGui then oldGui:Destroy() end
end -- short-lived oldGui scope

AI_DIAG_STAGE = "BEFORE_SCREEN_GUI"
AIDiag("08 Creating ScreenGui")
local ScreenGui = create("ScreenGui", {
    Name = "AvatarInspector",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 100
}, PlayerGui)
AI_DIAG_STAGE = "SCREEN_GUI_CREATED"
AIDiag("09 ScreenGui created and parented to PlayerGui")

-- Event Horizon / Cosmic Orbit A: one clickable, draggable 58px button.
-- All visual pieces use native Roblox UI and have Active=false. The Toggle is
-- the ONLY input surface; opening/dragging code below is intentionally unchanged.
local Toggle
do
    Toggle = makeButton(
        ScreenGui, "",
        UDim2.fromOffset(58, 58),
        UDim2.new(0, 20, 0.5, -29),
        Color3.fromRGB(18, 17, 15)
    )
    Toggle.Name = "AvatarInspectorFloatingButton"
    Toggle.Text = ""
    Toggle.ClipsDescendants = false
    Toggle.BackgroundColor3 = Color3.fromRGB(18, 17, 15)

    local corner = Toggle:FindFirstChildOfClass("UICorner")
    if corner then corner.CornerRadius = UDim.new(1, 0) end

    local outline = Toggle:FindFirstChildOfClass("UIStroke")
    if outline then
        outline.Color = Color3.fromRGB(191, 143, 89)
        outline.Thickness = 1.8
        outline.Transparency = 0.05
    end

    local function layer(name, pos, size, color, radius, rotation, transparency, z)
        local frame = create("Frame", {
            Name = name,
            Position = pos,
            Size = size,
            BackgroundColor3 = color,
            BackgroundTransparency = transparency or 0,
            BorderSizePixel = 0,
            Rotation = rotation or 0,
            Active = false,
            ZIndex = (Toggle.ZIndex or 1) + (z or 2)
        }, Toggle)
        round(frame, radius or 12)
        return frame
    end

    -- Dark celestial core, layered like an application icon.
    local disk = layer("OrbitDisk", UDim2.fromOffset(7, 7),
        UDim2.fromOffset(44, 44), Color3.fromRGB(35, 29, 23), 22, 0, 0, 2)
    local diskGradient = create("UIGradient", {Enabled = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(68, 50, 32)),
            ColorSequenceKeypoint.new(0.52, Color3.fromRGB(15, 14, 12)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(36, 29, 22))
        }), Rotation = 45
    }, disk)

    local eventSphere = layer("EventSphere", UDim2.fromOffset(19, 18),
        UDim2.fromOffset(21, 21), Color3.fromRGB(12, 12, 11), 11, 0, 0, 3)
    create("UIStroke", {
        Color = Color3.fromRGB(150, 109, 71),
        Thickness = 1,
        Transparency = 0.13
    }, eventSphere)

    -- The single elliptical orbit intentionally crosses the dark sphere.
    -- Using UIStroke rather than broken Frame segments keeps its edge smooth.
    local orbit = layer("CosmicOrbit", UDim2.fromOffset(7, 21),
        UDim2.fromOffset(45, 16), Color3.fromRGB(205, 155, 91),
        9, -27, 1, 5)
    local orbitStroke = create("UIStroke", {
        Color = Color3.fromRGB(211, 163, 102),
        Thickness = 2.5,
        Transparency = 0.04,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, orbit)
    create("UIGradient", {Enabled = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(156, 111, 69)),
            ColorSequenceKeypoint.new(0.43, Color3.fromRGB(219, 180, 117)),
            ColorSequenceKeypoint.new(0.73, Color3.fromRGB(210, 148, 82)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 108, 67))
        }), Rotation = 0
    }, orbitStroke)

    local satellite = layer("OrbitSatellite", UDim2.fromOffset(43, 12),
        UDim2.fromOffset(7, 7), Color3.fromRGB(219, 178, 114),
        4, 0, 0, 6)
    local star = layer("OrbitStar", UDim2.fromOffset(12, 41),
        UDim2.fromOffset(4, 4), Color3.fromRGB(173, 129, 81),
        2, 0, 0, 6)

    -- Smooth entrance; only opacity/scale animate, no per-frame work.
    local toggleScale = Toggle:FindFirstChildOfClass("UIScale")
    if toggleScale then toggleScale.Scale = 0.78 end
    Toggle.BackgroundTransparency = 1
    if outline then outline.Transparency = 1 end
    TweenService:Create(Toggle,
        TweenInfo.new(0.32, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}):Play()
    if outline then
        TweenService:Create(outline,
            TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Transparency = 0.05}):Play()
    end
    if toggleScale then
        TweenService:Create(toggleScale,
            TweenInfo.new(0.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {Scale = 1}):Play()
    end
end -- floating-icon scope
AI_DIAG_STAGE = "AI_BUTTON_CREATED"
AIDiag("10 AI button created successfully")

-- HttpService is only needed for outfit JSON storage. Acquire it only after
-- the visible AI toggle has been created, so storage cannot block GUI startup.
local httpServiceOk, httpServiceResult = pcall(function()
    return game:GetService("HttpService")
end)
if httpServiceOk then
    HttpService = httpServiceResult
else
    warn("[Avatar Inspector] HttpService unavailable; outfit storage disabled: " .. tostring(httpServiceResult))
end

local LANGUAGE_FILE = "AvatarInspector_Settings.json"
local function loadLanguagePreference()
    if type(readfile) ~= "function" then return end
    local ok, contents = pcall(function() return readfile(LANGUAGE_FILE) end)
    if not ok or type(contents) ~= "string" or contents == "" then return end
    if not HttpService then return end
    local decodeOk, data = pcall(function() return HttpService:JSONDecode(contents) end)
    if decodeOk and type(data) == "table" and type(data.language) == "string" then
        for _, option in ipairs(languageOptions) do
            if option.code == data.language then
                currentLanguage = option.code
                return
            end
        end
    end
end

local function saveLanguagePreference()
    if type(writefile) ~= "function" or not HttpService then
        return false
    end
    local encodeOk, encoded = pcall(function()
        return HttpService:JSONEncode({language = currentLanguage})
    end)
    if not encodeOk or type(encoded) ~= "string" then return false end
    local writeOk = pcall(function() writefile(LANGUAGE_FILE, encoded) end)
    if not writeOk then return false end
    if type(readfile) == "function" then
        local verifyOk, contents = pcall(function() return readfile(LANGUAGE_FILE) end)
        if not verifyOk or contents ~= encoded then return false end
    end
    return true
end

loadLanguagePreference()

local Main = create("Frame", {
    Name = "MainWindow",
    Size = UDim2.fromOffset(800, 520),
    Position = UDim2.fromScale(0.5, 0.5),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = BG,
    Visible = false,
    Active = true,
    ClipsDescendants = true
}, ScreenGui)

round(Main, 18)
addStroke(Main)
-- A single continuous border follows Main's UICorner, with no detached strips.
EH.ehStroke(Main, Color3.fromRGB(155, 114, 73), 0.08, 1.65)
do
    local inset = create("Frame", {
        Name = "EHContinuousInset",
        Position = UDim2.fromOffset(5, 5),
        Size = UDim2.new(1, -10, 1, -10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = false,
        ZIndex = Main.ZIndex
    }, Main)
    round(inset, 14)
    create("UIStroke", {Color = Color3.fromRGB(111, 85, 60),
        Thickness = 1, Transparency = 0.63}, inset)
end
create("UIGradient", {Enabled = false,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 26, 22)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(17, 16, 15)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 27, 23))
    }),
    Rotation = 25
}, Main)

-- Bronze Horizon: original lightweight dark-copper wave image; preserved background layer logic.
-- The embedded original artwork is packed as an indexed PNG.
-- It fills Main and is inserted BEFORE foreground panels. Only panel surfaces
-- become partly translucent; the 3D ViewportFrame stays fully opaque.
 -- The image is visual only: never handles input, never changes existing actions.
do
    local bgWriter = writefile
    local bgGetter = getcustomasset or getsynasset
    if false and type(bgWriter) == "function" and type(bgGetter) == "function" then
        local imageOk, imageUri = pcall(function()
            local imagePath = "AvatarInspector_Bronze_Horizon_BG_v7963.png"
            bgWriter(imagePath, EH_decodePNG64([=[iVBORw0KGgoAAAANSUhEUgAAAeAAAAE4CAMAAAC0Z9DlAAADAFBMVEUHBhQIBhQIBxMJBxMKBxILCBILCBEMCBANCRANCQ8OCQ8PCg4QCg4QCg0RCw0SCwwJCBcKCBYLCBYLCRUMCRQNCRQOChMOChMPChIQCxIQCxERCxESDBATDA8TDA8UDQ4LCRkMChgNChgOChcOCxcPCxYQCxYQDBURDBUSDBQTDRMTDRMUDRIVDhIVDhEWDxEOCxsOCxsPDBoQDBoQDBkRDRkSDRgTDRcTDhcUDhYVDxYWDxUWDxUXEBQYEBMYEBMQDR4RDR0RDRwSDhwTDhsTDxsUDxoVDxoWEBkWEBkXEBgYERcYERcZERYaEhYbEhUSDyATDx8TDx8UEB4VEB4WEB0WER0XERwYERsYEhsZEhoaEhobExkbExkcExgdFBgUECIVESIWESEWESEXEiAYEh8ZEh8ZEx4aEx4bEx0bFB0cFBwdFBseFRseFRofFRoWEiUXEiQYEyMZEyMZEyIaFCIbFCEbFCEcFSAdFR8eFR8eFh4fFh4gFh0gFx0hFxwTDhYUDxcWEBcXERgZEhgaExkcExkdFBoeFRsgFhshFxwjGBwkGR0mGh0nGx4oHB8qHR8rHiAtHiAuHyEwICExISIzIiI0IyM1JCQ3JSQ4JiU6JyU7KCY9KCY+KSc/KihBKyhCLClELSlFLipHLypIMCtJMSxLMixMMy1OMy1PNC5RNS5SNi9TNzBVODBWOTFYOjFZOzJbPDJcPTNePTNfPjRgPzViQDVjQTZlQjZmQzdoRDdpRThqRjlsRzltSDpvSDpwSTtySjtzSzx0TD12TT13Tj55Tz56UD98UT99UkB+U0GAU0GBVEKDVUKEVkOGV0OHWESJWUSKWkWLW0aNXEaOXUeQXUeRXkiTX0iUYEmVYUqXYkqYY0uaZEubZUydZkyeZ02faE6haE6iaU+kak+la1CnbFCobVGpblKrb1KscFOucVOvclSxclSyc1W0dFW1dVa2dle4d1e5eFi7eVi8elm+e1m/fFrAfVvCfVvDflzFf1zGgF3IgV3Jgl7P3U8EAAJKTUlEQVR4AQD//wAAADAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDBAMDAwQDExMUExMTFBMTExQTExMUExMTFBMTExQTExMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0REVERERFRERERUREREVERERFRERERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRkZGVkZGRlZGRkdXR0dHR0dHR0dHR0dHR0dHRwBAMEAwQDBAMEAwQDBAMEAwQDBAMEAwQDBAMEAwQDBAMEAwQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBQUExQUFBMUFBQTFBQUEyQkJCMkJCQjJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRURFRUVERVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZGVlZWRlZWVkZWVlZGVlZWRlZWVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGV0dXR1dHV0dXR1dHV0dXR1dHV0cAMDAwMDAwMDAwQDAwMEAwMDBAMDAwQDAwMEAwMDBAMDAxQTExMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NUREREVERERFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVEVVRVVFVUVVRVVFVUVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVlZWRlZWVkZWVlZGVlZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZHV0dXR1dHV0dHR1dHR0dXR0dHR0dHAEAwQDBAMEAwQDBAMEAwQDBAMEAwQDBAMEAwQDBAMEExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0RURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVkZWVlZGVlZWRlZWVkZWVlZGVkZWRldHV0dXR1dHV0dXR1dHV0dXR1dHV0dXRwAwMDAwMDAwMDAwMDAwMDBAMDAwQDAwMEAwMDBAMTExQTExMUExMTFBMTExQTExMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDRERUREREVERERFRERERUREREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVRVVFVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVZGVlZWRlZWVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWR1dHV0dXR0dHV0dHR1dHR0dXR0dHR0dHR0cAQDBAMEAwQDBAMEAwQDBAMEAwQDBAMEAwQDBAMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFCQkIyQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWRlZWVkZWVlZGVlZWRlZWVkZWVlZGVkZXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHADBAMDAwQDAwMEAwMDBAMDAwQDAwMEAwQDBBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTJCMkIyQjJCMkIyQjJCMkIyQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NERERUREREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFVFVUVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVlZGVlZWRlZWVkZWVlZGVlZWRlZWVkZWVlZGVlZWRlZWVkZWVlZGVlZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkdXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dHR1dHRwBAMEAwQDBAMEAwQDBAMEAwQDBAMEAwQDFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZGVldXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0dXR1dHV0cAMDAwQDAwMEAwMDBAMDAwQDAwMEAwMTFBMTExQTExMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUEyQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDRFRERERUREREVERERFRERERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERVRVVFVUVVRVVFVUVVRVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUZWVlZGVlZWRlZWVkZWVlZGVlZWRlZWVkZWVlZGVlZWRlZWVkZWVlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGVkZWRlZGV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dHR1dHR0dXAEAwQDBAMEAwQDBAMEAwQDBAMEAxQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVkZWVlZHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXRwAwQDAwMEAwQDBAMEAwQDBAMEExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMkIyQjJCMkIyQjJCMkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0RERFRERERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVkZWVlZGVlZWRlZWVkZWVlZGVlZWRlZWVkZWRlZGVkZWRldHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1cAQDBAMEAwQDBAMEAwQDBAMUExQTFBMUExQTFBMUExQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHADAwMEAwMDBAMDAwQDBBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTJCMkIyQjJCMkIyQjJCMkIyQjJCMkIyQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NEVERERFRERERUREREVERERFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFVFVUVVRVVFVUVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZGVlZWRlZWVkZWVlZGVlZWRlZWVkZWVlZGVlZWRlZGVkZWRlZGVkZXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHVwBAMEAwQDBAMEAwQDBBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVldXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0cAMEAwQDBAMEAwQDFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQjJCMkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0REVERERFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRVRVVVVUVVVVVFVVVVRVVVVUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWRlZWVkZWVlZGV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXAEAwQDBAMEAwQTFBMUExQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXRwAwQDBAMEAxQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUIyQjJCMkIyQjJCMkIyQjJCMkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NUREREVERERFRERERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVEVVRVVFVUVVVVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZGVlZWRlZWVkZWVlZHV1dXR1dXV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1cAQDBAMEExQTFBMUExQTFBMUExQTFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0RURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVldXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHADBAMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQUFCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDRERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFRFVVVVRVVVVUVVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWV1dXV1dXV1dXV0dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHVwBBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXR1dXV0cAMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQjJCMkIyQjJCMkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1RERERUREREVERERFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURVVFVVVVRVVVVUVVVVVFVVVVRVVVVUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVldXV1dXV1dXV1dXV0dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXR1dHV0dXAEExQTFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXVwAxQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQUFBMUFBQTFBQUEyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NERFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVEVVVVVFVVVVRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0dXR1cAQUFBMUFBQTFBQUExQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZWVlZWVlZWVlZWVlZWVldXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHADFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBQkIyQkJCMkJCQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0RERFRERERUREREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVUVVVVVFVVVVRVVVVUVVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVldXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1dHV0dXR1dHVwBBMUFBQTFBQUExQUFBMUFBQTFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1cAMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTJCQkIyQkJCMkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NEVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFVVVUVVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXAEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVldnV1dXZ1dXV2dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXVwAxQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUExQTFBMUFBQTFBQUExQUFBMUFCQjJCQkIyQkJCMkJCQjJCQkIyQkJCMkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTREREVERERFRERERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRVRVVVVUVVVVVFVVVVRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0dXV1dHV0dXR1dHV0dXR1cAQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZXV1dnV1dXZ1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1hYADFBMUExQTFBMUExQTFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFBMkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0RURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVVVVRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVldXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXR1dXV0dXWFhIWABBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQlJCQkJTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0RURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmV2dXZ1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dYWFhYWFgAMUExQTFBMUExQTFBMUExQTFBMUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUExQUFCMkJCQjJCQkIyQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDRERUREREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFRFVVVVRVVVVUVVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dHV1dXR1dXV0hYWFhIWEhYAEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1hYWFhYWFhYWABBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1REVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVldXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXWFhYWFhIWFhYSFgAQUGJholBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQlJCQkJSQkJCUkJCQlNDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dYWFhYWFhYWFhYWFhYADFBQUGFh4WIhEFBQTFBQUExQUFBMUFBQTFBQUExQUFBMUFBQTFBQUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NERFRERERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVEVVVVVFVVVVRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1hYWFhYWFhIWFhYSFhYWABBQUFBQUGJh4mGiYeIQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0RURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVWZlZWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmdXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV1dXV1dXV1dXV1dXV1dXV1dXWFhYWFhYWFhYWFhYWFhYWFgAQUExQUFBMUFBiIWIhoiFh0FBQUFBQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmV1dXZ1dXV2dXV1dnV1dXZ1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dYWFhYWFhYWFhYWFhYWFhYWFhYAEFBQUFBQUFBQUFBhoqHiYeKh4mGQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dXV2dXV1dnV1dXZ1dXV1dXV1hYWFhYWFhYWFhYWFhYWFhYWFhYWAAxQUFBMUFBQTFBQUExQYWIhYiGiIWHhUFBQUFBQUFBQUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NEVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFVVVUVVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVldnV1dXZ1dXV2dXV1dnV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFgAQUFBQUFBQUFBQUFBQUFBQYiGioeJh4qHiYZBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCUkJCQlJCQkJSQkJDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZldnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV1dXWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYAEFBQUFBQUFBQUFBQUFBQUFBQUGIhomGiIeJhoiGiEJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWABBQUFBQUFBQUFBQUFBQUFBQUFBQUFBiYeKiIqHioiJh4lCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dXV2hYWFhoWFhYaFhYWFhYWFhYWFhYWFhYWFhYWFgAQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBhYeGiYaIh4mGiIaIhEJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0RURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVVVVRVVVVUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmdXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYAEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQkJCQoeJh4qIioeLiIqHiodCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkNTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dYWGhYWFhoWFhYaFhYWFhYWFhYWFhYWFhYWFhYWFhYWABBQUFBQUFBQUFBQUFBQUFBQUFBQUJCQkJCQkJCQkKFiIaJhomHioaJh4mFh0JCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dXV1dXV1hYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFgAQUFBQUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCh4mHi4iLiIuJioeKh4lCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQlJCUkJSQlJDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZldnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXaFhoWGhYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWFhYWFhYWFhYAEFBQUFBQUFBQUFBQUFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQoWIhomGiYeKh4mHiYWIhUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ1NDU0NTQ1REVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERVVVVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZWVlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV2dXV1dnV1dXZ1dXV1dXV1dXV1dYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWABBQUFBQUFBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQomHiYeLiIqIi4mKiIqIiYZSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlNDQ0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2hYaFhoWGhYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWFhYWFhYWFhYWFgAQUFBQUFBQUFBQUFBQUJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkKIhYiHioeKiIuHioiKhoiGiEJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dXV2dXV1dnV1hYaFhYWGhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYAEFBQUFBQUFBQUFBQkJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUoeKh4uJi4mMiYuIi4mKh4qHUkJSQlJCUkJSQlJCUkJSQlJCUkJTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0RURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmdXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWABBQUFBQUFBQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkKFiIaJh4qIi4eKiIqHiYaJhYdCQkJCQkJCQkJCQkJCQkNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRVVUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZWVlZWVlZWVlZmVlZWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV1dXZ1dXV2dXV1doWFhYaFhYWGhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFgAQUFBQUFBQUJCQkJCQkJCQkJCQkJCQkJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSh4mHi4mLiYyJi4mMiYqIioeJhlJCUkJSQlJCU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZnV2dXZ1dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1hoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWFhYAEFBQUFBQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQoWIh4qHioiLiIuJi4iKiIqGiIaIQkJDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVmVlZWZlZWVmZWVlZmVlZWZlZWVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZldnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXaFhoWGhYaFhoWGhYWFhoWFhYaFhYWGhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWABRQUFCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQlJCUkJSQlJCUkJSQlJCUkJSQlKHiYeLiYuJjIqMio2KjImMiYqHiodTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTVFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnV2dXZ1dnV2dYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWGhYWFgAQUFCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQoeGiYaJiIuIi4mLiIqIi4eJh4mFh0NDQ0NDQ0NDQ0NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFVVRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZWVlZWVmZWVlZmVlZWZlZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2hYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWGhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYAEJCQkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQlJCUkJSQlJCUkJSQlJCUkKIhoqIioiMioyKjYqMiYyJi4iLiImGiUNTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmdnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dXZ1dnV2dXZ1dnWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWGhYWFhoWABCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCUkJCQlJCQoaJhomIi4iLiYyJi4mMiIuIioeJh4mFh0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0RURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVWVlZmVlZWZlZWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmdXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYWFhoWFhYaFhYWGhYWFhYWFhYWFhYWFhYWFhYWFgAUkJCQlJCQkJSQkJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkNTQ1OGioiKiIyKjIqNi42KjYuMioyJi4iLiImGU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dXZ2dnV2dnZ1dnZ2dXZ2doWGhoaFhoaGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYAEJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQ0NDQ0NDU0NDQ4iFiIeKh4qJi4mLiYyJi4mLiIqIioaJhoiFQ0NTQ0NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlZWVlZmVlZWZlZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1hoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWGhYWFhYWFhYWFhYWFhYWFhYWFhYWABCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJDU0NTQ1NDU0NTQ1NDU0NTh4mHi4mLiYyKjIqNi42KjYuMiYyJi4iLiImGiUNTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVERUVFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmdnV2dnZ1dnZ2dXZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXaGhoWGhoaFhoaGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWFhYaFgAQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlNDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0OIhomGioiLiIuKjImMio2JjIqMiIuIi4eJh4mFiENTQ1NDU0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYWFhoWFhYaFhYWGhYWFhYWFhYWFhYAFJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU4aKiIqIjIqMio2LjYuOjI2LjouNio2Ki4iLiIqHiodTQ1NTU0NTU1NDU1NURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2hoaGhoaGhoaFhoaGhYaGhoWGhoaFhoaGhYaGhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWABCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJSQkJCUkJDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDU0NDQ1NDQ0NTQ0NDiIWIh4qHioiLiIuKjImMio2JjIqMiYuJi4eJh4mGiIaIQ1NDU0RURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWZlZWVmZWVlZmVlZWZlZWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmdXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWFhYWFhYWFhYWFhYWFgAQkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDiYaKiIqIjIqMio2LjYuOjI6LjouNio2KjImMiYqHioeJholUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2doaGhoaGhoWGhoaFhoaGhYaGhoWGhoaFhoaGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYAEJCQkJCQkJCQkJCQkJCQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkNDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1OFiIaJh4qHiomMiYyKjYqNi42KjYuNioyKjIiLiIuHiYeJhoiGVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVZWZlZWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmV2dXZ1dnV2dXZ1dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnV2dXZ1hoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYWFhoWFhYaFhYWFhYWQBSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1OHiYeKiIuJjIqMio6LjouPjI6Mj4yOi46LjYqNioyJjImKiIqIiYaJVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2hoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhYaGhoWGhoaFhoaGhYaGhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaVkAQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJDU0NDQ1NDQ0NTQ0NDU0NDQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDiIWIh4qHioiLiIuKjImMio2KjYuNioyKjYmLiYuIioiKh4mHiYWIhYhEVERURFREVERURFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVmVlZWZlZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZldnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dXZ1dnV2dXZ1dnV2dXZ1dnV2dXaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWGhYWFhoWFhYaFhYWFhZWVlZAFJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlNDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NTU0NTU1NDU1NTQ1NTiIaKiIqIi4mLiY2LjYuOjI6Lj4yOi46MjouOi42KjYqMiYyJioeKiImGiYZUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2doaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaFhoaGhYaGhoWGhoaFhoaGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGlZaVlpWQBCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQlJCUkJSQlJCUkJSQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVIWIhomGiYiLiIuJjImMio2KjYuOio2LjoqNi42KjIqMiYuJi4eKh4qGiIaIhVRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2hYaGhoWGhoaFhoaGhYaGhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhYWWlZWVlpWVkAUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTU1NTU1RUVFRUVFRUVFRUVFSJh4mHi4mLiYyKjIqNi42LjoyOjI+MjoyPjI6LjoyNi46LjImMiouIi4iKh4qHiVRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhYaGhoWGhoaFhoaGhYaGhoWGhYaFhoWGhYaFhpWWlZaVlpWWlZAEJCQkJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCQkNTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDVERURFREVERURFREVERURFREVERUhYiFiIaJhomIi4iLiYyJjIqNio2LjYqNi42KjYuNioyKjImLiYuHioiKhomGiYWHhVRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWZWVlZmVlZWZlZWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmV2dXZ1dnV2dXZ1dnV2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1doaGhYaGhoWGhoaFhoaGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFlZWWlZWVlpWVlZWQBSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFSGiYeJh4uIi4iMioyKjYuNi46MjouPjI6Mj4yOi46MjYuOi4yKjIqLiIuIioeKh4mGVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2hoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaFhoaGhYaGhoWGhoaFhoaGhYaFhoWGhYaFhoWGhYaVlpWWlZaVlpWWlZaVkAQlJCQkJSQkJCUkJCQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVIWIhYiHiYeJiIuIi4mMiYyKjYqNi46KjYuOi42LjYqNio2JjImMiIqIioeJh4mGiIZVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZldnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnaGhoaGhoaGhoWGhoaFhoaGhYaGhoWGhoaFhoaGhYaGhoWGhoaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhZaVlpWWlZaVlpWVlZaVlZAFJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVImHiYeLiIuIjIqMiY2LjYuOjI6Lj4yOjI+MjoyPjI6LjouNio2KjImMiYqHioeJhmVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhYaGhoWGhoaFhoaGhZaVlpWWlZaVlpWWlZaVlpWQBCQkJSQkJCUkJCQlJCQkJSQkJCUkJCQlJCUkJSQlJCUkJSQlNDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTRFREVERURFREVERURFREVERURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRURFRUVIWIhomGiYeKh4qIi4iLiYyJjIqNio2LjYqNi42KjIqNiYuJi4iKiIqGiYaJhYdVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVZWVmZWVlZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZ1dnV2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnV2doaFhoaGhYaGhoWGhoaFhoaGhYaGhoWGhoaFhoaGhYaGhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaFhoWGlZaVlpWWlZaVlpWVlZaVlZWWkAUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUhomGioiKh4uJi4mMioyKjYuNi46MjouPjI6Lj4yOi46LjYqNiouIi4iKh4qHiFVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2hoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaFhoaGhYaGhoWGhoaFhoaWlZaVlpWWlZaVlpWWlZaVlpWWlZAEJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0RURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVh4aJhomHioeKiIuIi4qMiYyLjYqNi46LjYuOio2KjYmLiYuIioiKhoiGiFVVVVVVVVVVVVVVZVVVVWVVVVVlVVVWZlZWVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmdnZ1dnZ2dXZ2dnV2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhYaGhoWGhoaFhoaGhYaGhoWGhoaFhoWGhYaFhoWGhYaFhoWGhYaFhpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaQBSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCUlNTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVhoqIioiLiYuJjIqMio6LjouPjI6Mj42OjI+MjouOi4yJjImLiIuIiYZlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2doaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGlpaWlZaWlpWWlpaVlpWWlZaVlpWWlZaVkAQkJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJCU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NEVERURFREVERURFREVERURFREVERURFREVERUVFREVFRURFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWFiIWIh4mHioiLiIuJjImMio2KjYuOio2LjYqMioyIioiKhomGiIVVVWVVVVVlVlZWZlZWVmZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZnV2dnZ1dnZ2dXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2hoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaFhoaGhYaGhoWGhoaFhoaGhYaGhoWGhYaFhoWGhYaFhoWGhYaFhoWGhYaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZWVlpAFJCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJDU0NTQ1NDU0NTQ1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVYaJh4qHi4mLiYyKjIqOjI6Lj4yOjI+MjouOi42KjImLiIuIiYZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhpaVlpaWlZaWlpWWlpaVlpWWlZaVlpWWlZaVlpWQBCUkJSQlJCUkJSQlJCUkJSQlJCUkJSQlJDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1RUVERUVFREVFRURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWHhomGiYeKh4qJjImMio2KjYuOi42LjoqNioyJi4mLh4mHiYVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZ2dnV2dnZ1dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2doaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoWGhoaFhoaGhYaGhoWGhoaFhoWGlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWkAUkJSQlJCUkJSQlJCUlJSQlJSUkJSUlNDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlh4mHioiLiIyKjIqOjI6Mj42PjI+NjoyPjI2KjYqLiIuIiYZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2hoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaWlpaWlpaWlpaWlpaWlpaVlpaWlZaWlpWWlpaVlpWWlZAEJSQlJCUkJSQlJCUkJSQlJCUkJSQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NURFREVERURFREVERURFRUVERUVFREVFRURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVYiFiIaJh4qIi4iLio2KjYuOi42LjoqMioyIi4iKhoiGiFZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZXZ2dnV2dnZ1dnZ2dXZ2dnV2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2hoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhYaGhoWGhoaFhoaGhYaGhoWGhYaFhoWWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaQBSQlJCUkJSQlJCUkJSQlJCUkJTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWWGioiKiIyJjIqNi46Lj42PjI+NjouOi42KjImKh4qHiFZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhpaWlpaWlpaWlpaWlpWWlpaVlpaWlZaWlpWWlZaVlpWWlZaVkAQlJCUkJSQlJCUkJSQlJCUkNTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU1NTQ1NTU0NTU1NDVFRURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWaFiIeKh4qJjImMi46LjoyOi46MjoqNioyIioiKhoiGZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZ2dXZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnh4WIhYeFiIWHhoiFh4aIhYiGiIWIhoiFiIaIhYiGiIWIhoiFiIaIhYeGiIWHhoiFh4WIhYeFiIVoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoaGhoWGhoaFlpaWlZaWlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpAFJSUkJSUlJCUlJSQlJSU0NTU1NDU1NTQ1NTU0NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmaGioiKiIyKjYuOjI6MkI2PjZCNj4yOi4yJjImKh4pmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2eJh4mGiYeJhomHiYaKh4mGioeJhoqHiYaKh4mHioeJh4qHiYeKh4mHioeJh4qHiYeKh4mHioeJhoqHiYaKh4mGioeJhoqHiYaJh4mGiYeJhomHiWhoaGhoaGhoaGhoaGhoaGhoaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpWWlpaVlpaWlZaWlpWQBCUkJSQlJCUkJSQlJDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1REVFRURFRUVERUVFREVFRURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVWVmZWVlZmVlZWZlZmVoiFiIeKh4qJjImMi46LjoyPi46LjYqMiYuHiYeJhWZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZldnZ2dXZ2dnV2dnZ1dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ4SHhYiFh4WIhYeFiIWHhYiFh4aIhYiGiIWIhoiFiIaIhYiGiIWIhoiFiIaIhYiGiIWIhoiFiIaIhYiGiIWIhoiFiIaIhYiGiIWIhoiFiIaIhYiGiIWHhoiFh4WIhYeFiIWHhYiFh4WIhGhpaVlpaWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWlZaVlpWWkAUkJSUlJCUlJSQlNTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVomHioiLiY2LjYuPjY+NkI2PjI+MjoqNiouIioeJhmZmZmZmZmZmZmZmZmZmZmZmZmZmZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ4aJhoiGiYeJhomHiYaJh4mGiYeJhoqHiYaKh4mHioeJh4qHiYeKh4mHioeJh4qHiYeKiImHioiJh4qIiYeKiIqHioiJh4qIiYeKiImHioeJh4qHiYeKh4mHioeJh4qHiYeKh4mGioeJhomHiYaJh4mGiYeJhomHiIaJhmlpaWlpaWlpaWlpaWlpaWlpWWlpaVlpaWlZaVlpWWlZAEJSQlJCUkJSQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmhomGiYiLiYyLjouOjI+Mj42Pi42LjYmLiIqGiIaIVmZmZlZmZmZWZmZmVmZnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2eHhYiFh4aIhYiGiIWIhoiFiIaJhYiGiYaIhomGiIaJhoiHiYaJh4mGiYeJhomHiYaJh4mGiYeJhomHioaJh4qGiYeKhomHioaJh4qGiYeKhomHioaJh4qGiYeJhomHiYaJh4mGiYeJhomHiYaIhomGiIaJhoiGiYWIhomFiIaIhYiGiIWIhoiFh4WIhWlZaVlpWWlZaVlpWWlZaVlpWWlZaQBSUlJCUlJSQ1NTU0NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlaKiIqIjIqNi4+Nj42RjpCOkY6PjI+MjYqMiYqHiodmZmZmZmZmZmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ4mGiYeJhoqHiYaKh4mHioeJh4qHiYeKiIqHioiKh4qIioeLiIqHi4iKiIuIioiLiIqIi4iKiIuJioiLiYuIi4mLiIuJi4iLiYuIi4mLiIuJi4iLiYuIi4mLiIuJi4iLiYuIi4mKiIuJioiLiIqIi4iKiIuIioeLiIqHioiKh4qIioeKiImHioeJh4qHiYeKh4mGioeJhomHiYaJh2lZaWlpWWlpaVkAQlJCUkJTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU1NTQ1NTU0RUVFREVFRURFRUVERUVFREVFRURFRUVERUVFREVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVWZlZWVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWiIWIh4qHi4mNio2Mj4yPjZCMjoyOioyJi4eJh4mFh2ZmVmdnZ1dnZ2dXZ2dnZ2dnZ2dnZ2dnh4WIhYeFiIWHhoiFiIaIhYiGiIWIhomFiIaJhoiGiYaIh4mGiYeJhomHiYaJh4qGiYeKhomHioeJh4qHiYeKh4mHioeJiIqHiYiKh4qIioeKiIqHioiKh4qIioeKiIqHioiKh4qIioeJiIqHiYeKh4mHioeJh4qGiYeKhomHiYaJh4mGiYeJhoiGiYaIhomGiIaJhYiGiIWIhoiFiIaIhYeFiIWHhYiFh4WIAFJCUlNTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmaHiYeLiYuKjoyOjJCOkI6Rj5CNkI2Oi42Ki4iKh4mGiWdnZ2dnZ2dnZ2dnZ2eIhomHiIaJh4mGiYeJhoqHiYeKh4mHioeJh4qIioeKiIqHi4iKh4uIioiLiIqIi4iKiIuJi4iLiYuIi4mLiIyJi4iMiYuJjImLiYyJi4mMiYuJjImLiYyJi4mMiYuJjIqLiYyJi4mMiYuJjImLiYyJi4mMiYuJjImLiIyJi4iLiYuIi4mLiIuJioiLiIqIi4iKh4uIioeKiIqHioiKh4qHiYeKh4mHioeJhoqHiYaJhwBCU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmhYiGioeKiYyKjYyPjZCOkY2QjpCMjouNiYuIioaIhomFiIaIhYeFiIWIhoiFiIaIhYiGiYaIhomGiIaJhomHiYaJh4mGiYeKh4mHioeJh4qHiYiKh4qIioeKiIuHioiLiIqIi4iKiIuIiomLiIuJi4iLiYuIi4mLiIuJjIiLiYyIi4mMiIuJjImLiYyJi4mMiYuJjIiLiYyIi4mMiIuJi4iLiYuIi4mLiIqJi4iKiIuIioiLh4qIioeKiIqHioiKh4mHioeJh4qGiYeJhomHiYaJh4mGiIaJhogAU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZmZmZmZmZmaJh4uJi4mNjI6NkY+Rj5KQko+SjpCMj4uNiYyJioeKh4mHioeJh4qHiYeKh4mHioiKh4qIioeLiIqIi4iKiIuJioiLiYuIi4mLiIyJi4mMiYuJjImLiYyKjImMioyJjYqMiY2KjIqNioyKjYqMio2LjYqNi42KjYuNio2LjYqOi42KjouNio6LjYqOi42KjouNio6LjYqOi42KjYuNio2LjYqNi4yKjYqMio2KjIqNioyJjIqMiYyKjImMiYuJjImLiIyJi4iLiYuIi4mKiIuIioiLiIqHAENTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTRFRUVERUVFREVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVZmVlZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWh4aJhoqIjImNjI+NkI6RjpGOkY2PjI6KjImLh4mHiYaIhomFiIaJhYiGiYaIhomGiIeJhomHiYaJh4qHiYeKh4mIioeKiIqHioiLh4qIi4iKiIuIiomLiIuJi4iLiYyIi4mMiYuJjImLioyJjIqMiYyKjImMio2JjIqNiYyKjYqMio2KjIqNioyKjYqMio2KjIqNiYyKjYmMio2JjIqMiYyKjImLioyJi4mMiYuJjIiLiYuIi4mLiIqIi4iKiIuHioiKh4qIioeJh4qHiYeKhomHiQBTQ1NTU0NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmhomHioiLiY2LjoyQj5GPk5CSkJKPkY2QjI2KjYqLiIuIioeKiIqHioiKh4uIioiLiIqIi4mKiIuJi4iLiYuIjImLiYyJi4mMioyJjIqMiY2KjIqNioyKjYuNio2LjYqOi42LjouNi46LjYuOjI6LjoyOi46MjouPjI6Lj4yOjI+MjoyPjI6Mj4yOjI+MjoyPjI6Mj4yOi4+MjouOjI6LjoyOi46MjYuOi42LjouNio2LjYqNi4yKjYqMio2KjImMioyJjIqLiYyJi4mMiYuIi4kAQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZoWIhomHiomMio2MkI2Qj5KPkpCSjpCOj4uNioyIi4iKh4mHioeJh4qHiYeKh4qIioeKiIuHioiLiIqIi4iLiYuIi4mMiIuJjImLioyJjIqMiYyKjYqMio2KjIuNio2LjYqNi46LjYuOi42LjouOjI6LjoyOi46Mj4uOjI+LjoyPjI6Mj4yOjI+MjoyPjI6Mj4uOjI+LjoyOi46MjouOjI6LjYuOi42LjoqNi42KjYuNioyKjYqMio2JjIqMiYuKjImLiYyIi4mLiIuJi4iKAFNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUZFRUVGRVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmhomHiYeLiYuJjYyPjZGPkpCUkpSRlJGSj5GOj4yOi4yJjImLiIyJi4iMiYuJjImLiYyKjImMioyJjYqMio2LjYqNi42KjouNi46MjouOjI6Lj4yOjI+Nj4yPjY+MkI2PjZCNj42QjY+NkI6QjZCOkI2QjpCNkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCNkY6QjZCOkI2Qjo+NkI2PjJCNj4yPjY+Mj4yOjI+MjouOjI6LjouNi46LjYqNi42KjYuMigBDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDVFRURFRUVERUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWZWVlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZ2eFh4WIhYiHioeKiYyKjYyQjZGQk5CTkZOPkY+QjI6LjYmLiYuIioiLh4qIi4eKiIuIiomLiIuJjImLiYyJjIqNiYyKjYqNi46LjYuOi46Mj4uOjI+Mjo2PjI+Nj4yPjZCMj42QjY+NkI2PjZCNj42QjY+NkI2PjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjY+NkI2PjZCNj42QjI+Nj4yPjY+MjoyPi46MjouOjI6LjYuOio2LjYqNi42KjIqNiYyKjImMiowAU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZnZ4mGiIaJh4mGioiKiIuJjIqOjI+NkZCSkZSSlJKVkpOQko+QjY+MjYqNioyJjIqMiY2KjIqNi42KjouNi46MjoyPjY+NkI6QjZGPkY6Sj5KPkpCSkJORk5CTkZOQlJGTkJSRk5CTkZOQk5GSkJOQkpCTkJKPk5CSj5OQko+TkJKPk5CSj5OQko+TkJKPk5CSj5OQko+SkJKPkpCSj5KQkY+Sj5GPko+RjpGPkY6RjpCOkY6QjZCOkI2QjY+NkI2PjI+Nj4yPjI6Lj4yOi46MAENTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmeHhYiFiIaIhYiGiYaIh4mGiYiLiIuKjYuOjZGOkpGUkZSSlZGTkJKOkI2Pi42LjYmMio2JjIqNio2LjouOjI+Mj46RjpGPko+SkZSRlJKVkpWTlpOWlJeUlpWXlJeVl5SXlZeUl5SXlJaUlpOVk5aSlZKVkZSSlJGTkZSQk5GTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTj5KQk4+SkJKPkpCSj5GPko+Rj5KOkY+RjpCOkY6QjpGNkI6QjY+NkIyPjY+Mj42PjI6Mj4uOjI6LjQBTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUZFRUVGRUVFRkVFRUZFRVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmiYeJhoqHiYeKh4mHioiKh4qIioiLiYuJjIqNi4+NkI6SkZSSlpSWlJeUlZKUkZKPkY6QjZCNj42QjpCOkpCSkJSSlJKWlJaUmJaYlpqYmpibmZuZnZqdmp6bnZuenJ6bn5yem5+cnpuenJ2bnpucmp2am5ibmJqXmpeYlZiVl5SXlJaTlpSVk5aTlZKVk5WSlZOVkpWTlZKVk5SSlZKUkpWSlJGVkpSRlJKUkZSRk5GUkZOQk5GTkJOQko+TkJKPkpCRj5KPkY6Rj5COkY6QjZGOkI0AQ1NDU0NTQ1NDU0NTQ1NDU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZlZWVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVoeFiIWHhYiFiIaIhYiGiYaIhomGiYeJhomHioeKiIuIjIqOi4+OkY+TkpWTlZSWk5WTlZGTkZOPkpCTkJORlJKVlJeUl5aZl5qYnJmcmp2bnZyfnJ+doJ2gnqGeoJ+hnqGfop+hn6KfoqCin6Gfop+hn6GeoJ6gnZ+cnpudmp2Zm5ial5mWmJWXlZeTlpSWk5WTlZKVk5WSlJKVkpSSlZGUkpWRlJKUkZSSlJGTkZSQk5GTkJORk5CSkJOPkpCSj5GPko6Rj5GOkI6RjpCOkI2QjpCNj42QAFNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmaJhoiGiYeJhoqHiYeKh4mHioiKh4uIioiLiIqIi4mLiIyJjImNi42MkI6RkJSTlpSZl5qYm5mbmJuYmpeamJqYm5mbmZ2bnpufnZ+doZ6hnqKfoZ+ioKKgo6CioKOho6CkoaOhpKKkoqWjpaKmo6WjpqSmo6ekpqOmpKajpqOloqSho6Cin6CdoJ2em52am5ibmJmWmZaYlZiVl5WYlZeUl5WXlJeVlpSXlJaUl5SWk5aUlpOWk5WTlpOVkpWTlJKVkpSRlJKTkZSRk5CTkZOQk5CSj5KQko+SjwBTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmh4aIhYiGiIWIhomGiIaJhomHiYaJh4qHiYeKh4qIioeKiIuIi4mMiYyKjYuOjZGPk5OXlZqZnZufnqGfoZ+inqGfoZ6gnqCdoJ6gnaCeoZ2gnqCdoJ6gnZ+doJ2fnaCdn56gnaCeoZ6gn6GfoaCjoKKhpKGkoqWipaSmo6alp6Snpaikp6WnpKakpqKkoaOfoZ6gnJ6bnZmbmJqXmZeZlZiWmJWXlZiUl5WXlJeVl5SWlJeUlpSXk5aUlpOVk5aSlZOVkpSSlZKUkpSRk5GUkZORk5CSkJOPkpCSj5EAU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZomHiYaKh4mHioeJh4qIioeLiIqIi4iKiIuJi4iMiYuJjIqMiY2KjIqNi46Lj42QjpORlJOYl5uaoJ+joqelqKaqp6mlqKWmoqShop+hnqCdoJ2enJ6cnZuem52anZucmp2anJqdm52anpudm56cnpygnaCdoZ+hn6Ogo6GkoqWjp6SnpammqaeqqKqnq6iqp6qnqaaopaajpaGin6Gen5yem5yZnJmbmJuYmpeamJqXmpiZl5qXmZeal5mWmZeZlpmWmJWZlpiVmJWXlZiVl5SXlJaTlpSWk5aTlZKVk5SSAENTQ1NDU0NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlaHhYiFh4WIhYiGiIWIhomGiIaJhomHiYaJh4qHiYiKh4qIi4iKiYyJjIqNio6MkI2RkJSSlZWZl5uan52hoKSjpqWppqimqKSmo6SfoZ2fmpyZm5eZl5mVmJaYlZeVmJSXlZiVl5WYlZiWmZWYlpmWmZeal5qZm5mbmp2anZyfnJ+eoZ6hoKOgpKKmo6alqKapp6qnqqirp6qoqqaopaejpKGjn6Cen5udm52Zm5mbmJuZm5iamJuYmpibmJqYm5eamJuXmpial5mXmpeZl5mWmJaZlZiWmJWXlZeUlpSWk5WTlgBTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUZFRUVGRUVFRkVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmiYaIhomHiYaKh4mHioeJh4qIioeLiIqIi4iLiIuJi4iMiYuJjYqNio6Mjo2Rj5KQlJOWlZmXmpmdm56coJ6hn6Kgo6Glo6WjpqOloqShop6gnJyZm5eYlZiVlpSXlJaTl5SWlJeUlpSXlZeVmJaYlZmWmZaal5mXm5ibmJyZnJmdm52bn5yfnaCeoZ+joaOhpaSmpKinqaerqayqrautqq6rrKmsqKqmqKWmoqWho5+in6GeoZ6gnqGeoJ6hn6GeoZ+hnqGfoZ6hn6GeoZ6gnqGeoJ2gnZ+cn5yem56bnZqdmpyZnJkAU1NDU1NTQ1NTU0NTU1NDU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVoeFiIWIhoiFiIaJhoiGiYaJh4mGiYeKh4mIioeKiIuIiomLiIuKjYqNjI+MkI+TkZSUl5WZmJyZnJuem56cnpudm52anJqdmpybnpuenZ+cn52fm5yam5eYlpeTlZOVkpSSlZKUk5WSlZOWk5aUl5SXlZiVl5aYlZiXmZaZl5qXmpibmJuZnJmcm52bnZyfnJ+eoZ6hoKOhpKOnpKinqqirqq6rrq2wrbCusKyvrK6qrKmrp6mnqaWopqilqKappqinqaapp6qnqaeqp6mnqqapp6mmqKaopaelp6SmpKaipKKkoaOho5+hAFNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmh4mGioeJh4qHiYeKiIqHi4iKiIuIioiLiYuIjImLiYyKjIqNi46Lj46Qj5OSlZOYlpqYnJudm5+dn5yfnJ2anZqbmJqXmJWYlpeVmJaZl5uZnJqenJ6bnpudmZyYmZaZlpeUl5SWlJeVl5SYlZeVmZaYlpmXmZeamJqYm5mbmZyanJmdm52anpuem5+cnpygnZ+doZ+hn6Kgo6Glo6akqaeqqa6ssK+zsrW0uLe5t7u5u7i7uLq3uba4tbe0trO2tLazt7S2tLe0trS3tLa0t7S2s7aztbK1srSxtLGyr7Kvsa6wra+srqutqgBDU1NTQ1NTU0NTU1NDU1NTQ1NTU0NTU1NDU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZoWIhYeFiIWIhoiFiIaJhoiGiYaJh4qGiYeKh4mIioeKiIuIi4qNio6NkI6SkZWTl5aamJuanZqdm52Zm5mbl5mWmJSVk5WRk5GTkJKQk5CTkpWSlpWZlpqZnJqdm52anJmbl5mWmJWXlJeUlpSXlJeVmJWYlpmWmZeal5mYm5iamZuYm5qcmZyanZqdm56bnpyfnJ+doJ2gnqGfoqGkoqWkqKaqqa2ssLC0s7i4vLvAv8TCxsXJxsnHycbIxcfDxcLEwMK/wr7AvsC9v73AvL68v7u+u766vLq8ubu5u7e5t7m2uLW4tLa0trK0srQAU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmaGiIaJh4mGioeJh4qHiYeKiIqHi4iKiIuJi4iLiYuJjIqMio2LjoyQj5KQlZSXlpqZnJqenJ6bnpudmZyYmpaYlZaTlZKUkZSRkpCTkJKQk5CTkJSSlJKWlZiWm5mcm5+dn52gnZ6bnpqcmJuYmpeal5mXmpiamJuZm5icmpyZnZudmp6cnpufnJ+coJ2fnaGeoJ6in6Kgo6Gkoqakp6WqqKyqr66xsLW0uLi9vMC/xMTIx8zMz87T0tXT19XX1NbT1NDSzs7KzMjJxsjExcLFwsPAw8DBvsG+wL3Avb67vru9ur26u7m7ubq3ure5trm2AFNTQ1NTU0NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmhYiFiIaIhYiGiYaIhomGiYeJhomHioeJiIqHioiLiIuJjImMi46Mj46SkJSUl5aZmJyZnJudmpyZm5eZlpeTlZKUkJKQko+Rj5GOkY+RjpGPko+RkJKQkpGUkZSTl5WYmJuZnZyfnaCeoZ2fnZ6bnJqcmJuYm5iamJuYm5mcmZyanZqdm56bnpyfnJ+doJ2gnqGfoqCjoaSjpqSop6upra2xsLS0uLe7u7++wsLGxMjHy8nNzNDN0dDU0dXU19TX1djU1tTV0dLOz8rKx8fCw8DBvb+8vrq8ubu4uri6tri2uLW3tbe0trS2s7WztbK0srSxswBTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZoeJhomHiYeKh4mHioiKh4qIioiLiIqIi4mLiIyJi4mMio2KjoyPjZKQk5KXlpmYnJqdm56cnZqdmZqXmZaXk5WSlJCTkJKPkpCRj5KQko+TkJKQk5GTkZSSlJGVk5WTl5WXlZqYm5qenaCeoqCjoKShop+inqCcn5yem56cnpufnJ6cn52fnaCeoJ6in6Kfo6GjoaWjpqSpp6uqrq2xsba1ubm+vsLBxsXJyMzLzczQztDN0c7QzdDOz8zPzc7Mz83PzM/Nz8zPzM7KzMjJxcbBwb2+urq2uLW2srWys7CzsLKvsq+wrrGur62wra+sr6yuq6+srqsAQ1NTU0NTU1NDU1NTQ1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmiIWHhYiFiIaIhYiGiYaIhomGiYeJhomHioeJiIqHiomMiYyLjoyQj5ORlZWZl5qZnJmcmZuYmZaYlJWSlJCSkJKOkI6QjZCOkI2QjpGOkI6RjpGPko+SkJOQk5GUkZSSlZKVk5eUl5aamJubnpygn6Ogo6GkoKKgop6gnqCcnpyfnJ6cn5yfnaCdoJ+in6KhpKGlpKimqqqurbGytra7u8C/xMTJx8vLz8zQztHO0M7QzM7LzcnKx8nExsPEwMK/wb2/vcC8v73AvcC+wb7AvsC7vbm6tbays6+wrK6qrKmrp6qnqqaopqmlp6WopKelp6SmpKajpqSmAFNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZoiGiYeJhomHiYaKh4mHioiKh4uIioiLiIuIi4mLiYyKjIqOjI+OkpGUk5iXmpicmp2anZqbmJqXl5SWk5SQk5CRj5KPkY6Rj5GOko+Rj5KQko+TkZOQlJGTkZWSlJKVk5WTl5SWlJiWmJaamJqZnZufnaKgo6KmpKakp6Smo6WipKCjoKKfoqCioKOho6Glo6alqairq7Cvs7O5ub6+xMTIyM3M0M7T0dPR1NHSz9HOzsvMyMnFxsLDv8G9vbq8uLm1uLW2s7aztbK1s7Wzt7W4trq4ure6t7i0trKyrrCsrKirp6ilqKWnpKekpqOmo6WipaKkoaSio6GkoQBTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmaIhYeGiIWIhomFiIaJhomHiYaJh4qHiYeKh4qIi4iLiYyJjYyPjZGQlJOXlpqYm5qcmZuYmpaYlZaSk5GSj5GOkY2QjpCNj46QjZCOkY6Rj5KPkZCSj5KQk5CTkZSRlJKVkpWTlpOWlJeUl5aZlpmXm5ibmp6coJ+joaWkp6Wopqilp6Wno6WjpaGkoqWipaSopqqqrq2ys7i4vb/ExMnJzs3R0NTR1NLU0NLP0MvMycnExcLCvr+7vLi5treztLKzr7Gvsa2vra+rrqyuq66sr6ywrrKws7K1s7a0t7O1srOur6ytqKqnqKSmpKaipKKkoaOhpKCjoKOfoqCin6EAU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUZFRkVGRUZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZoaJh4mGioeJh4qIioeKiIqHi4iKiIuJi4iMiYuJjYqNi4+NkI+TkpWUmZibmZ2bnZqcmZqWmJWWkpSRko+Sj5GOkY+RjpGPkY6Sj5GPkpCSkJORk5GUkpSRlZOVkpaUlpOXlZeVmJaYlpmXmZeamJuYnJqcmp6cn52hoKOipqWop6upq6msqauoq6iqqKuprKuwr7Ozubm+v8XGy8vQ0NPS1tTW09bS08/RzMzIycTEwMG9vbm7t7i0trO0sLOwsa6xrq+sr6yuq66rraquq62qrqutq6+tr66ysLOytrS3tLe1trK0sLGsrqqrp6mmp6SnpKajpqOloqWipKGkoaOgAENTU1NDU1NTQ1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmaEh4WIhYeGiIWIhomFiIaJhomHiYaJh4qHiYiKh4qJjImNjI+NkZGVk5eWmpibmZuYmpeYlJWSlJCRj5GNj42PjI+Nj4yPjZCNkI6QjZCOkY6Rj5KPkpCTkJORlJGUkpWSlZOWk5aUl5SXlZiVmJeal5qYm5ibmZyanZufnKCfoqCko6elqaisqa2rr6yvrrKwtLS4uL2+xMPJys/O0tLW09XT1dHSzs/JysbGwcG9vrm6triztbKzr7Gvsa2vra+rrqyuq62rraqsqq2prKqsqayqrKmrqayprKqtq66tsK6ysbSytbS2s7Wys66vrK2oqaaopKakpqKkoqSho6GkoKKgowBTU1NTU1NTU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmhomHiYaJh4mGioeJh4qIioeKiIqIi4iKiIuJi4mMioyLj42Qj5OSlpWZmJuZnZqcmZuXmJSXk5SQk4+RjpGOkI2QjpCNkY6QjpGPkY+SkJKPk5CTkJSRk5GVkpSSlZOVk5eUlpSYlZiVmZeZl5qYmpicmZyZnZudm56cn5ygnqCeoqGjoqalqKesq6+utLO3t729wcLIyMzM0tLV1NjW2NXX09TP0MvLxsfCwr2+urq2uLS1sbSxsq+yr7Cusa6wrbCtr6ywra+sr62vrK+srqyvrK6rrqyuq66rrauurK6rr62wrrKws7K2tLe1uLW2s7Wwsa2uqqunqqaopaekpqOmo6WipaMAU1NTU1NTU1NTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZmZmVmZmZlaHhoiFiIaIhYiGiYaIh4mGiYeKh4mHioeKiIuIi4mMio2MkI6SkZWUmJebmJuZm5eZlpeTlJGTj5GOkI2PjY+Mj42QjI+NkI2QjpGOkI+RjpGPko+SkJOQk5GUkZSSlZKVk5aTlpSXlJeWmZaZl5qXmpibmJuanZqdm56bnp2gnaCfop+ioaSipqaqqq+wtra9v8bHzc/V1NnZ3Nnc2drV1tHRy8vHxsHBvL24ubW2srSxs6+xr7GtsK6wra+tsK2vrbCsr62wrK+tsKyvra+sr62vrK6sr6uurK6rrauuq62rrqutrK6sr66xr7OytbO2tbe0tbK0r7Ctrqmqp6mlp6WnpKakpqOlAFNTU1NTU1NTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVGRUZFRkVGRUZFRlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmiYeJhoqHiYeKh4mHioiKh4uIioiLiYuIjImLiYyKjYuPjZCPlJOWlZqYm5mdmpuYmpeXlJaSk5CSj5GOkY6QjZGOkI6Rj5GOko+Rj5KQkpCTkZOQlJGUkZWSlZKWk5aTl5SXlJiWmJaZl5mXmpiamJyanJqdm52bn52fnaCeoJ6ioKKgpKKlo6emqamur7S1vL7Fx8/R19jf3uHf4t7e2dnU0szMxsW/wLu7tri0tbK0sbKvsrCxr7Kvsa+yr7Gvsq+xr7Kvsa+yr7Gvsq+xr7Kvsa6yr7Gusa+wrrGusK2wrq+tsK2vrLCtr62wrrGvs7G0s7e1uLW5treztbGyrq+srKmrqKqnqqeppwBDU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVoeFiIWHhYiFiIaIhYiGiYaIh4mGiYeKh4mIioeKiYyJjYyPjZGRlZSXl5qXmpialpiVlpKTkJKOj42PjI6Mj4yOjI+Mj42QjY+OkI2QjpGOkY+Sj5GQk5CSkZORk5KUkpSTlpOVlJeUl5WYlZiWmZeZmJuYm5mcmpybnpuenaCdoJ6hn6KgpKGlpKmnrK2zs7q8w8XMztTV2tre297b3NfX0tHLysXEvr65urW2srSwsq+xrrCusa6wrrGusK6xrrGvsa6xr7Gusa+yrrGvsa6xr7Gusa+xrrCusa6wrrCtsK6wra+tr6yurK+rrqyuq66sr6yvrrKvs7K2tLe2uLW3tLWxsq+wrK6rraqsqq0AU1NTU1NTU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZmZmhoiGiYeJhoqHiYeKh4mHioiKh4uIioiLiYuJjIqMio6NkI+TkpaVmZibmZyZm5eZlpaSlJGSj5GOkI2QjY+NkI6QjZGOkI6Rj5GOko+Sj5OQkpCTkZORlJKUkpWTlZOWlJaUl5WXlZmWmZaamJqYm5mbmZ2bnZuenJ6coJ6gnqKfoqCkoqSjp6aqqa+wtba+v8bHz9DV1drY2tja1tbR0s3NyMnExMDBvb25u7e3tLaztLG0sbOws7CysLOxs7CzsbOwtLGzsLSxs7G0sbOxtLGzsbSxs7C0sbOws7GysLOwsq+ysLGvsq+xrrGvsK6xrrCtsK6wrrGvsrC1s7e1urm7ub26vLm7t7i0t7S1srWyAFNTU1NTU1NTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmZmZWZoWIhYiGiIWIhomGiIaJhomHiYaJh4qHiYiKiIqJjImNjI+OkpGVlJiXmpiamJqWl5SWkZKQkY2PjY+MjoyPjI6Nj4yPjZCNj46QjZCOkY6Rj5KPkpCTkJKRlJGTkpWSlJOWk5aUl5SXlZiVmJeZl5qYm5ibmZyanZuem56doJ2gnqKfoqGkoqalqqmusLa3vsDHyM/Q1tTY1tjU1NDQysnFxcDAvb66vLq8uLq4ure5tri0trS2srSytLCzsbOws7GzsLOxtLCzsbSxs7G0sbOxtLGzsbSws7G0sLOxs7CysLOwsrCyr7Kwsq+xr7Gusa+xrrCvsa6xr7KvsrG0srW1ube7u7++wcDDwMK/wb2+u725uwBTU1NTU1NTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVGRUZFRkVGRUZFRkVGRVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmaHiYaJh4mHioeJh4qIioeLiIqIi4iKiIuJi4mMioyKjo2Qj5OSlpWZmJuZnJmal5mVlpKUkZKOkY6QjZCOj42QjpCNkY6QjpGPkY+SkJKPk5CSkJORk5GUkpSSlZOVk5aUlpSXlZeVmZaZlpqYmpibmZuZnZudm56cn5ygnqCeoqCioKSipaOop6ursbK3ucHDycvS09fW2tfY09TOzcfHwcG7vbi5tbi1t7W4trm3u7m7uLy5u7i6t7m2uLW3tLe0tbO2s7WztrO1s7aztbO2s7WztrO1s7aztbO2s7WytbO1srWytLK1srSxtLK0sbSytLG1srSytbO2s7e1t7a5uLq5vbu/vsLBxcTJx8rIy8jJxcbCw74AU1NTU1NTU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVoiFh4WIhYiGiIWIhomGiIaJhomHiYaJh4qHioiLiYyLj42RkJWTl5aal5qXmZWXk5WQko+QjY+Mj4uOjI6LjoyPjI6Nj4yPjZCNkI6RjpCPkY6Rj5KPkpCTkJORlJGUkpWSlZOWk5aUl5SXlpmWmZeal5qZnJmcmp2bnpyfnJ+eoZ6hoKSipaWqqa+wt7i/wsrL0dLX1djV1tDQy8rDwr29t7i0tbGzsLOvsrG0sbSzt7S4t7q3urm7uLq4ura5tri0trS2s7WztbK1s7WytLO1srSztbK0srWytLK1srSytbG0srSxtLK0sbSytLG0srWytbO2tLe1uba5uLu5vLu+u7+9wb7BwMPBxMPHxMjHysfKx8nExcHBAFNTU1NTU1RUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmaIhomHiYaJh4mGioeJh4qIioeLiIqIi4mLiIyKjIqOjI+Ok5KVlJmXmpibmZqWmJWVkZOQkY6QjY+MkI2PjJCNj42QjpCOkY6RjpGPkY+SkJKPk5GTkJSRk5GVkpSSlpOVk5eUl5SYlpiWmZeZl5uYm5icmpyanpuenJ+doJ2hn6Gfo6Gko6emqqqxsri6wsTLzdTU2NbZ1tbQ0MrIwsK8vLe4tLSxs7Cyr7OwsrC0sbSytrS3tbm3uri8ur26vru9ur26u7i7t7m2uba3tbi1t7S3tba0t7S2tLe0trS3tLazt7S2s7e0trS3tLe0uLa4trq4urm9u768wL7Bv8PBxMLFw8XDxsTFw8bDxMLFwsTCxcPFw8bDxMHDvgBTU1NTVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZmiIWHhoiFiIaJhYiGiYaIh4mGiYeKh4mIioeKiIuJjIuPjZGQlJOXlpqXmpeZlZeUlZCSj5GNj4yPi46Mj4uOjI+Mj42QjI+NkI2QjpGOkI+RjpGPko+SkJOQk5GUkZSSlZKVk5aTlpSXlJeWmZaZl5qXmpmcmZyanZqdnJ+cn56hnqGgpKGlpaqpr7G3ucDEy8zT09jV19TUzs3Ixr+/urq0tbKzr7Gvsa6xr7KvsbCysLKxtLG0s7azt7a5t7q5vLm8u726vbq9ubu5u7e5t7m1t7W3tLa0t7S2tLeztrS2s7a0trO2tLe0t7W4tbm3u7i8u768v7/CwMPCxsPGxcjFx8bIxMfExsLEwcO/wL6/u726vLm7uby5vLq9ubsAU1NUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVGRUZFRkVGRUZFRkVGRUZFVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmZmZmZmZmZomGiYeJhoqHiYeKiIqHioiKh4uIioiLiYuIjIqMio6Mj46SkZWUmJeamJuZmpeZlZWSlJCRjpGOj42QjY+NkI2QjZCOkI6Rj5GOko+Rj5KQkpCTkZOQlJGTkZWSlJKVk5WTl5SWlJiVmJWZl5mXmpiamJyanJqdm56bn52fnaGfoZ+joaSip6aqqrCxuLrCxczO1dXY1tnV1M7Ox8W/v7q5tLays7CzsLKvs7CysLOxs7G0srSytbO1s7a0trS4trm3u7m8ur68vry/vb+8v7y9ur26u7i7uLm2ube4trm2uLW5tri2ube5t7q4u7m9u769wcDDwsbEx8bKyMrIzMnLyMvIysbJxcbDxcHCvsC8vbm7uLi1t7S1srWztbO2tLe1AFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmhIeFiIWHhoiFiIaJhYiGiYaIh4mGiYeKh4qIi4iLio6MkI+TkpaVmZaZl5mVlpOUkJGOkIyOjI6LjYuOi46MjouOjI+Mj42QjY+NkI2QjpGOkY+Sj5GQko+SkJOQk5GUkZSSlZKVlJaUlpWYlZiWmZaZmJuYm5mcmp2bnpuenaCdoJ+ioKSkqKitr7a4v8PKzNLT19XW09PMy8XDvLy3t7KzsLKusK6xrbCusa6xr7KvsrCzsLOxtLGzsrWytLO2s7a0t7W4t7q3u7m8ur27vru9u766vLq8uLq4ura4trm1uLa4tbi2ube6uby6vr3Bv8PCxsTIx8rIy8rMyczJy8jJxsjExcLDv8C9vrm7uLm1trO1sbKwsq6wra+srqyvrK+usgBUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVGRVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZoaJh4mGiYeJhoqHiYeKiIqHioiKh4uIioiLiYuJjYuOjZGQlJOYlpmXm5ialpiUlZGTkJGNkI2PjI+Nj4yPjY+NkI6QjZCOkI6Rj5GOko+Rj5KQkpCTkZOQlJKUkZWSlZKWk5aTl5WXlZiWmJaZl5qXm5mbmZyanZuenJ6coJ6gnqKgo6GlpKiorq+2uMDDys3U1NjW2NTTzczFw729t7eytLGyr7Kvsa+ysLKvs7CzsLSxtLG1srSytbO1s7a0trO3tLa0uLW4tbm3ube7uby6vry+vL+9v7y/vL67vru8uby6u7m8ury6vr3AvsPCxcTJx8vJzczOzM/NzsvOy8vIysbHw8TAwb2/u7y4ura3tLaztLCzsLGusa6vrK+srauuq62rrqwAVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmaFh4aIhYiGiYWIhomGiIeJhomHioaJh4qHioiLiIuKjoyPj5ORlpWZlpmXmZWXlJWQko+QjI6MjouOjI6LjoyPjI6Mj4yPjZCNj46QjZCOkY6Rj5KPkZCSj5KQk5CTkZSRlJKVkpWTlpOWlZeVmJaZlpmXmpibmZyZnJuem56doJ2gn6Kgo6OnpqyttLa+wcnL0dPX1dbS0svKxMK7ura2sbKvsa2wrrGtsK6xrrGvsq+ysLOws7G0sbSytbK0s7WytbO2s7W0trO2tLe0t7W4trm3uri7ur26vbu+u768v7y+vL+8v73AvcHAxMLGxcnHy8rOy8/N0M3PzM7Ky8jJxcbCw7/AvL65ure5tbaztbGzsLKvsa6wra+sr6utq62qrKqsqaupq6irAFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRUVGRUZFRkVGRUZFRkVGRUZFRkVGVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlZmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZmZmZmZmZmZmhomHiYaKh4mHioeJh4qIioeLiIqIi4mLiIyJjImNi46NkZCTkpeWmZebmJqXmZWWkpSQkY6QjY+Mj42PjJCNj42QjpCNkY6QjpGPkY6Sj5GPkpCSkJORk5CUkZSRlZKUkpaTlZOXlJeUmJaYlpmXmZebmJuZnJqcmp6cnpygnaCeoaCioKWjp6asrbO1vsHIy9LT19bY1NPMy8XCvLy2trKzsLGusa+xr7Kwsq+zsbOwtLG0sbWytLK1s7WztrS2s7e0trS3tbe0uLW3tbi2uLW5trm2uri6uLy5vLq+vL+9wb/BwMTCxcPIxsrIzczPzdLQ0tDT0NLP0c3OysvHyMPFwcG9v7u8uLq2t7S3s7WxtLGyr7Kvsa6xrq+tsK2uq66rraqtqqyprKmrqABUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVAP//AABVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmhIeFiIWHhoiFiIaIhYiGiYaIh4mGiYeKh4mIioiLio2Lj46SkJWUmJWZl5mVl5OVkJGOkIyOjI6LjYuOi42LjouOjI+Mjo2PjI+NkI2PjpCNkI6RjpGPko+RkJKPkpGTkJORlJGUk5WSlZSXlJeVmJWYlpmXmpibmJuanZqdm56cn52hnqKhpaSpqrGyur3GyM/R1tTW0tLLycPBurm0tbCxrrCsr62wra+usa6wr7KvsbCyr7Kxs7CzsbSxtLK1srSztbK1s7aztbO2s7a0trO2tLe0trW3tLe1uLW5t7q4vLu/vcHBxcTIyM3L0M/T0dTT1dLU0dLOz8vMx8fExL/AvL65ure5tLaztbGzsbOvsa+xrrCusKyvra+rrquuqqyqramrqauoqqiqp6mnqQBUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVGVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZoaJhoiGiYeJhoqHiYeKh4mHioiKh4uIioiLiYuJjYuNjJCPkpGWlZiXmpialpmVlZKUkJGNkI2PjI+MjoyPjY+MkI2PjZCOkI2RjpCOkY+RjpKPkY+SkJKQk5GTkZSSlJGVk5WSlpSWk5eVl5WYlpiWmpeal5uZm5mdm52bnpyfnaCeoZ+joaWkqqqwsbq9xMfP0dbV2NTTzMvEwru7tbWxsq+wrbGusK6xr7GvsrCysLOxs7G0srSxtbK0srWztbO2tLaztrS2tLe0t7S3tbe0uLW3tbi1t7W4tri2ube5t7u6vbzBwMTEycnOztPS1tXZ19jV2NTU0NHNzMfIxMS/wby9ubu3uLW3tLWytbKzsLOwsq+yr7Gusa6wrbCtr6yvrK2rrqusqqyqq6irqKqnqqcAVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmaFh4aIhYiGiIWIhomGiIaJhomHiYaJh4qHioiLiIuJjYuOjpKQlJSXlZiXmZWXlJWRko+RjI6MjouNi46LjYyOi46Mj4yOjY+Mj42QjY+OkI2QjpGOkY+Sj5GQko+SkJOQk5GUkZSSlZKVk5aTlpWYlZiWmZaZmJqYm5mcmZybnpuenaCdoaCkoqenra62ucLEzM/U09bT08zKxMK7ubS0r7GusKyvra+sr66wrbCvsa6xsLKvsrCzsLOxtLG0srSxtLK1srWztbK1s7aztbS2s7a0t7O2tLe0trW3tLe1uLa5uLy6vr7DwsfIzczQ0NTS1tTX09XS087Oy8vGxsLDvr+7vbi5tri0trO1sbOxs6+yr7KusK6xra+tr6yurK6rrautqqyqrKmrqauoqqiqp6mnqaWoAFRUVFRUVFRUVFRUVFRUVFRUVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVGRUZFRkVGRUZFRlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZWZmVmZmZlZmZmZWZmZmVmZmZlZmZmZWZmZmZmZmZmZmZmZmZmZmhomHiYaKh4mHioeJh4qIioeLiIqIi4iKiIuJi4mNi42MkI+SkZaVmJaamJqXmZWWkpSQkY6QjY+Mj42PjI+Nj4yQjY+NkI6QjZGOkI6Rj5GPko+Sj5KQkpCTkZOQlJKUkZWSlZKWk5WTl5SXlJiWmJaZl5mXm5ibmZyanJqenJ6coJ6gnqKgo6Knp6yttbjAw8zO1NTY1NTOzcbDvLy2tbGyr7CtsK6wrbGvsa6ysLKvs7GzsLSxs7G0srSytbO1sraztbO2tLazt7S2tLe1t7S3tbe0uLW3tbi2uLW5t7m3u7q9vMHAxMTKyc7N0tHU0tXS1NDSzs/KzMjIxMXBwr7AvL26vLm6t7m2t7S3s7WytbKzsLOwsq+yr7CtsK6vrK+srquuq62qraqsqaypq6irqKqnqqeppgBUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZoSHhYiFh4WIhYiGiIWIhomGiIaJhomHiYaJh4qHiomMio2NkY+Tk5eUmJaZlZeUlZGSj5CMjoyOio2LjoqNi46LjYyOi46Mj4yOjY+Mj42QjY+OkI2QjpGOkY+Sj5GQko+SkZOQk5GUkZSSlZKVlJeUl5WYlZiWmZeamJuYm5qdmp2cn5yfnqKgpKSpqrG0vL/HytHR1dPTzczFw7u6tbSvsK2vq66srquura+tr66wrrCvsa6xr7KvsrCzsLOxtLCzsbSxtLK1sbSytbK0s7WytbO2srWztrO1tLaztrW4tbm4vLu/wMTEycnOzNDP08/Sz9DLzMjJxMTBwr2+u725u7i6t7m3ubW4tbe0trS2srSytLCysLKusK6wrK+sr6utq62qrKqsqaupq6iqqKqmqaeppailqKSnpKcAVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUZFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmaGiYaIhomHiYaKh4mHioeJh4qIioeLiIqIi4mLiYyKjYuPjpGQlZSXlZmXmZaZlZaSlJCRjpCNj4yPjI6Mj4yOjI+Nj4yQjY+NkI6QjZGOkI6Rj5GPko+Sj5KQkpCTkZORlJKUkZWSlZKWk5aTl5WXlZiWmJaZl5qXm5mbmZ2bnZuenJ+doZ+hoKSkqKmwsrq9xsnQ0dbU1c/PyMW+vba1sLKur6yvra+ssK6wrbGvsa6ysLKvs7CzsLSxs7G0srSxtbK0srWztbK2s7WztrO1s7a0trO3tLa0t7S3tLi2uLe7ur28wsLGxszLz87T0dPQ08/PysvHxsLDvr66vLi5trm2t7W4tbe0uLW3tLi1t7S3tLaztrO0sbSxsq+yr7CtsK2vrK6sraqtqqyprKmrqKuoqaeqp6imqKanpKelAFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmhYeGiIWIhoiFiIaJhoiGiYaJh4mGiYeKh4mIioeKiYyKjYyQj5OSlpSYlpmWl5WWkZOQkY2PjI6LjYuOi42LjouOjI6LjoyPjI+Nj4yPjZCNkI6QjZCOkY6Rj5KPkZCSj5KQk5CTkZSRlJKVkpWTlpOWlZeVmJaZlpmXmpibmZyZnJuem56doJ6ioqamrK62ucHFzc7T09XPzsjGvry2tbCwra+rrauuq66sr6yvrbCtsK6xrrGvsq+ysLOvsrCzsLOxtLGzsbSxtLK0sbSytbK0srWytLO1srWztrO2tLi1ubm9vMHBxsbLy9DO0tDSz9DMzcfIw8S+v7u8t7i1t7O1srWxs7G0sbOxtLGzsrSxtLK0sbSytLGzsbOvsq+xrrCtsKyurK6qrKqsqKuoq6epp6mmqKaopaelp6OmpKaipQBUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVGRUZFRkVGRVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlZWZWZmZmVmZmZlZmZmZWZmZmVmZmZlZmZmZmZmZmZmZmZoaJh4mGioeJh4qHiYeKiIqHioiKiIuIioiLiYuJjIqNi4+OkZCUk5eVmZeal5mWl5OVkZKOkY2PjI+MjoyPjY+Mj42PjZCNj42QjpCOkY6QjpGPkY+Sj5KPkpCSkJORk5CUkZSRlZKUkpaTlZOXlJaUmJWYlZmXmZeamJuYnJqcmp6cnpygnqCfo6KlpayttLfAw8vN1NPV0dLLyMG/uLexsq6vrK+srqyvra+tsK6wrrGvsa+ysLKws7GzsLSxs7G0srSxtbK0srWztbK1s7WytrO1s7aztbO2tLa0t7W4tru6vb3Dw8fIzc3R0NTR08/RzMzHyMLCvb66ura4tbaztbK0sbSxs7CzsbKws7CysLOxsrCzsbOws7GzsLOwsq+yr7Gusa6wra+srquuq6yprKmqqKqnqaappqilqKWmpKekpaMAVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVoiEh4WIhYeGiIWIhoiFiIaJhoiGiYaJh4mGiYeKh4qIjImNjJCOkpGVk5eWmJWXlJaSk5CRjY6MjoqNi42KjYuOio2LjouOjI6LjoyPjI6Nj4yPjZCNkI6QjZCOkY6Rj5KPkZCSj5KQk5CTkZSRlJKVkpWUlpSWlZiVmJaZlpmYm5ibmp2anZyfnKCfo6KnqbCyur7HydDQ1NDQy8nBv7i3sLGtrqqtqq2qrauuq66sr6yvrbCtsK6xrrCvsa6xr7KvsrCyr7Kws7CysbOws7G0sLOxtLGzsbSxs7K0sbSztrS4uLy7wMHHxsvM0M7Rz9HNzcnJw8O/v7q6t7iztbK0sLKwsq6xr7GusK6wra+tsKyvra+sr62vrK+tr6yvra+sr62vrK6sr6utq62qrKqsqauoq6epp6mlp6WnpKakpqKloqWho6GjAFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmZmZWZmZmVmZmZlZmZmZWZmaIhomHiYaJh4mGioeJh4qHiYeKiIqHioiKiIuIi4iMioyKjo2Qj5OSlpSZl5mWmZaXk5WRko6RjY+Mj4yOi4+MjoyPjI+Mj42PjZCNj42QjpCNkY6QjpGPkY+Sj5KPkpCSkJORk5CUkZSRlZKUkpaTlpOXlJeUmJaYlpmXmZebmZuZnJqdm56cn52hn6Kip6itr7i8xMfP0NTS087LxMK7ubOzrq+rrqutq66srqyvra+tsK6wrrGvsa+ysLKvs7CysLOxs7C0sbOxtLGzsbSytLG0srSxtbK0srWytbK2tLa1ubi8vMLCx8jNzdHP09DRzc7JyMPEvr65u7a3s7Wys7CzsLKvsq+xrrGusK2wrq+tsK2vrK+srquvrK6rrqytq66rrauuq62rrqutqq2rrKqtqquprKmqp6qnqaappqekp6Smo6ajpKGkoQBUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmaFiIWHhoiFiIaIhYiGiYaIhomGiYeJhomHioeJiIqHiomMiY2Mj46SkZWTl5aZlZiVl5KTkJKNj4yOi42LjoqNi46LjYuOi46Mj4uOjI+Mj42PjI+NkI2QjpCNkI6RjpGPko+RkJKPkpCTkJORlJGUkpWSlZOWk5aUl5SXlpmWmZeal5qZnJmcm56bnp2hn6Skqquzt7/Cys3S0NLOzcXDvLqzsq6vq6yqraqsq62rrayvrK6tr62vrrCtsK6xrrGvsq6xr7KvsrCyr7Kws7CysLOwsrCzsLOxs7CzsbSxtLK1s7e3u7vAwcfGzMzQztHP0MvLx8fBwLy8t7e0tbGzsLKvsa6xrbCusK2vra+srqyuq62rrqqtqq2prKqsqaupq6irqKuoqqirp6qoqqeqqKqnqaeqp6mnqaaopqmlp6WnpKakpqOloqWho6GjoKIAVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVGRUZFVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVlZlZmZmZWZmZmVmZmZlZmZmZWZmZmVmZmZmZmh4mGiYeJhoqHiYeKh4mHioiKh4qIioeLiIqIi4mLiYyKjIqOjZCPk5KVlJmXmZealpeUlpKSj5GOj4yPjI6Mj4yOjI+Nj4yQjY+NkI6QjZCOkI6RjpCOkY+Rj5KPko+SkJKQk5GTkJSRk5GUkpSSlZOVk5aUlpSYlZiVmZeZl5qYmpicmpyanpuenKCeoZ+kpKipsbS8wMnL0dHU0M/Jx7+8tbWwsKyuq62rrqyuq6+tr6ywrrCtsa6xrrKvsa+ysLKvs7CysLOxs7CzsbOwtLGzsbSxs7G0sbOxtLK0sbWztbS4t7u7wcLHx83N0c/T0NDMzMfGwcG8u7e4tLWxtLGyr7Kvsa6xrrCtsK2vrK+trqyvrK6rrqutqq2qrKmsqauoq6mqqKuoqqeqp6mmqaeppqmmqKappqilqaaopaimp6Wopaekp6Smo6ajpKKkoqOgAFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVWZlZmVmZWZlZmVmZWZlZmVmZWZlZmVmZWh4WIhYeFiIWHhoiFiIaIhYiGiYaIhomGiYeJhomHioeKiIuJjIuPjZGQlJKWlZiVl5WWkpOQko2PjI6LjYuNioyLjYqNi46LjYuOi46Mj4uOjI+Mj42PjI+NkI2QjpCNkI6RjpGPko+RkJKPkpCTkJORlJGUkpWSlZOWk5aVl5WYlpmWmZibmJuZnJqdm5+doKClpayvt7rDxs7O0s/QycfAvba0r6+rrKqsqauprKmsq62qrayuq66sr6yvrbCtr66wrbCusa6wrrGusa+xrrGvsq6xr7Kvsa+yr7Gwsq+ysbSxtbW6ub6/xcXLy8/N0M7PycnFxL6+ubm0tbKzr7GusK2vra+srqyuq62rraqsqq2prKmsqKupq6iqqKqnqaeppqimqKWnpaikp6Sno6akpqOlo6aipaOloqSipaGkoqShpKKkoaOhpKCjoaOgoqCin6GfoQBUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVGRUVFRkVFRUZFRUVGRVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWZWZlZmVmZWZlZmVmZmZlZmZmZWZmZmhomGiIaJh4mGiYeJhoqHiYeKh4mHioiKh4qIioiLiIuIjIqMio6Mj46TkpWUmJaZlpmWl5OVkpKPkY6PjI+MjouOjI6Lj4yOjI+Nj4yPjY+NkI2PjZCOkI2RjpCOkY+RjpKPkY+SkJKQk5GTkJSRk5GVkpSSlZOVk5aUlpSYlZiWmZeZl5uYm5mcmpyanpyfnaGgpKSrrLO3wMTLzdPR0szLxMG5uLKxrK6rrKqtqq2qrquuq6+sr6ywra+tsK6wrrGvsa6xr7Gvsq+xr7Kwsq+ysLKvs7Cyr7OwsrCzsLKws7G0sra1ubm/wMXFzMzQztLPz8rLxcS+v7m5tLays6+yr7CtsK2vrK+srquurK2rrqutqq2qrKmsqauoq6iqp6qnqaappqilqKanpailpqSnpKajpqOloqWipKKloqShpKGjoaSho6CjoaKgo6Cin6Ogop+in6GeoZ8AVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVZVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZWZlZmVmZWZlZmVmZWZlZmVmZWiIWHhoiFiIaIhYiGiYWIhomGiIaJhomHiYaJh4qHiYiKh4qJjImMi4+NkZCUk5aVmJWYlZeTlJGSjo+Nj4uNi42KjYuNio2LjouNjI6LjoyPjI6Mj4yPjZCMj42QjZCOkI2QjpGOkY+SjpGPko+SkJOQk5GUkZSSlZKVk5aTlpSXlJeVmJaYl5qXmpmcmZybnpufnqKhpqivsrq+x8nPz9LNzMXDu7iysqytqqyoq6msqayqraqtq66rrqyvrK6tr6yvrbCtr66wrbCusa2wrrGusK6xrrCvsa6xr7Gusa+xrrGws7C0s7i3vL3Dw8nKz83Qzc7JycTDvby4uLOzsLKur62vrK6srqutq62qrKqsqauprKiqqKunqqeqpqmmqaWopqikp6WnpKakpqOlo6WipKKkoaOhpKCjoKOfoqCin6GfoZ6hnqGeoJ6gnaCeoJ2fnaCcn52fnJ+dn5yeAFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRUVGRUVFRkVFRUZFRkVGVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVmZmZlZmZmZWZmZmVmZmZlZmh4mGiYeJhoqHiYeKh4mHioiKh4qIioeLiIqIi4iKiIuJi4mMioyKjo2QjpOSlZSYlpmWmZaYlJaSk4+Rjo+Mj4yOi4+MjoyPjI6Mj42PjJCNj42QjpCNkI6QjpGOkI6Rj5GPko+Rj5KQkpCTkZOQlJGTkZSSlJKVk5WTlpSWlJeVl5WZlpmWmpiamJyZnJqdm56coJ6hoKamrK+4u8PHzs/Sz9DJxr69trSur6usqayqrKqtq62rrqyurK+tr62wrrCtsa6wrrGvsa6xr7Gusq+xr7Kvsa+yr7Gvsq+xr7Kwsq+ysLOxtbO3t729wsPKys/O0c7PysvFxL6+uLiztbGyrrGur6yvrK6rrqytqq2rrKqtqquprKmrqKuoqqeqp6mmqaaopailp6SnpKajpqOloqWipKGkoqOhpKGioKOgop+in6GeoZ+gnqGeoJ2gnZ+doJ2fnJ+dnpyfnJ6bnpyemwBUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVmVmZWZlZmVmZWZlZmVmaEh4WIhYeFiIWHhoiFiIaIhYiGiYWIhomGiIaJhomHiYaJh4qHioiLiYyLj42RkJSSlpWYlZeVl5KUkZKOj4yOi42LjYqMio2KjYuNio2LjouNjI6LjoyPi46Mj4yPjY+Mj42QjY+OkI2QjpGOkY+RjpGPko+SkJOQk5GUkZSSlZKVk5aTlpSXlJeWmZaZl5qXmpmcmZ2bn52ioqipsbW+wcnL0M7PysjAvba1rq6qrKiqqKuoqqmsqayqraqsq66rrayuq66sr6yura+sr62vrK+tsK2vrbCtr62wra+tsK2vrrCtsK6xrrKxtbS5usDAxsjNy8/NzsnIw8O8u7a2sbKvsKyurK6qrKqtqayprKirqKunqqiqpqmnqaWopqikp6Wno6akpqKlo6WhpKKkoaOho6CioKKfoZ+hnqCeoZ2gnaCcn52fnJ6cnpudm56anZudmpyanZmcmpyZm5mcmJuZm5iamJsAiFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRkVFRUZFRVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVZmVmZWZlZmVmZWZoaIhomHiIaJh4mGiYeJhoqHiYeKh4mHioiKh4qIioeLiIqIi4mLiIyKjIqOjZCOk5KVk5iWmJaZlpeUlpKTj5GOj4yPjI6LjoyOi46MjouPjI6Mj42PjJCNj42QjpCNkI6QjZGOkI6Rj5GOko+Rj5KQko+TkJOQlJGTkZSSlJKVk5WTlpSWlJeVl5WZl5mXmpiamJyanJqenJ+doqGmp6+yur3Hyc/O0c3LxMK6t7GxrKyprKmrqKyqrKqtq62rrqyuq6+srqyvra+tsK2vrbCusK2wrrCtsa6wrbGusK6xrrCusa6wrrGvsa+zsbS0ubq/wMfHzMzQzs/Ky8XDvb24t7Kzr7Ctr6yuq66rraqtqqyprKmrqKuoqqeqp6mmqaaopailp6SnpKajpqOloqWipKGkoaOgo6Cin6KfoZ6hn6CdoJ6fnaCdn5yfnJ6bnpydm56bnZqdm5yanZqcmZyZm5mcmZuYm5mamJuYAIaIhYeFiIVUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZlZmVmZWZlZmhYeFiIWIhoiFiIaIhYiGiYWIhomGiIaJhoiHiYaJh4mGiYeKh4mIioiKiYyKjYyPjZGRlZKWlZiVl5WXk5SRko6QjY+LjYuNio2LjYqNi46KjYuOi42MjouOjI+MjoyPjI+NkIyPjZCNkI6QjZCOkY6Qj5GOkY+Sj5KQk5CSkZORk5KUkZSTlZOVlJeUl5WYlZiXmpeamJuZnJqem5+fo6OqrbW4wcTMzNDNzcbDvLqysaytqKqoqqeqqKuoq6msqayqraqtq66rrayuq66sr6yurK+srq2vrK+tr6yvra+sr62vrK+tr6yvrbCtsK+zsba3vb3DxcvKzszOycnEw728t7axsq6vq62rramsqqyoq6mrqKqoqqepp6mmqKaopKelp6Omo6aipaKloaShpKCioKOfoZ+inqCeoZ2gnaCcn52fnJ6cnpudm52anJqdmZyanJmbmZyYm5mbmJqYm5eamJqXmZealpmXmZaYlpmVmACKh4mGioeJhomHiYaJVFRUZFRUVGRUVFRkVFRUZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVWZlZmVomHiYaJh4mGioeJhoqHiYeKh4mHioiJh4qIioeKiIqHi4iKiIuJi4iLiYuJjIqNi4+NkI+TkpWUmJaZlpmWl5SWkpOPko6PjI+MjouOjI6Lj4yOjI+Nj4yPjY+MkI2PjZCOkI2RjpCOkY6QjpGPkY6Sj5GPkpCSj5OQkpCTkZORlJKUkpWTlZKWlJaTl5WXlZiWmJaal5qYm5mbmZ2bnZygnqKiqKqxtL7BycvRz8/KyMG9trWvrqqsqauoq6mrqayqrKqtq62rrqyurK+sr6yvra+ssK2vrbCtr62wrrCtsK6wrbCusK2wrrCtsK6wrrGvsrG2tru8w8TKys/Nz8vMxsW+vri3srOvsKyvrK2qraqsqaypq6irqKqnqqeppqmmqKWopaekp6Smo6ajpaKloqShpKGioKOgoZ+in6CeoZ6gnaCdn5yfnJ6bnpudmp2bnJqdmpyZnJmbmZyZm5ibmJqYm5ial5qXmZeal5mWmZeYlpmWmJUAhYiGiIWHhYiFh4WIhYeFiIWHhYhUVFRUVFRVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVVlVWVVZVVlVYeFiIWHhYiFh4WIhYeFiIWIhoiFiIaIhYiGiYWIhomGiIaJhomHiYaJh4qHiYiKh4qJjIqNjJCOkZGVkpaVmJWXlZaSlJGSjo+NjouNi42KjIqNioyKjYqNi42KjYuOi42MjouOjI+MjoyPjI+Nj4yPjZCNj46QjZCOkY6Qj5GOkY+Sj5KQk5CSkZSRk5KUkpSTlpOWlJeUl5WYlZiXmpeamZyZnZygnqOlrK63u8TGzMzPysnCwLe1r6+pqqeppqmnqqeqqKuoq6msqayqraqsq62qrauuqq2rrqutq66rrayuq66srquurK6rrqyuq66srquurbCusrO4uL7Ax8fMy87KysbFvr23t7Gxra+qrKqsqKuoq6eqp6qmqaappailqKSmpKejpaOloqSipKGjoaOgoqCinqGeoZ2gnaCcn5yfm56bnpqdmp2ZnJqcmZuZm5iamJqXmpeal5mXmZaYlpmVmJaYlZeVmJWXlZeUl5WXlJaUl5OWlJaTlZOWAImHioeJhoqHiYaJh4mGiYeJhomHiIaJhoiGiYaIVWVVVVVlVVVVZVVVVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVVlVWVVZVWIhomGiIaJh4iGiYeJhomHiYaJh4mGioeJhoqHiYeKh4mHioiKh4qIioeKiIqIi4iKiIuJi4mNi42Lj46Rj5SSlZSYlpiWmZaXk5WSk4+Rjo+Mj4yOi46LjYuOjI6Lj4yOjI+MjoyPjY+MkI2PjZCOkI2QjpCNkY6QjpGPkY6Sj5GPkpCSj5OQkpCTkZORlJKUkpWTlZKWlJaUl5WXlZiWmJaamJqYnJmcmp6cn56jo6mrtLe/w8vMz8zNx8S8urOxrK2pqqeqqKqoq6mrqayqrKqtq62qrqutq66srquvrK6sr6yurK+srqyvra6sr62urK+trqyvra+ssK2wrrOyt7e+v8XGzMzOy83IxsC/ubiys6+vq66rrKmsqauoq6iqp6qnqaappqilqKWnpKekpaOmo6ShpKGjoKOgop+in6GeoZ6gnaCdnpyfnJ2bnpudmp2anJmcmZuYm5ial5qYmpeal5mWmZeYlpmWmJWYlpeVmJWXlJiVl5SXlZaUl5SWk5eUlpOWlACHiYaIhomGiIaJhYiGiYWIhoiFiIaIhYiGiIWIhoiFh4aIhYeFiIWHhYhVVVVVVVVVVVVVVWVVVVVlVVVVZVVVVWVVVVVlVVVVZVWHhYiFh4WIhYeGiIWHhoiFiIaIhYiGiIWIhoiFiIaJhYiGiYaIhomGiIaJhomHiYaJh4mGiYeKh4mHioeKiIuIi4qNi46NkY+TkpWTl5WYlZeVlpKUkZKOj42Pi42LjYqMio2KjYuNio2LjouNi46LjoyOi46Mj4yOjI+Mj42QjI+NkI2PjpCNkI6RjpCPkY6Rj5KPkpCTj5KRk5CTkZSRlJKVkpWUlpSWlZiVmJaZlpmYm5ibmp6boKCmpq6xur3FyM7LzcjGvru0s6ysqKqmqKeppqmnqqeqqauoq6msqayqraqsq62qrautqq2rrqqtq66rrauuq62rrqutq66rrauuq62sr6ywsLS0urzCw8nJzcrMyMfAv7m4srKur6qsqayoqqiqp6mnqaaopqilp6WnpKakpqKloqWho6GjoKKgop+hn6GdoJ2gnJ6cn5udm52anJqcmZuZm5iamJuXmZealpmXmZaYlpiVl5WYlJeVl5SWlJeTlpSWk5WTlpOVk5WSlZOVkpSSlZKUkpWRlJKUkZQAi4iKh4qIioeKiIqHioiJh4qHiYeKh4mHioeJhoqHiYaKh4mGioeJhomHiYaJh4mGiYeJhomHiYaJh4mGiYeJhomHiYaJh4mGiYeJhomHiYaJh4mGioeJhoqHiYeKh4mHioeJh4qHiYeKiIqHioiKh4qIioeLiIqHi4iKiIuIioiLiYuJjIqMio6MjoyRj5KRlZSXlZmXmZaZlpeTlZKTj5GOj4yPjI6LjoyOi46MjouPjI6Mj42PjI+Nj42QjY+NkI6QjZGOkI6RjpCOkY+RjpKPkY+SkJKPk5CSkJORk5GUkpSRlZKVkpaTlpOXlJeUmJaYlpmXmZebmZuZnZudnKCfpKSsrra5w8bMzM/LysPBubavr6urp6qoqaerqKqorKmsqa2qrKqtq62rrqutq66srquurK6rr6yuq6+srquvrK6rr6yuq6+srquvrK+tsa+zs7m6wMLJyc3LzsrJw8K8urS0sLCsrqusqaypq6irqKqnqqeppqmmp6WnpaajpqOloqWipKGkoaKfop+hnqGeoJ2gnZ+cn5ydm52bnJqcmpuYm5mamJuYmZeal5mWmZaYlZiWl5WYlZeUl5WWlJeUlpOWlJaTlpOVk5aTlZKVk5WSlZOUkpWSlJKVkpSRAIaJh4mGiIaJhoiGiYaIhomFiIaJhYiGiIWIhoiFiIaIhYiGiIWHhoiFh4WIhYeFiIWHhYiFh4WIhYeFiIWHhYiFh4WIhYeFiIWHhYiFh4aIhYeGiIWIhoiFiIaIhYiGiIWIhomFiIaJhYiGiYaIhomGiIeJhomHiYaJh4qHiYeKh4qIi4mMio6Lj46SkJOSlpSXlZiUlpSWkZOQkY2PjI6KjYqNioyKjYqMio2KjIuNio2LjouNi46LjoyOi46Mj4yOjI+Mj42PjI+NkI2PjpCNkI6RjpCOkY6Rj5KPkZCSj5KQk5CTkZSRlJKVkpWUl5SXlZiVmJeal5qYnJmdnKGgpqiws7zAyMjNy8vEwru4sK+qq6aopqilqKappqmnqqeqqKuoq6msqauprKmsqqyprKqtqayqramsqq2prKqtqayqramsqq2prKqtqq2ssK+0try9xMXLyczJycPCvLq0s66vqqypq6epp6mmqKaopaelp6SmpKajpaOloaShpKCioKKfoZ+hnaCdoJyenJ6bnZudmpyanJibmJuXmpealpiWmZWYlZiUl5WXlJaUlpOVk5aSlZOVkpSSlJGUkpSRk5GUkJORk5CTkZOQkpCTkJKQk4+SkJKPkpCSj5GQkgCKiIuIioeLiIqHioiKh4qIioeKh4mHioeJh4qHiYeKh4mGioeJhoqHiYaKh4mGiYeJhomHiYaJh4mGiYeJhomHiYaJh4mGiYeJhoqHiYaKh4mGioeJhoqHiYeKh4mHioeJh4qHiYeKiIqHioiKh4qIioeLiIqIi4iKiIuJi4mMioyKjoyPjZKQk5KWlJeVmZaYlZiVlpKUkZKOkY2PjI6MjYuOi42LjoyOi46MjouPjI6Mj42PjI+Nj4yQjY+NkI6QjZCOkI2RjpCOkY+RjpKPkY+SkJKPk5CSkJORk5CUkpSRlZKVkpaTlpOXlZeVmJaYlpqXmpibmZyanpyfn6WmrK+5vMTGzczNyMe/vLWzrayoqqeppqmnqaeqqKqoq6mrqayqrKqtqqyqrautqq2rraquq62qrqutqq6rraquq62qrautqq2rrauurbCvtLS6u8PEycnOy8vGxb+9traxsKyuqquoq6iqp6qnqaappqilqKWmpKekpaKloqShpKGjoKOgoZ6hnqCdoJ2enJ6cnZqdmpyZnJmbmJuYmpeal5mWmZaYlZiVl5SXlJaTlpSVk5aTlZKVkpSSlZKUkZSSk5GUkZOQlJGTkJORk5CTkJKQk5CSkJOQko+TkJKPkpAAiIqHiYeKh4mHioaJh4qGiYeJhomHiYaJh4mGiIeJhoiGiYaIhomGiIaJhoiGiYaIhomGiIaJhYiGiYWIhomFiIaJhoiGiYaIhomGiIaJhoiGiYaIhomGiIaJhoiHiYaJh4mGiYeJhomHioaJh4qHiYeKh4mIioeKiIuIi4qNio2MkI2RkJSRlZSXlJeVmJSWk5WRko+RjY+MjouNi42KjIqNioyLjYqNi46KjYuOi42MjouOjI+LjoyPjI6Nj4yPjZCMj42QjY+OkI2QjpGOkI6RjpGPko+RkJKPkpCTkJORlJGUkpWSlZOWk5aUl5WXlpmWmZibmJuanpyhoqiqsra/wcnJzcnIwr+3ta6uqKmmqKWnpqimqKeqp6moq6iqqauoq6msqauprKmsqqyprKqsqayqrKmsqqyprKqsqayqrKmrqqyprKuurLCxt7e+wMfHy8rMxsbAvre2sbGrrKmrp6mnqaaopqilp6WnpKakpqKloqWho6GjoKKgop6hnqGdn52fnJ6cnpqcmpyZm5mbmJqYmpaZlpmVmJWYlJeUl5OWk5aSlZOVkpSSlJGTkZSQk5GTkJKQk4+SkJKPkY+Sj5GPko6Rj5GOkY+RjpCOkY6QjpGOkI6RjpCOkY2QAIyJi4iLiYuIi4mLiIuJioiLiIqIi4iKiIuIioeLiIqHioiKh4qIioeKiIqHioiKh4qIioeKiIqHioiKh4qIioeKiIqHioiKh4qIioeKiIqHioiKh4qIioeLiIqHi4iKh4uIioiLiIqIi4iKiIuJi4iMiYuJjIqMio6MjoyQjpGQlJKVlJiWmJaZl5iVmJSVkpSQkY6QjY+Mj4yOi46MjouOjI6Lj4yOjI+MjoyPjY+MkI2PjZCNj42QjpCNkY6QjpGOkI6Rj5GOko+Rj5KQko+TkJKQk5GTkJSRk5GUkpSSlZOVk5aUlpSYlZiVmZeZl5qYm5mcmp2coaGmp6+yu77HyM3KzMbDvLqysKusqKmmqaeppqqoqqerqauorKmrqayqrKqtqqyqrautqq2rraqtq62qrautqq2rrKqtqqyqraqsqq2rrqyxsLW1vb7ExczLzcnJw8G6ubOyra+rrKirqKqnqqeppqmmqKWopaakpqSloqWipKGkoaKfop+hnqGen52fnJ6bnpudmp2am5ibmJqXmpeZlpmWmJWYlZeUl5SWk5aTlZKVkpSRlZKUkZSRk5CTkZKQk5CSj5KQko+SkJGPko+Rj5KPkY6Sj5GOkY+RjpGPkY6Rj5GOkY+QjgCHioiKh4qIioeJh4qHiYeKhomHioaJh4mGiYeJhomHiYaIh4mGiIaJhoiGiYaIhomGiIaJhoiGiYaIhomGiIaJhoiGiYaIhomGiIaJhoiGiYaIhomGiIeJhomHiYaJh4mGiYeJhomHioeJh4qHioiLiIqJjImMi46Mj46Rj5OSlZOWlZiVl5WXk5WSlJCRjpCMjouOioyKjYmMio2JjIqNioyLjYqNi42KjYuOi42LjouOjI6LjoyPjI6Mj4yPjY+Mj42QjY+NkI2QjpGNkI6RjpGPko+RkJKPkpCTkJORlJGUkpWSlZOWk5aVmJWYlpmWmZibmZ2doqKprLW4wMPKyMvHxr67tLKrq6eopKelp6SnpailqKeppqmnqqeqqKuoqqirqKupq6irqauoq6mrqKupq6irqauoqqmrqKqoq6irqayprayxsbe5wMHHyMvIycTCu7mzs62tqaunqaappaelp6SmpKajpaOloqSipKCjoKOfoZ+hnqCeoJyenJ6bnZudmZuZm5iamJqWmZaZlZeVl5SWlJaTlZOVkpSSlJGTkZOQkpCTj5KQko+Rj5GOkI6RjZCOkI2PjZCNj42QjI+Nj4yPjY+MjoyPjI6Mj4yOjI+MjoyPjI6Mj4yOjI8AjImMiouJjImLiIuJi4iLiYuIi4mKiIuIioiLiIqIi4iKh4uIioeLiIqHioiKh4qIioeKiIqHioiKh4qIioeKiIqHioiKh4qIioeKiIqHioiKh4uIioeLiIqIi4iKiIuIioiLiYuIi4mLiYyKjIqNi42Lj42QjpKQk5KWlJeVmJaYlpmWl5SWk5SQko+QjZCMjouOi42LjouNi46MjouOjI6Lj4yOjI+MjoyPjY+Mj42PjZCNj42QjpCNkI6QjZGOkI6Rj5GOkY+Rj5KPko+SkJKQk5GTkJSRk5GVkpSSlZOVk5eUl5SYlpiWmZeZl5uZm5qenaChp6mwtL3Ax8jNycnCwLm2r66pqaaopqilqaaopqqnqqerqKqoq6mrqaypq6msqqyprKqsqayqrKmsqqyprKqrqaypq6msqauprKqsqq2ssK+2t72/xsfLyczHxb++t7WvsKusqKuoqaappqilqKWnpKekpqOmo6SipKKjoKOgop+in6CdoJ2fnJ+cnZqdmpyZnJmal5qXmZaZlpiVmJWWlJeUlZOWk5SSlZKTkZSRk5CTkJKPkpCRj5KPkY6RjpCOkY6QjZCOkI2QjY+NkI2PjJCNj4yPjY+Mj42PjI+Nj4yPjY+Mj42PjI+NAIuOioyKjImLiYuIioiLiIqIi4eKiIqHioiKh4mIioeJh4qHiYeKh4mHioeJh4qHiYeKhomHioaJh4qGiYeKhomHioaJh4qGiYeKh4mHioeJh4qHiYeKh4mHioeJiIqHioiLh4qIi4iLiYyJjIuOi4+OkY6SkZSSlZSXlJeWmJWXlJaSlJGTj5COj4yOi46KjIqNioyKjYqMi42KjYuNio2LjouNi46LjoyOi46Mj4uOjI+Mjo2PjI+NkIyPjZCNj46QjZCOkY6QjpGOkY+Sj5GPko+SkJOQk5GUkZSSlZKVk5aTlpSXlJeWmZaZl5qYm5qenaOlrK63u8PEysnKxMK7ubGvqqqlp6SnpKelqKWopqmmqaeqp6moqqeqqKuoqqirqKqpq6iqqauoqqirqKqoq6iqqKuoqqirp6qoq6irqq6ssbO5usHDycjKx8fAv7i3sLCrrKepp6mlp6WnpKakpqOlo6WipKKkoaOgo5+hn6GeoJ6gnJ6cnpudmp2Zm5mbmJqXmpaYlpiVl5WXk5aUlpKVkpWRk5GUkJKQk4+Sj5KOkY+RjpCOkI2PjZCMj42PjI6Mj4yOjI+LjoyOi42LjouNi46LjYuOio2LjoqNi46KjYuOio2LjoqNi46KjQCTkJGNkI2Oi46LjYqNioyJjIqMiYyJi4mMiYuJjImLiIyJi4iLiYuIi4mLiIuJi4iLiYuIi4mLiIuJi4iLiYuIi4mLiIuJi4iLiYuIi4mLiIuJi4iMiYuIjImLiYyKjImNio2KjoyOjJCOkI6SkJORlZSWlJiWmJaZl5mWmJWWk5WSk4+SjpCNj4yOi46MjouOjI6LjoyOi4+MjoyPjI6Mj42PjI+Nj4yQjY+NkI6PjZCOkI2RjpCOkY6QjpGPkY6Sj5GPkpCSj5KQkpCTkZOQlJGTkZSSlJKVk5WTlpSWlJeVl5WZlpmXmpiamJybnp2io6mrtLe/wsnJy8fHwL21tK2sp6mmp6Wopqimqaepp6qoqqirqauorKmrqaypq6msqquprKqrqaypq6msqauprKmrqKypq6isqauprKqtrLGxtri/wcfHzMnKxMO8urOzrq2pq6ippqmmqKWopaekp6Smo6ajpaKloqOgo6Cin6KfoJ2gnZ+cn5ydmp2anJmbmZqXmpeZlpmWl5SXlJaTlpOVkpWSlJGUkZOQk5CSj5KPkY6Rj5COkY6QjZCOj42QjY+Mj42PjI+MjoyPjI6LjoyOi46MjouOjI6LjoyOi46MjYuOjI6LjoyOi46MjosAk5SSk4+RjpCMjoyOioyKjImLiYuIi4iLiIqIi4eKiIqHioiKh4qIioeJh4qHiYeKh4mHioeJh4qHiYeKh4mHioeJh4qHiYeKh4mHioeJiIqHioiKh4qIi4iLiYyJi4qNio2LjoyPjpGOkpGUkZWTl5SXlZiVl5WXk5WTlJCSj5GNj4yOi42LjYqMio2JjIqNioyKjYqMi42KjYuNio2LjouNi46LjYyOi46MjouOjI+MjoyPjI+Nj4yPjZCNj42QjZCOkI2QjpGOkY+RjpGPko+SkJOQk5GUkZSSlZKVk5aTlpSXlZeWmZaZmJyanp+kpa2xubzDxcrHx8K/t7WuraeopaajpaSmpKalqKWnpqmmqKeppqmnqqepp6qnqqiqp6qoqqeqqKqnqaeqp6mnqqepp6qmqaeqpqmoq6isrbKyubzDw8jIysXEvry0s66uqKmnqKWnpaejpqSmoqWjpaGkoaSgoqCin6GfoZ2fnZ+cnpuempyanJibmJqXmZeZlZiVmJSWlJaTlZOVkZSRlJCSkJOPkY+RjpCOkY2QjZCMj42PjI6MjouNi46LjYuNio2LjYqMio2JjIqMiYyKjImLiYyJi4mMiYuJjImLiYyJi4mMiYuJjImLiYyJi4mMAJqXmpaYlJeTlJGTkJGOkY6PjI+MjouOi42KjYqMiYyKjImMiouJjImLiYyJi4iMiYuIjImLiIyJi4iMiYuIjImLiIyJi4iMiYuJjImLiYyKjImNioyKjouNi4+Nj42Rj5GPk5GUkpaUlpSYlpiWmZeZlpmWl5SWk5SQk4+RjZCNjoyOjI2LjouNi46LjYuOjI6LjoyOi4+MjoyPjI6Mj42PjI+Nj4yQjY+NkI2PjZCOkI2QjpCNkY6QjpGPkY6Rj5GPko+Rj5KQkpCTkJOQlJGTkZSSlJKVk5WTlpSWlJiVmJWZl5mXm5mbmp6eoqOrrbW4wcTJyMrFw7y6s7Cqq6anpKelp6SopqilqaeppqqnqqeqqKqoq6iqqKupq6irqauoq6mqqKuoqqirqKqoq6iqp6uoqqerqKqpraywsLe5v8HIyMvHyMLAubexsKusqKmmqaanpailp6SnpKWjpaOkoaSho6CjoKGeoZ6gnaCdnpuem52anJqbmJuYmZeZlpiVmJWXlJeUlZKVkpSRlJGTkJOQko+Sj5GOkY6QjZCOj42QjY+Mj4yOi46MjouOi42KjouNio2LjIqNioyKjYqMiY2KjImNioyJjIqMiYyKjImNioyJjYqMiY2KjIqNigCYm5eamJqWmJaYlJaTlZGTkJKOkI6QjI+Mj4uNi42KjIqNiYyKjImLiYyJi4mMiIuJi4iLiYuIi4mLiIuJi4iLiYyIi4mMiYuKjImMio2KjYuOi46Mj4yPjpGOkZCTkJSSlZOWlJeVl5aYlZiWmJSWlJWSk5GSjpCOkIyOjI6KjYuNioyKjYqMio2KjIuNio2LjYqNi46LjYuOi42MjouOjI6LjoyPjI6Mj4yOjY+Mj42QjI+NkI2PjpCNkI6RjZCOkY6Rj5GOkY+Sj5KQk5CSkZSRk5KVkpSTlpOWlJeUl5WYlpmXmpicm6Cfpqiws7u/xsXJxsa+vLWzq6ump6Olo6ajpqSnpKelqKWopqmmqaeppqmnqqepp6qnqaeqp6mnqqepp6qmqaeqpqmnqaapp6mmqaeqp6qprayytLu8w8XJx8jEwru5s7Grq6ippaelp6SmpKajpaOloqSipKCjoKOfoZ+hnaCdn5yenJ6anJqcmZuYm5eZl5mVmJWYlJaUlpOVkpWRk5GTkJKQko+Rj5GOkI6QjY+Nj4yOjI+LjouOi42LjYqMio2JjIqMiYuJjImLiYyIi4mLiIuJi4iKiYuIioiLiIqIi4iKiIuIioiLiIqIi4iKiYuIi4mLiIsAmZiamJyZm5mcmZuYm5iZlpmWl5SWk5SRlJGSj5KPkY6RjpCNkI2PjI+MjoyPjI6LjoyOi46MjouOjI6LjoyOi4+MjoyPjY+MkI2QjZGOkY+SkJKQlJKUkpaUlpSYlpiWmZeZl5qXmZaZlpeUl5SVkpSRko+RjpCNj4yOi46MjouOjI6LjoyOi46MjouPjI6Mj4yOjI+Nj4yPjY+MkI2PjZCNj42QjpCNkI6QjZGOkI6RjpCOkY+RjpKPkY+Sj5GPkpCSkJOQk5CTkZORlJKUkpWTlZOWlJaUl5WXlZiWmZaamJqYnJufnqSmrK+4vMPEysjIwsG6t6+vqamlp6SmpKelp6Wopqimqaepp6qoqqerqKqoq6iqqKuoqqirqKqoq6iqp6uoqqeqqKqnqqiqp6qoqqerqayrsbK3ucHDyMfLx8a/vre1r6+qqqeppqilqKWnpKekpqOmo6WipKKjoKOgop+in6CdoJ2fnJ6bnZqdmpuYm5ial5mXmJWYlZeUl5SVkpWSlJGUkZOQk5CSj5KPkY6RjpCNkI2PjI+MjouOjI6LjouNio2LjYqNioyJjYqMiYyKjImMiYuJjImLiYyJi4iMiYuIjImLiIyJi4iMiYuJjImLiYyJi4mMiYuJAJGUk5aUl5aZlpmYmpeamJqXmZeZlpiVl5SWk5aSlJKUkJKQko+Rj5GOkI6QjZCNkI2PjZCMj42QjI+NkI2PjZCNkI6RjpGPko+SkJOQk5GUkZSTlpOWlJeUl5WYlZiWmJWXlZeUlpOVkZORko+QjpCMjoyOio2LjYqMio2JjIqNiYyKjYqMio2KjIuNio2LjYqNi46LjYuOi42LjouOjI6LjoyPi46Mj4yOjI+Mj42PjI+NkI2PjZCNkI6QjZCOkY6Qj5GOkY+Sj5KQk5CTkZSRk5KVkpWTlpOWlJeUl5aZlpmYnJugoaipsbW+v8bGyMPCvLmxr6mppKWjpaKlo6ajpqSnpKelqKWnpqilqKappqimqaaop6mmqKeppqimqaaopqmlqKappaimqKWopqilqKaqqKyts7O7vcTEyMbHwb+5t6+vqqqmp6Wno6ajpqKloqWhpKGkoKKgop+hn6Gdn52fnJ6bnpqcmpyYmpial5mXmZWXlZeTlpOWkpSSlJGTkZOPko+SjpCOkI2PjY+MjoyOi42LjoqNi42KjIqMiYuJjIiLiYuIioiLh4qIioeKiIqHiYeKh4mHioeJh4qGiYeKhomHiYaJh4mGiYeKhomHioaJh4qHiYeKh4mHigCRj5ORlJKWlJaVmJeZl5uYm5icmZuYnJmbmJuYmpeal5iWmJaXlJeUlpOWlJWTlpOVkpWTlJKVkpSSlZOVkpaTlZOWlJaUl5WXlJiWmJWZl5mWmpeZl5qXmZaZl5iVmJWWk5aTlJGTkJKOkY6PjI+MjouOjI2LjouNi46LjYuOjI2LjoyOi46MjouPjI6Mj4yOjI+Nj4yPjY+Mj42PjJCNj42QjY+NkI6QjZCOkI2RjpCOkY+RjpGPkY6Sj5GPkpCSj5OQkpCTkZORlJKUkpWTlZOWlJaUl5WXlZmXmZebmZyboKClp6+yur3FxcjFxsC9trStrKeopKajpqSmpKelp6Wopqimqaeppqqnqaeqp6mnqqiqp6qoqaeqp6mnqqeppqqnqaapp6mmqaeppqmnqaisq7CxuLrBwsnHycXEvru0s62sqKqmqKWnpaajpqSlo6WjpKGkoaOgo6Cin6GeoJ2gnZ6bnpudmpyZm5ibmJmWmZaYlZiVlpOWk5WSlZKTkJOQko+Sj5GOkY6QjZCNj4yPjI6LjoyNi46LjYqNioyJjIqMiYyJi4iMiYuIi4mKiIuIioiLiIqHi4iKh4qIioeKiIqHioiKh4qIioeKiIqHioiKh4qIioeLiIqIi4gAjI+Mj46RjpGQk5CTkpWTlpWYlZiXmZeZmJqXmpibl5qYmpeal5qXmZeZlpiWmZWYlpiVmJaYlZeWmJWYlpiVmJaZlZiWmZaYl5mWmZeZlpiWmZWYlpiUl5SWk5WSlJCSkJKOkI6QjI6MjouNi42KjYuNioyKjYqMio2KjIuNio2LjYqNi46KjYuOi42LjouNjI6LjoyOi46Mj4uOjI+MjoyPjI+Nj4yPjZCMj42QjY+OkI2QjpGNkI6RjpGPkY6Rj5KPkpCTkJKRk5CTkpSRlJOVk5WUl5SXlZiVmJebmJ2doqKprbW3v8LHxcbBwLi2r66np6SmoqSipaKlo6ajpqSnpKelqKWopqmlqKappqimqaaopqmmqKappaimqaWopqilqKaopaelqKWnpqimqaitrLK1vL3ExcnFxsC+trSurqippqekpqSmo6WjpaKkoqSgo6Cjn6GfoZ6gnqCcnpyem52anJmbmZuXmZeZlZiVl5SWlJaSlJKUkZORk4+Sj5KOkI6QjY+Nj4yOjI6LjYuNioyKjYmMioyJi4mLiIuIi4iKiIqHioiKh4mHioaJh4mGiYeJhomHiYaIhomGiIaJhoiGiYaIhomGiIaJhoiGiYaIhomGiIeJhomHiYaJAI+Nj4yQjZCNkY+Rj5KQk5GUkpWTl5SXlZiWmZaamJqXm5ibmJuZm5icmZuYnJmbmJuZm5ibmZuYm5mamJuYmpibmJqXm5ial5qXmZaZlpiVmJWXlJaTlZKUkZOQk4+RjpGOj42PjY6Mj4yOi46MjouOjI6LjoyOi46MjouPjI6Mj4yOjI+MjoyPjY+Mj42PjJCNj42QjY+NkI2PjZCOkI2QjpCNkY6QjpGOkI6Rj5GOko+Rj5KPkY+SkJKPk5CSkJORk5GUkpSSlZOVkpaUlpSXlZeVmJaYlpqYmpmdnKChqKqxtL3AxcXJxMO8u7Oxqqump6Omo6Wjp6SmpKilp6Wppqimqaeppqqnqaeqp6mnqqepp6qnqaeqp6mmqaeppqmnqKappqimqaaopqqoq6uxsri6wsPIx8nEwru6s7GrrKippailp6SnpKajpqOloqWio6GjoKKfop+hnqCdn5yfnJ2anZqbmJuYmpeal5iVmJWWlJaTlZKVkpSRk5GSj5KPkY6RjpCNkI2PjI+MjouOi42KjYuMio2KjImMiouJjImLiIuJioiLiIqHi4iKh4qIioeKiImHioeJh4qHiYeKh4mHioeJh4qHiYeKh4mHioeJh4qHiYeKiImHioiKhwCKjYuOio2LjouNjI6Ljo2PjY+OkY6Rj5KQk5GUkZSTlZOVlJeUlpWXlJeVmJWYlpiVmJaYlZiWmJWXlZiVl5WXlJaUl5OWk5aSlZKVkZORk5CSj5KOkI6QjI+Mj4uNi46KjYuNioyKjYqMio2JjIqNioyKjYqMio2KjIuNio2LjYqNi46KjYuOi42LjouNi46LjoyOi46MjouOjI+MjoyPjI6Nj4yPjY+Mj42QjY+NkI2QjpCNkI6RjpCPkY6Rj5KPkpCTkJKRlJGTkpWSlJOWk5aUl5SXlpmWmpmenaOlrK63usHCxsTEvry1s6uqpqaipKKkoaSipaKlo6ajpqSnpKelqKSnpailp6aopaemqKWnpailp6WopKelp6Snpaekp6WnpKakp6SnpamnrKyztLu+xMTHxcW9u7WzrKunqKSmo6aipKKloaShpKCioKOfoZ+hnqCeoJyenJ6anZqcmZuZm5eZl5mVl5WXlJaTlpKUkpSQk5CTj5GPkY6QjpCMj42Pi46LjoqNi42JjIqMiYuJi4iKiIuHioiKh4mHioaJh4mGiIaJhoiGiYWIhoiFiIaIhYeFiIWHhYiFh4WIhYeFiIWHhYiFh4WIhYeFiIWHhYiFh4WIhYeGiIWIhogAjoyPjI6Mj4yOjI+MjoyPjY+MkI2PjZGOkI6Sj5GPk5CTkJSRlJGVkpSSlZOVk5aTlZOWk5WTlpOVk5aTlZKVkpSRlJKTkZSRkpCSkJGOkY+QjZCNj4yPjY6Mj4yOi46MjYuOi42LjouNi46MjYuOjI6LjoyOi46MjouPjI6Mj4yOjI+MjoyPjY+Mj42PjI+Nj4yQjY+NkI2PjZCOkI2QjpCNkI6QjZGOkI6Rj5GOkY+RjpKPkY+SkJKPk5CSkJORk5GUkpSSlZOVk5aUlpSXlZeVmZeZl5uZnZyio6mstLe/wMbFxsHBubavrqmopKajpaKlo6WjpqSmpKelp6WopqilqaaopqmnqKapp6imqaaopqmmqKappqilqKaopaimp6WopaelqKaop6ursLG4u8HCyMbHwsG6t7CwqqqmqKWmo6akpaOmo6SipKKjoKOgop+in6CeoJ2fnJ+cnZqdmpuYm5ial5mWmJWYlZaTlpOVkpWSk5CTkJKPko+RjpGOj42PjY6MjoyNi46LjYqNioyJjImLiIuJi4iLiIqHi4iKh4qHiYeKh4mGioeJhomHiYaJhoiGiWtra2tra2tra2tra2tra2tra2tra2tra2trW2triIaJhoiGiYeJhomHAIyOi46MjouNi46LjYuOi42LjouNjI6LjoyPi46Mj4yPjZCNj46QjZCOkY6Qj5GOkY+RjpGPkY6Rj5GOkI6RjpCOkI2PjZCMj42PjI6MjouOi46LjYuOio2LjYqNi42KjIuNioyLjYqNi42KjYuNio2LjoqNi46KjYuOi42LjouNjI6LjoyOi46MjouOjI+LjoyPjI6Mj4yOjY+Mj42PjI+NkIyPjZCNj46QjZCOkY2QjpGOkY+RjpGPko+SkJOQkpGTkJOSlJGUk5WTlZSXlJeVmJWZmJuan6Cmp6+yurzCw8bCwbu5sa+qqaSloqSho6KkoqSjpqOlpKekpqSnpKelqKWnpailp6WopaelqKWnpaikp6WnpKelp6SmpKekpqSnpKakp6Wop6yssrW8vsTFyMPDvbuzsayrpqekpqOlo6WipKKkoaOho6CioKKeoJ6gnZ+dn5udm52ZnJmbmJqXmpaYlpiUlpSWkpWSlJGTkZOPko+SjpCOkI2PjY+MjoyOio2LjYqMioyJi4mLiIqIi4eKiIqHiYeKhomHiYaIhomGiIaIhYiGiIWHhYhra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tba1trW2tba1trW2tba1trW4iFhwCQjY+MkI2PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+Mj42PjJCNj4yQjY+NkI2PjZCOkI2QjpCNkI6QjZCOj42QjY+NkI2PjI+Nj4yPjI6Mj4yOi4+MjouPjI6LjoyOi46MjouPjI6Lj4yOi4+MjoyPjI6Mj4yOjI+Nj4yPjY+Mj42PjJCNj4yQjY+NkI2PjZCNj42QjpCNkI6QjZGOkI2RjpCOkY6QjpGPkY6Sj5GPko+Rj5KQkpCTkJKQk5GTkZSSlJKVk5WSlpSWk5eVl5WYlpiWmpibmp+fpKWtsLe6wsLGw8W/vba0raymqKSloqWjpaKmpKajp6WnpKilp6WopqimqaaopqmmqKappqimqaaopammqKWopqilqKWnpailp6WopaelqaeqqrCxuLrCw8jGx8LAuLewrqmqpqekp6Smo6ajpaKloqShpKGjoKKgoZ6hnqCdn5yem56bnJmcmZqXmpeZlpiVl5SXlJWSlZKUkZSRko+Sj5GOkY6QjZCNj4yPjI6LjouNio2KjImMiYuIjImLiIuIioeLiIqHioeJh4qHiYaJh4mGe2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tba1sAi46MjouOjI6LjYuOi42LjouNi46LjYuOio2LjoqNi46KjYuOio2LjoqNi46KjYuOio2LjoqNi46KjYuNio2LjYqNi42KjYuNioyKjYqMio2KjIqNioyKjYqMio2KjIuNio2LjYqNi42KjYuNio2LjYqNi46KjYuOi42LjouNi46LjYyOi46MjouOjI6LjoyPi46Mj4yOjI+Mjo2PjI+Nj4yPjZCNj42QjZCOkI2QjpGOkI+RjpGPko+SkJOQk5GUkZOSlZKUk5aTlpSXlJeWmZebm6GhqKqytLy+xMLEv7+3ta6tpqajpKCjoaOgo6KkoaSjpaKlo6ajpqSnpKakp6SmpaekpqWnpKakp6SmpKejpqSmo6akpqOlo6ajpaOmo6akqKarrLK0u77Ew8bDwru5srCqqaano6WipaGkoaSgo6Gjn6Kfop6gnqCdn52fm52bnZmcmZuYmpealpiWmJSWlJaSlZKUkZORk4+Rj5GOkI6QjI+Mj4uNi46KjIqNiYuJjIiLiIuHioiKh4mHioaJh4mGiIaJhYiGiIWHhYiFh2tra2tra2tra2tra2tra2tra2tra2tba2trW2tra1trW2tba1trW2tba1trW2tba1trW2tba1trW2tbW1xsAI+NkI2PjJCNj4yPjY+Mj42PjI+Nj4yPjY6Mj4yOjI+MjoyPjI6Mj4yOjI+MjouPjI6Lj4yOi4+MjouPjI6LjoyOi46MjouOjI6LjoyOi46MjouOjI6LjoyOi46MjouPjI6Lj4yOi4+MjoyPjI6Mj4yOjI+NjoyPjY+Mj42PjI+Nj4yQjY+MkI2PjZCNj42QjY+NkI6QjZCOkI2RjpCOkY6QjpGPkY6Rj5GPko+Rj5KQkpCTkJOQk5GTkZSSlJKVk5WTlpSWlJeVl5WZl5mYnJufoKeor7K6vcLCxsLBu7qysKqqpaWipKKkoaWipaKmo6ajp6SmpKelp6WopaelqKaopaimp6WopaelqKWnpKilp6Snpaekp6SmpKekpqSnpaemqqqvsLi6wcLHxcbAv7e1rq6oqKWnpKWjpqOkoqWipKGkoaKgoqChnqGeoJ2fnJ6bnpucmZyZmpeal5mWmJWXlJeUlZKVkpSRk5CSj5KPkY6Rjo+Mj42Oi46LjYqNi4yJjIqLiYyJi4iLiIqHioiKh4qHiYaKh4mGiYaIa3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1trW2tbbFxsXACMj4yOjI+MjoyPjI6Mj4uOjI+LjoyOi46MjouOjI6LjYyOi42LjouNi46LjYuOi42LjouNi46LjYuOio2LjoqNi46KjYuOio2LjoqNi46KjYuOio2LjoqNi46LjYuOi42LjouNi46LjYuOi42MjouOjI6LjoyOi46MjouOjI+LjoyPjI6Mj4yOjI+Mjo2PjI+Nj4yPjZCMj42QjY+NkI2PjpCNkI6RjpCOkY6Rj5KOkY+Sj5KQk5CSkZSRk5KUkZSTlZOVlJeUl5WYlpqZnp2jpayttbi/v8PBwry7tLKrqqWmoaOho6CjoaShpKKloqWjpqOlpKajpqSnpKakp6SmpKekpqSnpKakp6OmpKajpaSmo6WjpqOlo6aipaOmo6emq6uytLy9w8THwsG7uLGvqqqlpqOloqSipKGjoaOgoqCin6GfoZ2gnZ+cnpyempyanJmbmJqXmZaZlZeVl5OVk5WRlJGTkJKQko6QjpCNj42PjI6MjoqNi42JjIqMiIuJi4iKiIqHiYeKhomHiYaIhomFiIaIhYeFa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tba1trW2tba1trW2tba1trW2tcbFxsXGwAkI6QjZCOkI2QjpCNkI6PjZCNj42QjY+NkI2PjZCNj4yQjY+MkI2PjI+Nj4yPjY+Mj42PjI+Nj4yPjY6Mj42OjI+NjoyPjY6Mj42OjI+NjoyPjY6Mj42PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+MkI2PjJCNj4yQjY+NkI2PjZCNj42Qjo+NkI6QjZCOkI2RjpCNkY6QjpGOkI6Rj5GOkY+RjpKPkY+SkJKPkpCSkJORk5CUkZORlJKUkpWTlZOWlJaUl5WXlZiWmZebmZ2coqOpq7S2vb7Ew8S/v7i2r66op6OloqShpKKkoqWjpaOmpKakp6WnpKilp6WopaelqKWnpailp6WopaekqKWnpKelpqSnpKakp6Smo6ekpqSopqmpr7G3usHDx8TGwL62ta6sp6mlpqOmo6WipaKkoaSho6CjoKKfop+gnaCdn5yfnJ2anZqbmJuYmZaZlpiVl5SWk5aTlJGUkZOQk5CRjpGOkI2QjY+Mj4yOi46LjYqNioyJjImLiIuJioiLiIqHioeJh4qHiYaJa3tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2xcbFxsXGxcAIyOjI+MjoyPjI6Mj4uOjI+LjoyPi46MjouOjI6LjoyOi46MjouNjI6LjYuOi42LjouNi46LjYuOi42LjouNi46KjYuOio2LjoqNi46KjYuOio2LjouNi46LjYuOi42LjouNi46LjYuOi42LjouNjI6LjoyOi46MjouOjI6LjoyPi46Mj4yOjI+MjoyPjI6Nj4yPjY+Mj42QjI+NkI2PjpCNkI6RjZCOkY6Rj5KOkY+Sj5KQk5CTkZSRlJKVkpWTlpOWlJeVmJebmZ6fpqeusbm6wMDDv7+5t6+uqKiio6Cjn6Kgo6CjoaShpKKloqSjpaKlo6ajpaSmo6akpqOmpKajpaOmo6WjpqKlo6WipKOloqSipaKkoqWipaOnpaqrsbO6vcPCxcHBubewrqiopKaipKKkoKOho6CioKKfoZ+hnaCdoJyenJ6anZqcmZuYm5eZl5mVl5WXk5WTlZKUkZOQkpCSjpCOkI2PjY+LjouOioyKjYmLiYyIi4iLh4qIioeJh4mGiIaJhYiGiIWHhYiEa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1trW2tba1trW2tba1trW2tba1trXGxcbFxsXFxcbACQjZCOkI2QjpCNkI6PjZCOj42QjY+NkI2PjZCNj42QjY+MkI2PjJCNj4yPjY+Mj42PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+Mj42PjJCNj4yQjY+NkI2PjZCNj42QjY+NkI6QjZCOkI2QjpCNkY6QjpGOkI6Rj5GOkY+RjpKPkY+SkJKPkpCSkJORk5CUkZORlJKUkpWTlZOWlJaUl5WYlpmYm5qfn6SmrbC3ucDAw8DCvLqzsquqpaaio6CjoaOhpKKkoqWjpaOmpKajp6SmpKelp6Snpaekp6WnpKekpqSnpKajp6Smo6akpaOmo6WjpqOlo6akpqSpqa6vt7nAwcbExL69trOsrKeno6ajpaKloqShpKGjoKOgop+in6CeoJ2fnJ+cnZqdmpuYm5ial5mWmJWYlZaTlpOUkZSRk5CTkJGOkY6QjZCNjoyOjI2KjYuMiYyKi4mMiYuIi4iKh4qIiYeKh4mGiYeIa3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1tsXGxcbFxsXGxcbFwAjY+Mj42PjI+Nj4yPjY+Mj42PjI+Nj4yOjY+MjoyPjI6Mj4yOjI+MjoyPi46Mj4uOjI+LjoyPi46MjouOjI6LjoyOi46MjouOjI6LjoyOi46MjouOjI6LjoyOi46MjouOjI+LjoyPi46Mj4uOjI+MjoyPjI6Mj4yOjI+Mjo2PjI+Nj4yPjY+Mj42QjI+NkI2PjZCNj46QjZCOkI2QjpGOkI+RjpGPko+RkJKPkpCTkJORlJGTkpWSlJOWk5aUl5SXlpqYnJyioqmss7W8vcK/wb28tbOtq6WloqOfoqCin6Kgo6CjoaShpKKloqWjpqKlo6ajpaOmo6WjpqOlo6ajpaOmoqWjpaKkoqWipKKloaSipaGkoqWipqWqqrGzu7zCw8XAwLm3r62oqKOloqSho6GjoKKgo5+in6KeoJ6gnZ+dn5udm52anJmbmJqYmpaYlpiUlpSWkpSSlJGTkJOPkY+RjZCNkIyOjI6LjYuNioyKjImLiYuIioiKh4mHioaJh4mGiIaIhYiGiGpra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tba1trW2tba1trW2tba1xsXGxcbFxsXGxcbFxcAJGOkI6RjpCOkY6QjpGOkI2RjpCNkY6QjZGOkI2QjpCNkI6QjZCOkI2QjpCNkI6PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCOkI2QjpCNkI6QjZCOkI2QjpCNkY6QjpGOkI6RjpCOkY+RjpGPkY6Sj5GPko+Rj5KQko+TkJKQk5GTkJSRk5GUkpSSlZOVk5aUlpSXlZeVmZeamJ2coaKpqrGzu7zBwMO/vri3sK6oqKSkoaOho6CkoaOhpaKloqajpaOmpKajp6SmpKelpqSnpaakp6SmpKekpqOmpKajpqSlo6ajpaOmo6WipqOlo6elqKiusLa5wMLGw8W/vLWzrKumqKSloqWipKGkoqOhpKGioKKgoZ6hnqCdoJ2em56bnJmcmZuYmpeZlpiVl5SXlJWSlZKTkJOQko+Sj5CNkI2PjI+MjouOi42KjYqMiYyJi4iLiIqIi4iKh4qHiYaJh4lqemp7a3tre2t7a3tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2xsXGxcbFxsXGxcbFxsXACMj42PjI+Nj4yPjY+Mj42PjI+Nj4yOjY+MjoyPjI6Mj4yOjI+MjoyPjI6Mj4uOjI+LjoyPi46Mj4uOjI6LjoyOi46MjouOjI6LjoyOi46MjouOjI6LjoyOi46MjouOjI6LjoyPi46Mj4uOjI+LjoyPjI6Mj4yOjI+MjoyPjI6Nj4yPjY+Mj42PjI+NkIyPjZCNj42QjZCOkI2QjpGOkI+RjpGPko+RkJKPkpCTkJORlJGUkpWSlZOWk5aVmJaamp+epKeur7a5vr3Bvr64t7GvqKejpJ+hn6GeoZ+in6Kgo6CjoaShpKKloqSipaKlo6WipaOloqWjpaKkoqWipKKloaSipKGjoaSho6GkoaOhpKGkoqakqaqwsrm8wsHEwL+4ta+tp6ejpaGjoaOgoqCin6Gfop6gnqCdn52fm56bnZqcmpyYmpialpiWmJSXlJaTlZKUkZORk4+Rj5GNkI2QjI6MjouNi42JjIqMiIuJi4eKiIqHiYeJhoiGiYWIhoiFh4WIampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1trW2tba1trW2tba1trW2tbbFxsXGxcbFxsXFxcbFxcXGwAkI2RjpCNkY6QjZGOkI2RjpCNkY6QjZGOkI2QjpCNkI6QjZCOkI2QjpCNkI6PjZCOj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42Qjo+NkI6QjZCOkI2QjpCNkY6QjZGOkI6RjpCOkY+RjpGPkY6Sj5GPko+Rj5KQko+TkJKQk5GTkZSSlJGVkpSSlpOVk5eUlpSYlpiXm5qenqWmrK62uL29wr/Au7q0squrpaWho6Cin6OgoqCkoaOhpaKkoqWjpaOmo6WjpqSmo6akpqOmpKajpqOlo6ajpaKlo6WipaOkoqWipKKloqSipaOlo6iora62uL/AxcPDvby0squrpqajpaKkoaSho6CjoaKfoqChnqGeoJ2gnZ6bnpudmpyZm5ibmJmWmZaXlJeUlZKVkpSRk5CSj5KPkI2QjY+Mj4yOi46LjYqNioyJjImLiIuIioeKiImHioeJhomGemp6anpqe2t7a3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tcbFxsXGxcbFxsXGxcbFxsXGxcAI2QjY+NkI2PjZCNj42QjY+NkI2PjZCMj42QjI+NkIyPjZCMj42PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+Mjo2PjI6Nj4yOjI+MjoyPjI6Mj4yOjI+MjoyPjI6Mj4yOjI+Mjo2PjI6Nj4yPjY+Mj42PjI+Nj4yPjY+Mj42QjI+NkI2PjZCNj42QjY+OkI2QjpCNkI6RjpCOkY6Rj5KOkY+Sj5KQk5CSkZOQk5GUkZSSlZKVk5aTlpWYlZmZnZyio6qrsrW7u7++wLu6tbOsq6amoaKfoZ6hn6KfoqCjoKOhpKGjoqShpKKloqSipaKko6WipKOloqSipaKkoqShpKKkoaOhpKGjoaSgo6GkoKOhpKGlpKmpr7K5u8HBxL+/uLaurKeno6ShpKCjoKOfoqCin6GfoZ6gnqCcnpyem52bnZmbmZuXmZeZlZeVl5SWk5WSlJGUkJKQko6QjpCNj42Pi46LjoqMioyJi4mLiIqIioeJh4qGiYeJhoiGiIWIhXpqamp6ampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tba1trW2tba1trW2xcbFxsXGxcbFxsXGxcbFxcXGxcXACRj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkI6Rj5COkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCNkY6QjZGOkI2RjpCNkY6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2RjpCNkY6QjZGOkI2RjpCOkY6QjpGOkI6RjpCOkY+RjpGPkY6Rj5GOko+Rj5KPkY+SkJKPk5CSkJORk5CUkZORlJKUkZWSlZKWk5WTl5SWlJiWmJabmZ2coqOpqrK0urvAv8G9vbe1r66op6OkoaKfoqCioKOho6GkoqSipaOloqajpaOmo6WjpqSmo6akpaOmo6WjpqOloqWjpaKloqSipaKkoaWipKGloqSipaSnp62utbe/wMTCxL67tLKrqqWno6SipKKjoaSho6CjoKKfop+hnqGen5yfnJ6bnZqcmZyZmpeal5iVmJWWk5aTlJGUkZOQk5CRjpGOkI2QjY6LjoyNio2KjImMiYuIi4mKiIuIioeKh4mGiYd6anpqemp6antre2t7a3tre2t7a3tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1trbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFwAjI+NkIyPjZCMj42QjI+NkIyPjZCMj42QjI+NkIyPjZCMj42PjI+Nj4yPjY+Mj42PjI+Nj4yPjY+Mjo2PjI6Nj4yOjI+MjoyPjI6Mj4yOjI+MjoyPjI6Mj4yOjI+MjoyPjI6Nj4yOjY+Mj42PjI+Nj4yPjY+Mj42PjI+NkIyPjZCNj42QjY+OkI2QjpCNkI6RjpCPkY6Rj5KPkY+Sj5KQk5CTkZSRk5KUkZSSlZKVlJeUmJebmp+gpqeusLe3vb2/u7y3tq+tqKeio5+hnqCeoZ6gn6KfoaCjoKKho6CjoaSho6KkoaSipKGkoqShpKKkoaOhpKGjoaSgo6GjoKKgo6CioKOfoqCjoKKhpKOnqK+wuLvBwMO/vre0rqympqKkoKKgo5+in6KeoZ+hnqCeoJyfnJ+bnZudmZyZm5ial5mWmJWYlJaUlpKUkpSQkpCSjpGOkI2PjY+LjouOioyKjImLiYuIioiKh4mHiYaIhomFiIaIhYeFiGpqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1trW2tba1trW2tba1tsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcAJCOkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCNkY6QjZGOkI2RjpCNkY6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZGOkI2RjpCNkY6QjpGOkI6RjpCOkY+QjpGPkY6Rj5GOko+Rj5KPkY+SkJKPk5CSkJORk5CUkZORlJKUkpWTlZOWlJaUl5WXlZqYm5ugoKanrrC2t729wL2+ubixsauppKWhop+in6GfoqCioKOho6CkoqShpaKkoqWjpaKlo6WipaOloqWjpaKloqSipaKkoaSipKGkoqOhpKGjoaSho6GkoqSip6arrbS3vb/EwsK8u7SxqqqlpaKkoqOgo6GjoKOgop+in6GeoZ6fnZ+cnpuem5yZnJmal5qXmZaYlZeUlpOVkpWSk5CTkJGOkY6QjZCNjoyOjI2KjYqMiYyJi4iLiIqHioiJh4qHiYaJh4hqemp6anpqemp7a3tre2t7a3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1xsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXACNkI2PjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2PjpCNj46QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCMj42QjI+NkIyPjZCMj42QjI+NkIyPjZCMj42QjI+NkIyPjZCNj42QjY+NkI2PjZCNj42QjZCOkI2QjpCNkI6RjZCOkY6Qj5GOkY+SjpGPko+SkJKPkpCTkJORlJGTkpSRlJOVkpWUl5SYl5uZnp+kpauutLW7u7+8vbm4srCrqqSkoKKeoJ6gnaCeoZ6hn6KfoqCjoKOhpKCjoaSho6KkoaSipKGkoqSho6GkoaOho6CjoaOgoqCjoKKgo5+ioKOfoqCjoKSjqKeusLi5wMDDvr63ta2spqeio6GjoKKgop+hn6KeoJ6hnZ+dn5yenJ6anJqcmZuYmpeZl5mVl5WXk5WTlZGTkZOPko+RjpCOkIyOjI6LjYuNioyKjIiLiYuHioiKh4mHiYaIhomFiIaIampqempqanpqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tba1trW2tbbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFwAkY+RjpGPkY6Sj5GOko+RjpKPkY6Sj5GOko+RjpKPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+QjpGPkI6Rj5COkY6QjpGOkI6RjpCOkY6QjpGOkI6Rj5COkY+QjpGPkY6Rj5GOkY+RjpGPkY6Sj5GOko+Rj5KPkY+SkJKPkpCSj5OQkpCTkZOQlJGTkZSSlJGVkpSSlZOVk5aUlpSXlZeVmZibmp+fpKWsrrS1u7u/vb+7urSzraymp6Kjn6KfoZ6in6Gfo6CioKSho6GkoqShpaKkoqWjpaKlo6WipaOloqWipKKloqShpKKkoaSho6GkoaOgpKGjoKSho6Gko6alq62ztr2/w8HDvbqzsauppaajpKGkoaOgo6Cin6KgoZ+hn6CdoJ2fnJ+cnZqdmpuYm5ial5mWmJWXlJaTlpOUkZSRko+Sj5GOkY6PjI+MjouOi42KjYqMiYyJi4iLiIqHioeJh4qHiWp6anpqemp6anpqemt7a3tre2t7a3tre2t7a3tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcAI2PjZCNj42QjY+NkI2PjpCNj46QjY+OkI2PjpCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCMj42QjI+NkIyPjZCMj42QjI+NkIyPjZCMj42QjI+NkIyPjZCNj42QjY+NkI2PjZCNj46QjZCOkI2QjpCNkI6RjpCOkY6Rj5GOkY+Sj5GQko+SkJOQkpGTkJORlJGUkpWSlZOWlJeWmpidnaOjqauysri5vbu9ubmzsqyspaWhop6gnaCcn52gnaCeoZ6hn6KfoqCjoKKgo6CjoaOgo6GjoKOho6CjoaOgoqCjoKKgop+ioKKfoZ+in6Gfop6hn6KfoaCjoaanra+2ub+/wr6+trStrKWloqOfoqCin6GfoZ6gnqGdn52fnJ6cnpudmp2Zm5mbl5mXmZWXlZeTlpOVkpSRk5CSkJKOkI6QjI+MjouNi42KjIqMiIuJi4eKiIqGiYeJhoiGiIWHhYiEamp6ampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1trW2tba1trW2tcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXACRjpGPkY6Rj5GOkY+RjpGPkY6Sj5GOko+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkI6Rj5COkY+QjpGOkI6RjpCOkY6QjpGOkI6Rj5COkY+QjpGPkY6Rj5GOkY+RjpGPkY6Sj5GPko+Rj5KPkY+SkJKPk5CSkJOQkpCTkZOQlJGTkZSSlJKVk5WSlpOWk5eVl5WZl5uan5+jpKussrO5ub27vrq6tbWuraeoo6Ofop6gnqGeoZ6in6Gfo6CioKOho6GkoaOhpKKkoaSipKGkoqShpKKkoaSho6GkoaOgo6GjoKOgoqCjoKKgo6CioKOho6Gmpaqrs7W8vcPBwby6s7CqqqWloaSho6CjoKKfoqChnqGfoJ2gnZ+cn5yem52anJmcmZqXmpeYlZiVlpOWk5SRlJGTkJKPkY6Rjo+Mj4yOi46LjYqNioyJjImLiIuIioeKh4mGiYeIhnpqemp6anpqemp6anpre2t7a3tre2t7a3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2xsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFwAjpCNkI6RjZCOkY2QjpGNkI6RjZCOkY2QjpGNkI6RjZCOkY2QjpGNkI6RjZCOkY2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkY2QjpGOkI6RjpCOkY6Qj5GOkY+SjpGPko+RkJKPkpCTkJKQk5CTkZSRk5KUkZSSlZKVlJeUl5aamZ2eo6Opq7Gxt7i8ury5urSzrq2npqKjnqCdoJyfnaCdoJ6hnqGfop+hoKKfoqCjoKKho6CjoaOgo6GjoKOho6CioKOgoqCin6Kgop+hn6KfoZ+inqGfop6hn6Kfo6Kmpqyvtri+v8K+vbe1raumpqGjoKKfoZ+inqGfoZ6gnqCdn52fm56bnpqcmpyYmpialpmWmJWXlJaTlZKUkZORk4+Rj5GNkI2PjI6MjoqNio2Ji4mLiIqIioeJh4qGiYaJhYiGiIVqanpqamp6ampqempqantra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tba1trXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcAJKPkY+Sj5GPko+Rj5KQkY+SkJGPkpCRj5KQkY+SkJGPkpCRj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPkpCRj5KQko+SkJKPk5CSkJOQkpCTkZOQk5GTkJSRk5GUkpSRlZKUkpWTlZOWlJaUl5WXlZmYm5qfn6Skq6yxsri4vLu+urq1tbCuqKmkpKCin6CdoZ6gnqGfoZ+ioKKgo6GjoKSho6GkoqShpKKkoaSipKGkoqShpKGjoaSho6CjoaOgo6CioKOgop+joKKfo6CioKOipaSqq7K0vL3CwMK8urOxqqmkpqKjoKOgoqCjoKKfop+hnqGeoJ2gnZ6cnpudmp2am5ibmJmWmZaXlJeUlpOVkpSRk5CSj5KPkI2QjY+Mj4yNi46LjImMiouIi4mKiIuIioeKh4mGiWp6anpqemp6anpqemp6a3tre2t7a3tre2t7a3tre2t7a3tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXACNkI6QjZCOkY2QjpGNkI6RjZCOkY2QjpGNkI6RjZCOkY2QjpGNkI6RjZCOkY2QjpGNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6RjZCOkY6QjpGOkI6RjpCPkY6Rj5GOkY+Sj5GPko+SkJKPkpCTkJORk5CTkZSRlJKVkpWTl5SXl5qZnZ6jo6mqsLC2tru5u7i5tLOuraenoqOeoJ2fnJ6cn5yfnaCdoJ6hnqCfoZ6hn6KfoaCin6Kgop+ioKOfoqCin6Kgop+hn6KfoZ+hnqGfoZ6gnqGeoJ6hnqCeoZ6gn6KgpaasrbW3vr3Bvb22s62rpaWho5+hn6GeoJ6hnaCeoJ2fnZ+cnpyempyanJmbmJuXmZeZlZeVl5OVk5WRk5GTj5KPkY6QjpCMjoyOi42LjYmLiYyIioiKh4mHioaIhomFiIaIhYdqempqanpqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1trW2tba1xsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFwAkY+Sj5GPko+Rj5KPkY+SkJGPkpCSj5KQko+SkJKPkpCRj5KQkY+SkJGPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+SkJKPkpCSj5KQko+TkJKPk5CSkJORk5CTkZOQlJGTkZSSlJGVkpSSlZOVkpaUlpOXlZeWmpibm6CgpKWrrLGyuLi7ub25ubW1r66oqaSkoKKeoJ2gnZ+doJ6gnqGfoZ+ioKKfo6CioKOho6CjoaOgpKGjoKSho6CjoaOgo6CioKOgop+ioKKfop+hn6KfoZ+in6GfoqCioKWkqaqxtLq8wcDAu7qzsKmppKSho6Cin6KgoZ+in6GeoZ6gnaCdn5yfnJ2anZqcmZuYmpealpiVmJWWk5aTlJGUkZKPko+RjpCOj4yPjI6LjouMioyKi4iLiYqIi4iJh4qHiYaJhnpqemp6anpqemp6anpqemt7a3tre2t7a3tre2tra3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcAI6RjpCPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpCPkY6Qj5GOkI+RjpCPkY6Qj5GOkY+RjpGPkY6Rj5GOkY+RjpGPko6Rj5KPkY+Sj5GPko+SkJKPkpCTkJKQk5CTkZOQk5GUkZSSlZKUk5aTlpSXlZiYnJqfn6Wkqquxsba3u7i7uLmzs66up6ejo5+gnZ+cnpyfnJ6doJ2fnqCdoJ6hnqGfop+hn6KfoqCin6Kgop+ioKKfoqCin6Gfop+hn6GeoZ+hnqCeoZ6gnqGdoJ6hnaCeoZ6ioaWlq621tr2+wb28trSsq6WloaKgop6hn6GeoJ6hnaCdoJyfnJ+bnZudmpyZnJiamJqWmJaYlJaUlpKVkpSRk5CSj5GPkY2PjY+LjouOioyKjImLiYuIioiKh4mHiYaIhomFiIaIampqempqanpqamp6ampqe2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXACTkJKPk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQko+TkJKPk5CSj5OQko+TkJKPk5CSj5OQko+TkJKQk5CSkJOQkpCTkJKQk5GTkJORk5CTkZOQlJGTkZSRk5GUkpSRlZKUkpWTlZKWk5WTlpSWlJiWmJebmp2doqKmp62us7O4uLu5vLi5tLSvrqippKSgop6gnaCdn52gnqCeoZ+hnqKfoZ+ioKKgo6CioKOho6CjoaOgo6GjoKOho6CjoKKgo6Cin6Kgop+in6Gfop+hnqKfoZ6in6GfoqGko6mqsLO6vMC/wbu5srGqqKOloaOgo6Cin6KfoZ+in6CeoZ6fnZ+dnpuem52anJmbmJuYmZaZlpeUl5SVkpWSk5CTkJKPkY+QjZCNj4yOjI2KjYqMiYyJi4iLiIqHioiJh4qHiWp6anpqemp6anpqemp6anpre2t7a3tre2t7a3tre2t7a3tre2t7a2tre2tra3tra2t7a2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFwAjpGPkY6Rj5GOkY+RjpGPkY6Rj5KOkY+SjpGPko6Rj5KOkY+SjpGPko6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5KOkY+SjpGPko+Rj5KPkZCSj5KQko+SkJOQkpCTkJORk5CTkZSRlJKVkpSTlpOWlZiWmpmdnKGip6asrbKyt7a6t7m2t7GxraympqKjnp+cnpudm56bnpyfnJ6dn5yfnaCdoJ6hnqCfoZ6hn6GeoZ+inqGfop6hn6GeoZ+hnqCeoZ6gnqCdoJ6gnZ+doJ2fnaCdn52gnaCeoZ+kpauss7a8vL+8vLWzrKukpKGinqCeoZ2gnqCdn52gnJ+cn5udm52anJqcmJuYmpeZlpmVl5WXk5WTlZGTkZOPkY+RjZCNj4yOjI6KjYqMiYuJi4iKiIqHiYeJhoiGiIWHhYiEamp6ampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tba1trW2xcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcAJKQk5CSkJOQkpCTkJKQk5CSkJORkpCTkZKQk5GSkJORkpCTkZKQk5GSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJORk5CTkZOQk5GTkJSRk5GUkZORlJKUkZSSlJGVkpSSlZOVkpaTlZOXlJeVmZeamJ2cn5+kpKmpr7C0tLm4uri6treysq2sp6ijo5+hnp+cn5yenJ+dn52gnqCdoZ6hnqGfoZ+ioKKfoqCin6Ogop+joKKfo6Cin6Kgop+in6Gfop+hnqGfoZ6hnqCeoZ6gnqGeoJ6hn6GfpKOoqbCyubrAvr+6ubKvqamjpKCjoKGfop+hnqGfoJ6hnp+doJ2em56bnZqdmpuYm5ial5mWmJWXlJaTlpKUkZSRko+Sj5CNkI2PjI+MjYuNi4yJjImLiIuIioeKiImHioeJhnpqemp6anpqemp6anpqemp6antre2t7a3tre2t7a3tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXACQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCTj5KQk5CSkJOQkpGTkJORk5CTkZSRk5GUkZSSlZKUk5WTlpSXlZiXmpmdnKGgpaWrqq+wtbS4t7q2uLS1r6+rq6WloaKen5yem52bnpudnJ6bnpyfnJ+doJ2gnqCdoJ6hnqCfoZ6hn6GeoZ+hnqGfoZ6hn6GeoJ6hnaCeoJ2gnqCdn52gnZ+doJyfnaCcn52gnaGgpKSqrLS1u7zAu7u1s6yqpaWgoZ+hnqCeoZ2gnqCdn52fnJ6cnpudm52ZnJmbmJqYmpaYlpiUlpSWkpSSlJCSkJKPkY6QjY+Nj4uNi42KjIqMiYuJi4eKiIqHiYeJhoiGiIWHanpqamp6ampqempqanpqamp6a2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2tsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXFwAlJGTkZSRk5GUkZORlJGTkZSRk5GUkpORlJKTkZSSk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSSlJGUkpSRlJKUkZWSlJKVkpSSlZOVkpWTlZOWlJaTl5SXlJiWmZebmp2coKCko6mprq6zs7e2uri6t7m0tK+wq6qlpqKinqGdn5yfnJ6cn52fnKCdoJ2hnqCeoZ+hnqKfoZ+ioKKfoqCin6Kgop+ioKKfoqChn6KfoZ+in6GeoZ+hnqGeoJ6hnqCdoZ6gnaGeoJ6ioKOiqKmvsbm7v73AurixsKmoo6Shop+in6Geop+hnqGeoJ2gnZ+cn5yem56bnJmcmZuYmpeZlpmWl5SXlJWSlZKTkJOQkY6RjpCNkI2Oi46LjYqNioyJjImLiIuIioeKh4mGiYd6anpqemp6anpqemp6anpqemp7a3tre2t7a3tre2t7a3tre2t7a3tra2t7a2tre2tra3tra2t7a2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcAI+SkJOPkpCTj5KQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk4+SkJOPkpCTj5KQk4+SkJOPkpCTj5KQk4+SkJOPkpCTkJKQk5CSkJOQkpCTkJKRk5CTkZOQk5GUkZORlJGUkpSRlJKVkpWTlpSXlpmXmpqenKGhpaWpqq+us7O3tbi2uLS1sbKsrKiooqOfoZyem52anJqdmp2bnpudnJ6bnpyfnJ+doJ2fnaCdoJ6gnaCeoZ2gnqGdoJ6hnaCeoJ2gnqCdn52gnJ+dn5yfnZ+cnpyfnJ6cn5yenJ+cn52hn6Okqquytbu7vru7tLKsqqSkoKKeoJ6gnZ+doJyfnZ+cnpyem52bnZqcmpyYmpialpmWmJWXlJaTlZKVkZORk4+Rj5GNj42PjI6MjoqMioyJi4mLiIqIioeJh4mGiIaIhYeFiGpqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tba2trW2tra1tra2tbbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcXFxcXACUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZWSlJGVkpSSlZKUkpWTlZKVk5WTlpOWk5eUlpSYlpiWmpmbmp+doaClpamprq6ysba1uLa5tre0tbGwq6ynp6KkoKCdn5yem56cnpuenJ6cn52fnKCdn52gnqCeoZ6gnqGfoZ6in6Geop+hnqKfoZ6in6GeoZ+gnqGeoJ6hnqCdoJ6gnaCdn52gnZ+doJ2fnaCeoJ6joqeor7G4ub+9vrm4sa+oqKOjn6KfoZ6hn6CeoZ6gnaCdn5yfnJ6bnpudmp2am5ibmJmWmZaYlZeUlpOVkpSRk5CSj5KPkI2QjY+Mj4yNio2KjImMiYuIi4iKh4qHiYaJh4hqemp6anpqemp6anpqemp6anpqe2t7a3tre2t7a3tre2t7a2tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcXFwAkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5KUkZSSlJGUkpWSlJKVkpWTlpOWlJeUmJaal5uanpygoKSjp6esq7CwtLK2tbi1t7S2sbGtrqippaWgoZ6fm52bnZqcmp2anZuem52cnpuenJ+cn52fnJ+doJ2fnqCdoJ6gnaCeoJ2gnqCdoJ6gnZ+doJ2fnaCcn52fnJ+dn5yenJ+cnpyfm56cn5yenJ+doJ+ko6mss7S6u766urSyq6mkpJ+hnqCdoJ2gnZ+doJyfnZ+bnpyemp2anZmbmZuYmpeZlpiWmJSWlJaSlJKUkJKQko6RjpCNj42Pi42LjYqMioyIi4iLh4qHioaJh4mGiIaIhWpqempqanpqamp6ampqempqanpra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2xcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXFxcXFxcAJWTlZKWk5WSlpOVkpaTlZKWk5WSlpOVkpaTlZKWk5WSlpOVkpaTlZKWk5WSlpOVkpaTlZKVk5WSlZOVkpWTlZKVk5WSlZOVkpaTlZKWk5WSlpOVk5aTlZOWlJaTlpSWk5eUl5SYlZiVmZeamJyanZugnqKhpaWoqK2ssK+0s7a1uba4tbe0tLCxrKynqKSkoKKen5yfnJ6bnpudm56cnpyfnZ+coJ2fnaCeoJ2hnqCeoZ+hnqGfoZ6hn6GeoZ+hnqGfoZ6hn6CeoZ6gnaGeoJ2gnqCdoJ2fnaCdn52gnZ+doJ2fnaGfoqKoqa+xuLq+vL65t7CvqaeipKChnqGfoZ6hnqCeoZ6gnaCdn5yfnJ6bnZucmZyZmpeal5mWmJWXlJeUlZKVkpOQk5CRjpGOkI2QjY6LjouNio2KjImMiYuIi4iKh4qHiYaJanpqemp6anpqemp6anpqemp6antre2t7a3tre2t7a3tre2t7a3tre2t7a3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXACRlJKVkZSSlZGUkpWRlJKVkZSSlZGUkpWRlJKVkZSSlZGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKVkZSSlZKUkpWSlJOVkpWTlpOWlJeUl5WYlpmYm5mcm5+doaGlo6enrKqvrrKxtLO3tLa0trKzsLGrrKipo6Shop2fnJ6anJqcmZyanJmcmp2anZuemp2bnpuenJ+cnpyfnJ+dn5yfnaCcn52gnJ+doJyfnZ+cn52fnJ6cn5yenJ+bnpyem56cnpudm56bnZuem52bnpuenKCeo6OqqrK0urm9urqzsaupo6OfoZ2fnaCcn52fnJ6cn5uenJ6anZudmZyZm5iamJqWmJaYlZeUlpOVkpSRk5CTj5GPkY2PjY+MjouOioyKjImLiYuHioiKhomHiYaIhoiFh4Vqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tba2trW2tra1tsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFwAlpSXlJaTl5SWk5eUlpOXlJaTl5SWk5aUlpOWlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOXlJaUl5SXlJeVl5WYlpiWmZeamJuZnJqenZ+eoqGko6inqqmurbCvtLO1tLi1t7S3tLWxsq6uqqunp6KkoKGdn5yem56bnZqdm52anpudm56cnpyfnJ+cn52fnaCdn52gnqCdoJ6gnaGeoJ2hnqCdoZ6gnaCeoJ2gnp+doJ2fnKCdn5yfnZ+cn5yenJ+cnpyfnJ6cn52gnqKip6ivsbe4vry9t7ewraenoqKfoZ6gnaGeoJ2gnp+doJ2fnJ+cnpuem5yZnJmbmJuYmZaZlpeUl5SWkpWSlJGTkJKPko+QjZCNj4yOjI2KjYqMiYyJi4iLiIqHioeJhomHiGp6anpqemp6anpqemp6anpqemp6a3tre2t7a3tre2tra3tra2t7a2tre2tra3tra2t7a2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcXFxcXFxcAJWYlJeVl5SXlZeUlpSXlJaUl5SWlJeTlpSWk5aUlpOWlJaTlpSWk5aUlpOVlJaTlZSWk5WUlpOWlJaTlpSWk5aUl5OWlJeUlpWXlJeVmJWYlpmWmZibmJuanZqenKCeoaCkoqalqaerq6+tsbC0sbWztrO2tLays7Cxra2qq6amo6SfoJ2fm52anZmcmpyZnJqcmZyanZqdm52anZuem56cnpuenJ+cnp2fnJ+dn5yfnZ+cn52fnJ+dn5yfnZ+cnpyfnJ6cn5uenJ6bnZyem52bnpudm56bnZuem52cnpyfn6OjqauytLq6vbm5s7GqqKOjn6CeoJyfnZ+cn52fnJ6cnpudm56anJqcmZuZm5eZl5mWmJWXlJaUlpKUkpSQkpCSjpCOkI2PjI+LjYuNioyKjIiLiIuHiYeKhomGiYWIhohqamp6ampqempqanpqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1xsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXFxcXFxcXFxcXACdm5yanZqcmZyZm5ibmZqYm5ial5qYmpeal5mXmpeZlpqXmZaZl5mWmZeZlpmXmZaZl5mWmZeZlpmXmZaal5mXmpiamJuZm5icmpyanZudm5+doJ6ioKOhpaOmpamnq6murK+usrG0sra0trS4tbe0trO0sLKurqqsqKikpaGinqGdnpuem52anZudmp2bnZqem52bnpyenJ+cnpyfnZ+coJ2fnaCeoJ2gnqCdoJ6gnaCeoJ2gnqCdoJ6gnaCdn52gnZ+cn52fnJ+dnpyfnJ6cn5yenJ+cnpyfnJ+coJ+ioqipr7G4ub27vbe2r66npqGjn6GeoZ6gnaCeoJ2gnZ+cn52enJ6cnZqdmpyZnJmal5qXmZaYlZeUlpOVkpWSk5CTkJGOkY6QjY+NjouOi42KjYqMiYyJi4iLiIqHioeJhnpqemp6anpqemp6anpqemp6anpqemt7a3tre2t7a3tre2t7a3tre2t7a3tre2tra3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXFxcXFwAoKKgop+hn6GeoJ6gnJ+dn5uenJ6bnZudmpyanZmcmpyZm5mcmZuZnJibmZuYm5mbmJuZnJmbmZyZnJqdmpybnpudnJ+cn52gnqGfoqCjoqWipqWopqmorKmtrLCtsbCzsbSytbK1s7aytLK0sLGur6usqKmlpqKkn6Gen5udmp2Zm5mcmJuZm5ibmZyZm5qcmZyanZqcm52anZuem52bnpuenJ6bnpyfm56cn5uenJ+bnpyfm56cnpuenJ6bnZuem52bnpqdm52anZudmpyanZqcmp2anJqdmp2cn56jpKqrsrS6uLu4uLGvqaiiop+gnJ+cn5yenJ+bnpyem52bnZqcmpyZm5mbmJqYmpaYlpiUlpSWk5WSlJGTkJKPkY+RjY+Nj4uOi42KjIqMiYuJi4eKh4qGiYaJhYiGiIWHampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tba2trW2tsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcAK6rrqusqqypq6irqKmmqaaopailp6SnpKajpqOloqWipKGkoqOhpKGjoaSho6GkoaOhpKKkoaWipKKlo6Wjp6SnpKimqKaqqKqprKqtq6+tsK6ysLKwtLK1s7a0trS3tLaztrO0sbOwsa2vq6yoqqamoqShoZ6gnZ6bnpucmp2anJmdmpyanZqcmp2bnZqem52bnpyem5+cnpyfnJ6cn52fnJ+dn5ygnZ+coJ2fnKCdn5yfnZ+cn52fnJ+cnpyfnJ6bnpyem56cnZuem52bnpudm56bnZufnJ+doqKnqK+xt7i9uru1ta6spqahop6hnp+doJ2fnaCdn5yfnJ6bnpydmp2anJmcmZuYmpiZlpmWl5SXlJWSlZKUkZOQko+Sj5CNkI2OjI6LjYqNioyJjImLiIuIioeKh4mGiYZ6anpqemp6anpqemp6anpqemp6anpre2t7a3tra2t7a2tre2tra3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcXFxcXFxcXFxcXQC0trO1s7WytLK0sLOws6+xr7GusK6wra+tr6yurK6rrautqqyqramsqqyprKqsqayqrKmsqq2qrauuq66sr6yvrbCtsK+yr7Kws7CzsrWytbO2s7W0trO1s7aytLKzsLGvsKytqqynqaWnoqShop6gnZ+bnZqdmZuZnJibmZuYm5mcmJuZnJmcmpyZnJqdmpybnZqdm56bnZuem52cnpuenJ6bnpyem56cnpuenJ6bnpyem52bnpudm56anZudmp2bnZqcmp2anJqdmpyanZqcmp2anJuem5+fpKSqrLO0ubm8t7axr6inoqKen52fnJ6cn5yenJ+bnpyem52bnZqcmpyYm5ibl5mXmZWYlZeUlpOWkpSSlJCSkJKOkI6QjY+Mj4uNi42KjImMiIqIi4eJh4qGiIaJhYiGiGpqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV0Auri6t7u4ure6uLq3ure5t7q3uba5tri1uLa3tbi1t7S3tLa0t7S2s7a0trO2tLWztrS2s7a0trO3tLa0t7W3tLe1t7S4tbe1uLW3tLe1trS2s7WytbGzr7Kur6yuq6yoqqanpKaio6Cin6Cdn5yem52bnJqdmpyZnJqcmZ2anJqdm52anZudm56bnZuenJ6bn5yenJ+cnpyfnZ+cn52fnJ+dn5yfnZ+cn52fnJ+dn5yfnJ6cn5yem5+cnpuenJ6bnpudm56bnZuem52bnpudm56cnpygnqKiqKmvsbi4vLm7tbOtrKaloKKfoJ2gnZ+doJ2fnKCdn5yfnJ6bnpudmp2anJmbmZqXmpeYlZiVl5SWk5WSlJGTkJOQkY6RjpCNj4yOi46LjYqNiouJjImKiIuIioeKh4mGemp6anpqemp6anpqemp6anpqemp6a3tre2t7a3tre2t7a3tre2t7a3tra2t7a2tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXFxcXF1dXV1dALG0srWytbO2s7a0t7S3tbi0t7W4tbe2uLW4tri1uLa4tbe2uLW3tbi1t7W4tLe1t7S3tbe0trS3s7a0trO1s7aytbK1sbOxs7Cyr7GusK2vq62qrKiqp6mlpqOloaOgop6gnZ+bnZudmZuZm5iamJuYmpibmJqYm5iamZuYm5mcmJuZnJmbmpyZnJqdmZyanZqcm52anZudmp2bnpqdm56anZuemp2bnZqdm52anZudmpyanZqcmp2ZnJqcmZyanJmbmZyZm5mcmZuZnJmbmpyanZyfnqOkq6yytLm3ura2r62npqChnp+cnpyem56cnpudm56anZudmpyanJmbmZuXmpeZlpiWmJSWlJaSlZKUkZOQko+Rj5GNj42Pi46LjYqMioyJi4mLh4qHioaJhomFiIaIhYdqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2xsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXQCsqq2rrauvra+tsK6wrrGvsa+zsLKws7GzsbSytLG1srSytbK0srWytLK1srSxtbK0sbSxs7CzsLKvsq+xrrGusK2vrK6rraqsqKuoqaaopaejpqOkoaOgoZ6hnp+cn5ydmp2anJmcmpuZnJmbmZyZm5mcmpyZnJqcmZ2anJqdmpyanZudmp6bnZuem52bnpyem56cnpuenJ6bn5yem5+cnpufnJ6bnpyem56cnpuem52bnpudmp6bnZqdm52anZucmp2anJqdmpyanZudmp6cn56jo6ipsLK3t7y5ubOyrKqkpKChnaCdn5yfnZ+cn5yenJ+cnpuem52anZqcmZyZmpeal5mWmZaXlJeUlZKVkpOQk5CSj5GPkI2QjY6LjouNio2KjImMiYuIi4iKh4qHiYaJhnpqemp6anpqemp6anpqemp6anpqamp7a2tre2tra3tra2t7a2tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXV1dXV1dXV0AoaShpKKloqWjpqOmpKekp6Wopaimqaapp6qnqqirqKqpq6irqauoq6msqKupq6iqqKunqqiqp6mnqaaopqikpqSmo6WipaGjoaOfoZ+hnZ+dn5yem56anJqcmZuZnJibmZuYmpibmJqYm5iamJuYmpmbmJuZm5ibmZyZm5mcmZyanJmcmp2ZnJqdmpyanZqdm52anZudmp2bnZqdm52anZudmp2bnZqcmp2anJqdmZyanJmcmpyZnJqcmZuZnJmbmZyZm5mcmZuZnJmcmp2bn5+lpauttLS5uLq0tK6tpqWgoZ2fnJ6bnpyem52bnpudm52anJqdmZyZnJiamJqXmZeZlZeVl5SWk5WSlJGUkJKQko6QjpCMj4yOi42LjYmMiYyIioiLh4mHioaIhomFiIaIampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dAJ+dn52gnqCdoZ6hnqKfoZ+ioKKgo6GjoKSho6GkoqShpKKkoaWipKGloqShpaKkoaSio6GkoaOgo6Cin6KfoZ6hnqCdoJ2fnJ+cnpuem52anZucmp2anJmcmpyZnJmbmZyZm5mcmZuZnJqcmZyanJmdmpyanZqcmp2bnZqdm52anpudm56bnZuenJ2bnpyem56cnpuenJ6bnpyem56cnpuenJ6bnpudm56bnZuem52anZudmp2bnJqdmpyanZqcmp2anJqdmpyanZudnKCfo6Oqq7GyuLi7t7iysKqppKOfoZ6fnJ+dn5yfnZ+cn5yem56cnZuem5yanZqbmJuYmpeal5iVmJWWk5aTlZKUkZOQk5CRjpGOkI2PjI6LjouNio2Ki4mMiYqIi4iJh4qHiWp6anpqemp6anpqemp6anpqemp6anpqe2t7a3tre2t7a3tre2t7a2tre2tra3tra2t7a2tre2tra3tra2t7a2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXF1dXV1dXV1dXV1dXQCZm5mcmZuanJmcmpyZnJqdmpyanZqdm52anZuemp2bnpudm56bnZuem52bnpudm56anZudmp2bnZqcmp2ZnJqcmZuZnJibmZuYmpibmJqYm5eamJqXmpial5qYmpeamJqXmpibl5qYm5iamJuYmpmbmJuZm5ibmZyYm5mcmZuZnJmbmpyZnJqcmZyanJmcmpyZnJqdmZyanJmcmpyZnJqcmZyanJmbmZyZm5mcmJuZm5ibmZuYm5mbmJqYm5iamJuYmpibmJuZnJmdnKCfpaatrbO0uba3s7KrqqWkn6Ccnpudm56anZudmp2bnZqcmp2Zm5mcmJqYm5eZl5mWmJWYlJaUlpKUkpSQk5CSj5GOkY2PjY+LjouNioyKjIiLiIuHioeKhomGiYWIhoiFampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2xcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV0AnJmdmpyZnZqcmZ2anJqdmpyanZqcmp2anJqdmpyanZqcmp2anJqdmpyanZqcmp2anJmdmpyZnJqcmZyanJmcmpuZnJmbmZyZm5mcmZuYnJmbmJyZm5icmZuZnJmbmZyZm5mcmZuZnJqcmZyanJmcmpyZnZqcmp2anJqdmpyanZudmp2bnZqdm52anZudmp6bnZqem52anZudmp2bnZqdm5yanZqcmp2anJmdmpyZnJqcmZyam5mcmZuZnJmbmZyam5mcmpyanpyfnqSkqquys7i3ura1r6+pp6Kjn5+cn5yenJ+cnpufnJ6bnpudmp2bnJqdmpuYm5ial5qXmZaYlZeUl5SVkpWSk5CTkJKPkY6QjZCNjouOi42KjYqMiYyJi4iLiIqHioeJholqamp6ampqempqanpqamp6ampqempqantra2t7a2tre2tra3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxdXV1dXV1dXV1dXV1dXV1dAJmcmJuZnJibmZyYm5mcmJuZnJibmZyYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJqYm5iamJuYmpibmJqYm5iamJuYmpibmJqYm5iamJuYmpibmJqYm5iamJuYmpmbmJuZm5ibmZuYm5mcmJuZnJmbmZyZm5mcmZuZnJmbmpyZnJqcmZyanJmcmpyZnJqcmZyanJmbmpyZm5mcmZuZnJibmZuYm5mbmJuZm5iamJuYmpibmJqYm5iamJuYmpmbmJuanpygoaenra+1tLi2t7Gwqqmjo5+gnJ6bnpqdm56anZudmp2anZqcmpyZm5mbmJqYmpaZlpmVl5WXk5WTlZKUkZOQkpCSjpCOkIyPjI6LjYuNiYyJjIiKiIuHiYeJhoiGiYWIhmpqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXQCdmpyanZqcmp2anJqdmpyanZqcmp2anJqdmpyanZqcmp2anJmdmpyZnZqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnZqcmZ2anJqdmpyanZqcmp2anJqdm52anZudmp2bnZqdm52anZudmp2bnZqdm52anZqcmp2anJqdmpyZnZqcmZyanJmcmpuZnJmbmZyZm5mcmZuZnJmbmZyanJmdm52coaClpayus7S5t7i0tK6tpqehoZ2gnZ6cn5yem5+cnpuenJ6bnpudmp2anJmcmZuYm5iZl5mWmJWYlZaTlpOVkpSRk5CTkJGOkY6PjY+MjouOi42KjYqLiYyJioiLiImHioeJanpqemp6anpqemp6anpqemp6anpqempra3tra2t7a2tre2tra3tra2t7a2tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbV1dXV1dXV1dXV1dXV1dXV1dXV0AmJuZnJibmZyYm5mcmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJqZm5iamJuYmpibmJqYm5iamJuYmpibmJqYm5iamJuXmpibl5qYm5eamJuXmpibmJqYm5iamJuYmpibmJqYm5iamJuYmpmbmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJuZm5iamJuYmpibmJqYm5eamJqXmpial5qYmpeZl5qXmZeal5mXmpeZmJqXmpmcmZ2doqGnqa+vtbW4tLSvrqemoqKdnpudmpyanZqcmp2anJqdmZyanJmbmZuYmpial5mXmZWXlZeUlpSWkpSSlJCSkJKPkY6RjY+Nj4uNi42KjIqMiIuIi4eKh4qGiYaJhYiGiIVqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2trbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1NXV1dAJyanZqcmp2anJqdmpyanZqcmp2anJqdmpyanZqcmZ2anJmdmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpuZnJqbmZyZm5mcmZuZnJmbmZyZm5mcmZuZnJqbmZyam5mcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpuZnJmbmZyZm5mcmZuYm5mbmJuZm5ibmZqYm5iamJuYmpibmJqYm5mbmJyZnJqenaGgp6etrrS0uLW3srGrq6Wkn6GdnpuenJ2bnpudm56bnZqem52anZqcmZyZm5ibmJqXmpeYlZiVl5SWk5WSlZKTkJOQko+RjpCNkI2Oi46LjYqNioyJjImLiIuIioeKh4mGiWpqanpqamp6ampqempqanpqamp6ampqemtra3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXQCZnJmbmZyZm5mcmZuZnJmbmZyZm5mcmZuZnJmbmZyZm5mcmJuZnJibmZyYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYmpmbmJqZm5iamZuYmpibmJqZm5iamZuYmpmbmJqZm5iamZuYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJqZm5iamJuYmpibmJqYm5eamJuXmpial5qYmpeZl5qXmZeal5mXmpeZl5qXmZeal5mXmpeamJuYnJufnqOkqqqwsba0trOzrKympqCgnZ6anZqdmpyanZqcmp2ZnJqcmZuZnJibmJuXmpealpiWmJWXlZeTlZOVkZSRk5CSj5KOkI6QjI+MjouNi42JjImMiIqIioeJh4mGiIaJhYiGampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbFxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV0AnZudmp2bnZqdm52anZudmp2bnJqdm5yanZqcmp2anJqdmpyanZqcmp2anJqdmpyZnZqcmZ2anJmdmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyam5mcmZuZnJmbmZyZm5mcmZuYnJmbmJuZm5ibmZuYm5iamJuYmpibmJqYm5iamJuYmpibmJqYm5mbmZ2bnp2jo6ipsLG1tLi1tbCwqqijo5+fnJ+cnZuem52bnpudm56bnZqdm5yanZqcmZyZmpiamJmWmZaYlZeVlpOWk5SRlJGTkJKPkY6Rjo+Mj4yOi46LjYqNiouJjImKiIuIiYeKh4lqempqanpqamp6ampqempqanpqamp6ampre2tra3tra2t7a2tre2tra3tra2t7a2tre2tra3tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dAJibmZuYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYmpmbmJqYm5iamJuYmpibmJqYm5iamJuYmpibl5qYm5eamJuXmpibl5qYm5eamJqXmpial5qYmpeamJqXmpial5qYmpeamJqXmpial5qYmpeamJqXmpial5mXmpeZl5qXmZealpmXmpaZl5mWmZeZlpmXmZaYlpmWmJaZlpiWmZaYlpmWmJeZlpmXmpeamZybn6ClpautsrG1s7Wwr6qpo6Oen5udmpyZnJqcmZyanJmbmZyZm5mbmJqYm5eal5qWmJaYlZeVl5OWk5WSlJKUkJKQko6RjpCNj42Pi42LjYqMioyIi4iLh4qHioaJhomFiIaIhWpqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tba2trXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXQCcmZ2anJmdmpyZnZqcmZ2anJmdmpyZnZqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqbmZyam5mcmZuZnJmbmZyZm5mcmZuZnJmbmZyZm5icmZuYnJmbmJyZm5icmZuYnJmbmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJuZmpibmJqYm5iamJuYmpebmJqXmpial5qYmpeamJmXmpeZl5qXmZeal5mXmpeZl5qYmZeamJqYm5mcm6CfpKSrrLGxtrS2srOtrKamoaGdn5ydmp2bnZqdm52anZucmp2anJmcmpuZnJmamJqYmZaZlpiVmJWWk5aTlZKVkpOQk5CRjpGOkI2QjY6LjouNio2KjImMiYuIi4iKh4qHiYaJampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXF1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV0AmZuYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJuZm5ibmZuYmpmbmJqYm5iamJuYmpibmJqYm5iamJuYmpibl5qYm5eamJuXmpial5qYmpeamJqXmpial5qYmpeamJqXmpial5mYmpeZl5qXmZeal5mXmpeZl5qXmZealpmXmpaZl5mWmZeZlpmXmZaYlpmWmJaZlpiWmZaYlpmVmJaZlZiWmZaYlpmWmJeZlpmYm5mdnaKhp6murrOytbKyrq2npqGinZ6bnZmcmpyZnJqcmZuanJmbmZyYm5mbmJqYmpeZl5mWmJaYlJaUlpOVk5WRk5GTkJKPkY6QjpCMjoyOi42LjYmMiYyIioiKh4mHiYaIhomFiIZqampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dAJyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyanJmcmpyZnJqcmZyam5mcmpuZnJmbmZyZm5mcmZuZnJmbmZyZm5mcmZuYnJmbmJyZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJuZmpibmZqYm5iamJuYmpibmJqYm5ial5uYmpebmJqXmpial5qYmpeamJmXmpeZl5qXmZeal5mXmpeZlpqXmZeal5mXmpeZl5qYmpebmZuanp2hoaeora6zs7aztbCwqqqkpJ+gnZ6bnpudmp2bnZqdm52anZqcmp2anJmcmZuYm5ial5qXmZaZlpeUl5SWk5aTlJGUkZKQko+RjpGOj4yPjI6LjouNio2Ki4mLiYqIi4iJh4qHiWp6ampqempqanpqamp6ampqempqanpqamt7a2tre2tra3tra2t7a2tre2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxdXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXQCXmpial5qYmpeamJqXmpial5qYmpeamJqXmpial5qYmpeamJqXmpial5qYmpeZmJqXmZeal5mXmpeZl5qXmZeal5mXmpaZl5qWmZealpmXmZaZl5mWmZeZlpmXmZaZl5mWmZeZlpiXmZaYlpmWmJaZlpiWmZaYlpmVmJaZlZiWmJWYlpiVmJaYlZeVmJWXlZiVl5WYlZeVmJWXlZiVl5WYlZeVmJWYlpiVmJeal5ubn56jpKqqsLC0sbOwsKqppKSen5udmZuZnJibmZyYm5mbmJuZm5iamJuXmpial5mXmZaYlpiUl5SXk5WTlZGUkZSQkpCSjpCOkI2PjY+LjYuNioyKjIiLiIuHioeKhomGiYWIhoiFampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trW2tra1tra2tcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1NXU1dTV0AmpibmJqYm5mamJuZm5ibmZuYm5mbmJuZm5ibmZuYm5mbmJuZmpibmZqYm5iamJuYmpibmJqYm5iamJuYmpibmJqXm5ial5uYmpeamJqXmpial5qYmpeamJqXmpiZl5qYmZeal5mXmpeZl5qXmZeal5mWmpeZlpmXmZaZl5mWmZeZlpmXmJaZlpiWmZaYlpmWmJaZlpiWmZaYlpmWmJaZlpiWmZeZlpqYmpicm5+epKSpqrCws7K1sbGsrKemoaKdnpudmpyZnZqcmZ2anJmdmpyZnJqbmZyZm5ibmJqXmpeZlpmWl5WXlJaTlpOUkpSRk5CTkJGOkY6QjZCNjouOi42KjYqMiYyJi4iLiIqHioeJholqampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dAJealpmXmpaZl5qWmZeal5mXmpeZl5qXmZeal5mXmpeZl5qXmZealpmXmpaZl5qWmZealpmXmpaZl5mWmZeZlpmXmZaZl5mWmZeZlpiXmZaYlpmWmJaZlpiWmZaYlpmVmJaZlZiWmZWYlpiVmJaYlZiWmJWYlpiVl5WYlZeVmJWXlZiVl5WYlJeVmJSXlZiUl5WYlJeVmJSXlZiUl5WYlZeVmJWYlpmXmpmenKGip6etrbKws7GyrKynp6GhnZ6anJmcmJuZm5ibmZuYm5mbmJuZm5iamJqXmZealpiWmZWXlZeUlpSWkpWSlJGTkZOPkY+RjpCOkIyOjI6LjYuNiYyJjIiKiIqHiYeJhoiGiYWIhmpqampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xcbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dTV1NXQCamJqXmpial5qYmpeamJqXmpial5uYmpebmJqXm5ial5uYmpebmJqXmpial5qYmpeamJqXmpial5qYmpeamJqXmpiZl5qXmZeal5mXmpeZl5qXmZeal5mWmpeZlpqXmZaZl5mWmZeZlpmXmZaZl5iWmZaYlpmWmJaZlpiWmZaYlZmWmJWZlpiVmZaYlZmWmJWZlpiVmZaYlZmWmJaZlpmWmpeamJyanp2ioqenra2ysbSys66vqaijpJ+fm56bnJmdmpyZnZqcmZ2anJmcmpyZnJmbmJuZmpiamJmXmZeYlZiVl5SXlJWSlZKUkZSRko+Sj5GOkY6PjI+MjouOi42KjYqLiYuJioiLiImHioeJampqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxtXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV0AlZeWmJWYlpiVmJaYlZiWmJWYlpiVmJaYlZiWmJWYlpiVmJaYlZiWmJWYlpiVmJaYlZiWmJWYlpiVmJaYlZeWmJWXlZiVl5WYlZeVmJWXlZiVl5WYlJeVmJSXlZiUl5WXlJeVl5SXlZeUl5WXlJaUl5SWlJeUlpSXlJaUl5SWlJeTlpSXk5aUl5OWlJeTlpSXlJaUl5SWlJeUlpWXlJeVmJaZmJyan6ClpKqrr66ysLKtramooqKen5qcmZuYmpibmJqYm5iamJuYmpibl5qYmpeZl5mWmJaYlZeVl5SWlJaTlZKVkZORk5CSj5KOkI6QjY+Mj4uNi42KjIqMiIuIi4eJh4qGiYaJhYiGiIVqampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tba2trW2tra1tsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcbFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1NXU1dTV1NXU1dAJiVmZaYlpmWmJaZlpiWmZaYlpmWmJaZl5iWmZeYlpmXmJaZl5iWmZeYlpmXmJaZlpiWmZaYlpmWmJaZlpiWmZaYlpmWmJaZlpiVmZaYlZmWmJWYlpiVmJaYlZiWmJWYlpiVmJaXlZiVl5WYlZeVmJWXlZiVl5WYlZeUmJWXlJiVl5SYlZeUmJWXlJiVl5SYlZeVmJWXlZiWmJWZlpmXm5mcm6CgpKWrq6+us7GyrrCrqqWloKCcnpqcmZyZm5mcmZuZnJmbmZyZm5icmZuYm5ial5qYmZaZl5iVmJWXlJeUlpOVk5SRlJGTkJKQkY6RjpCNj42Oi46LjYqNioyJjImLiIuIioeKh4mGiWpqampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXQCUl5SWlZeUl5WXlJeVl5SXlZeUl5WXlJeVmJSXlZiUl5WYlJeVmJSXlZiUl5WYlJeVmJSXlZeUl5WXlJeVl5SXlZeUl5WXlJeVl5SXlZeUlpWXlJaUl5SWlJeUlpSXlJaUl5SWlJeTlpSXk5aUlpOWlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOWlJaTlpSXk5aUl5SWlJeUl5WYlZmYnJqenqOjqKmurbCvsq2uqqqkpKCgm52anJiamJuXmpibmJqYm5iamJuXmpial5mXmpaZl5mWmJaYlJeVl5OWk5WSlJKUkJOQk4+Rj5GNkI2QjI6MjouNi42JjImMiIqIioeJh4mGiIaJhYiGampqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbFxsbGxcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dTV1NXU1dTV0AmJWXlZiVl5WYlZeVmJWXlZiWl5WYlpiVmJaYlZiWmJWYlpiVmJaYlZiWmJWYlpiVmJaYlZiWmJWYlpiVmJaXlZiVl5WYlZeVmJWXlZiVl5WYlZeVmJWXlZiVl5SYlZeUmJWXlJeVl5SXlZeUl5WXlJeVl5SXlZeUl5WXlJeVl5SXlZeUl5WXlJeVl5SYlZeVmJWXlZmWmZeamZyboJ+kpKmprq2ysLKvsKyrpqeioZ2fm5yZnJmbmJyZm5mcmZuZnJmbmJyZm5ibmZqYm5ial5qXmZaZlpiVmJWWk5aTlZKVkpORk5CSj5KPkY6Qjo+Mj4yOi46LjIqNiouJi4mKiIuIiYeKh4lqampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXG1dbV1tXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NAJKVk5WSlZOWkpWTlpKVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpKVk5aSlZOWkpWTlpKVk5WSlZOVkpWTlZKVk5WSlZOVkpWTlZKVk5WSlZOVkpWTlpKVk5aTlZOWk5WUlpOWlJeVmJebmZ2doqGnp6yrr66wra6qqqWloKGcnZqbl5qXmpeZl5qXmZeal5mXmpeZl5qWmZeZlpiWmZWYlZiUl5SXk5aTlpKUkpSRk5GTj5GPkY6QjpCMjoyOi42LjYqMioyIi4iLh4mHioaIhomFiIaIhWpqampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tba2trW2tra1tra2tba2trW2xsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1NXU1dTV1NXU1dTV1NXQCVk5aTlZOWlJaTlpSWk5aUlpOWlJaTl5SWk5eUlpOXlJaTl5SWlJeUlpSXlJaUl5SWlJeUlpSXlJaUl5SWk5eUlpOXlJaTl5SWk5eUlpOXlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOWlJaTl5SWlJeUlpSXlZeUmJaYlpqYm5qfn6OjqKisrLCusa6wq6ump6KinZ+bnJmbmZqYm5iamJuZmpibmZqYm5iamJuYmpeamJmXmpeYlpmWl5WYlZaTlpOVkpWSlJGUkZKPko+RjpGOj4yPjI6LjouNio2KjImMiYqIi4iKh4qHiYaJampqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxtXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV0AkpSRlJKUkZSSlZGUkpWSlJKVkpSSlZKUkpWSlJKVkpSTlZKUk5WSlZOVkpWTlZKVk5WSlZOVkpWTlZKVk5WSlZOVkpWTlZKUk5WSlJOVkpSSlZKUkpWSlJKVkpSSlZKUkpWSlJKVkpSSlZKUkpWSlJKVkpSTlZKUk5WSlZOVkpWTlZKVk5aTlZOWk5aUmJWYl5uZnp6ioaanrKqurbCsrqqrpaWhoZydmpyYmpial5mXmpeZl5qXmZeal5mXmpeZl5mWmZeZlpiWmJWXlZeUlpSWk5WTlZGUkZSQkpCSj5GPkY2PjY+MjoyOio2KjYmLiYuIioiKh4mHiYaIhomFiIVqampqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tba2tsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dTV1NXU1dTV1NXU1dAJWSlJKVk5SSlZOVkpWTlZKVk5WSlpOVkpaTlZKWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpOVk5aTlZOWk5WTlpSWk5aUlpOWlJaTl5SWlJeVl5SYlpiWmpmcm6Cfo6OoqKyrsK6wra+rq6anoqKen5ucmZyZmpibmJqYm5iamJuYmpibmJqYm5ial5qYmZeal5mWmZaYlZiVl5SXlJaTlpOUkpSRk5CTkJKPko+QjZCNj4yPjI6LjouMioyKi4iLiYqHioiJh4qHiWpqampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbF1tXW1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTQCPkpCTkJKQk5CSkJOQkpGTkJORk5CTkZOQk5GTkJORlJCTkZSQk5GUkJORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkZORlJGTkZSRk5KUkZSSlJGUkpSRlJKVkZSSlZKVk5aTlpSXlZiXm5menqKhpqarqa2srqusqaqkpaChnJ2am5eZl5mWmJaZlpiXmZaZl5mWmZeZlpiWmZaYlpiVmJWYlJeVl5SWlJaTlZOVkZSRlJCSkJKPkY+RjZCNkIyOjI6LjYuNiYyJjIiKiIuHiYeKhoiGiYWIhoiFampqWmpqalpqampaampqWmpqalpqampaampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2xsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxsXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1dTV1NXU1dTV0Ak5CTkZOQlJGTkJSRk5GUkZORlJGTkZSSk5GUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGVkpSRlZKUkZWSlJGVkpSRlZKUkZWSlJGVkpSSlZKUkpWSlJKVkpSSlZKUkpWSlJKVkpSSlZKUkpWTlZKVk5WSlZOVkpaTlZOWk5WTlpSWlJeVmJaamZyboKCko6ioq6qvra6rramqpaahoZ2fm5yYm5ial5qXmZeamJqXmpial5qYmpeamJmXmpeZlpmXmJaZlpiVmJWXlJeUlpOWk5SSlJKTkJOQko+Sj5COkI2PjI+MjouOi42KjYqLiYyJioiLiImHioeJholqampqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxdbV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NAI+Sj5GPko+Rj5KPkpCSj5KQko+SkJKPkpCTj5KQk5CSkJOQkpCTkJKQk5CSkJOQkpGTkJKRk5CTkZOQk5GTkJORk5CTkZOQk5GTkJORk5CTkZOQk5GTkJORlJCTkZSQk5GUkZORlJGTkZSRk5GUkZSSlJGUkpSRlJKVkpWTlpOWlZiWmZmdm5+fpKOnp6uprautqquoqKOkoKCcnZmbl5mXmZaYlpmWmJaZlpiXmZaZl5mWmJaZlpiWmZWYlpiVl5WXlJaUlpOVk5WSlJKUkZORk4+Sj5KOkI6QjY+Nj4uOi46KjIqMiYuJi4iKiIqHiYeJhoiGiYWIhWpaampqWmpqalpqampaampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra1tra2tba2trW2tra1tra2tcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dTV1NXU1dTV1NXU1dTV1NXQCSkJKPk5CSkJOQkpCTkJKQk5GSkJORk5CTkZOQk5GTkJSRk5CUkZORlJGTkZSRk5GUkZORlJGTkZSRk5GUkpORlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlZKUkZWSlJGVkpSSlZKUkpWSlJKVk5WSlZOVkpaTlZOWlJeUmJaZl5ybnp2ioaWlqqmsqq6sraqsqKikpaChnJ6am5ibmJmXmpeZl5qXmZeamJqXmpial5qYmZeal5mWmpeZlpmWmJWYlZeUl5SWk5aTlZKVkpSRlJGTkJKQkY6RjpCNkI2PjI+MjYqNi4yJjImLiIuJioeKiImHioeJampqampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXW1dbV1tXW1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU0AjZCOkI2QjpGNkI6RjpCOkY6QjpGOkY+RjpGPkY6Rj5GOkY+SjpGPko6Rj5KPkY+Sj5GPko+Rj5KPkZCSj5GQko+SkJKPkpCSj5KQko+SkJKPkpCTj5KQk4+SkJOQkpCTkJKQk5CTkZOQk5GTkJORlJGTkpSRlJOWk5aVmZeamp6coaGlpKinq6msqqyoqaWmoaKen5qbmJqWmJaYlZeWmJWYlpiVmJaYlZiWmJWYlpiVmJaYlZeVmJSXlZeUlpSWk5WTlZKUkpSRk5GTj5KPko6QjpCNj42PjI6MjoqNio2Ji4mLiIqIioeJh4mGiIaJhYiFiIRqWmpaalpqWmpqalpqampaampqWmpqalpqamtba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tba1trXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1dTV1NXU1dTV1NXU1dAJCOkY+RjpGPkY6Sj5GOko+Rj5KPkY+SkJGPkpCSj5KQko+SkJKPk5CSj5OQkpCTkJKQk5CSkJOQkpCTkJKQk5GTkJORk5CTkZOQk5GTkJORk5CUkZOQlJGTkZSRk5GUkZORlJKUkZSSlJGVkpSSlZOVk5aUl5WZl5qZnZygn6Sjp6aqqayqraqrqKqlpqGjnp+bnZmal5qXmZaZl5iWmZeZlpmXmZaZl5mWmZeZlpmXmJaZlpiVmJaYlZiVl5SXlJaTlpOVkpWSlJGUkZOQk5CRjpGOkI2QjY+Mj4yNi46LjImMiouIi4mKh4qIiYeKh4mGiWpqampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbF1tXW1dXV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTQCNkI2PjZCNj46QjZCOkI2QjpCNkI6RjZCOkY6QjpGOkI6RjpCPkY6Rj5GOkY+RjpGPko6Rj5KOkY+Sj5GPko+Rj5KPkY+Sj5GQko+SkJKPkpCSj5KQk4+SkJOQkpCTkJKRk5CTkZOQk5GUkZSSlZKVlJeVmJebmZ2doZ+ko6elqairqKuoqqWno6SfoJydmZqYmZaYlpiVl5WYlZeVmJWYlpiVmJaYlZiWmJWXlpiVl5WYlJeVl5SWlJaTlZOWkpSSlZGTkZSQkpCSj5GPkY6QjpCMj4yPi42LjYqMioyJi4mLiIqIioeJh4mGiIaJhYiFalpqampaampqWmpqalpqampaampqWmpqalpra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1xsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dTV1NXU1dTV1NXU1dTV1NXU1dTV0AkY6QjpGOkI6Rj5COkY+RjpGPkY6Sj5GOko+Rj5KPkY+Sj5GPkpCSj5KQko+SkJKPk5CSj5OQkpCTkJKQk5CSkJOQkpCTkZOQk5GTkJORk5CUkZOQlJGTkZSRk5GUkpSRlJKUkpWTlZKWlJaUmJaZl5uanZyhoKOip6app6upq6mrqKmlp6Ojn6CcnZmcmJqXmZeYlpmWmJaZl5iWmZeZlpmXmZaZl5mWmZeYlpmWmJWZlpiVmJWXlJeUlpOWlJWSlZOUkZSRk5CTkJKPko+RjpGOj42PjY6LjouNio2KjImMiYuIi4iKh4qIiYeKh4lqampqampqampqampqampqampqampqampqampra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbFxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbV1tXW1dbV1tXW1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dTV5OAIyOjI+MjoyPjI+Nj4yPjY+Mj42QjI+NkI2PjZCNj42QjZCOkI2QjpCNkI6RjZCOkY2QjpGOkI6RjpCOkY6Qj5GOkY+RjpGPkY6Rj5KOkY+Sj5GPko+RkJKPkpCTj5KQk5CTkZSRlJOWk5eWmZebmp6coKCkoqalqaapp6qmqKWmoqOfoJydmpuXmZaYlJeVl5SWlZeUl5WXlJeVl5SXlZiUl5WXlJeVl5SXlZeUlpSXk5aUlpOVk5WSlJKUkZORk5CSkJKPkY+RjpCOkIyPjI+LjYuNioyKjImLiYuIioiKh4mHiYaIhomFiIWIhGpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaaltrW2tba1trW2tba1trW2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1trW2tba1trW2tba1trW2tba1trW2tbbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXGxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1dTV1NXU1dTV1NXU1dTV5OXgCPjZCNj42QjpCNkI6QjZCOkI2RjpCOkY6QjpGOkI6Rj5GOkY+RjpGPkY6Sj5GOko+Rj5KPkY+Sj5GPkpCSj5KQko+SkJKPk5CSkJOQkpCTkJKQk5GTkJSRk5GUkpSSlZOVk5eVmJaamZyan52hn6SjpqSpp6mnq6ippqilpaGjn5+cnZqbl5qXmJWYlpeVmJaXlZiWmJWYlpiVmZaYlZmWmJWYlpiVmJaXlZiVl5SXlZaUl5SWk5aTlZKVkpSRlJGTkJOQko+Sj5GOkY6PjZCNjouOi42KjYqMiYyJi4iLiIqHioiJh4qHiYaJampaampqampqampqampqampqampqampqampqa2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsXGxsbFxsbGxcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXG1dbV1tXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTl5OXk4AjI+MjoyPjI6Mj4yPjY+Mj42PjI+NkIyPjZCNj42QjY+OkI2QjpCNkI6QjZCOkY2QjpGOkI6RjpCOkY6Qj5GOkY+RjpGPko6Rj5KPkY+Sj5KQko+SkJOQk5GUkZSTlpSXlpmXmpqdm5+foqCko6ekqKappqimp6OloqOen5ydmZuYmZaYlZeUlpSXlJaUl5SWlZeUl5WXlJeVl5SXlZeUl5WXlJaUl5SWlJeTlpSWk5WTlZKUkpWRlJGUkJOQk4+Rj5KOkI6QjY+Nj4yOjI6LjYuNioyKjIiLiYuHioiKh4mHiYaIhoiFh1pqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpba1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba1trW2xcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxsXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dTV1NXU1dTV1NXU1dTV1NXU1eTl5OXk5eAJCNj42QjY+NkI6QjZCOkI2RjpCNkY6QjpGOkI6Rj5GOkY+RjpGPkY6Sj5GOko+Rj5KPkY+SkJKPkpCSj5KQko+TkJKQk5CSkJORk5CUkZORlJKUkpaUlpSYlpiXm5mcmp+doJ+joqWjp6aopqqnqaaopaajpaGhnZ+cnJmbmJmWmZaYlZiVl5WYlZeVmJaYlZiWmJWYlpiVmJaYlZiWmJWYlpeVmJWXlJeVl5SXlJaTlpOVkpWTlJKUkpORk5GSj5KQkY6RjpCNkI2PjI+MjouOi42KjYqMiYyJi4iLiIqHioeJhoqHalpqampqampqampqampqampqampqampqampqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2trbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxtXW1dbV1tXW1dbV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU5eTl5OXk5eTgCLjYyOi46MjouOjI+LjoyPjI6Mj4yOjY+Mj42PjI+NkIyPjZCNj42QjY+NkI2PjpCNkI6QjZCOkY2QjpGOkI+RjpGPko6Rj5KPkpCTkJORlJKVk5eUl5aal5uanpufnqKgo6Kmo6alp6SnpKajpKGjn6CdnpqbmJqWmJWXlJaUlpOVk5aTlZSWk5aUlpOWlJaTlpSXk5aUl5OWlJaTlpSWk5WTlpOVk5WSlZKVkpSSlJGTkZOQkpCSj5GPkY6QjpCNj42PjI6MjouNi42KjIqMiIuJi4eKiIqHiYeJhoiGiIWHhYhaalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1tsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcbFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1dTV1NXU1dTV1NXk5eTl5OXk5OTl4Aj4yPjY+MkI2PjZCNj42Qjo+NkI6QjZCOkI2RjpCOkY6QjpGOkI6Rj5GOkY+RjpKPkY6Sj5GPkpCSj5KQkpCTkZOQlJGUkZWTlZOWlJeVmZeamJyanZugnqGfo6Klo6elp6Wopaekp6SloqSgoZ2fnJ2Zm5iZlpmWl5SXlZaUl5SWlJeVl5SXlZeUl5WXlJiVl5SYlZeUmJWXlJeVl5SXlZaUl5SWk5aUlZOWk5WSlZKUkZSRk5CTkJKPko+RjpGOkI2QjY+Mj4yOi46LjYqNioyJjImLiIuIioeKh4mGiYeIhmpqalpqampaampqWmpqalpqampaampqWmpqalpra2tba2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2xsbGxsbGxsXGxsbFxsbGxcbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbV1tXW1dbV1dXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1OXk5eTl5OXk5eTl5OAIyOi46Mj4uOjI+MjoyPjI6Nj4yPjY+Mj42QjI+NkI2PjZCNj46QjZCOkI2QjpGOkI6RjpGPko+RkJKPkpCTkJOSlZKVk5eUl5aZl5qZnJqdnKCdoaCjoaSjpqOmpKajpqOloaOhop6gnZ6am5malpiWmJSWlJaTlZOWk5WTlpOVk5aTlZSWk5aUlpOWlJaTlpSWk5aUlpOWlJaTlZOWk5WTlZKVk5WSlJKUkZORlJCSkJOPko+SjpGOkY2QjZCMj4yPi42LjoqMio2Ji4mMiIqIi4eKh4qGiYeJhoiGiIWHWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaaltrW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tbbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXGxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dTV1NXU1dTV1NXU1dTV5OXk5eTl5OXk5eTl5OTgCQjY+NkI2PjZCOkI2QjpCNkY6QjpGOkI6RjpCOkY+RjpGPkY+Sj5GPkpCSj5OQkpCTkZORlJKUkpaTlpSXlZiWmZeamJyanZufnaCeoqCjoaWjpaOnpKekp6Smo6aipKCin6Ccn5ucmZuYmZaZlpeUl5SWlJeUlpSXlJaUl5SWlJeVl5SXlZeUl5WXlJeVl5SXlZeUl5WXlJeUlpSXlJaTlpSVk5aTlZKVkpSRlJKTkJORkpCTkJGPko+QjpGOj42PjY6MjoyNio2LjIqMiouJjImLiIuIioeKh4mGiYdqWmpqalpqampaampqWmpqalpqampaampqWmpqamtra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsbGxsbGxsbGxsbGxsbGxsbGxcbGxsXGxsbFxsbGxcbGxsXGxsbFxsbGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXG1dbV1tXW1dbV1tXW1dbV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTl5eXk5eTl5OXk5eTl5OXk4Ai46MjouOjI+MjoyPjI6Mj4yPjY+Mj42QjY+NkI2QjpGNkI6RjpGPko+SkJOQk5GUkZSTlZOWlJeVmJeal5qZnJqdnJ+doJ+in6KhpKGkoqWipKKloaOho5+hnqCcnZqcmJqXmZWXlZeTlZOVkpSSlZKUkpWSlJKVkpSTlZKVk5WSlZOWkpWTlpKVk5aSlZOWkpWTlZKVk5WSlJKVkZSSlJGTkZSQk5GTkJKQko+Rj5GOkI6QjY+Nj4yOjI6LjYuNioyKjImLiYuIioiLh4mHioaJh4mGiIaIhYeFalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaa1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXGxcXFxsXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXU1dTV1NXU1dTV1NXU1dTV1NXU1dTl5OXk5eTk5OXk5OTl5OTk5OAI+NkI2PjZCOkI2RjpCOkY6QjpGPkY6Sj5KPkpCSkJORk5GUkpSSlpOWk5eVl5WZl5mXm5mcmp2bnpygnqCeoqCjoaSipKKlo6WipqOloqWio6Cin6Cdn5ydmpyZmpeZlpiVl5SWk5aUlZOWk5WTlpOVk5aTlZOWlJaTlpSWk5aUlpOXlJaTl5SWk5eUlpOWlJaTlpSWk5aTlZOWk5WSlZKUkZWSlJGUkZOQk5CSj5KPkY6RjpCNkI2PjI+NjouOjI2KjYuMiYyKi4mMiYqIi4iKh4qHiYaJh4haalpqWmpaalpqWmpaalpqWmpaalpqWmpaampqWmpra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2xsbFxsbGxcbGxsXGxsbFxsbGxcbGxsXGxsbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXW1dbV1tXW1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXU1eTl5OXk5eTl5OXk5eTl5OXk5eTgCNj4yPjZCNj46QjZCOkY6Rj5KPkpCTkJORlJGUkpWSlZSXlJeWmZaZmJuYm5qdmp2cn5yfnqGeoaCjoKOhpKGjoqSho6GjoKKgop6gnp+cnZudmZuYmpaYlZiUlpSWkpWTlZKUkpWRlJKVkZSSlZKUkpWSlJKVkpSTlZKVk5WSlZOVkpWTlZKVk5WSlZOVkpSSlZKUkpWRlJKUkZORlJCTkZOQkpCSj5GPko6RjpGNkI2QjI+Nj4uOjI6KjYuNioyKjImLiYuIioiKh4mHiYaIhomFiIaIhWpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmtba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcbFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1NXU1dTV1NXU1dTV1NXU5eTl5OXk5eTl5OXk5OTl5OTk5eTk4Ako+Sj5OQk5CUkZSRlZOVk5aUlpSYlZiWmZeZl5uZm5mdm52bn52fnaGfoZ+ioKOgpKKkoaWipKKloqShpKKjoKOgoZ6hnp+cn5udmZyZmpeal5iVmJWWlJaUlZOWk5WSlZOVkpWTlZKWk5WTlpOVk5aTlZOWlJaTlpSWk5aUlpOWlJaTlpSWk5aUlpOWlJWTlpOVkpaTlZKVkpSRlZKUkZSRk5CTkJKPkpCRj5KPkI6RjpCNkI2PjI+MjouOi42KjYqMiYyJi4iLiYqHi4iKh4qHiYaJWmpaalpqWmpaalpqWmpaalpqWmpaalpqampaampqW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tra2tsXGxsbFxsbGxcbGxsXGxsbFxsbGxcbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbF1tXW1dbV1tXW1dbV1tXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OAJCTkZSRlJOWk5aUl5SXlpmWmZibmJuanZqdm56cn52gnaCeoZ6hoKKfoqCjoKKgo5+ioKKfoZ+hnZ+dn5udm52Zm5mbl5mXmZWXlZeTlZOVkpSSlJGTkZSQk5GUkJORlJCTkZSRk5GUkZOSlJGUkpSRlJKUkZSSlZGUkpWRlJKVkZSSlJGUkpSRlJKUkZORlJGTkZOQk5GTkJKQko+Rj5KOkY+RjpCOkI2PjY+MjoyPi42LjoqNio2JjIqMiIuJi4iKiIqHiYeJhoiGiYWIhoiFh1pqWlpaalpaWmpaWlpqWmpaalpqWmpaalpqWmpaalprW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1xsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcbFxcXGxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXU1dTV1NXU1dTV1NXU1dTV1OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTgCYlpqYmpicmpyanpuenJ+dn52hn6GfoqCioKOho6CkoaOhpKGjoKOhoqCjoKGeoZ6gnaCdnpuem5yZnJmal5qXmJWYlZeUl5SVk5aTlZKVkpSRlZKUkZWSlJGVkpSRlZKUkpWSlJKVk5WSlZOVkpWTlZKVk5WSlpOVkpaTlZKWk5WSlZOVkpWTlZKVkpSSlZKUkZSSk5GUkZOQk5GSkJOQko+Sj5GOkY6QjZCNj4yPjY6Mj4yNi46LjYqNioyJjImLiIuIioeKiImHioeJhomGalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaaltrW2tba1trW2tba1trW2tba1trW2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tbbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxdbV1tXW1dbV1tXV1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk4Am56bnp2fnaCeoZ6hn6KfoaCin6Kgo5+ioKKfoZ+inqCeoZ2fnZ+cnpuempyanJiamJqWmJaYlZeUl5OVk5WSlJKUkZORlJCTkZOQk5GTkJORk5CTkZOQk5GUkJORlJGTkZSRk5GUkZOSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGTkZSRk5GUkJORk5CSkJOQkpCSj5GPko6Rj5GOkI6QjY+NkIyPjI+LjoyOi42LjYqMioyJi4mLiIqIi4eKiIqHiYeJhoiGiYWIhohaWlpqWlpaalpaWmpaalpqWmpaalpqWmpaalpqWmpaa1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXGxcXFxsXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1dTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OAKOgoqCjoaOgpKGjoKOhoqCjoKKfop+gnqCdn5yfnJ2bnZqcmZyZmpeal5mWmZaXlJeUlpOWk5WSlZOUkpWSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZWSlJGVkpSSlZKUkpWSlJKVk5WSlZOVkpWTlZKVk5WSlZOVkpWTlZKVk5SSlZKUkpWSlJGVkpSRlJGTkZSRk5CTkJKQk5CSj5KPkY6RjpCNkI6PjZCNj4yPjI6LjouNio2KjImMiouJjImLiIuIioeKh4mHioeJWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpba1trW2tba1trW2tba1trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2tba2trW2tra1tra2xcbGxsXGxsbFxsbGxcbGxsXGxsbFxsbGxcbGxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXW1dbV1tXW1dbV1tXW1dbV1dXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1eXl5OXl5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTgCeoZ6hnaCeoJyfnJ+bnZudmpyZnJiamJqXmZaZlZeVl5SWlJaSlZOVkZSSlJGTkZOQkpCTkJKQk4+SkJKPkpCSj5KQko+SkJKPkpCTj5KQk5CSkJOQkpCTkJKRk5CTkZOQk5GTkJORk5CTkZOQk5GTkJORk5CTkZOQk5GTkJORk5CSkJOQkpCSj5KQko+Rj5KOkY+RjpCOkI2QjZCMj42PjI6MjouNi46KjYqNiYyKjImLiYuIioiKh4mHioaJh4mGiIaIhYeFiIRaWlpaWlpaWlpaWlpaWmpaWlpqWlpaalpaWmpaWlpqWlpba1sBOkrFtVtba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tbbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dTV1NXU1dTV1NXU1dTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OTk5OTk5OTgCenJ6bnZqdmpuYm5ial5qXmJaYlpeUl5SWk5aTlZKVk5SSlZKUkZSRk5GUkZOQk5GTkJORk5CTkZOQk5GTkJORk5CUkZOQlJGTkZSRk5GUkZORlJGTkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSlJGUkpSRlJKUkZSSk5GUkZORlJGTkJORkpCTkJKPkpCSj5KPkY6Rj5COkY6QjZCNj4yPjI6LjoyNi46LjYqNioyJjImLiIuJioiLiIqHioeJhomHiYZqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaa1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXG1dbV1tXW1dbV1dXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk4Al5mVl5WXlJaUlpOVk5WSlJKUkZORlJCTkZOQkpCTj5KQko+SkJKPkpCSj5GQko+RkJKPkpCSj5KQko+SkJKPkpCSj5KQk4+SkJOQkpCTkJKQk5CSkJOQkpGTkJKRk5CTkZOQk5GTkJORk5CTkZOQkpGTkJKQk5CSkJOQkpCTj5KQko+Rj5KPkY+RjpGPkY6QjpCNkI2QjI+Nj4yOjI+LjouOio2LjYqMioyJi4mMiIuIi4eKiIqHiYeJhoiGiYWIhoiFh1paWlpaWlpaWlpaWlpqWlpaalpaWmpaWlpqWlpaalpaWmpbW1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2xcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXU1dTV1NXU1eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OAJaTlZKVk5SSlZKUkZSRk5GUkZOQk5GTkJORk5CTkZOQk5GTkJORk5CTkZOQk5GTkJORk5CTkZOQk5GTkJSRk5CUkZORlJGTkZSRk5GUkZORlJGTkZSSk5GUkpSRlJKUkZSSlJGUkpSRlJKUkZSSk5GUkZORlJGTkJSRk5CTkZOQk5CSkJOQko+SkJGPko+RjpGPkI6RjpCNkI2PjI+NjoyPjI6LjouNio2KjImMiouJjImLiIuIioeKiIqHioeJholaalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmpaalpqWmtba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxtXW1dbV1tXW1dbV1tXW1dXV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV5eTl5eXk5eXl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTgCPkpCSj5GPko6Rj5KOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+SjpGPko6Rj5KOkY+Sj5GPko+Rj5KPkY+Sj5GPko+RkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkY+Sj5GPko+Rj5KOkY+RjpGPkY6QjpGNkI6QjY+NkIyPjY+MjoyPi46MjouNi42KjIqNiYyKjImLiYuIioiLh4qHioaJh4mGiIaJhYiGiIWHhVpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1tsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1dTV1NXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OTk5OTk5OTk5OTk4Ako+TkJKPk5CSj5OQko+TkJKPk5CSj5OQko+TkJKPk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJORkpCTkZKQk5GTkJORk5CTkZOQk5GTkJORk5CTkZOQk5GTkJORk5CTkZOQk5GSkJOQkpCTkJKQk5CSj5KQko+SkJGPko+RjpGPkY6RjpCNkI6QjZCNj4yPjY6Mj4yOi46LjYqNi4yKjYqMiYyJi4iLiYqIi4iKh4qIiYeKh4mGiYZaWmpaWlpqWlpaalpaWmpaWlpqWmpaalpqWmpaalpqWmpaalprW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1xsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbV1tXW1dbV1tXV1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1OXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OAI+RjpGPkY6Rj5GOkY+SjpGPko6Rj5KOkY+SjpGPko6Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+Rj5KPkZCSj5GQko+RkJKPkZCSj5GPko+Rj5KPkY+Sj5GPko+Rj5KOkY+SjpGPkY6Rj5GOkI6RjZCOkI2QjpCNj42QjI+Nj4yOjI+LjoyOi42LjYqMio2JjIqMiYuJi4iKiIuHioiKh4mHioaJh4mGiIaIhYiGiFpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaaltbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tbbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dXV1NXU1dTV5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk5OTgCTkJKPk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkJKQk5CSkJOQkpCTkZKQk5GSkJORkpCTkZKQk5GSkJORkpCTkJKQk5CSkJOQkpCTkJKQk5CSj5OQko+SkJKPkpCRj5KPkY6Sj5GOkY+QjpGOkI2Qjo+NkI2PjI+NjoyPjI6LjouNi46LjYqNioyJjIqLiYyJi4iLiIqIi4iKh4qHiYaKh4laalpaWmpaWlpqWlpaalpaWmpaalpqWmpaalpqWmpaalpqWmpaa1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXG1dbV1tXW1dbV1tXW1dbV1dXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXl5eXl5eTl5eXk5eXl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk4AjpCPkY6Qj5GOkI+RjpCPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkI+RjpCOkY6QjpGOkI6RjpCOkY2QjpGNkI6QjZCOkI2PjZCNj42PjI+Nj4yOjI+LjoyOi42LjoqNi42KjIqNiYyKjImLiYyIi4mLiIqIioeJh4qGiYeJhoiGiYWIhoiFh4WIWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1xcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OTk5OTk5OTk5OTk5OTk5OAJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCRj5KQkY+Sj5GPko+Rj5KPkY+Sj5GOko+RjpGPkY6Rj5COkY6QjZGOkI2Qjo+NkI2PjI+Nj4yPjI6Mj4yOi46LjYqOi42KjYqMiYyKjImMiYuIi4mKiIuIioeKiImHioeJhomHiFpaWlpaWlpaWlpaWlpaWlpaWlpaWmpaWlpqWlpaalpaWmpaWlpqWlpba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2xcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXW1dbV1dXW1dXV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1eXl5OXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTgCPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpCPkY6Qj5GOkI+RjpCOkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCOkY6QjpGOkI6RjZCOkY2QjpCNkI6QjZCOkI2PjZCNj42QjI+Nj4yPjY+MjoyPjI6MjouOjI6LjYuOio2LjYqMio2JjIqMiYuJjIiLiYuIioiLh4qIioeJh4mGiYeJhoiGiYWIhohaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWltbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dTV1NXU5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk5OTk5OTk4AkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCSj5KQko+SkJKPkpCRj5KQkY+SkJGPko+Rj5KPkY+Sj5GPko+Rj5KPkY+Sj5GPko+RjpKPkY6Sj5GOkY+RjpGPkY6Rj5COkY6QjpGOkI2RjpCNkI6PjZCNj42QjY+Mj42OjI+MjouOjI6LjouNio6LjYqNioyJjYqMiYyJi4iLiYuIi4iKh4qIioeKh4mGioeJWlpaWlpaWlpaWlpaWlpaWlpaWlpaalpaWmpaWlpqWlpaalpaWmpaWlpqW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1tsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbF1tXW1dbV1tXW1dbV1tXV1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXl5eXl5eXl5eTl5eXk5eXl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OAI2QjpGNkI6RjZCOkY2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2PjpCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCMj42QjI+Nj4yPjY+Mj42PjI6Mj4yOjI+LjoyOi46MjouNi46LjYuOio2LjYqMio2KjIqMiYyKjImLiYyIi4mLiIqIi4eKiIqHiYeKhomHiYaIhomFiIaIhYeFiFpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tba1tbW2tbW1xsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXV1dTV1NXU1dTV1OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTgCRjpKPkY6Sj5GOko+RjpKPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+RjpGPkY6Rj5COkY6QjpGOkI6RjpCOkY6QjpGOkI6RjpCNkY6QjZGOkI2QjpCNkI6QjZCNj42QjY+NkI2PjJCNj4yPjY6Mj4yOjI+MjouOjI6LjouNi46LjYqNi4yKjYqMiYyKjImMiYuIi4mLiIuIioeLiIqHioeJh4qHiYaJh4haWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWltrW1tba1tbW2tbW1trW1tba1tbW2tbW1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tbbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxdXV1tXV1dbV1dXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV5eXk5eXl5OXl5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk4AjpCNkI6QjZCOkI2QjpCNkI6QjZCOkI2PjpCNj42QjY+NkI2PjZCNj42QjY+NkI2PjZCMj42QjI+NkIyPjY+Mj42PjI+Nj4yPjY+MjoyPjI6Mj4yOjI+LjoyPi46MjouOjI6LjYuOi42LjoqNi42KjIqNioyKjYmMioyJi4mMiYuJi4iLiYuIioiLh4qIioeJh4qGiYeJhoiGiYaIhoiFiIaIWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tba1tbW2tbW1trW1tba1tbW2tcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1dXU1dTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OAJGPkY6Rj5GOkY+RjpGPkY6Rj5GOkY+QjpGOkI6RjpCOkY6QjpGOkI6RjpCNkY6QjZGOkI2QjpCNkI6QjZCOkI2Qjo+NkI2PjZCNj42QjY+NkI2PjJCNj4yPjY+Mj42OjI+MjoyPjI6LjoyOi46LjYuOi42KjYuNio2KjIqNioyJjIqLiYyJi4iMiYuIi4iKiIuIioeKiImHioeJhomHiVpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWmpbW1trW1tba1tbW2tbW1trW1tba1tbW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2tba1trW2xcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXW1dbV1tXW1dbV1dXW1dXV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1eXl5eXl5eXl5OXl5eTl5eXk5eXl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OTgCMj42QjI+Nj4yPjY+Mj42PjI+Nj4yOjY+MjoyPjI6Mj4yOjI+MjoyPjI6Mj4uOjI+LjoyOi46MjouOjI6LjoyOi42MjouNi46LjYuOi42LjoqNi42KjYuNio2LjYqMio2KjIqNiYyKjImMioyJi4mMiIuJi4iLiYuIioiLh4qIioeKh4qHiYeKhomHiYaIhomFiIaIhYiGiIWHhYhKWlpaSlpaWkpaWlpKWlpaSlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWltbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dXV1NXU1dTV1NXU5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk4AkI2QjpCNkI6QjZCOkI2Qjo+NkI2PjZCNj42QjY+NkI2PjZCNj4yQjY+MkI2PjI+Nj4yPjY+Mj42PjI+NjoyPjI6Mj4yOjI+MjouPjI6LjoyOi46MjouOi42LjouNi46LjYqNi42KjYuMio2KjImNioyJjIqLiYyJi4mMiYuIi4mKiIuIioeLiIqHioeJh4qHiYaJh4mGiYZaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWltbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1tba1trW2tba1trW2tba1trXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxcXGxcXFxsXFxcbFxdXW1dXV1tXV1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXl5eXl5eXk5eXl5OXl5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk5OAI2PjI6Mj4yOjI+MjoyPjI6Mj4yOjI+LjoyPi46MjouOjI6LjoyOi46MjouNjI6LjYuOi42LjouNi46KjYuOio2LjYqNi42KjYuNioyLjYqMio2KjIqNiYyKjImMioyJjIqMiYuJjImLiYyIi4mLiIqIi4iKiIuHioiKh4mHioeJh4qGiYeJhoiGiYaIhomFiIaIhYdKWkpaSlpKWlpaSlpaWkpaWlpKWlpaSlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1NXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTgCQjY+NkI2PjZCNj42QjY+MkI2PjJCNj4yPjY+Mj42PjI+Nj4yPjY6Mj4yOjI+MjoyPjI6Lj4yOi4+MjouOjI6LjoyOi46MjYuOi42LjouNi46LjYqOi42KjYuNio2KjIqNioyKjYqMiYyKjImMiYuJjImLiIyJi4iLiYqIi4iKh4uIioeKiImHioeJhoqHiYaJWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpbW1tbW1tbW1tbW1tbW1tbW1tbW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1tba1tbW2tba1trW2tba1trW2tba1trW2tba1xsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbV1dXW1dXV1tXV1dbV1dXW1dXV1tXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1eXl5eXl5eXl5eXl5OXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OTk5OTk4Ai42LjouNi46LjYuOio2LjoqNi42KjYuNio2LjYqNi42KjIuNioyKjYqMio2KjIqNioyKjYmMio2JjIqMiYyKjImMioyJi4mMiYuJjImLiYyIi4mLiIuJi4iLiYuIioiLiIqIi4eKiIqHioiKh4mHioeJh4qGiYeJhoiGiYaIhomFiIaIhYiGiIWHhYiEWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpaWkpaWlpKWlpaSlpaWkpaWlpaWlpaWlpaWltbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXU1dXV1NXV1dTV1dXU1dTV1NXU1dTV5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OAI6Mj4yOjI+MjouPjI6LjoyOi46MjouOjI6LjoyNi46LjYuOi42LjouNi46LjYqOi42KjYuNio2LjYqNi42KjYuMio2KjIqNioyKjYqMiY2KjImMioyJjIqLiYyJi4mMiYuIjImLiIuJi4iLiIqIi4iKh4qIioeKiImHioeJh4qHiYaJh4mGiYaISlpaWkpaWlpKWlpaSlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tba1tbW2tbW1trW1tba1tbW2tbW1trW1tcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXF1dbV1dXW1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXl5eXl5eTl5eXk5eXl5OXl5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk5OTk5PTwCLjYqNi42KjYuNioyLjYqMio2KjIqNioyKjYqMio2JjIqNiYyKjImMioyJjIqMiYuKjImLiYyJi4mMiYuJjIiLiYyIi4mLiIuJi4iLiYuIioiLiIqIi4iKiIuHioiKh4qIioeJh4qHiYeKhomHiYaJh4mGiIaJhoiGiYWIhoiFiIaIhYdKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWlpaSlpaWkpaWlpKWlpaSlpaWkpaWlpaWlpaWlpbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1xcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXV1eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk9PT08AjoyOi46MjYuOi42LjouNi46LjYuOi42KjouNio2LjYqNi42KjYuNio2LjIqNioyKjYqMio2KjIqNioyJjYqMiYyKjImMioyJjIqLiYyJi4mMiYuJjImLiIuJi4iLiYuIi4iKiIuIioiLiIqHioiKh4qIiYeKh4mHioeJhomHiYZaSlpKWlpaSlpaWkpaWlpKWlpaSlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWltbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1trW1tba1tbW2tbW1trW1tba1tbW2tbW1trXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXGxcbFxsXGxcbFxsXGxcbFxsXGxcbFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxtXV1dbV1dXW1dXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV5eXl5eXl5eXl5eXl5eXl5OXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OTk5OT09PT09PAImMioyJi4mMiYuJjImLiYyJi4mMiIuJjIiLiYuIi4mLiIuJi4iLiYuIioiLiIqIi4iKiIuIioiLh4qIi4eKiIqHioiKh4qIioeJh4qHiYeKh4mHioaJh4qGiYeJhomHiYaIhomGiIaJhYiGiYWIhoiFiIaIhYeFiIWHhVpKSkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaWlpKWlpaS1tbW0tbW1tLW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXV1dTV1dXU1dTV1NXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5PT09PT09PTwCMio2KjIqNioyKjYqMiY2KjImNioyJjIqMiYyKjImMioyJjIqLiYyJi4mMiYuJjImLiYyJi4iMiYuIi4mLiIuJi4iLiYqIi4iKiIuIioiLiIqHi4iKh4qIioeKiIqHioeJh4qHiYeKh4mGioeJhomHiYaJhoiGWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpaWkpaWlpKWlpaSlpaWkpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1xcXFxcXFxcXFxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1eXl5eXl5eXl5eTl5eXk5eXl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk9PT09PT09PT08AiYyIi4mMiIuJi4iLiYuIi4mLiIqJi4iKiIuIioiLiIqIi4iKiIuHioiLh4qIioeKiIqHioiKh4qIioeJh4qHiYeKh4mHioeJh4qGiYeJhomHiYaJh4mGiIaJhoiGiYaIhomFiIaIhYiGiIWIhoiFh0lZSkpKWkpKSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpaWkpaWlpKWlpbS1tbW0tbW1tLW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1xcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dXV1OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OT09PT09PT09PT09PAIyKjImMioyJjIqMiYyKi4mMiYuJjImLiYyJi4mMiYuIjImLiIyJi4iLiYuIi4mLiIuJi4iLiYqIi4iKiIuIioiLiIqHi4iKh4uIioeKiIqHioiKh4qIiYeKh4mHioeJhoqHiYaJh4mGiYdZSVlJWUlaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpaWkpaWlpKWlpaSlpaWkpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWltbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbXFxcXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxcXFxsXFxcbFxcXGxdXV1tXV1dbV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV5eXl5eXl5eXl5eXl5eXk5eXl5OXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OT09PT09PT09PT09PTwCHioiKh4qIioeKiIqHiYiKh4mHioeJh4qHiYeKh4mHioaJh4qGiYeJhomHiYaJh4mGiYeJhoiHiYaIhomGiIaJhoiGiYWIhomFiIaIhYiGiIWIhoiFiIaIhYeFiIWHhYiFh4VJSUlJSUlJSUlJSUpKSkpKSkpKSkpKSkpaSkpKWkpKSlpKSkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKW0tbS1tLW0tbS1tLW1tbS1tbW0tbW1tLW1tbS1tbW0tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dXV1NXV1dTV1NXU1dTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5PT09PT09PT09PTz9PT08Ai4iLiYuIi4mKiIuIioiLiIqIi4iKiIuIioeLiIqHi4iKh4qIioeKiIqHioiKh4qIioeKiImHioeJh4qHiYeKh4mHioeJhoqHiYaJh4mGiYeJhomHiYaJhoiGiUlJSVlJSUlZSUlJWUlJSVlJWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaWlpKWlpaSlpaWkpaWlpKWlpaWlpbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1xcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1eXl5eXl5eXl5OXl5eTl5eXk5eXl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk9PT09PT09PT09PT09PT09PAIeKh4mHioeJh4qHiYeKhomHioaJh4mGiYeJhomHiYaJh4mGiIeJhoiGiYaIhomGiIaJhoiGiYaIhomFiIaJhYiGiIWIhoiFiIaIhYiGiIWHhYiFSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlKSkpKSkpKSkpKSlpKSkpaSkpKWkpKSlpKSkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSltLW0tbS1tLW0tbW1tLW1tbS1tbW0tbW1tLW1tbS1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXV1dTV1dXU5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OT09PT09PT09PT09PT09PT08/TwCLiIqIi4iKh4uIioeLiIqHioiKh4qIioeKiIqHioiKh4qIiYeKh4mHioeJh4qHiYeKh4mHioeJhoqHiYaKh4mGiYeJhomHiYZJSUlJSUlJSUlJSUlJSUlJSUlJSVlJSUlZSUlJWUlJSVpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpaWkpaWlpKWlpaSlpaWkpaWlpaWlpaW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXl5eXl5eXl5eXl5eXl5eTl5eXk5eXl5OXl5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5PT09PT09PT09PT09PT09PT09PT08AhoiGiYaIhomFiIaJhYiGiYWIhoiFiIaIhYiGiIWIhoiFiIaIhYeGiIWHhYiFh4WIhYeFiIWHhYiFh4WIOUlJSTlJSUk5SUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpaSkpKWkpKSlpKSkpaSkpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tbW0tbW1tLW1tbS1tbW0tbW1tLW1tbS1tbW1tbW1tbW1tbW1tbW1xcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXV1dTV1dXU1dTV1NXU1dTV1OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5eTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk9PT09PT09PT09PT09PTz9PT08/T09PAImHioeJh4qHiYaKh4mGioeJhomHiYaJh4mGiYeJhomHiYaJh4iGiYaIhomGiIZJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlKSlpKSkpaSkpKWkpKSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaWlpKWltbS1tbW0tbW1tLW1tbS1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV5eXl5eXl5eXk5eXl5OXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OT09PT09PT09PT09PT09PT09PT09PT09PTwCGiYWIhoiFiIaIhYiGiIWIhoiFiIaIhYeFiIWHhYiFSTlJOUk5STlJOUk5STlJOUk5STlJOUk5SUlJOUlJSTlJSUk5SUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpaSkpKWkpKSlpKSkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWktbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tbW0tbW1tLW1tbS1tbW0tbW1tLW1tbW1tbW1tbW1tbW1tbW1tbXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dXV1NXV1dTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OXk5OTk5OTk5OTk5OTk5OTk5OTk5PT09PT09PT09PT09PT09PT09PT08/T09PP08AiYeJhomHiYaJh4mGiYdIOEg4SDhIOEg4SDhJOUk5STlJSUk5SUlJOUlJSTlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUpKSlpKSkpaSkpKWkpKSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaWlpKW1tbS1tbW0tbW1tLW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXl5eXl5eXl5eXl5eXl5eXl5eTl5eXk5eXl5OXl5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5fT09PT09PT09PT09PT09PT09PT09PT09PT09PADg4ODg4ODg4ODg4ODg4OEg4ODhIODg4SDk5OUk5STlJOUk5STlJOUk5STlJOUk5STlJOUk5STlJOUk5STlJOUk5SUlJOUlJSTlJSUk5SUlJSUlJSUlJSUlJSUlJSUlJSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKWkpKSlpKSkpaSkpKWkpaSlpKWkpaSlpLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW1tbS1tbW0tbW1tLW1tbS1xcXExcXFxMXFxcTFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dTV1dXU1dXV1NXV1dTV1dXU1dXV1NXV1dTV1NXU1dTV1NXU1eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTk5OXk5OTl5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk9PT09PT09PT09PT09PT09PTz9PT08/T09PP08/TwA4OEg4SDhIOEg4SDhIOEg4SDhIOEg4STlJOUk5STlJOUk5STlJOUk5STlJSUk5SUlJOUlJSTlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlKSkpKSkpKSkpKSkpKSkpKSlpKSkpaSkpKWkpKSlpKSkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSltLW0tbS1tLW0tbS1tLW1tbS1tbW0tbW1tLW1tbS1tbW0tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV5eXl5eXl5eTl5eXk5eXl5OXl5eTl5eXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OTk5eTk5OXk5OTk5OT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08AODg4ODg4ODg4ODg4OEg4ODhIODg5STlJOUk5STlJOUk5STlJOUk5STlJOUk5STlJOUk5STlJOUk5STlJOUk5SUlJOUlJSTlJSUk5SUlJSUlJSUlJSUlJSUlJSUpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpaSkpKWkpKSlpKSkpaSkpKWkpaSlpKWkpaS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbS1tLW0tbW1tLW1tbS1tbW0tbW1tLW1tcTFxcXExcXFxMXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXF1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1NXV1dTV1dXU1dXV1NXV1dTV1dXU1dXV1NXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl5OTk5eTk5OTk5OTk5OTk5OTk5OTk5OTk5PT09PT09PT09PT09PT09PT09PT09PT08/T09PP09PTz9PAEg4SDhIOEg4SDhIOEg4SDhIOEk5STlJOUk5STlJOUk5STlJOUk5STlJSUk5SUlJOUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSkpKSkpKSkpKSkpKSkpKSkpKSlpKSkpaSkpKWkpKSlpKSkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpaSlpKWkpbS1tLW0tbS1tLW0tbS1tLW1tbS1tbW0tbW1tLW1tbS1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1xcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1eXl5eXl5eXl5eXl5eXl5eXl5OXl5eTl5eXk5eXl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5eTl5OXk5OTl9PT09fT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTzrHg8ctaMwQAAAAAElFTkSuQmCC]=]))
            return bgGetter(imagePath)
        end)
        if imageOk and type(imageUri) == "string" and imageUri ~= "" then
            local wallpaper = create("ImageLabel", {
                Name = "EH_BronzeHorizon_Background",
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = imageUri,
                ImageTransparency = 0.14,
                ScaleType = Enum.ScaleType.Crop,
                Active = false,
                Selectable = false,
                ZIndex = Main.ZIndex
            }, Main)
            print("[Avatar Inspector] Bronze Horizon PNG asset registered (v7.9.63).")
            -- Decode and filesystem failures cannot prevent the GUI from starting.
            pcall(function()
                wallpaper:GetPropertyChangedSignal("IsLoaded"):Connect(function()
                    if wallpaper.IsLoaded then
                        print("[Avatar Inspector] Bronze Horizon image displayed.")
                    end
                end)
            end)
        else
            warn("[Avatar Inspector] Bronze Horizon background not registered: " .. tostring(imageUri))
        end
    else
        print("[Avatar Inspector] Clean Bronze: decorative background disabled.")
    end
end

local UIScale = create("UIScale", {
    Scale = 1
}, Main)

-- Recovery-safe event binding. The full animated action is installed later;
-- until then the floating button can still show the actual Main window.
EH.mainOpenAction = nil
Toggle.Activated:Connect(function()
    if EH.mainOpenAction then
        local ok, err = pcall(EH.mainOpenAction)
        if not ok then
            warn("[Avatar Inspector] Open animation failed: " .. tostring(err))
            Main.Visible = not Main.Visible
            UIScale.Scale = 1
        end
    else
        Main.Visible = not Main.Visible
    end
end)

local Header = create("Frame", {
    Size = UDim2.new(1, 0, 0, 48),
    BackgroundColor3 = PANEL,
    BackgroundTransparency = 0.16,
    Active = true
}, Main)

round(Header, 15)

create("UIGradient", {Enabled = false,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 34, 28)),
        ColorSequenceKeypoint.new(0.58, Color3.fromRGB(29, 26, 23)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 33, 28))
    }),
    Rotation = 0
}, Header)
addStroke(Header)
-- Connected rounded header contour; no floating segmented fragments.
EH.ehStroke(Header, Color3.fromRGB(155, 115, 77), 0.11, 1.35)
do -- release construction-only local: HeaderContour
local HeaderContour = Header:FindFirstChildOfClass("UIStroke")
if HeaderContour then
    create("UIGradient", {Enabled = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(115, 88, 57)),
            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(192, 145, 94)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(157, 114, 76)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 88, 57))
        })
    }, HeaderContour)
    local glint = HeaderContour:FindFirstChildOfClass("UIGradient")
    if glint and glint.Enabled then
        TweenService:Create(glint,
            TweenInfo.new(12, Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut, -1, true),
            {Offset = Vector2.new(0.38, 0)}):Play()
    end
end
end -- short-lived HeaderContour scope

do -- release construction-only local: HeaderTitle
local HeaderTitle = makeLabel(
    Header, "HORIZON",
    UDim2.new(1, -182, 1, 0),
    UDim2.fromOffset(16, 0), 15
)

HeaderTitle.Font = Enum.Font.GothamBlack
HeaderTitle.TextColor3 = Color3.fromRGB(255, 248, 242)
HeaderTitle.TextSize = 17
HeaderTitle.Size = UDim2.new(1, -182, 0, 27)
HeaderTitle.Position = UDim2.fromOffset(18, 3)
end -- short-lived HeaderTitle scope

do
    local subtitle = makeLabel(Header, "EVENT HORIZON / 053",
        UDim2.fromOffset(260, 14), UDim2.fromOffset(17, 29), 9)
    subtitle.Font = Enum.Font.GothamBold
    subtitle.TextColor3 = Color3.fromRGB(207, 166, 108)
    subtitle.TextSize = 9
    subtitle.Position = UDim2.fromOffset(24, 29)
    local marker = create("Frame", {
        Size = UDim2.fromOffset(6, 6),
        Position = UDim2.fromOffset(15, 33),
        Rotation = 45,
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(203, 152, 98),
        BorderSizePixel = 0,
        Active = false
    }, Header)

    local orbit = create("Frame", {
        Name = "EventHorizonOrbit",
        Position = UDim2.new(1, -164, 0, 8),
        Size = UDim2.fromOffset(32, 32),
        BackgroundColor3 = Color3.fromRGB(41, 35, 29),
        BorderSizePixel = 0,
        Active = false
    }, Header)
    round(orbit, 10)
    orbit.Visible = false -- Clean Bronze: decorative orbit hidden
    local ring = create("Frame", {
        Position = UDim2.fromOffset(8, 8),
        Size = UDim2.fromOffset(16, 16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = false
    }, orbit)
    round(ring, 10)
    create("UIStroke", {
        Color = Color3.fromRGB(195, 146, 89), Thickness = 2
    }, ring)
    local core = create("Frame", {
        Position = UDim2.fromOffset(14, 14),
        Size = UDim2.fromOffset(4, 4),
        BackgroundColor3 = Color3.fromRGB(218, 180, 117),
        BorderSizePixel = 0,
        Active = false
    }, orbit)
    round(core, 4)
    local orbitSatellite = create("Frame", {
        Name = "OrbitSatellite",
        Size = UDim2.fromOffset(5, 5),
        Position = UDim2.fromOffset(23, 5),
        BackgroundColor3 = Color3.fromRGB(216, 175, 111),
        BorderSizePixel = 0
    }, orbit)
    round(orbitSatellite, 5)
    create("UIStroke", {Color = Color3.fromRGB(154, 114, 75),
        Thickness = 1, Transparency = 0.2}, orbit)
end

local LangButton = makeButton(
    Header, currentLanguage:upper(),
    UDim2.fromOffset(64, 32),
    UDim2.new(1, -112, 0, 8),
    Color3.fromRGB(39, 34, 29)
)
EH.styleIconAction(LangButton)
LangButton.Name = "LanguageButton"
LangButton.TextSize = 11

local Close = makeButton(
    Header, "×",
    UDim2.fromOffset(34, 32),
    UDim2.new(1, -44, 0, 8),
    Color3.fromRGB(41, 34, 28)
)
EH.styleIconAction(Close)

-- Full shutdown confirmation. Tapping the floating profile button still only hides the window.
local ExitOverlay = create("Frame", {
    Name = "ExitConfirmationOverlay",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.38,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 200
}, ScreenGui)

local ExitPanel = create("Frame", {
    Name = "ExitConfirmationPanel",
    Size = UDim2.fromOffset(286, 154),
    Position = UDim2.fromScale(0.5, 0.5),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = PANEL,
    BorderSizePixel = 0,
    ZIndex = 201
}, ExitOverlay)
round(ExitPanel, 14)
addStroke(ExitPanel)

local ExitTitle = makeLabel(
    ExitPanel, "Confirmation",
    UDim2.new(1, -24, 0, 28), UDim2.fromOffset(12, 12), 16
)
ExitTitle.Font = Enum.Font.GothamBold
ExitTitle.TextXAlignment = Enum.TextXAlignment.Center
ExitTitle.ZIndex = 202

local ExitMessage = makeLabel(
    ExitPanel, "Are you sure?",
    UDim2.new(1, -24, 0, 30), UDim2.fromOffset(12, 45), 13
)
ExitMessage.TextXAlignment = Enum.TextXAlignment.Center
ExitMessage.ZIndex = 202

local ExitYes = makeButton(
    ExitPanel, "Yes",
    UDim2.fromOffset(112, 36), UDim2.new(0, 20, 1, -50), GREEN
)
ExitYes.ZIndex = 203
ExitYes.TextSize = 13

local ExitNo = makeButton(
    ExitPanel, "No",
    UDim2.fromOffset(112, 36), UDim2.new(1, -132, 1, -50), RED
)
ExitNo.ZIndex = 203
ExitNo.TextSize = 13

local exitPanelScale = create("UIScale", {Scale = 0.92}, ExitPanel)
local function showExitConfirmation()
    ExitOverlay.Visible = true
    exitPanelScale.Scale = 0.92
    TweenService:Create(exitPanelScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
end

local function hideExitConfirmation()
    ExitOverlay.Visible = false
end

ExitNo.Activated:Connect(hideExitConfirmation)
ExitYes.Activated:Connect(function()
    if shutdownAvatarInspector then
        shutdownAvatarInspector()
    else
        ScreenGui:Destroy()
    end
end)

local Search = create("TextBox", {
    Size = UDim2.new(1, -132, 0, 36),
    Position = UDim2.fromOffset(12, 58),
    BackgroundColor3 = PANEL,
    TextColor3 = WHITE,
    PlaceholderColor3 = MUTED,
    PlaceholderText = "Search players...",
    Text = "",
    TextSize = 13,
    Font = Enum.Font.Gotham,
    ClearTextOnFocus = false,
    Active = true
}, Main)

round(Search, 12)
addStroke(Search)
create("UIPadding", {
    PaddingLeft = UDim.new(0, 38),
    PaddingRight = UDim.new(0, 8)
}, Search)
Search.TextColor3 = Color3.fromRGB(249, 242, 236)
Search.PlaceholderColor3 = Color3.fromRGB(171, 159, 141)
do -- release construction-only local: searchOutline
local searchOutline = Search:FindFirstChildOfClass("UIStroke")
if searchOutline then
    Search.Focused:Connect(function()
        TweenService:Create(searchOutline, TweenInfo.new(0.18), {
            Color = ACCENT_PURPLE, Transparency = 0.05, Thickness = 1.7
        }):Play()
    end)
    Search.FocusLost:Connect(function()
        TweenService:Create(searchOutline, TweenInfo.new(0.18), {
            Color = OUTLINE, Transparency = 0.14, Thickness = 1.1
        }):Play()
    end)
end
end -- short-lived searchOutline scope

local ModeButton = makeButton(
    Main, "📁 OUTFITS",
    UDim2.fromOffset(100, 36),
    UDim2.new(1, -112, 0, 58),
    Color3.fromRGB(39, 34, 29)
)
EH.styleIconAction(ModeButton)
ModeButton.TextXAlignment = Enum.TextXAlignment.Right
create("UIPadding", {PaddingRight = UDim.new(0, 14)}, ModeButton)

local PlayerList = create("ScrollingFrame", {
    Position = UDim2.fromOffset(12, 104),
    Size = UDim2.fromOffset(190, 310),
    BackgroundColor3 = PANEL,
    BackgroundTransparency = 0.10,
    BorderSizePixel = 0,
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(155, 112, 73),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    ScrollingDirection = Enum.ScrollingDirection.Y,
    Active = true
}, Main)

round(PlayerList, 12)
addStroke(PlayerList)
EH.ehPanel(PlayerList, "scroll")
EH.listNeon(PlayerList)

create("UIListLayout", {
    Padding = UDim.new(0, 5),
    SortOrder = Enum.SortOrder.LayoutOrder
}, PlayerList)

create("UIPadding", {
    PaddingTop = UDim.new(0, 6),
    PaddingLeft = UDim.new(0, 6),
    PaddingRight = UDim.new(0, 6),
    PaddingBottom = UDim.new(0, 6)
}, PlayerList)

-- Avatar source modes are next to the players list: desktop right, mobile below.
-- This is a viewport switch, NOT a change to the actual game character.
EH.avatarSourceMode = "Original"
do
    local bar = create("Frame", {
        Name = "HorizonAvatarSourceBar",
        Position = UDim2.fromOffset(214, 160),
        Size = UDim2.fromOffset(300, 34),
        BackgroundTransparency = 1,
        BorderSizePixel = 0, Active = false, ZIndex = 12
    }, Main)
    local original = makeButton(bar, "", UDim2.new(0.5, -3, 1, -2),
        UDim2.fromOffset(0, 1), Color3.fromRGB(92, 64, 40))
    original.Name = "HorizonOriginalAvatarButton"
    local morph = makeButton(bar, "", UDim2.new(0.5, -3, 1, -2),
        UDim2.new(0.5, 3, 0, 1), Color3.fromRGB(40, 35, 30))
    morph.Name = "HorizonLiveMorphButton"
    for _, button in ipairs({original, morph}) do
        button.ZIndex = 13
        button.TextSize = 11
        button.TextColor3 = Color3.fromRGB(243, 216, 187)
        button.TextTruncate = Enum.TextTruncate.AtEnd
    end

    EH.layoutAvatarSourceBar = function(mobile)
        if mobile then
            bar.Position = UDim2.fromOffset(12, 250)
            bar.Size = UDim2.new(1, -24, 0, 31)
        else
            bar.Position = UDim2.fromOffset(214, 160)
            bar.Size = UDim2.fromOffset(300, 34)
        end
    end

    EH.refreshAvatarSourceButtons = function()
        local lang = currentLanguage
        local names = {
            ru = {"АВАТАР", "МОРФ"},
            en = {"AVATAR", "MORPH"},
            es = {"AVATAR", "MORPH"},
            pt = {"AVATAR", "MORPH"},
            fr = {"AVATAR", "MORPH"},
            de = {"AVATAR", "MORPH"},
            pl = {"AWATAR", "MORF"},
            tr = {"AVATAR", "MORF"},
            ja = {"アバター", "モーフ"},
            ko = {"아바타", "모프"},
            zh = {"头像", "变身"},
            be = {"АВАТАР", "МОРФ"}
        }
        local text = names[lang] or names.en
        original.Text, morph.Text = text[1], text[2]
        for _, entry in ipairs({
            {button = original, mode = "Original"},
            {button = morph, mode = "Morph"}
        }) do
            local active = EH.avatarSourceMode == entry.mode
            entry.button:SetAttribute("SelectedControl", active)
            entry.button.BackgroundColor3 = active
                and Color3.fromRGB(96, 69, 43) or Color3.fromRGB(40, 35, 30)
            local stroke = entry.button:FindFirstChildOfClass("UIStroke")
            if stroke then
                stroke.Color = active and Color3.fromRGB(211, 165, 113)
                    or Color3.fromRGB(112, 84, 56)
                stroke.Transparency = active and 0.02 or 0.34
            end
        end
    end

    EH.changeAvatarSourceMode = function(mode)
        if EH.avatarSourceMode == mode then return end
        EH.avatarSourceMode = mode
        EH.refreshAvatarSourceButtons()
        if currentMode ~= "Players" then return end
        local target = selectedPlayer
        if target and target.Parent == Players and EH.scanAvatarSourcePlayer then
            task.spawn(EH.scanAvatarSourcePlayer, target)
        elseif Status and Status.Parent then
            Status.Text = currentLanguage == "ru"
                and "Выберите игрока для просмотра" or "Select a player to inspect"
        end
    end
    original.Activated:Connect(function()
        EH.changeAvatarSourceMode("Original")
    end)
    morph.Activated:Connect(function()
        EH.changeAvatarSourceMode("Morph")
    end)
    EH.refreshAvatarSourceButtons()
end

local Viewport = create("ViewportFrame", {
    Position = UDim2.fromOffset(214, 104),
    Size = UDim2.fromOffset(300, 310),
    BackgroundColor3 = PANEL,
    BorderSizePixel = 0,
    Active = true,
    Selectable = true,
    ClipsDescendants = true
}, Main)

round(Viewport, 12)
addStroke(Viewport)
EH.ehPanel(Viewport, "viewer")
EH.ehStroke(Viewport, Color3.fromRGB(150, 111, 74), 0.19, 1.45)
-- Original compact, frameless 3D preview heading.
do
    local viewerInfo = makeLabel(Viewport, "3D-PREVIEW",
        UDim2.fromOffset(116, 18), UDim2.fromOffset(37, 11), 10)
    viewerInfo.TextColor3 = Color3.fromRGB(247, 228, 208)
    viewerInfo.Font = Enum.Font.GothamBold
    viewerInfo.ZIndex = 4
end

EH.emptyPreview = create("Frame", {
    Name = "EHAvatarPlaceholder",
    Size = UDim2.fromOffset(142, 128),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.52),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Active = false,
    Visible = true,
    ZIndex = 8
}, Viewport)
do
    local halo = create("Frame", {
        Name = "EmptyHalo",
        Size = UDim2.fromOffset(80, 80),
        Position = UDim2.fromOffset(31, 3),
        BackgroundColor3 = Color3.fromRGB(31, 27, 23),
        BorderSizePixel = 0,
        Active = false,
        ZIndex = 9
    }, EH.emptyPreview)
    round(halo, 40)
    create("UIStroke", {Color = Color3.fromRGB(143, 108, 74),
        Thickness = 1.4, Transparency = 0.24}, halo)
    create("UIGradient", {Enabled = false,Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 35, 27)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(19, 18, 16))
    }), Rotation = 60}, halo)
    -- Match the user's circular silhouette reference; retain a native fallback.
    local iconOk, icon = pcall(EH_pngIcon, halo, "placeholder", UDim2.fromOffset(0, 0), 80)
    if iconOk and icon then
        halo.BackgroundTransparency = 1
        local oldEdge = halo:FindFirstChildOfClass("UIStroke")
        if oldEdge then oldEdge.Transparency = 1 end
    else
        EH.safeIcon(halo, "placeholder", UDim2.fromOffset(16, 16), 48)
    end
    local caption = makeLabel(EH.emptyPreview, "Select a player",
        UDim2.new(1, 0, 0, 20), UDim2.fromOffset(0, 97), 11)
    caption.TextXAlignment = Enum.TextXAlignment.Center
    caption.TextColor3 = Color3.fromRGB(202, 165, 121)
    caption.Font = Enum.Font.GothamBold
    caption.ZIndex = 9
end
EH.setPreviewReady = function(loaded)
    if EH.emptyPreview and EH.emptyPreview.Parent then
        EH.emptyPreview.Visible = not loaded
    end
    local label = Viewport:FindFirstChild("EHModelStateLabel")
    if label then
        label.Text = loaded and "MODEL READY" or "SELECT PLAYER"
    end
    local pill = Viewport:FindFirstChild("EHModelReadyPill")
    local dot = pill and pill:FindFirstChild("EHStatusDot")
    if dot then
        dot.BackgroundColor3 = loaded and Color3.fromRGB(142, 222, 175)
            or Color3.fromRGB(152, 117, 83)
    end
end

local ViewModeBar = create("Frame", {
    Name = "ViewModeBar",
    Position = UDim2.new(1, -116, 0, 8),
    Size = UDim2.fromOffset(106, 29),
    BackgroundColor3 = BG,
    BackgroundTransparency = 0.12,
    BorderSizePixel = 0,
    ZIndex = 20
}, Viewport)
round(ViewModeBar, 7)

-- One camera control: touch-drag to orbit freely around the avatar.
local FreeViewButton = makeButton(
    ViewModeBar, "FREE LOOK",
    UDim2.new(1, -4, 1, -4),
    UDim2.fromOffset(2, 2),
    Color3.fromRGB(39, 34, 29)
)
EH.styleIconAction(FreeViewButton)
FreeViewButton.TextSize = 9
FreeViewButton.ZIndex = 21

do
    EH.statusChip(Viewport, "EHModelReadyPill",
        UDim2.new(0, 12, 1, -31), UDim2.fromOffset(132, 24),
        Color3.fromRGB(152, 117, 83))
    local viewerState = makeLabel(Viewport, "SELECT PLAYER",
        UDim2.fromOffset(107, 22), UDim2.new(0, 35, 1, -30), 9)
    viewerState.Name = "EHModelStateLabel"
    viewerState.ZIndex = Viewport.ZIndex + 3
    viewerState.TextColor3 = Color3.fromRGB(214, 177, 119)
    viewerState.Font = Enum.Font.GothamBold
    viewerState.ZIndex = 4
end

local ZoomBar = create("Frame", {
    Name = "ZoomBar",
    AnchorPoint = Vector2.new(1, 1),
    Position = UDim2.new(1, -7, 1, -7),
    Size = UDim2.fromOffset(78, 30),
    BackgroundColor3 = BG,
    BackgroundTransparency = 0.12,
    BorderSizePixel = 0,
    ZIndex = 20
}, Viewport)
round(ZoomBar, 7)

local ZoomOutButton = makeButton(
    ZoomBar, "−",
    UDim2.fromOffset(34, 26),
    UDim2.fromOffset(2, 2),
    Color3.fromRGB(39, 34, 29)
)
EH.styleIconAction(ZoomOutButton)
ZoomOutButton.TextSize = 18
ZoomOutButton.ZIndex = 21

local ZoomInButton = makeButton(
    ZoomBar, "+",
    UDim2.fromOffset(34, 26),
    UDim2.fromOffset(42, 2),
    Color3.fromRGB(39, 34, 29)
)
EH.styleIconAction(ZoomInButton)
ZoomInButton.TextSize = 18
ZoomInButton.ZIndex = 21

-- Exit from a temporary asset preview, replacing the camera mode control.
EH.assetCloseButton = makeButton(
    Viewport, "✕  АВАТАР",
    UDim2.fromOffset(106, 29), UDim2.new(1, -116, 0, 8),
    Color3.fromRGB(46, 38, 30)
)
EH.styleIconAction(EH.assetCloseButton)
EH.assetCloseButton.TextSize = 11
EH.assetCloseButton.ZIndex = 25
EH.assetCloseButton.Visible = false
-- Native block-avatar silhouette: never relies on executor image APIs.
-- The existing return action remains unchanged.
do
    EH.assetCloseButton.Text = "АВАТАР"
    EH.assetCloseButton.TextXAlignment = Enum.TextXAlignment.Right
    create("UIPadding", {PaddingRight = UDim.new(0, 11)}, EH.assetCloseButton)
    local glyph = create("Frame", {
        Name = "EHReturnAvatarGlyph",
        Position = UDim2.fromOffset(10, 4),
        Size = UDim2.fromOffset(18, 21),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = false,
        ZIndex = EH.assetCloseButton.ZIndex + 1
    }, EH.assetCloseButton)
    local parts = {
        {5, 0, 8, 7},   -- square head
        {4, 8, 10, 7},  -- torso
        {0, 8, 3, 8},   -- left block arm
        {15, 8, 3, 8},  -- right block arm
        {4, 16, 4, 5},  -- left leg
        {10, 16, 4, 5}  -- right leg
    }
    for _, p in ipairs(parts) do
        local piece = create("Frame", {
            Position = UDim2.fromOffset(p[1], p[2]),
            Size = UDim2.fromOffset(p[3], p[4]),
            BackgroundColor3 = Color3.fromRGB(207, 166, 112),
            BorderSizePixel = 0,
            Active = false,
            ZIndex = glyph.ZIndex + 1
        }, glyph)
        create("UIStroke", {
            Color = Color3.fromRGB(142, 104, 70),
            Thickness = 0.6,
            Transparency = 0.3
        }, piece)
    end
    -- New square avatar icon; keep the old native glyph if PNG support is unavailable.
    local iconOk, icon = pcall(EH_pngIcon, EH.assetCloseButton, "avatar_return",
        UDim2.fromOffset(5, 2), 25)
    if iconOk and icon then glyph.Visible = false end
end

local World = Instance.new("WorldModel")
World.Parent = Viewport

local Camera = Instance.new("Camera")
Camera.Parent = Viewport
Viewport.CurrentCamera = Camera

local PoseBar = create("Frame", {
    Position = UDim2.fromOffset(214, 420),
    Size = UDim2.fromOffset(300, 32),
    BackgroundColor3 = PANEL,
    BorderSizePixel = 0,
    ZIndex = 5,
    Active = true
}, Main)

round(PoseBar, 9)
addStroke(PoseBar)
EH.ehStroke(PoseBar, Color3.fromRGB(125, 94, 65), 0.33, 1.1)

local TPoseButton = makeButton(
    PoseBar, "T-POSE",
    UDim2.new(0.32, -3, 1, -4),
    UDim2.fromOffset(2, 2)
)

local APoseButton = makeButton(
    PoseBar, "A-POSE",
    UDim2.new(0.32, -3, 1, -4),
    UDim2.new(0.34, 0, 0, 2)
)

local NeutralButton = makeButton(
    PoseBar, "NEUTRAL",
    UDim2.new(0.32, -3, 1, -4),
    UDim2.new(0.68, 0, 0, 2)
)

for _, poseButton in ipairs({
    TPoseButton, APoseButton, NeutralButton
}) do
    poseButton.TextSize = 11
    poseButton.ZIndex = 6
    poseButton.Active = true
end

local ItemsPanel = create("Frame", {
    Position = UDim2.fromOffset(526, 104),
    Size = UDim2.fromOffset(262, 350),
    BackgroundColor3 = PANEL,
    BackgroundTransparency = 0.10,
    BorderSizePixel = 0,
    Active = true
}, Main)

round(ItemsPanel, 12)
addStroke(ItemsPanel)
EH.ehPanel(ItemsPanel, "viewer")
EH.listNeon(ItemsPanel)

-- Dashboard 19: title, prominent count, and supporting status in one panel.
EH.wornHeader = EH.statusChip(ItemsPanel, "EHWornCountPill",
    UDim2.fromOffset(13, 5), UDim2.new(1, -26, 0, 76),
    Color3.fromRGB(142, 222, 175))
EH.wornHeader.BackgroundColor3 = Color3.fromRGB(43, 36, 30)
EH.wornHeader.EHStatusDot.Visible = false
EH.wornHeader:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(135, 100, 67)
EH.wornHeader:FindFirstChildOfClass("UIStroke").Transparency = 0.36
EH.wornHeader:FindFirstChildOfClass("UICorner").CornerRadius = UDim.new(0, 12)
-- Scoped decoration: no extra long-lived Luau locals.
do
    local tag = create("Frame", {
        Name = "EHItemsOutlinedTitle",
        Position = UDim2.fromOffset(12, 5),
        Size = UDim2.fromOffset(112, 23),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = EH.wornHeader.ZIndex + 2
    }, EH.wornHeader)
    round(tag, 6)
    create("UIStroke", {
        Color = Color3.fromRGB(170, 127, 83),
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, tag)
    local title = makeLabel(tag, "ITEMS",
        UDim2.new(1, -8, 1, 0), UDim2.fromOffset(4, 0), 12)
    title.Font = Enum.Font.GothamMedium
    title.TextColor3 = Color3.fromRGB(235, 225, 209)
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.TextScaled = false
    title.ZIndex = tag.ZIndex + 1
end
EH.safeIcon(EH.wornHeader, "items", UDim2.new(1, -32, 0, 5), 22)

EH.wornBadge = makeLabel(
    EH.wornHeader, "—",
    UDim2.fromOffset(72, 26), UDim2.fromOffset(12, 29), 19
)
EH.wornBadge.Name = "EclipseItemCount"
EH.wornBadge.BackgroundTransparency = 1
EH.wornBadge.TextColor3 = Color3.fromRGB(242, 233, 218)
EH.wornBadge.TextXAlignment = Enum.TextXAlignment.Left
EH.wornBadge.Font = Enum.Font.GothamSemibold
EH.wornBadge.ZIndex = EH.wornHeader.ZIndex + 2

-- Keep the existing WornCountLabel binding used by scanner and favorites.
local WornCountLabel
do
    local tag = create("Frame", {
        Name = "EHItemsThinStatus",
        Position = UDim2.fromOffset(12, 55),
        Size = UDim2.fromOffset(146, 19),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = EH.wornHeader.ZIndex + 2
    }, EH.wornHeader)
    round(tag, 9)
    create("UIStroke", {
        Color = Color3.fromRGB(133, 204, 169),
        Transparency = 0.2,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, tag)
    local dot = create("Frame", {
        Name = "EHDashboardWornDot",
        Position = UDim2.fromOffset(7, 7),
        Size = UDim2.fromOffset(5, 5),
        BackgroundColor3 = Color3.fromRGB(155, 231, 186),
        BorderSizePixel = 0,
        ZIndex = tag.ZIndex + 1
    }, tag)
    round(dot, 3)
    WornCountLabel = makeLabel(tag, "WORN ITEMS: —",
        UDim2.new(1, -21, 1, 0), UDim2.fromOffset(17, 0), 10)
    WornCountLabel.Name = "WornItemsCounter"
    WornCountLabel.ZIndex = tag.ZIndex + 1
    WornCountLabel.TextColor3 = Color3.fromRGB(196, 244, 216)
    WornCountLabel.Font = Enum.Font.GothamMedium
    WornCountLabel.TextXAlignment = Enum.TextXAlignment.Left
    WornCountLabel.TextScaled = false
    WornCountLabel.Text = translateText("WORN ITEMS: —"):gsub(":%s*—$", "")
end

do
    local rule = create("Frame", {
        Name = "EHItemsSectionDivider",
        Position = UDim2.fromOffset(12, 85),
        Size = UDim2.new(1, -24, 0, 1),
        BackgroundColor3 = Color3.fromRGB(113, 88, 59),
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        Active = false
    }, ItemsPanel)
end
EH.statusChip(ItemsPanel, "EHScanStatusPill",
    UDim2.new(0, 12, 1, -31), UDim2.fromOffset(128, 24),
    Color3.fromRGB(142, 222, 175))
local ItemsStatusChip = makeLabel(
    ItemsPanel, "SCAN ACTIVE",
    UDim2.fromOffset(99, 22), UDim2.new(0, 34, 1, -30), 9
)
ItemsStatusChip.ZIndex = ItemsPanel.ZIndex + 3
ItemsStatusChip.TextColor3 = Color3.fromRGB(209, 174, 118)
ItemsStatusChip.Font = Enum.Font.GothamBold

local ItemList = create("ScrollingFrame", {
    Position = UDim2.fromOffset(6, 89),
    Size = UDim2.new(1, -12, 1, -123),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(155, 112, 73),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    ScrollingDirection = Enum.ScrollingDirection.Y,
    Active = true
}, ItemsPanel)

create("UIListLayout", {
    Padding = UDim.new(0, 6),
    SortOrder = Enum.SortOrder.LayoutOrder
}, ItemList)

create("UIPadding", {
    PaddingBottom = UDim.new(0, 6)
}, ItemList)

-- EVENT HORIZON / 053 lower structural belt: a segmented bridge + useful status console.
-- Explicitly replaces the older v7.9.42 bridge and brand pill; no stacking.
local EHBridge = create("Frame", {
    Name = "EHLowerBridge",
    Position = UDim2.fromOffset(18, 517),
    Size = UDim2.new(1, -36, 0, 4),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Active = false
}, Main)
EHBridge.Visible = false -- Clean Bronze: decorative lower stripe hidden

do
    local bridgeLine = create("Frame", {
        Name = "EHContinuousBridge",
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, 3),
        BackgroundColor3 = Color3.fromRGB(171, 127, 80),
        BorderSizePixel = 0,
        Active = false
    }, EHBridge)
    round(bridgeLine, 2)
    create("UIGradient", {Enabled = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 82, 55)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(195, 153, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(108, 82, 55))
        })
    }, bridgeLine)
end

local StatusConsole = create("Frame", {
    Name = "EHSystemStatus",
    Position = UDim2.new(0, 13, 1, -51),
    Size = UDim2.new(1, -26, 0, 41),
    BackgroundColor3 = Color3.fromRGB(34, 30, 26),
    BackgroundTransparency = 0.20,
    BorderSizePixel = 0,
    Active = false
}, Main)
round(StatusConsole, 11)
create("UIGradient", {Enabled = false,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 37, 29)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(31, 28, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 35, 28))
    })
}, StatusConsole)
create("UIStroke", {
    Color = Color3.fromRGB(139, 102, 69),
    Thickness = 1.25,
    Transparency = 0.14
}, StatusConsole)
local BrandPill = create("Frame", {
    Name = "EHStatusIdentity",
    Position = UDim2.fromOffset(10, 7),
    Size = UDim2.fromOffset(122, 27),
    BackgroundColor3 = Color3.fromRGB(50, 41, 32),
    BorderSizePixel = 0,
    Active = false
}, StatusConsole)
round(BrandPill, 8)
do -- release construction-only local: StatusIcon
local StatusIcon = makeLabel(
    BrandPill, "",
    UDim2.fromOffset(16, 16), UDim2.fromOffset(8, 5), 12
)
StatusIcon.TextColor3 = Color3.fromRGB(208, 168, 110)
StatusIcon.Font = Enum.Font.GothamBold
end -- short-lived StatusIcon scope

do -- release construction-only local: BrandLabel
local BrandLabel = makeLabel(
    BrandPill, "SYSTEM STATUS",
    UDim2.new(1, -28, 1, 0), UDim2.fromOffset(25, 0), 10
)
BrandLabel.TextColor3 = Color3.fromRGB(218, 178, 120)
BrandLabel.Font = Enum.Font.GothamBold
end -- short-lived BrandLabel scope

do -- release construction-only local: StatusActive
local StatusActive = makeLabel(
    StatusConsole, "ACTIVE",
    UDim2.fromOffset(64, 20), UDim2.new(1, -84, 0, 10), 10
)
StatusActive.TextColor3 = Color3.fromRGB(218, 178, 120)
StatusActive.TextXAlignment = Enum.TextXAlignment.Right
StatusActive.Font = Enum.Font.GothamBold
StatusActive.Visible = false
end -- short-lived StatusActive scope

-- The right-hand indicator reflects that the GUI is alive, not whether scanning is active.
do
    local signal = create("Frame", {
        Name = "EHSystemIndicator",
        Position = UDim2.new(1, -23, 0, 16),
        Size = UDim2.fromOffset(8, 8),
        BackgroundColor3 = Color3.fromRGB(209, 163, 105),
        BorderSizePixel = 0,
        Active = false
    }, StatusConsole)
    round(signal, 8)
    create("UIStroke", {Color = Color3.fromRGB(221, 184, 124),
        Transparency = 0.35, Thickness = 2}, signal)
end

EH.statusChip(StatusConsole, "EHMessagePill",
    UDim2.new(0, 136, 0, 7), UDim2.new(1, -181, 0, 27),
    Color3.fromRGB(196, 154, 101))
local Status = makeLabel(
    Main, "Select a player",
    UDim2.new(1, -234, 0, 30),
    UDim2.new(0, 181, 1, -45), 11
)
Status.ZIndex = StatusConsole.ZIndex + 3
Status.TextColor3 = MUTED
Status.TextTruncate = Enum.TextTruncate.AtEnd

-- Compact confirmation toast for completed copy/save actions.
local Toast = create("Frame", {
    Name = "ActionToast",
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 10),
    Size = UDim2.fromOffset(260, 38),
    BackgroundColor3 = Color3.fromRGB(30, 105, 70),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 50
}, Main)
round(Toast, 9)
addStroke(Toast)

local ToastIcon = create("TextLabel", {
    Name = "SuccessCheckmark",
    BackgroundTransparency = 1,
    Text = "✓",
    TextColor3 = Color3.fromRGB(130, 255, 165),
    TextSize = 19,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextYAlignment = Enum.TextYAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0, 24, 0.5, 1),
    Size = UDim2.fromOffset(22, 22),
    Rotation = 0,
    ZIndex = 52
}, Toast)

local ToastText = makeLabel(
    Toast, "Action completed successfully",
    UDim2.new(1, -54, 1, 0),
    UDim2.fromOffset(48, 0), 12
)
ToastText.Font = Enum.Font.GothamBold
ToastText.ZIndex = 52

local function showSuccessToast(message)
    toastToken += 1
    local token = toastToken
    ToastText.Text = tostring(message or "Action completed successfully")
    Toast.Visible = true
    Toast.BackgroundTransparency = 0.08
    ToastText.TextTransparency = 0
    ToastIcon.TextTransparency = 0

    task.delay(1.8, function()
        if token ~= toastToken or not Toast.Parent then return end
        local fadeInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        pcall(function()
            TweenService:Create(Toast, fadeInfo, {BackgroundTransparency = 1}):Play()
            TweenService:Create(ToastText, fadeInfo, {TextTransparency = 1}):Play()
            TweenService:Create(ToastIcon, fadeInfo, {TextTransparency = 1}):Play()
        end)
        task.delay(0.3, function()
            if token == toastToken and Toast.Parent then
                Toast.Visible = false
            end
        end)
    end)
end

-- Reusable modal for safe outfit deletion and renaming.
local ModalOverlay = create("Frame", {
    Name = "OutfitDialogOverlay",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.38,
    BorderSizePixel = 0,
    Visible = false,
    Active = true,
    ZIndex = 70
}, Main)

local ModalPanel = create("Frame", {
    Name = "OutfitDialog",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(340, 178),
    BackgroundColor3 = PANEL,
    BorderSizePixel = 0,
    ZIndex = 71
}, ModalOverlay)
round(ModalPanel, 13)
addStroke(ModalPanel)
create("UIGradient", {Enabled = false,Color = ColorSequence.new(Color3.fromRGB(32, 31, 29), Color3.fromRGB(31, 29, 25)), Rotation = 25}, ModalPanel)

local ModalTitle = makeLabel(
    ModalPanel, "Confirmation",
    UDim2.new(1, -24, 0, 28),
    UDim2.fromOffset(12, 10), 14
)
ModalTitle.Font = Enum.Font.GothamBold
ModalTitle.ZIndex = 72

local ModalMessage = create("TextLabel", {
    BackgroundTransparency = 1,
    Text = "Are you sure?",
    TextColor3 = WHITE,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Center,
    Position = UDim2.fromOffset(12, 43),
    Size = UDim2.new(1, -24, 0, 48),
    ZIndex = 72
}, ModalPanel)

local RenameInput = create("TextBox", {
    Name = "RenameInput",
    Position = UDim2.fromOffset(12, 91),
    Size = UDim2.new(1, -24, 0, 34),
    BackgroundColor3 = LIGHT,
    TextColor3 = WHITE,
    PlaceholderColor3 = MUTED,
    PlaceholderText = "New outfit name",
    Text = "",
    TextSize = 13,
    Font = Enum.Font.Gotham,
    ClearTextOnFocus = false,
    Visible = false,
    ZIndex = 73
}, ModalPanel)
round(RenameInput, 7)

local ModalNoButton = makeButton(
    ModalPanel, "No",
    UDim2.fromOffset(145, 34),
    UDim2.new(1, -157, 1, -46),
    RED
)
ModalNoButton.ZIndex = 74

local ModalYesButton = makeButton(
    ModalPanel, "Yes",
    UDim2.fromOffset(145, 34),
    UDim2.fromOffset(12, 132),
    GREEN
)
ModalYesButton.ZIndex = 74

local pendingDialogAction = nil
local dialogMode = "Confirm"

local function closeOutfitDialog()
    ModalOverlay.Visible = false
    pendingDialogAction = nil
    RenameInput.Visible = false
    ModalYesButton.Text = "Yes"
    ModalNoButton.Text = "No"
end

local function openConfirmDialog(message, callback)
    dialogMode = "Confirm"
    ModalTitle.Text = "Confirm deletion"
    ModalMessage.Text = message or "Are you sure you want to delete this outfit?"
    RenameInput.Visible = false
    ModalYesButton.Text = "Yes"
    ModalNoButton.Text = "No"
    pendingDialogAction = callback
    ModalOverlay.Visible = true
end

local function openRenameDialog(favorite)
    dialogMode = "Rename"
    ModalTitle.Text = "Rename outfit"
    ModalMessage.Text = "Enter a new name for this saved outfit:"
    RenameInput.Text = tostring(favorite.name or "")
    RenameInput.Visible = true
    ModalYesButton.Text = "Save"
    ModalNoButton.Text = "Cancel"
    pendingDialogAction = function()
        local newName = tostring(RenameInput.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if newName == "" then
            Status.Text = "The name cannot be empty"
            return
        end

        local oldName = favorite.name
        favorite.name = newName
        local saved, storageError = persistFavorites()
        if not saved then
            favorite.name = oldName
            Status.Text = "Could not save the new name: " .. tostring(storageError)
        else
            Status.Text = "Outfit renamed successfully"
            showSuccessToast("Outfit name changed")
        end
        refreshFavoritesList()
    end
    ModalOverlay.Visible = true
    task.defer(function()
        pcall(function() RenameInput:CaptureFocus() end)
    end)
end

ModalNoButton.Activated:Connect(function()
    closeOutfitDialog()
end)

ModalYesButton.Activated:Connect(function()
    local callback = pendingDialogAction
    if type(callback) ~= "function" then
        closeOutfitDialog()
        return
    end

    closeOutfitDialog()
    callback()
end)

-- Dedicated language picker. The option names remain in their native forms.
local LangOverlay = create("Frame", {
    Name = "LanguagePickerOverlay",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.38,
    BorderSizePixel = 0,
    Visible = false,
    Active = true,
    ZIndex = 80
}, Main)

local LangPanel = create("Frame", {
    Name = "LanguagePickerPanel",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(350, 340),
    BackgroundColor3 = PANEL,
    BorderSizePixel = 0,
    ZIndex = 81
}, LangOverlay)
round(LangPanel, 13)
addStroke(LangPanel)
create("UIGradient", {Enabled = false,Color = ColorSequence.new(Color3.fromRGB(32, 31, 29), Color3.fromRGB(31, 29, 25)), Rotation = 25}, LangPanel)

do -- release construction-only local: LangTitle
local LangTitle = makeLabel(LangPanel, "Choose language", UDim2.new(1, -60, 0, 30), UDim2.fromOffset(12, 10), 14)
LangTitle.Font = Enum.Font.GothamBold
LangTitle.ZIndex = 82
end -- short-lived LangTitle scope

local LangClose = makeButton(LangPanel, "X", UDim2.fromOffset(30, 28), UDim2.new(1, -42, 0, 9), RED)
LangClose.ZIndex = 83

for index, option in ipairs(languageOptions) do
    local column = (index - 1) % 2
    local row = math.floor((index - 1) / 2)
    local optionButton = makeButton(
        LangPanel,
        option.name,
        UDim2.fromOffset(160, 38),
        UDim2.fromOffset(10 + column * 170, 48 + row * 44),
        option.code == currentLanguage and ACCENT or LIGHT
    )
    optionButton.Name = "LanguageOption_" .. option.code
    optionButton.TextSize = 10
    optionButton.TextScaled = true
    optionButton.TextWrapped = false
    optionButton.ZIndex = 83
    optionButton.Activated:Connect(function()
        currentLanguage = option.code
        LangButton.Text = currentLanguage:upper()
        LangOverlay.Visible = false
        applyLocalization(ScreenGui)
        LangButton.Text = currentLanguage:upper()
        EH.setModeButtonLabel(ModeButton, currentMode)
        if EH.refreshHomeText then EH.refreshHomeText() end
        if EH.refreshAvatarSourceButtons then EH.refreshAvatarSourceButtons() end
        local preferenceSaved = saveLanguagePreference()
        if not preferenceSaved then
            Status.Text = "Language changed, but this executor cannot save language settings"
        end
        showSuccessToast("Language changed successfully!")
        for _, candidate in ipairs(languageOptions) do
            local optionObject = LangPanel:FindFirstChild("LanguageOption_" .. candidate.code)
            if optionObject then
                optionObject.BackgroundColor3 = candidate.code == currentLanguage and ACCENT or LIGHT
            end
        end
    end)
end

LangButton.Activated:Connect(function()
    LangOverlay.Visible = true
end)

LangClose.Activated:Connect(function()
    LangOverlay.Visible = false
end)

-- Apply the saved language to all text already created.
LangButton.Text = currentLanguage:upper()
applyLocalization(ScreenGui)
LangButton.Text = currentLanguage:upper()
EH.setModeButtonLabel(ModeButton, currentMode)


-- HORIZON: two tabs. Inspector GUI stays active; Home is an opaque overlay.
do
    local layer = create("ScrollingFrame", {
        Name = "HorizonHomePage",
        Position = UDim2.fromOffset(8, 108),
        Size = UDim2.new(1, -16, 1, -166),
        CanvasSize = UDim2.fromOffset(0, 528),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(166, 125, 87),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollingEnabled = true,
        ClipsDescendants = true,
        BackgroundColor3 = BG,
        BorderSizePixel = 0,
        Active = true, Visible = true, ZIndex = 30
    }, Main)
    round(layer, 12)

    local card = create("Frame", {
        Name = "HorizonWelcomeCard",
        Position = UDim2.fromOffset(12, 14),
        Size = UDim2.new(1, -24, 0, 182),
        BackgroundColor3 = Color3.fromRGB(36, 31, 26),
        BorderSizePixel = 0, ZIndex = 31
    }, layer)
    round(card, 13)
    create("UIStroke", {
        Color = Color3.fromRGB(154, 113, 72),
        Thickness = 1.2, Transparency = 0.17
    }, card)
    local stripe = create("Frame", {
        Position = UDim2.fromOffset(14, 15),
        Size = UDim2.fromOffset(4, 55),
        BackgroundColor3 = Color3.fromRGB(201, 152, 97),
        BorderSizePixel = 0, ZIndex = 32
    }, card)
    round(stripe, 3)

    local welcome = makeLabel(card, "",
        UDim2.new(1, -48, 0, 34), UDim2.fromOffset(29, 17), 21)
    welcome.Name = "HorizonWelcomeTitle"
    welcome.Font = Enum.Font.GothamBold
    welcome.TextColor3 = Color3.fromRGB(246, 220, 187)
    welcome.ZIndex = 32

    local username = makeLabel(card, "",
        UDim2.new(1, -48, 0, 23), UDim2.fromOffset(29, 57), 13)
    username.TextColor3 = Color3.fromRGB(226, 189, 140)
    username.ZIndex = 32

    local intro = makeLabel(card, "",
        UDim2.new(1, -48, 0, 65), UDim2.fromOffset(29, 91), 13)
    intro.TextColor3 = Color3.fromRGB(195, 181, 164)
    intro.TextWrapped = true
    intro.TextYAlignment = Enum.TextYAlignment.Top
    intro.TextTruncate = Enum.TextTruncate.None
    intro.ZIndex = 32

    local hint = create("Frame", {
        Name = "HorizonHomeHint",
        Position = UDim2.fromOffset(12, 208),
        Size = UDim2.new(1, -24, 0, 98),
        BackgroundColor3 = Color3.fromRGB(30, 27, 24),
        BorderSizePixel = 0, ZIndex = 31
    }, layer)
    round(hint, 11)
    create("UIStroke", {
        Color = Color3.fromRGB(109, 83, 58),
        Thickness = 1, Transparency = 0.34
    }, hint)
    local hintTitle = makeLabel(hint, "",
        UDim2.new(1, -34, 0, 25), UDim2.fromOffset(17, 13), 14)
    hintTitle.Font = Enum.Font.GothamBold
    hintTitle.TextColor3 = Color3.fromRGB(229, 197, 155)
    hintTitle.ZIndex = 32
    local hintBody = makeLabel(hint, "",
        UDim2.new(1, -34, 0, 44), UDim2.fromOffset(17, 42), 12)
    hintBody.TextColor3 = Color3.fromRGB(187, 174, 156)
    hintBody.TextWrapped = true
    hintBody.TextYAlignment = Enum.TextYAlignment.Top
    hintBody.TextTruncate = Enum.TextTruncate.None
    hintBody.ZIndex = 32

    -- HORIZON / Home server controls. One local scope, no startup rewrites.
    do
        local teleport = game:GetService("TeleportService")
        local json = HttpService or game:GetService("HttpService")
        local busy, serial = false, 0
        local heading = makeLabel(layer, "",
            UDim2.new(1, -30, 0, 24), UDim2.fromOffset(16, 317), 15)
        heading.Font = Enum.Font.GothamBold
        heading.TextColor3 = Color3.fromRGB(229, 197, 155)
        heading.ZIndex = 32

        local function newAction(name, y, glyph)
            local button = create("TextButton", {
                Name = name, Position = UDim2.fromOffset(12, y),
                Size = UDim2.new(1, -24, 0, 58),
                BackgroundColor3 = Color3.fromRGB(40, 37, 33),
                BorderSizePixel = 0, Text = "", AutoButtonColor = false,
                Active = true, Selectable = true, ZIndex = 32
            }, layer)
            round(button, 11)
            create("UIStroke", {
                Color = Color3.fromRGB(128, 93, 61),
                Thickness = 1.1, Transparency = 0.25
            }, button)
            local icon = makeLabel(button, glyph,
                UDim2.fromOffset(30, 30), UDim2.fromOffset(13, 14), 23)
            icon.Font = Enum.Font.GothamBold
            icon.TextColor3 = Color3.fromRGB(218, 174, 122)
            icon.TextXAlignment = Enum.TextXAlignment.Center
            icon.ZIndex = 33
            local title = makeLabel(button, "",
                UDim2.new(1, -60, 0, 21), UDim2.fromOffset(50, 8), 14)
            title.Font = Enum.Font.GothamBold
            title.TextColor3 = Color3.fromRGB(241, 216, 184)
            title.ZIndex = 33
            local details = makeLabel(button, "",
                UDim2.new(1, -60, 0, 18), UDim2.fromOffset(50, 33), 11)
            details.TextColor3 = Color3.fromRGB(178, 163, 144)
            details.ZIndex = 33
            EH.bindPhysicalPress(button, button, true)
            return button, title, details
        end
        local same, sameTitle, sameDetails =
            newAction("HorizonRejoinSameServer", 345, "↻")
        local other, otherTitle, otherDetails =
            newAction("HorizonJoinDifferentServer", 411, "⇄")
        local notice = makeLabel(layer, "",
            UDim2.new(1, -36, 0, 40), UDim2.fromOffset(17, 479), 11)
        notice.TextColor3 = Color3.fromRGB(188, 168, 142)
        notice.TextWrapped = true
        notice.TextYAlignment = Enum.TextYAlignment.Top
        notice.ZIndex = 32

        EH.refreshServerActions = function()
            local ru = currentLanguage == "ru"
            heading.Text = ru and "Управление сервером" or "Server controls"
            sameTitle.Text = ru and "Перезайти на тот же сервер" or "Rejoin same server"
            sameDetails.Text = ru and "Вернуться в текущую сессию"
                or "Reconnect to this instance"
            otherTitle.Text = ru and "Перезайти на другой сервер" or "Join another server"
            otherDetails.Text = ru and "Найти другую публичную сессию"
                or "Find another public instance"
        end

        local function status(ru, en, failed)
            local text = currentLanguage == "ru" and ru or en
            notice.Text = text
            notice.TextColor3 = failed and Color3.fromRGB(245, 139, 121)
                or Color3.fromRGB(188, 168, 142)
            if Status and Status.Parent then Status.Text = text end
        end
        local function stop(ru, en)
            busy = false
            serial += 1
            status(ru, en, true)
        end
        local function begin(ru, en)
            if busy then return nil end
            if game.PlaceId <= 0 or not game:IsLoaded() then
                status("Игра ещё не готова.", "Game is not ready.", true)
                return nil
            end
            busy = true
            serial += 1
            local ticket = serial
            status(ru, en, false)
            task.delay(25, function()
                if busy and ticket == serial and ScreenGui.Parent then
                    stop("Переход не завершён. Повторите попытку.",
                        "Teleport did not finish. Please retry.")
                end
            end)
            return ticket
        end

        teleport.TeleportInitFailed:Connect(function(player, _, errorMessage)
            if player == LocalPlayer and busy and ScreenGui.Parent then
                stop("Не удалось подключиться: " .. tostring(errorMessage),
                    "Teleport failed: " .. tostring(errorMessage))
            end
        end)

        local function join(id, ticket)
            if ticket ~= serial or not busy then return end
            local ok, err = pcall(function()
                -- TeleportAsync cannot run from a client executor.
                teleport:TeleportToPlaceInstance(game.PlaceId, id, LocalPlayer)
            end)
            if not ok and ticket == serial then
                stop("Ошибка подключения: " .. tostring(err),
                    "Teleport error: " .. tostring(err))
            end
        end

        same.Activated:Connect(function()
            if type(game.JobId) ~= "string" or game.JobId == "" then
                status("ID сервера недоступен.", "Server ID unavailable.", true)
                return
            end
            local ticket = begin("Перезаходим на текущий сервер...",
                "Rejoining current server...")
            if ticket then task.spawn(join, game.JobId, ticket) end
        end)

        local function fetchPage(url)
            local ok, response = pcall(function() return game:HttpGet(url) end)
            if not ok or type(response) ~= "string" or response == "" then
                local requester = (type(request) == "function" and request)
                    or (type(http_request) == "function" and http_request)
                    or (type(syn) == "table" and type(syn.request) == "function"
                        and syn.request)
                if requester then
                    ok, response = pcall(function()
                        local res = requester({Url = url, Method = "GET"})
                        assert(type(res) == "table"
                            and (res.Success == true or tonumber(res.StatusCode) == 200)
                            and type(res.Body) == "string",
                            "Server API refused the request")
                        return res.Body
                    end)
                end
            end
            if not ok or type(response) ~= "string" then
                return nil, "Roblox server API unavailable"
            end
            local parsed, data = pcall(function() return json:JSONDecode(response) end)
            if not parsed or type(data) ~= "table" or type(data.data) ~= "table" then
                return nil, "Invalid Roblox server response"
            end
            return data
        end

        other.Activated:Connect(function()
            local ticket = begin("Ищем другой доступный сервер...",
                "Finding another available server...")
            if not ticket then return end
            task.spawn(function()
                local candidates, seen, cursor, failed = {}, {}, nil, false
                local currentId = game.JobId
                for _ = 1, 4 do
                    if ticket ~= serial or not busy then return end
                    local url = "https://games.roblox.com/v1/games/"
                        .. tostring(game.PlaceId)
                        .. "/servers/Public?sortOrder=Asc&excludeFullGames=true&limit=50"
                    if cursor then url = url .. "&cursor=" .. json:UrlEncode(cursor) end
                    local data = fetchPage(url)
                    if not data then failed = true break end
                    for _, server in ipairs(data.data) do
                        if type(server) == "table"
                            and type(server.id) == "string"
                            and server.id ~= "" and server.id ~= currentId
                            and not seen[server.id]
                            and type(server.playing) == "number"
                            and type(server.maxPlayers) == "number"
                            and server.playing < server.maxPlayers then
                            seen[server.id] = true
                            candidates[#candidates + 1] = server.id
                        end
                    end
                    local nextCursor = data.nextPageCursor
                    if type(nextCursor) ~= "string" or nextCursor == ""
                        or nextCursor == cursor or #candidates >= 10 then
                        break
                    end
                    cursor = nextCursor
                end
                if ticket ~= serial or not busy then return end
                if #candidates == 0 then
                    if failed then
                        stop("Не удалось загрузить список серверов.",
                            "Cannot load Roblox server list.")
                    else
                        stop("Другие свободные серверы не найдены.",
                            "No other available public servers.")
                    end
                    return
                end
                status("Подключаемся к другому серверу...",
                    "Joining a different server...", false)
                join(candidates[math.random(1, #candidates)], ticket)
            end)
        end)
        EH.refreshServerActions()
    end

    EH.refreshHomeText = function()
        local ru = currentLanguage == "ru"
        welcome.Text = ru and "Добро пожаловать!" or "Welcome!"
        username.Text = "@" .. tostring(LocalPlayer.Name)
        intro.Text = ru
            and "Рады видеть тебя в HORIZON. Все возможности в одном интерфейсе."
            or "Welcome to HORIZON. Your tools, all in one place."
        hintTitle.Text = ru and "Раздел «Аватары»" or "Avatar Inspector"
        hintBody.Text = ru
            and "Открой вторую вкладку, чтобы просматривать аватары, аксессуары и наряды."
            or "Open the second tab to inspect avatars, accessories and outfits."
        if EH.refreshServerActions then EH.refreshServerActions() end
    end
    EH.refreshHomeText()

    -- All player settings stay inside the main tab, without extra panels.
    local playerPage = create("ScrollingFrame", {
        Name = "HorizonPlayerPage",
        Position = UDim2.fromOffset(8, 108),
        Size = UDim2.new(1, -16, 1, -166),
        CanvasSize = UDim2.fromOffset(0, 926),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(166, 125, 87),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollingEnabled = true,
        ClipsDescendants = true,
        BackgroundColor3 = BG,
        BorderSizePixel = 0,
        Active = true, Visible = false, ZIndex = 30
    }, Main)
    round(playerPage, 12)
    local playerCard = create("Frame", {
        Name = "HorizonPlayerCard",
        Position = UDim2.fromOffset(12, 14),
        Size = UDim2.new(1, -24, 0, 151),
        BackgroundColor3 = Color3.fromRGB(36, 31, 26),
        BorderSizePixel = 0,
        ZIndex = 31
    }, playerPage)
    round(playerCard, 13)
    create("UIStroke", {Color = Color3.fromRGB(154, 113, 72),
        Thickness = 1.2, Transparency = 0.17}, playerCard)
    local playerTitle = makeLabel(playerCard, "",
        UDim2.new(1, -30, 0, 34), UDim2.fromOffset(16, 16), 20)
    playerTitle.Font = Enum.Font.GothamBold
    playerTitle.TextColor3 = Color3.fromRGB(246, 220, 187)
    playerTitle.ZIndex = 32
    local playerDescription = makeLabel(playerCard, "",
        UDim2.new(1, -30, 0, 77), UDim2.fromOffset(16, 57), 13)
    playerDescription.TextColor3 = Color3.fromRGB(195, 181, 164)
    playerDescription.TextWrapped = true
    playerDescription.TextYAlignment = Enum.TextYAlignment.Top
    playerDescription.TextTruncate = Enum.TextTruncate.None
    playerDescription.ZIndex = 32

    -- HORIZON / Accent Corner #10 + Smooth Check #7.
    -- UI control only: the flight controller is not connected yet.
    do
        local flyCard = create("Frame", {
            Name = "HorizonFlyCard",
            Position = UDim2.fromOffset(12, 732),
            Size = UDim2.new(1, -24, 0, 78),
            BackgroundColor3 = Color3.fromRGB(40, 37, 33),
            BorderSizePixel = 0,
            ZIndex = 31
        }, playerPage)
        round(flyCard, 10)
        create("UIStroke", {
            Color = Color3.fromRGB(69, 64, 58),
            Thickness = 1,
            Transparency = 0
        }, flyCard)

        local accent = create("Frame", {
            Name = "BronzeCornerAccent",
            Position = UDim2.fromOffset(13, 19),
            Size = UDim2.fromOffset(3, 39),
            BackgroundColor3 = Color3.fromRGB(190, 147, 107),
            BorderSizePixel = 0,
            ZIndex = 32
        }, flyCard)
        round(accent, 2)

        EH.safeIcon(flyCard, "fly", UDim2.fromOffset(27, 26), 25)

        local flyTitle = makeLabel(flyCard, "Fly",
            UDim2.new(1, -174, 0, 25), UDim2.fromOffset(64, 16), 16)
        flyTitle.Font = Enum.Font.GothamBold
        flyTitle.TextColor3 = Color3.fromRGB(242, 223, 205)
        flyTitle.ZIndex = 32

        local flySubtitle = makeLabel(flyCard, "Режим полёта",
            UDim2.new(1, -174, 0, 20), UDim2.fromOffset(64, 41), 11)
        flySubtitle.TextColor3 = Color3.fromRGB(170, 160, 152)
        flySubtitle.ZIndex = 32

        local flyToggle = create("TextButton", {
            Name = "HorizonFlyToggle",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -15, 0.5, 0),
            Size = UDim2.fromOffset(68, 34),
            BackgroundColor3 = Color3.fromRGB(60, 58, 55),
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Active = true,
            Selectable = true,
            ZIndex = 33
        }, flyCard)
        round(flyToggle, 17)
        local toggleStroke = create("UIStroke", {
            Color = Color3.fromRGB(109, 102, 95),
            Thickness = 1,
            Transparency = 0
        }, flyToggle)

        local knob = create("Frame", {
            Name = "SmoothCheckKnob",
            Position = UDim2.fromOffset(4, 4),
            Size = UDim2.fromOffset(26, 26),
            BackgroundColor3 = Color3.fromRGB(197, 190, 183),
            BorderSizePixel = 0,
            Active = false,
            ZIndex = 34
        }, flyToggle)
        round(knob, 13)
        local checkmark = makeLabel(knob, "✓",
            UDim2.fromScale(1, 1), UDim2.fromOffset(0, -1), 19)
        checkmark.Name = "SmoothCheckMark"
        checkmark.TextColor3 = Color3.fromRGB(40, 123, 59)
        checkmark.TextXAlignment = Enum.TextXAlignment.Center
        checkmark.TextYAlignment = Enum.TextYAlignment.Center
        checkmark.TextTransparency = 1
        checkmark.Font = Enum.Font.GothamBold
        checkmark.Active = false
        checkmark.ZIndex = 35

        local isEnabled = false
        local function setFlyVisualState(enabled)
            isEnabled = enabled
            flyToggle:SetAttribute("FlyToggleEnabled", enabled)
            local movement = TweenInfo.new(0.43, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local colors = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(knob, movement, {
                Position = UDim2.fromOffset(enabled and 38 or 4, 4)
            }):Play()
            TweenService:Create(knob, colors, {
                BackgroundColor3 = enabled and Color3.fromRGB(220, 255, 208)
                    or Color3.fromRGB(197, 190, 183)
            }):Play()
            TweenService:Create(flyToggle, colors, {
                BackgroundColor3 = enabled and Color3.fromRGB(80, 107, 74)
                    or Color3.fromRGB(60, 58, 55)
            }):Play()
            TweenService:Create(toggleStroke, colors, {
                Color = enabled and Color3.fromRGB(164, 217, 146)
                    or Color3.fromRGB(109, 102, 95)
            }):Play()
            TweenService:Create(checkmark, colors, {
                TextTransparency = enabled and 0 or 1
            }):Play()
        end

        -- Fly is isolated in the separate Functions/Player.lua repository.
        -- Never fetch or compile it during HORIZON startup.
        -- A private GitHub repository cannot be read via anonymous HttpGet:
        -- this guarded loader fails without affecting the main UI.
        local flyController = nil
        local flyRetryAt, flyRetryReason = 0, nil
        local flyModuleURL =
            "https://raw.githubusercontent.com/kykrunikcu-byte/Functions/main/Player.lua"

        local function getFlyController()
            if flyController then return flyController end
            if os.clock() < flyRetryAt then return nil, flyRetryReason end
            local function failed(reason)
                flyRetryAt = os.clock() + 6
                flyRetryReason = reason
                EH.logDiagnostic("Player controller", reason)
                return nil, reason
            end
            if not EH.capabilities.compile then
                return failed("loadstring is unavailable")
            end
            local fetched, contents = pcall(function()
                return game:HttpGet(flyModuleURL)
            end)
            if not fetched or type(contents) ~= "string"
                or contents:sub(1, 2) ~= "--" then
                return failed("Player.lua cannot be downloaded (check repository visibility)")
            end
            local compiled, chunk = pcall(loadstring, contents)
            if not compiled or type(chunk) ~= "function" then
                return failed("Player.lua compilation failed: " .. tostring(chunk))
            end
            local ran, result = pcall(chunk)
            if not ran or type(result) ~= "table" or type(result.new) ~= "function" then
                return failed("Player.lua did not provide its module interface")
            end
            local initialized, controller = pcall(result.new, {
                screenGui = ScreenGui,
                player = LocalPlayer,
                userInput = UserInputService,
                tweens = TweenService
            })
            if not initialized or type(controller) ~= "table" then
                return failed("Player.lua initialization failed: " .. tostring(controller))
            end
            flyController = controller
            flyRetryAt, flyRetryReason = 0, nil
            EH.registerController("Player", controller)
            return controller
        end

        flyToggle.Activated:Connect(function()
            if isEnabled then
                if flyController then
                    local ok, reason = pcall(function() flyController:disable() end)
                    if not ok then warn("[HORIZON Fly] Disable error: " .. tostring(reason)) end
                end
                setFlyVisualState(false)
                return
            end

            local controller, err = getFlyController()
            if not controller then
                warn("[HORIZON Fly] " .. tostring(err))
                setFlyVisualState(false)
                return
            end
            local ok, reason = pcall(function() controller:enable() end)
            if not ok then
                warn("[HORIZON Fly] Enable error: " .. tostring(reason))
                pcall(function() controller:disable() end)
                setFlyVisualState(false)
                return
            end
            setFlyVisualState(true)
        end)

        EH.stopFly = function()
            if flyController then
                EH.releaseController("Player")
                pcall(function() flyController:destroy() end)
                flyController = nil
            end
            isEnabled = false
        end

        -- Noclip: same Accent Corner card and Smooth Check animation as Fly.
        -- It uses the already-loaded Player.lua controller, not a second loader.
        local noclipCard = create("Frame", {
            Name = "HorizonNoclipCard",
            Position = UDim2.fromOffset(12, 824),
            Size = UDim2.new(1, -24, 0, 78),
            BackgroundColor3 = Color3.fromRGB(40, 37, 33),
            BorderSizePixel = 0, ZIndex = 31
        }, playerPage)
        round(noclipCard, 10)
        create("UIStroke", {
            Color = Color3.fromRGB(69, 64, 58),
            Thickness = 1, Transparency = 0
        }, noclipCard)
        local noclipAccent = create("Frame", {
            Name = "BronzeCornerAccent",
            Position = UDim2.fromOffset(13, 19),
            Size = UDim2.fromOffset(3, 39),
            BackgroundColor3 = Color3.fromRGB(190, 147, 107),
            BorderSizePixel = 0, ZIndex = 32
        }, noclipCard)
        round(noclipAccent, 2)
        EH.safeIcon(noclipCard, "ghost", UDim2.fromOffset(27, 26), 25)

        local noclipTitle = makeLabel(noclipCard, "Noclip",
            UDim2.new(1, -174, 0, 25), UDim2.fromOffset(64, 16), 16)
        noclipTitle.Font = Enum.Font.GothamBold
        noclipTitle.TextColor3 = Color3.fromRGB(242, 223, 205)
        noclipTitle.ZIndex = 32
        local noclipSubtitle = makeLabel(noclipCard, "Сквозь стены",
            UDim2.new(1, -174, 0, 20), UDim2.fromOffset(64, 41), 11)
        noclipSubtitle.TextColor3 = Color3.fromRGB(170, 160, 152)
        noclipSubtitle.ZIndex = 32

        local noclipToggle = create("TextButton", {
            Name = "HorizonNoclipToggle",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -15, 0.5, 0),
            Size = UDim2.fromOffset(68, 34),
            BackgroundColor3 = Color3.fromRGB(60, 58, 55),
            BorderSizePixel = 0, Text = "",
            AutoButtonColor = false, Active = true,
            Selectable = true, ZIndex = 33
        }, noclipCard)
        round(noclipToggle, 17)
        local noclipStroke = create("UIStroke", {
            Color = Color3.fromRGB(109, 102, 95),
            Thickness = 1, Transparency = 0
        }, noclipToggle)
        local noclipKnob = create("Frame", {
            Name = "SmoothCheckKnob",
            Position = UDim2.fromOffset(4, 4),
            Size = UDim2.fromOffset(26, 26),
            BackgroundColor3 = Color3.fromRGB(197, 190, 183),
            BorderSizePixel = 0, Active = false, ZIndex = 34
        }, noclipToggle)
        round(noclipKnob, 13)
        local noclipCheck = makeLabel(noclipKnob, "✓",
            UDim2.fromScale(1, 1), UDim2.fromOffset(0, -1), 19)
        noclipCheck.Name = "SmoothCheckMark"
        noclipCheck.TextColor3 = Color3.fromRGB(40, 123, 59)
        noclipCheck.TextXAlignment = Enum.TextXAlignment.Center
        noclipCheck.TextYAlignment = Enum.TextYAlignment.Center
        noclipCheck.TextTransparency = 1
        noclipCheck.Font = Enum.Font.GothamBold
        noclipCheck.Active = false
        noclipCheck.ZIndex = 35

        local noclipEnabled = false
        local function setNoclipVisual(enabled)
            noclipEnabled = enabled
            noclipToggle:SetAttribute("NoclipEnabled", enabled)
            local move = TweenInfo.new(0.43, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local color = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(noclipKnob, move, {
                Position = UDim2.fromOffset(enabled and 38 or 4, 4)
            }):Play()
            TweenService:Create(noclipKnob, color, {
                BackgroundColor3 = enabled and Color3.fromRGB(220, 255, 208)
                    or Color3.fromRGB(197, 190, 183)
            }):Play()
            TweenService:Create(noclipToggle, color, {
                BackgroundColor3 = enabled and Color3.fromRGB(80, 107, 74)
                    or Color3.fromRGB(60, 58, 55)
            }):Play()
            TweenService:Create(noclipStroke, color, {
                Color = enabled and Color3.fromRGB(164, 217, 146)
                    or Color3.fromRGB(109, 102, 95)
            }):Play()
            TweenService:Create(noclipCheck, color, {
                TextTransparency = enabled and 0 or 1
            }):Play()
        end
        noclipToggle.Activated:Connect(function()
            if noclipEnabled then
                if flyController then
                    local ok, err = pcall(function() flyController:disableNoclip() end)
                    if not ok then
                        warn("[HORIZON Noclip] Disable failed: " .. tostring(err))
                        return
                    end
                end
                setNoclipVisual(false)
                return
            end

            local controller, err = getFlyController()
            if not controller then
                warn("[HORIZON Noclip] " .. tostring(err))
                setNoclipVisual(false)
                return
            end
            if type(controller.enableNoclip) ~= "function" then
                warn("[HORIZON Noclip] Update Player.lua: missing enableNoclip")
                return
            end
            local ok, problem = pcall(function() controller:enableNoclip() end)
            if not ok then
                warn("[HORIZON Noclip] Enable failed: " .. tostring(problem))
                pcall(function() controller:disableNoclip() end)
                setNoclipVisual(false)
                return
            end
            setNoclipVisual(true)
        end)

        -- Reuse HORIZON's existing full-close cleanup for both player tools.
        local stopPreviousPlayerTools = EH.stopFly
        EH.stopFly = function()
            if stopPreviousPlayerTools then stopPreviousPlayerTools() end
            noclipEnabled = false
        end

        -- All numerical player controls share one in-page card, no extra panels.
        local function makeStatCard(kind, y, title, descriptionRU, descriptionEN,
            method, resetMethod, glyph, manualLimit)
            manualLimit = manualLimit or 10000000
            local card = create("Frame", {
                Name = kind == "speed" and "HorizonSpeedCard"
                    or (kind == "jump" and "HorizonJumpCard" or "HorizonGravityCard"),
                Position = UDim2.fromOffset(12, y),
                Size = UDim2.new(1, -24, 0, 170),
                BackgroundColor3 = Color3.fromRGB(40, 37, 33),
                BorderSizePixel = 0, ZIndex = 31
            }, playerPage)
            round(card, 10)
            create("UIStroke", {Color = Color3.fromRGB(69, 64, 58),
                Thickness = 1}, card)
            local accent = create("Frame", {
                Position = UDim2.fromOffset(13, 15), Size = UDim2.fromOffset(3, 40),
                BackgroundColor3 = Color3.fromRGB(190, 147, 107),
                BorderSizePixel = 0, ZIndex = 32
            }, card)
            round(accent, 2)

            local iconLabel = makeLabel(card, glyph, UDim2.fromOffset(27, 25),
                UDim2.fromOffset(27, 21), 23)
            iconLabel.Font = Enum.Font.GothamBold
            iconLabel.TextColor3 = Color3.fromRGB(216, 173, 115)
            iconLabel.TextXAlignment = Enum.TextXAlignment.Center
            iconLabel.ZIndex = 32
            local caption = makeLabel(card, title, UDim2.new(1, -178, 0, 24),
                UDim2.fromOffset(64, 11), 15)
            caption.Font = Enum.Font.GothamBold
            caption.TextColor3 = Color3.fromRGB(242, 223, 205)
            caption.ZIndex = 32
            local description = makeLabel(card, "", UDim2.new(1, -174, 0, 18),
                UDim2.fromOffset(64, 36), 11)
            description.TextColor3 = Color3.fromRGB(170, 160, 152)
            description.ZIndex = 32

            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local initial
            if kind == "gravity" then
                initial = workspace.Gravity
            elseif kind == "speed" then
                initial = humanoid and humanoid.WalkSpeed or 16
            else
                initial = humanoid and (humanoid.UseJumpPower and humanoid.JumpPower
                    or humanoid.JumpHeight) or 50
            end
            local readout = makeLabel(card, tostring(initial),
                UDim2.fromOffset(101, 25), UDim2.new(1, -112, 0, 17), 13)
            readout.Font = Enum.Font.GothamBold
            readout.TextColor3 = Color3.fromRGB(229, 187, 138)
            readout.TextXAlignment = Enum.TextXAlignment.Right
            readout.ZIndex = 32

            local slider = create("TextButton", {
                Name = "StatSlider", Text = "", AutoButtonColor = false,
                Position = UDim2.fromOffset(16, 65),
                Size = UDim2.new(1, -32, 0, 25),
                BackgroundTransparency = 1, BorderSizePixel = 0,
                Active = true, ZIndex = 33
            }, card)
            local rail = create("Frame", {
                Size = UDim2.new(1, 0, 0, 6),
                Position = UDim2.new(0, 0, 0.5, -3),
                BackgroundColor3 = Color3.fromRGB(84, 72, 60),
                BorderSizePixel = 0, Active = false, ZIndex = 33
            }, slider)
            round(rail, 3)
            local fill = create("Frame", {
                Size = UDim2.fromScale(math.clamp(initial / 500, 0, 1), 1),
                BackgroundColor3 = Color3.fromRGB(204, 159, 111),
                BorderSizePixel = 0, Active = false, ZIndex = 34
            }, rail)
            round(fill, 3)
            local knob = create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(math.clamp(initial / 500, 0, 1), 0.5),
                Size = UDim2.fromOffset(16, 16),
                BackgroundColor3 = Color3.fromRGB(227, 190, 151),
                BorderSizePixel = 0, Active = false, ZIndex = 35
            }, slider)
            round(knob, 8)
            local low = makeLabel(card, "0", UDim2.fromOffset(40, 16),
                UDim2.fromOffset(16, 91), 10)
            low.TextColor3 = Color3.fromRGB(179, 166, 148)
            low.ZIndex = 32
            local high = makeLabel(card, "500", UDim2.fromOffset(50, 16),
                UDim2.new(1, -66, 0, 91), 10)
            high.TextXAlignment = Enum.TextXAlignment.Right
            high.TextColor3 = Color3.fromRGB(179, 166, 148)
            high.ZIndex = 32

            -- Gravity is slider-only (0–500); manual entry remains for speed/jump.
            local manualLabel, manual
            if kind ~= "gravity" then
                manualLabel = makeLabel(card, "", UDim2.new(1, -28, 0, 18),
                    UDim2.fromOffset(16, 109), 11)
                manualLabel.TextColor3 = Color3.fromRGB(201, 184, 162)
                manualLabel.ZIndex = 32
                manual = create("TextBox", {
                    Name = kind == "speed" and "HorizonSpeedInput" or "HorizonJumpInput",
                    Position = UDim2.fromOffset(16, 132),
                    Size = UDim2.new(1, -128, 0, 29),
                    BackgroundColor3 = Color3.fromRGB(48, 43, 39),
                    BorderSizePixel = 0,
                    Text = tostring(initial), PlaceholderText = "0–" .. tostring(manualLimit),
                    ClearTextOnFocus = false,
                    TextColor3 = Color3.fromRGB(242, 223, 205),
                    PlaceholderColor3 = Color3.fromRGB(163, 150, 134),
                    Font = Enum.Font.Gotham, TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 33
                }, card)
                round(manual, 7)
                create("UIStroke", {Color = Color3.fromRGB(95, 77, 60),
                    Thickness = 1}, manual)
            end
            local reset = create("TextButton", {
                Name = "StatReset",
                Position = kind == "gravity" and UDim2.fromOffset(16, 121)
                    or UDim2.new(1, -104, 0, 132),
                Size = kind == "gravity" and UDim2.new(1, -32, 0, 34)
                    or UDim2.fromOffset(88, 29), Text = "",
                BackgroundColor3 = Color3.fromRGB(76, 62, 50),
                BorderSizePixel = 0,
                TextColor3 = Color3.fromRGB(239, 216, 188),
                Font = Enum.Font.GothamMedium, TextSize = 11,
                AutoButtonColor = true, Active = true, ZIndex = 33
            }, card)
            round(reset, 7)

            local function show(value, updateManual)
                readout.Text = tostring(value)
                local t = math.clamp(value / 500, 0, 1)
                fill.Size = UDim2.fromScale(t, 1)
                knob.Position = UDim2.fromScale(t, 0.5)
                if updateManual and manual then manual.Text = tostring(value) end
                if manual then manual.TextColor3 = Color3.fromRGB(242, 223, 205) end
                readout.TextColor3 = Color3.fromRGB(229, 187, 138)
            end
            local function apply(value, updateManual)
                local controller, errorText = getFlyController()
                if not controller or type(controller[method]) ~= "function" then
                    warn("[HORIZON " .. title .. "] " .. tostring(errorText or "Missing method"))
                    if manual then manual.TextColor3 = Color3.fromRGB(248, 128, 128)
                    else readout.TextColor3 = Color3.fromRGB(248, 128, 128) end
                    return
                end
                local ok, result, err = pcall(controller[method], controller, value)
                if not ok or result == false then
                    warn("[HORIZON " .. title .. "] " .. tostring(ok and err or result))
                    if manual then manual.TextColor3 = Color3.fromRGB(248, 128, 128)
                    else readout.TextColor3 = Color3.fromRGB(248, 128, 128) end
                    return
                end
                show(value, updateManual)
            end

            -- Temporary global pointers prevent lingering listeners and keep
            -- touch slider movement independent of page scrolling.
            local moving, pointer, onMove, onRelease = false, nil, nil, nil
            local function release()
                moving, pointer = false, nil
                if onMove then onMove:Disconnect(); onMove = nil end
                if onRelease then onRelease:Disconnect(); onRelease = nil end
                if playerPage.Parent then playerPage.ScrollingEnabled = true end
            end
            local function dragTo(x)
                local width = slider.AbsoluteSize.X
                if width <= 0 then return end
                local value = math.floor(math.clamp(
                    (x - slider.AbsolutePosition.X) / width, 0, 1) * 500 + 0.5)
                apply(value, false)
            end
            slider.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1
                    and input.UserInputType ~= Enum.UserInputType.Touch then return end
                release()
                moving, pointer = true, input
                playerPage.ScrollingEnabled = false
                dragTo(input.Position.X)
                onMove = UserInputService.InputChanged:Connect(function(changed)
                    if moving and (changed == pointer or (pointer
                        and pointer.UserInputType == Enum.UserInputType.MouseButton1
                        and changed.UserInputType == Enum.UserInputType.MouseMovement)) then
                        dragTo(changed.Position.X)
                    end
                end)
                onRelease = UserInputService.InputEnded:Connect(function(ended)
                    if ended == pointer or (pointer
                        and pointer.UserInputType == Enum.UserInputType.MouseButton1
                        and ended.UserInputType == Enum.UserInputType.MouseButton1) then
                        release()
                    end
                end)
            end)
            ScreenGui.Destroying:Connect(release)
            if manual then
                manual.FocusLost:Connect(function(enterPressed)
                    if not enterPressed then return end
                    local digits = manual.Text:match("^%s*(%d+)%s*$")
                    local value = digits and tonumber(digits)
                    if not value or value > manualLimit then
                        manual.TextColor3 = Color3.fromRGB(248, 128, 128)
                        return
                    end
                    apply(value, true)
                end)
            end
            reset.Activated:Connect(function()
                local controller, err = getFlyController()
                if not controller or type(controller[resetMethod]) ~= "function" then
                    warn("[HORIZON " .. title .. "] " .. tostring(err or "Missing reset"))
                    return
                end
                local ok, value = pcall(controller[resetMethod], controller)
                if ok and type(value) == "number" then
                    show(value, true)
                else
                    warn("[HORIZON " .. title .. "] Reset failed: " .. tostring(value))
                end
            end)
            return function()
                local ru = currentLanguage == "ru"
                description.Text = ru and descriptionRU or descriptionEN
                if manualLabel then
                    manualLabel.Text = ru and "Ручной ввод (Enter)" or "Manual entry (Enter)"
                end
                reset.Text = ru and "Сброс" or "Reset"
            end
        end
        local refreshSpeed = makeStatCard("speed", 180,
            "Speed", "Скорость передвижения", "Movement speed",
            "setWalkSpeed", "resetWalkSpeed", "»")
        local refreshJump = makeStatCard("jump", 364,
            "Jump Power", "Высота прыжка", "Jump height / power",
            "setJumpPower", "resetJumpPower", "↑")
        local refreshGravity = makeStatCard("gravity", 548,
            "Gravity", "Гравитация", "World gravity",
            "setGravity", "resetGravity", "↓", 100000)
        local function refreshStatCards()
            refreshSpeed()
            refreshJump()
            refreshGravity()
        end

        -- The existing localization system can call the most recent page refresh.
        EH.refreshFlyCardText = function()
            flySubtitle.Text = currentLanguage == "ru" and "Режим полёта" or "Flight mode"
            noclipSubtitle.Text = currentLanguage == "ru" and "Сквозь стены" or "Through walls"
            refreshStatCards()
        end
    end

    local refreshHome = EH.refreshHomeText
    EH.refreshHomeText = function()
        refreshHome()
        local ru = currentLanguage == "ru"
        playerTitle.Text = ru and "Управление игроком" or "Player tools"
        if EH.refreshFlyCardText then EH.refreshFlyCardText() end
        playerDescription.Text = ru
            and "Скорость, прыжок, гравитация, Fly и Noclip — всё в одном разделе."
            or "Speed, jumping, gravity, Fly and Noclip — all in one place."
    end
    EH.refreshHomeText()

    -- ESP page is navigation-only until the user approves specific ESP tools.
    local espPage = create("Frame", {
        Name = "HorizonESPPage",
        Position = UDim2.fromOffset(8, 108),
        Size = UDim2.new(1, -16, 1, -166),
        BackgroundColor3 = BG,
        BorderSizePixel = 0,
        Active = true,
        Visible = false,
        ZIndex = 30
    }, Main)
    round(espPage, 12)
    local espCard = create("Frame", {
        Name = "HorizonESPWelcomeCard",
        Position = UDim2.fromOffset(12, 14),
        Size = UDim2.new(1, -24, 0, 151),
        BackgroundColor3 = Color3.fromRGB(36, 31, 26),
        BorderSizePixel = 0,
        ZIndex = 31
    }, espPage)
    round(espCard, 13)
    create("UIStroke", {Color = Color3.fromRGB(154, 113, 72),
        Thickness = 1.2, Transparency = 0.17}, espCard)
    local espTitle = makeLabel(espCard, "ESP",
        UDim2.new(1, -30, 0, 34), UDim2.fromOffset(16, 16), 20)
    espTitle.Font = Enum.Font.GothamBold
    espTitle.TextColor3 = Color3.fromRGB(246, 220, 187)
    espTitle.ZIndex = 32
    local espDescription = makeLabel(espCard, "",
        UDim2.new(1, -30, 0, 77), UDim2.fromOffset(16, 57), 13)
    espDescription.TextColor3 = Color3.fromRGB(195, 181, 164)
    espDescription.TextWrapped = true
    espDescription.TextYAlignment = Enum.TextYAlignment.Top
    espDescription.TextTruncate = Enum.TextTruncate.None
    espDescription.ZIndex = 32
    local refreshPlayerAndHome = EH.refreshHomeText
    EH.refreshHomeText = function()
        refreshPlayerAndHome()
        espTitle.Text = "ESP"
        espDescription.Text = currentLanguage == "ru"
            and "Здесь появятся настройки подсветки игроков и объектов. Пока функции не добавлены."
            or "Player and object highlighting options will appear here. No functions have been added yet."
    end
    EH.refreshHomeText()

    -- Dedicated navigation bar below the header, not inside its narrow title row.
    local nav = create("Frame", {
        Name = "HorizonNavigationBar",
        Position = UDim2.fromOffset(12, 54),
        Size = UDim2.fromOffset(450, 48),
        BackgroundColor3 = Color3.fromRGB(32, 28, 24),
        BorderSizePixel = 0,
        ZIndex = 12,
        Active = true
    }, Main)
    round(nav, 12)
    create("UIStroke", {Color = Color3.fromRGB(132, 98, 67),
        Thickness = 1.1, Transparency = 0.2}, nav)

    local homeTab = makeButton(nav, "Главная",
        UDim2.new(0.25, -5, 1, -8), UDim2.fromOffset(4, 4),
        Color3.fromRGB(47, 37, 29))
    homeTab.Name = "HorizonHomeTab"
    local avatarsTab = makeButton(nav, "Аватары",
        UDim2.new(0.25, -5, 1, -8), UDim2.new(0.25, 2, 0, 4),
        Color3.fromRGB(35, 30, 25))
    avatarsTab.Name = "HorizonAvatarsTab"
    local playerTab = makeButton(nav, "Игрок",
        UDim2.new(0.25, -5, 1, -8), UDim2.new(0.5, 0, 0, 4),
        Color3.fromRGB(35, 30, 25))
    playerTab.Name = "HorizonPlayerTab"
    local espTab = makeButton(nav, "ESP",
        UDim2.new(0.25, -5, 1, -8), UDim2.new(0.75, -2, 0, 4),
        Color3.fromRGB(35, 30, 25))
    espTab.Name = "HorizonESPTab"

    local tabs = {homeTab, avatarsTab, playerTab, espTab}
    -- Keep icons and captions in separate non-interactive layers.
    -- TextButton.Text previously occupied the full control and overlapped the icon.
    local captions = {"Главная", "Аватары", "Игрок", "ESP"}
    for i, tab in ipairs(tabs) do
        tab.ZIndex = 13
        tab.Font = Enum.Font.GothamBold
        tab.Text = ""
        EH.styleIconAction(tab)

        local caption = makeLabel(tab, captions[i],
            UDim2.new(1, -6, 0, 15), UDim2.new(0, 3, 1, -18), 11)
        caption.Name = "HorizonTabCaption"
        caption.Font = Enum.Font.GothamBold
        caption.TextColor3 = Color3.fromRGB(234, 216, 182)
        caption.TextXAlignment = Enum.TextXAlignment.Center
        caption.TextYAlignment = Enum.TextYAlignment.Center
        caption.TextTruncate = Enum.TextTruncate.AtEnd
        caption.Active = false
        caption.ZIndex = tab.ZIndex + 2
    end

    -- Original native icons, now centered in the upper half of each button.
    local glyphs = {
        EH.safeIcon(homeTab, "home", UDim2.new(0.5, -10, 0, 3), 20),
        EH.safeIcon(avatarsTab, "shirt_tab", UDim2.new(0.5, -10, 0, 3), 20),
        EH.safeIcon(playerTab, "user_round_cog", UDim2.new(0.5, -10, 0, 3), 20),
        EH.safeIcon(espTab, "eye", UDim2.new(0.5, -10, 0, 3), 20)
    }

    EH.layoutHorizonTabs = function(mobile, windowWidth)
        local width = mobile and (windowWidth - 24) or 450
        nav.Size = UDim2.fromOffset(width, 48)
        nav.Position = UDim2.new(0.5, -width / 2, 0, 54)
        -- Both desktop and mobile use one stable stacked layout.
        for i, tab in ipairs(tabs) do
            local glyph = glyphs[i]
            if glyph then glyph.Position = UDim2.new(0.5, -10, 0, 3) end
            local caption = tab:FindFirstChild("HorizonTabCaption")
            if caption then caption.TextSize = mobile and 10 or 11 end
        end
    end

    local function selectPage(page)
        layer.Visible = page == "Home"
        playerPage.Visible = page == "Player"
        espPage.Visible = page == "ESP"
        for _, entry in ipairs({
            {button = homeTab, active = page == "Home"},
            {button = avatarsTab, active = page == "Avatars"},
            {button = playerTab, active = page == "Player"},
            {button = espTab, active = page == "ESP"}
        }) do
            local button = entry.button
            button:SetAttribute("SelectedControl", entry.active)
            button.BackgroundColor3 = entry.active
                and Color3.fromRGB(93, 67, 43) or Color3.fromRGB(35, 30, 25)
            local stroke = button:FindFirstChildOfClass("UIStroke")
            if stroke then stroke.Transparency = entry.active and 0.02 or 0.2 end
        end
    end
    homeTab.Activated:Connect(function() selectPage("Home") end)
    avatarsTab.Activated:Connect(function() selectPage("Avatars") end)
    playerTab.Activated:Connect(function() selectPage("Player") end)
    espTab.Activated:Connect(function() selectPage("ESP") end)
    selectPage("Home")
end

--==================================================
-- RESPONSIVE LAYOUT
--==================================================

local function updateLayout()
    local camera = workspace.CurrentCamera
    if not camera then return end

    local screen = camera.ViewportSize
    local mobile = screen.X < 650

    local width = mobile and 360 or 800
    local height = mobile and 676 or 576

    Main.Size = UDim2.fromOffset(width, height)
    if EH.layoutHorizonTabs then EH.layoutHorizonTabs(mobile, width) end
    if EH.layoutAvatarSourceBar then EH.layoutAvatarSourceBar(mobile) end

    UIScale.Scale = math.min(
        (screen.X - 20) / width,
        (screen.Y - 30) / height,
        1
    )
    windowBaseScale = UIScale.Scale

    EHBridge.Visible = not mobile
    ItemsStatusChip.Visible = not mobile
    if EH.emptyPreview then
        EH.emptyPreview.Size = mobile and UDim2.fromOffset(110, 110)
            or UDim2.fromOffset(142, 128)
    end

    if mobile then
        Search.Position = UDim2.fromOffset(12, 114)
        Search.Size = UDim2.new(1, -132, 0, 34)

        ModeButton.Position = UDim2.new(1, -112, 0, 114)
        ModeButton.Size = UDim2.fromOffset(100, 34)

        PlayerList.Position = UDim2.fromOffset(12, 156)
        PlayerList.Size = UDim2.new(1, -24, 0, 90)

        Viewport.Position = UDim2.fromOffset(12, 288)
        Viewport.Size = UDim2.new(1, -24, 0, 145)

        PoseBar.Position = UDim2.fromOffset(12, 437)
        PoseBar.Size = UDim2.new(1, -24, 0, 32)

        ItemsPanel.Position = UDim2.fromOffset(12, 473)
        ItemsPanel.Size = UDim2.new(1, -24, 0, 137)
        ItemList.Position = UDim2.fromOffset(6, 60)
        ItemList.Size = UDim2.new(1, -12, 1, -65)

        Status.Position = UDim2.new(0, 181, 1, -45)
        Status.Size = UDim2.new(1, -240, 0, 30)
    else
        Search.Position = UDim2.fromOffset(12, 114)
        Search.Size = UDim2.new(1, -132, 0, 36)

        ModeButton.Position = UDim2.new(1, -112, 0, 114)
        ModeButton.Size = UDim2.fromOffset(100, 36)

        PlayerList.Position = UDim2.fromOffset(12, 160)
        PlayerList.Size = UDim2.fromOffset(190, 310)

        Viewport.Position = UDim2.fromOffset(214, 199)
        Viewport.Size = UDim2.fromOffset(300, 271)

        PoseBar.Position = UDim2.fromOffset(214, 476)
        PoseBar.Size = UDim2.fromOffset(300, 32)

        ItemsPanel.Position = UDim2.fromOffset(526, 160)
        ItemsPanel.Size = UDim2.fromOffset(262, 350)
        ItemList.Position = UDim2.fromOffset(6, 63)
        ItemList.Size = UDim2.new(1, -12, 1, -97)

        Status.Position = UDim2.new(0, 181, 1, -45)
        Status.Size = UDim2.new(1, -240, 0, 30)
    end
end

updateLayout()

local function connectCameraResize()
    local camera = workspace.CurrentCamera

    if camera then
        trackExternalConnection(camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateLayout))
    end
end

connectCameraResize()

trackExternalConnection(workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    task.wait()
    connectCameraResize()
    updateLayout()
end))

--==================================================
-- DRAGGING
--==================================================

local function makeDraggable(guiObject, handle)
    local dragging = false
    local startPointer, startGuiPosition, activeTouch
    handle.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then return end
        dragging = true
        activeTouch = input.UserInputType == Enum.UserInputType.Touch and input or nil
        startPointer = input.Position
        startGuiPosition = guiObject.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                activeTouch = nil
            end
        end)
    end)
    trackExternalConnection(UserInputService.InputChanged:Connect(function(input)
        if not dragging or not startPointer or not startGuiPosition then return end
        if activeTouch then
            if input ~= activeTouch then return end
        elseif input.UserInputType ~= Enum.UserInputType.MouseMovement then
            return
        end
        local delta = input.Position - startPointer
        local parentSize = guiObject.Parent.AbsoluteSize
        local scaledSize = guiObject.AbsoluteSize
        local anchor = guiObject.AnchorPoint
        local currentX = startGuiPosition.X.Scale * parentSize.X + startGuiPosition.X.Offset + delta.X
        local currentY = startGuiPosition.Y.Scale * parentSize.Y + startGuiPosition.Y.Offset + delta.Y
        local minX, maxX = scaledSize.X * anchor.X + 4, parentSize.X - scaledSize.X * (1 - anchor.X) - 4
        local minY, maxY = scaledSize.Y * anchor.Y + 4, parentSize.Y - scaledSize.Y * (1 - anchor.Y) - 4
        if maxX >= minX then currentX = math.clamp(currentX, minX, maxX) end
        if maxY >= minY then currentY = math.clamp(currentY, minY, maxY) end
        guiObject.Position = UDim2.fromOffset(currentX, currentY)
    end))
end

makeDraggable(Toggle, Toggle)
makeDraggable(Main, Header)

--==================================================
-- CLIPBOARD
--==================================================

local function copyID(id)
    local text = tostring(id)
    local copied = false

    if type(setclipboard) == "function" then
        local ok = pcall(function()
            setclipboard(text)
        end)
        copied = ok
    end

    if not copied and type(toclipboard) == "function" then
        local ok = pcall(function()
            toclipboard(text)
        end)
        copied = ok
    end

    if not copied then
        Status.Text = "Clipboard is not available"
        return false
    end

    Status.Text = "Copied ID: " .. text
    showSuccessToast("Accessory ID copied")
    return true
end

--==================================================
-- STATIC MODEL CLEANUP
--==================================================

local function removeExtraObjects(model)
    for _, object in ipairs(model:GetDescendants()) do
        if object.ClassName == "AnimationConstraint" then
            pcall(function()
                object.IsKinematic = true
            end)
        end

        if object:IsA("Tool")
        or object:IsA("Script")
        or object:IsA("LocalScript")
        or object:IsA("Animator")
        or object:IsA("ParticleEmitter")
        or object:IsA("Trail")
        or object:IsA("Beam") then
            object:Destroy()
        end
    end

    local humanoid = model:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.AutoRotate = false
        humanoid.PlatformStand = true

        pcall(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end)

        pcall(function()
            humanoid.EvaluateStateMachine = false
        end)

        pcall(function()
            humanoid.DisplayDistanceType =
                Enum.HumanoidDisplayDistanceType.None
        end)
    end

    local root = model:FindFirstChild("HumanoidRootPart", true)

    if not root then
        root = model:FindFirstChild("Torso", true)
            or model:FindFirstChild("UpperTorso", true)
    end

    for _, object in ipairs(model:GetDescendants()) do
        if object:IsA("BasePart") then
            object.CanCollide = false
            object.CanTouch = false
            object.CanQuery = false
            object.Massless = true
            object.Anchored = false
        end
    end

    if root and root:IsA("BasePart") then
        root.Anchored = true
    end
end

local function resetJoints(model)
    for _, joint in ipairs(model:GetDescendants()) do
        if isPoseJoint(joint) then
            pcall(function()
                joint.Transform = CFrame.new()
            end)
        end
    end
end

--==================================================
-- AVATAR LOADING
--==================================================

local function cloneCharacter(character)
    if not character then return nil end

    local oldArchivable = {}

    local function saveArchivable(object)
        oldArchivable[object] = object.Archivable
        object.Archivable = true
    end

    saveArchivable(character)

    for _, object in ipairs(character:GetDescendants()) do
        saveArchivable(object)
    end

    local success, clone = pcall(function()
        return character:Clone()
    end)

    for object, value in pairs(oldArchivable) do
        pcall(function()
            object.Archivable = value
        end)
    end

    if not success or not clone then return nil end

    return clone
end

-- Account descriptions are cloned per consumer, so callers may safely Destroy()
-- their own copies. Never cache or substitute a game morph for an account avatar.
EH.accountDescriptionCache = {}
local function getOriginalAvatarDescription(player, humanoid)
    local userId = player and tonumber(player.UserId)
    if userId and userId > 0 then
        local cache = EH.accountDescriptionCache
        local stored = cache[userId]
        if stored and os.clock() - stored.time <= 25 and stored.template then
            local cloneOk, clone = pcall(function()
                return stored.template:Clone()
            end)
            if cloneOk and clone then return clone, "account" end
        end
        local ok, description = pcall(function()
            if Players.GetHumanoidDescriptionFromUserIdAsync then
                return Players:GetHumanoidDescriptionFromUserIdAsync(userId)
            end
            return Players:GetHumanoidDescriptionFromUserId(userId)
        end)
        if ok and description then
            local cloned, template = pcall(function()
                return description:Clone()
            end)
            if cloned and template then
                if stored and stored.template then
                    pcall(function() stored.template:Destroy() end)
                end
                cache[userId] = {time = os.clock(), template = template}
                -- Bounded cache protects mobile memory after inspecting many players.
                local count, oldestKey, oldestTime = 0, nil, math.huge
                for id, entry in pairs(cache) do
                    count += 1
                    if entry.time < oldestTime then
                        oldestKey, oldestTime = id, entry.time
                    end
                end
                if count > 24 and oldestKey then
                    local old = cache[oldestKey]
                    cache[oldestKey] = nil
                    if old and old.template then old.template:Destroy() end
                end
            end
            return description, "account"
        end
        EH.logDiagnostic("Account avatar", "description lookup failed")
    end

    if humanoid then
        local ok, description = pcall(function()
            return humanoid:GetAppliedDescription()
        end)
        if ok and description then
            return description, "live-fallback"
        end
    end
    return nil, "unavailable"
end

local function makeStaticAvatar(player)
    if not player then return nil end

    if EH.avatarSourceMode == "Morph" then
        -- Clone the current game character and its morphs, not the account rig.
        local character = player.Character
        local copy = character and cloneCharacter(character) or nil
        if copy then
            removeExtraObjects(copy) -- preview safety; never touch live character
        end
        return copy
    end

    -- STRICT account preview: never substitute a Piggy/Brookhaven morph.
    -- This API builds the account avatar in its own R6/R15 rig.
    local ok, cleanModel = pcall(function()
        if Players.CreateHumanoidModelFromUserIdAsync then
            return Players:CreateHumanoidModelFromUserIdAsync(player.UserId)
        end
        return Players:CreateHumanoidModelFromUserId(player.UserId)
    end)
    if ok and cleanModel then
        removeExtraObjects(cleanModel)
        return cleanModel
    end

    -- Fallback is ALSO account-based. A failed lookup is an error, not a morph.
    local description = getOriginalAvatarDescription(player, nil)
    if not description then return nil end
    local rigType = Enum.HumanoidRigType.R15
    pcall(function()
        local info = Players:GetCharacterAppearanceInfoAsync(player.UserId)
        if info and info.playerAvatarType == "R6" then
            rigType = Enum.HumanoidRigType.R6
        end
    end)
    local created, model = pcall(function()
        if Players.CreateHumanoidModelFromDescriptionAsync then
            return Players:CreateHumanoidModelFromDescriptionAsync(description, rigType)
        end
        return Players:CreateHumanoidModelFromDescription(description, rigType)
    end)
    pcall(function() description:Destroy() end)
    if created and model then
        removeExtraObjects(model)
        return model
    end
    return nil
end

--==================================================
-- CAMERA AND MODEL CENTERING
--==================================================

local function clearViewport()
    -- Cancel pending loads and restore an avatar before clearing this viewport.
    if EH.closeAssetPreview then EH.closeAssetPreview() end
    for _, child in ipairs(World:GetChildren()) do
        child:Destroy()
    end

    currentModel = nil
    if EH.setPreviewReady then EH.setPreviewReady(false) end
    rotating = false
    lastPointer = nil
    table.clear(jointBases)

    for _, tween in ipairs(poseTweens) do
        pcall(function()
            tween:Cancel()
        end)
    end

    table.clear(poseTweens)
end

local function calculateFitDistance(boxSize)
    -- Use a bounding sphere so the avatar stays inside the viewport even
    -- when the camera orbits to diagonal / side / elevated angles.
    local verticalHalfFov = math.rad(Camera.FieldOfView / 2)
    local viewportSize = Viewport.AbsoluteSize
    local aspect = math.max(viewportSize.X / math.max(viewportSize.Y, 1), 0.5)
    local horizontalHalfFov = math.atan(math.tan(verticalHalfFov) * aspect)
    local limitingHalfFov = math.min(verticalHalfFov, horizontalHalfFov)
    local radius = boxSize.Magnitude / 2
    return math.max(radius / math.sin(limitingHalfFov), 4)
end

local function updateFreeOrbitCamera()
    if not currentModel then return end
    local pitchLimit = math.rad(78)
    orbitPitch = math.clamp(orbitPitch, -pitchLimit, pitchLimit)
    orbitDistance = math.clamp(orbitDistance, minimumCameraDistance, maximumCameraDistance)

    local horizontal = math.cos(orbitPitch) * orbitDistance
    local offset = Vector3.new(
        math.sin(orbitYaw) * horizontal,
        math.sin(orbitPitch) * orbitDistance,
        math.cos(orbitYaw) * horizontal
    )
    Camera.CFrame = CFrame.lookAt(offset, Vector3.new(0, 0, 0), Vector3.yAxis)
end

local function styleSelectedControl(button, selected)
    button:SetAttribute("SelectedControl", selected)
    local color = selected and Color3.fromRGB(73, 56, 36)
        or Color3.fromRGB(39, 34, 29)
    TweenService:Create(button, TweenInfo.new(0.18, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        BackgroundColor3 = color,
        TextColor3 = WHITE
    }):Play()
    local stroke = button:FindFirstChildOfClass("UIStroke")
    if stroke then
        TweenService:Create(stroke, TweenInfo.new(0.18), {
            Color = selected and Color3.fromRGB(208, 168, 110) or OUTLINE,
            Thickness = selected and 1.95 or 1,
            Transparency = selected and 0 or 0.28
        }):Play()
    end
end

local function setViewportMode(mode)
    viewportMode = mode == "Free" and "Free" or "Orbit"
    rotating = false
    styleSelectedControl(FreeViewButton, true)
    updateFreeOrbitCamera()
end

local function changeZoom(direction)
    if not currentModel then return end
    if viewportMode ~= "Free" then
        setViewportMode("Free")
    end
    orbitDistance = orbitDistance * (direction > 0 and 0.86 or 1.16)
    updateFreeOrbitCamera()
end

local function centerModel(model)
    local success, boxCFrame, boxSize = pcall(function()
        return model:GetBoundingBox()
    end)

    if not success or boxSize.Magnitude <= 0 then
        return false
    end

    local pivot = model:GetPivot()
    model:PivotTo(CFrame.new(-boxCFrame.Position) * pivot)

    Camera.FieldOfView = 40
    task.wait()

    local fitDistance = calculateFitDistance(boxSize)
    baseCameraDistance = math.max(fitDistance * 1.22, 4)
    -- Allow close inspection; ViewportFrame clipping keeps the model
    -- contained by the editor boundaries while zoomed in.
    minimumCameraDistance = math.max(fitDistance * 0.42, 2.5)
    maximumCameraDistance = math.max(baseCameraDistance * 4, minimumCameraDistance + 10)
    orbitDistance = baseCameraDistance
    orbitYaw = 0
    orbitPitch = 0

    Camera.CFrame = CFrame.lookAt(
        Vector3.new(0, 0, baseCameraDistance),
        Vector3.new(0, 0, 0)
    )

    return true
end


-- GLASS LENS: temporary item preview. No separate viewport or permanent avatar edits.
function EH.closeAssetPreview()
    EH.assetPreviewToken = (EH.assetPreviewToken or 0) + 1
    local saved = EH.assetPreviewState
    EH.assetPreviewState = nil
    EH.assetCloseButton.Visible = false
    if not saved then return end
    if saved.item and saved.item.Parent then saved.item:Destroy() end
    if saved.avatar then
        if saved.avatar.Parent == nil then saved.avatar.Parent = World end
        currentModel = saved.avatar
    else
        currentModel = nil
    end
    orbitYaw, orbitPitch = saved.yaw, saved.pitch
    orbitDistance, baseCameraDistance = saved.distance, saved.baseDistance
    minimumCameraDistance, maximumCameraDistance = saved.minimum, saved.maximum
    viewportMode = saved.mode
    Camera.FieldOfView = saved.fov
    Camera.CFrame = saved.camera
    rotating, lastPointer = false, nil
    PoseBar.Visible = saved.poseVisible
    ViewModeBar.Visible = saved.viewVisible
    if EH.setPreviewReady then EH.setPreviewReady(currentModel ~= nil) end
    Status.Text = currentLanguage == "ru" and "Просмотр аватара восстановлен" or "Avatar preview restored"
end

EH.assetCloseButton.Activated:Connect(function()
    EH.closeAssetPreview()
end)

function EH.loadItemGeometry(assetId)
    -- Existing avatar attachments are preferable: no download or permissions needed.
    if currentModel then
        for _, accessory in ipairs(currentModel:GetDescendants()) do
            if accessory:IsA("Accessory") then
                local ok, source = pcall(function() return accessory.SourceAssetId end)
                if ok and tonumber(source) == tonumber(assetId) then
                    local copy = accessory:Clone()
                    if copy then return copy end
                end
            end
        end
    end

    -- Executor support varies. Both retrieval APIs are protected.
    local loaded
    local okObjects, objects = pcall(function()
        return game:GetObjects("rbxassetid://" .. tostring(assetId))
    end)
    if okObjects and type(objects) == "table" then
        loaded = objects[1]
        for i = 2, #objects do
            pcall(function() objects[i]:Destroy() end)
        end
    end
    if not loaded then
        local okInsert, result = pcall(function()
            return game:GetService("InsertService"):LoadAsset(assetId)
        end)
        if okInsert then loaded = result end
    end
    if not loaded or typeof(loaded) ~= "Instance" then
        return nil, "Asset cannot be loaded by this executor"
    end
    return loaded
end

function EH.openAssetPreview(assetId, assetName)
    if EH.assetPreviewState then EH.closeAssetPreview() end
    EH.assetPreviewToken = (EH.assetPreviewToken or 0) + 1
    local token = EH.assetPreviewToken
    local previousAvatar = currentModel
    if not previousAvatar then
        Status.Text = currentLanguage == "ru" and "Сначала выберите аватар" or "Select an avatar first"
        return
    end
    Status.Text = currentLanguage == "ru" and "Загрузка 3D-предмета..." or "Loading 3D item..."
    local asset, loadError = EH.loadItemGeometry(assetId)
    if token ~= EH.assetPreviewToken or not ScreenGui.Parent then
        if asset then pcall(function() asset:Destroy() end) end
        return
    end
    if not asset then
        Status.Text = currentLanguage == "ru"
            and ("3D недоступно: " .. tostring(loadError))
            or ("3D unavailable: " .. tostring(loadError))
        return
    end
    local preview = Instance.new("Model")
    preview.Name = "GlassLens_" .. tostring(assetId)
    asset.Parent = preview
    local pieces = 0
    for _, child in ipairs(preview:GetDescendants()) do
        if child:IsA("Script") or child:IsA("LocalScript") or child:IsA("ModuleScript") then
            child:Destroy()
        elseif child:IsA("BasePart") then
            pieces += 1
            child.Anchored = true
            child.CanCollide = false
        end
    end
    if pieces == 0 then
        preview:Destroy()
        Status.Text = currentLanguage == "ru"
            and "Для этого ID нет отдельной 3D-модели"
            or "This asset has no standalone 3D model"
        return
    end
    local state = {
        avatar = previousAvatar, item = preview, camera = Camera.CFrame,
        fov = Camera.FieldOfView, yaw = orbitYaw, pitch = orbitPitch,
        distance = orbitDistance, baseDistance = baseCameraDistance,
        minimum = minimumCameraDistance, maximum = maximumCameraDistance,
        mode = viewportMode, poseVisible = PoseBar.Visible,
        viewVisible = ViewModeBar.Visible
    }
    EH.assetPreviewState = state
    previousAvatar.Parent = nil
    preview.Parent = World
    currentModel = preview
    local positioned = centerModel(preview)
    if EH.assetPreviewState ~= state then return end
    if not positioned then
        EH.closeAssetPreview()
        Status.Text = currentLanguage == "ru" and "Не удалось показать 3D-предмет"
            or "Could not frame this 3D item"
        return
    end
    orbitYaw, orbitPitch = 0, 0
    ViewModeBar.Visible = false
    PoseBar.Visible = false
    EH.assetCloseButton.Visible = true
    updateFreeOrbitCamera()
    Status.Text = (currentLanguage == "ru" and "3D предмет: " or "3D item: ") .. tostring(assetName)
end

--==================================================
-- POSE SYSTEM
--==================================================

local function readJointData(joint)
    if not isPoseJoint(joint) then return nil end

    local part0
    local part1
    local c0
    local c1
    local transform

    local attachment0
    local attachment1

    pcall(function()
        part0 = joint.Part0
    end)

    pcall(function()
        part1 = joint.Part1
    end)

    pcall(function()
        c0 = joint.C0
    end)

    pcall(function()
        c1 = joint.C1
    end)

    pcall(function()
        transform = joint.Transform
    end)

    if joint.ClassName == "AnimationConstraint" then
        pcall(function()
            attachment0 = joint.Attachment0
            attachment1 = joint.Attachment1
        end)

        if not part0 and attachment0 then
            part0 = attachment0.Parent
        end

        if not part1 and attachment1 then
            part1 = attachment1.Parent
        end

        if typeof(c0) ~= "CFrame" and attachment0 then
            c0 = attachment0.CFrame
        end

        if typeof(c1) ~= "CFrame" and attachment1 then
            c1 = attachment1.CFrame
        end
    end

    if not part0 or not part1 then return nil end

    if not part0:IsA("BasePart")
    or not part1:IsA("BasePart") then
        return nil
    end

    if typeof(c0) ~= "CFrame"
    or typeof(c1) ~= "CFrame" then
        return nil
    end

    if typeof(transform) ~= "CFrame" then
        transform = CFrame.new()
    end

    return {
        Part0 = part0,
        Part1 = part1,
        C0 = c0,
        C1 = c1,
        Transform = transform,
        Attachment0 = attachment0,
        Attachment1 = attachment1,
        JointType = joint.ClassName
    }
end

local function getRigType(model)
    local humanoid = model:FindFirstChildOfClass("Humanoid")

    if humanoid then
        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            return "R6"
        end

        if humanoid.RigType == Enum.HumanoidRigType.R15 then
            return "R15"
        end
    end

    if model:FindFirstChild("UpperTorso", true)
    or model:FindFirstChild("LeftUpperArm", true)
    or model:FindFirstChild("RightUpperArm", true) then
        return "R15"
    end

    if model:FindFirstChild("Torso", true)
    and (
        model:FindFirstChild("Left Arm", true)
        or model:FindFirstChild("Right Arm", true)
    ) then
        return "R6"
    end

    return "Unknown"
end

local function rememberJointBases(model)
    table.clear(jointBases)

    for _, joint in ipairs(model:GetDescendants()) do
        if isPoseJoint(joint) then
            local data = readJointData(joint)

            if data then
                jointBases[joint] = {
                    Part0 = data.Part0,
                    Part1 = data.Part1,
                    C0 = data.C0,
                    C1 = data.C1,
                    Transform = data.Transform,
                    Attachment0 = data.Attachment0,
                    Attachment1 = data.Attachment1,
                    JointType = data.JointType
                }
            end
        end
    end
end

local function cancelPoseTweens()
    for _, tween in ipairs(poseTweens) do
        pcall(function()
            tween:Cancel()
        end)
    end

    table.clear(poseTweens)
end

shutdownAvatarInspector = function()
    -- Cancel pending async scans and prevent stale results from rebuilding GUI.
    EH.avatarScanToken = (EH.avatarScanToken or 0) + 1
    EH.lastAvatarScan = nil
    if EH.animationController then
        pcall(function() EH.animationController:destroy() end)
        EH.animationController = nil
    end
    -- Restore player tools and all registered feature controllers.
    if EH.stopFly then pcall(EH.stopFly) end
    if EH.cleanupControllers then EH.cleanupControllers() end
    for id, cache in pairs(EH.accountDescriptionCache or {}) do
        EH.accountDescriptionCache[id] = nil
        if cache.template then pcall(function() cache.template:Destroy() end) end
    end
    -- Disconnect listeners attached to services/workspace before removing the GUI.
    for _, connection in ipairs(externalConnections) do
        pcall(function() connection:Disconnect() end)
    end
    table.clear(externalConnections)

    -- Stop active pose tweens so they do not outlive the interface.
    cancelPoseTweens()

    -- Destroying the ScreenGui removes all interface-owned event connections,
    -- modal elements, viewport models and the floating toggle in one operation.
    if ScreenGui and ScreenGui.Parent then
        ScreenGui:Destroy()
    end
end

local function updatePoseButtons(pose)
    for key, button in pairs({T = TPoseButton, A = APoseButton, N = NeutralButton}) do
        styleSelectedControl(button, key == pose)
    end
end

--==================================================
-- ARM SIDE DETECTION
--==================================================

local function getArmSide(joint, base)
    local jointName = string.lower(joint.Name)
    local partName = ""

    if base and base.Part1 then
        partName = string.lower(base.Part1.Name)
    end

    local attachment0Name = ""
    local attachment1Name = ""

    if base and base.Attachment0 then
        attachment0Name = string.lower(base.Attachment0.Name)
    end

    if base and base.Attachment1 then
        attachment1Name = string.lower(base.Attachment1.Name)
    end

    local combined = table.concat({
        jointName,
        partName,
        attachment0Name,
        attachment1Name
    }, " ")

    if string.find(combined, "left", 1, true) then
        return "Left"
    end

    if string.find(combined, "right", 1, true) then
        return "Right"
    end

    if base and base.Part0 then
        local referencePart = base.Part0
        local right = referencePart.CFrame.RightVector

        if typeof(base.C0) == "CFrame" then
            local shoulderPosition =
                (referencePart.CFrame * base.C0).Position

            local shoulderOffset =
                shoulderPosition - referencePart.Position

            if math.abs(shoulderOffset:Dot(right)) > 0.03 then
                if shoulderOffset:Dot(right) < 0 then
                    return "Left"
                end

                return "Right"
            end
        end

        if base.Part1 then
            local relative =
                base.Part1.Position - referencePart.Position

            if relative:Dot(right) < 0 then
                return "Left"
            end

            return "Right"
        end
    end

    return nil
end

--==================================================
-- SHOULDER JOINT DETECTION
--==================================================

local function isR6ShoulderJoint(base)
    if not base or not base.Part0 or not base.Part1 then
        return false
    end

    local part0Name = string.lower(base.Part0.Name)
    local part1Name = string.lower(base.Part1.Name)

    return part0Name == "torso"
        and (
            part1Name == "left arm"
            or part1Name == "right arm"
        )
end

local function isR15ShoulderJoint(base)
    if not base or not base.Part0 or not base.Part1 then
        return false
    end

    local part0Name = string.lower(base.Part0.Name)
    local part1Name = string.lower(base.Part1.Name)

    local torsoMatch =
        part0Name == "uppertorso"
        or part0Name == "torso"

    local armMatch =
        string.find(part1Name, "upperarm", 1, true) ~= nil

    return torsoMatch and armMatch
end

local function isCustomShoulderJoint(joint, base)
    if not base or not base.Part0 or not base.Part1 then
        return false
    end

    local jointName = string.lower(joint.Name)
    local attachment0Name = ""
    local attachment1Name = ""

    if base.Attachment0 then
        attachment0Name = string.lower(base.Attachment0.Name)
    end

    if base.Attachment1 then
        attachment1Name = string.lower(base.Attachment1.Name)
    end

    local hasShoulderName =
        string.find(jointName, "shoulder", 1, true) ~= nil
        or string.find(attachment0Name, "shoulder", 1, true) ~= nil
        or string.find(attachment1Name, "shoulder", 1, true) ~= nil

    if not hasShoulderName then
        return false
    end

    local part0Name = string.lower(base.Part0.Name)
    local part1Name = string.lower(base.Part1.Name)

    local torsoMatch =
        string.find(part0Name, "torso", 1, true) ~= nil

    local armMatch =
        string.find(part1Name, "arm", 1, true) ~= nil

    return torsoMatch and armMatch
end

local function isShoulderJoint(joint, base)
    return isR6ShoulderJoint(base)
        or isR15ShoulderJoint(base)
        or isCustomShoulderJoint(joint, base)
end

--==================================================
-- TORSO AND POSE DIRECTIONS
--==================================================

local function getTorso(model)
    if not model then return nil end

    local torso =
        model:FindFirstChild("UpperTorso", true)
        or model:FindFirstChild("Torso", true)
        or model:FindFirstChild("HumanoidRootPart", true)

    if torso and torso:IsA("BasePart") then
        return torso
    end

    return nil
end

local function getBodyAxes(model)
    local torso = getTorso(model)

    if not torso then
        return Vector3.new(1, 0, 0),
            Vector3.new(0, 1, 0)
    end

    local up = torso.CFrame.UpVector

    if up.Magnitude < 0.001 then
        up = Vector3.new(0, 1, 0)
    else
        up = up.Unit
    end

    local right = torso.CFrame.RightVector
    right = right - up * right:Dot(up)

    if right.Magnitude < 0.001 then
        local look = torso.CFrame.LookVector
        right = look:Cross(up)
    end

    if right.Magnitude < 0.001 then
        right = Vector3.new(1, 0, 0)
    else
        right = right.Unit
    end

    return right, up
end

local function getHorizontalArmDirection(model, side)
    local right = getBodyAxes(model)

    if not right or right.Magnitude < 0.001 then
        return nil
    end

    if side == "Left" then
        return -right.Unit
    end

    return right.Unit
end

local function getPoseDirection(model, side, pose)
    local outward = getHorizontalArmDirection(model, side)

    if not outward then
        return nil
    end

    if pose == "T" then
        return outward.Unit
    end

    if pose == "A" then
        local _, bodyUp = getBodyAxes(model)
        local downward = -bodyUp

        return (
            outward.Unit * math.cos(math.rad(45))
            + downward.Unit * math.sin(math.rad(45))
        ).Unit
    end

    return nil
end

--==================================================
-- ADAPTIVE UNIVERSAL ARM AXIS
--==================================================

local function getAdaptiveArmDirection(base, model)
    if not base
    or not base.Part1
    or typeof(base.C1) ~= "CFrame" then
        return nil, nil, nil
    end

    local part = base.Part1

    if not part:IsA("BasePart") then
        return nil, nil, nil
    end

    local size = part.Size
    local localPivot = base.C1.Position
    local shoulderWorld = part.CFrame * base.C1

    local torso = getTorso(model)

    local bodyUp

    if torso then
        bodyUp = torso.CFrame.UpVector
    elseif base.Part0 then
        bodyUp = base.Part0.CFrame.UpVector
    else
        bodyUp = Vector3.new(0, 1, 0)
    end

    if bodyUp.Magnitude < 0.001 then
        bodyUp = Vector3.new(0, 1, 0)
    else
        bodyUp = bodyUp.Unit
    end

    local downDirection = -bodyUp

    local centerVector =
        part.Position - shoulderWorld.Position

    local centerUnit = nil

    if centerVector.Magnitude > 0.001 then
        centerUnit = centerVector.Unit
    end

    local maxSize = math.max(
        size.X,
        size.Y,
        size.Z,
        0.001
    )

    local candidates = {
        {
            name = "X",
            localAxis = Vector3.new(1, 0, 0),
            length = size.X,
            otherA = size.Y,
            otherB = size.Z
        },
        {
            name = "Y",
            localAxis = Vector3.new(0, 1, 0),
            length = size.Y,
            otherA = size.X,
            otherB = size.Z
        },
        {
            name = "Z",
            localAxis = Vector3.new(0, 0, 1),
            length = size.Z,
            otherA = size.X,
            otherB = size.Y
        }
    }

    local bestCandidate = nil
    local bestScore = -math.huge
    local secondBestScore = -math.huge

    for _, candidate in ipairs(candidates) do
        if candidate.length > 0.001 then
            local worldAxis =
                part.CFrame:VectorToWorldSpace(candidate.localAxis)

            if worldAxis.Magnitude > 0.001 then
                worldAxis = worldAxis.Unit

                local pivotCoordinate =
                    localPivot:Dot(candidate.localAxis)

                local pivotThreshold = math.max(
                    candidate.length * 0.015,
                    0.005
                )

                local sign

                if math.abs(pivotCoordinate) > pivotThreshold then
                    sign = pivotCoordinate > 0 and -1 or 1
                elseif centerUnit then
                    local centerDot = worldAxis:Dot(centerUnit)

                    if math.abs(centerDot) > 0.025 then
                        sign = centerDot >= 0 and 1 or -1
                    else
                        sign =
                            worldAxis:Dot(downDirection) >= 0
                            and 1 or -1
                    end
                else
                    sign =
                        worldAxis:Dot(downDirection) >= 0
                        and 1 or -1
                end

                local directedAxis = worldAxis * sign

                local lengthRatio =
                    candidate.length / maxSize

                local otherMax = math.max(
                    candidate.otherA,
                    candidate.otherB,
                    0.001
                )

                local aspectRatio =
                    candidate.length / otherMax

                local aspectScore = math.clamp(
                    (aspectRatio - 1) / 1.5,
                    0,
                    1
                )

                local centerAlignment = 0.5

                if centerUnit then
                    centerAlignment = math.max(
                        0,
                        directedAxis:Dot(centerUnit)
                    )
                end

                local verticalAlignment = math.max(
                    0,
                    directedAxis:Dot(downDirection)
                )

                local pivotEdgeScore = math.clamp(
                    math.abs(pivotCoordinate)
                        / math.max(candidate.length * 0.5, 0.001),
                    0,
                    1
                )

                local score =
                    lengthRatio * 0.30
                    + verticalAlignment * 0.34
                    + centerAlignment * 0.22
                    + pivotEdgeScore * 0.08
                    + aspectScore * 0.06

                candidate.direction = directedAxis
                candidate.score = score
                candidate.lengthRatio = lengthRatio
                candidate.aspectRatio = aspectRatio
                candidate.verticalAlignment = verticalAlignment
                candidate.centerAlignment = centerAlignment
                candidate.pivotEdgeScore = pivotEdgeScore

                if score > bestScore then
                    secondBestScore = bestScore
                    bestScore = score
                    bestCandidate = candidate
                elseif score > secondBestScore then
                    secondBestScore = score
                end
            end
        end
    end

    if bestCandidate then
        local confidence = bestScore - secondBestScore

        local diagnostics = {
            Axis = bestCandidate.name,
            Score = bestCandidate.score,
            Confidence = confidence,
            LengthRatio = bestCandidate.lengthRatio,
            AspectRatio = bestCandidate.aspectRatio,
            VerticalAlignment = bestCandidate.verticalAlignment,
            CenterAlignment = bestCandidate.centerAlignment,
            PivotEdgeScore = bestCandidate.pivotEdgeScore
        }

        return bestCandidate.direction, shoulderWorld, diagnostics
    end

    if centerUnit then
        return centerUnit, shoulderWorld, {
            Axis = "CENTER",
            Score = 0,
            Confidence = 0,
            Fallback = true
        }
    end

    return nil, shoulderWorld, nil
end

--==================================================
-- ROTATION BETWEEN DIRECTIONS
--==================================================

local function getRotationBetweenDirections(
    currentDirection,
    desiredDirection
)
    if not currentDirection or not desiredDirection then
        return nil
    end

    if currentDirection.Magnitude < 0.001
    or desiredDirection.Magnitude < 0.001 then
        return nil
    end

    currentDirection = currentDirection.Unit
    desiredDirection = desiredDirection.Unit

    local dot = math.clamp(
        currentDirection:Dot(desiredDirection),
        -1,
        1
    )

    local axis = currentDirection:Cross(desiredDirection)

    if axis.Magnitude < 0.0001 then
        if dot > 0 then
            return CFrame.new()
        end

        local fallbackAxis =
            currentDirection:Cross(Vector3.new(0, 1, 0))

        if fallbackAxis.Magnitude < 0.0001 then
            fallbackAxis =
                currentDirection:Cross(Vector3.new(1, 0, 0))
        end

        if fallbackAxis.Magnitude < 0.0001 then
            fallbackAxis =
                currentDirection:Cross(Vector3.new(0, 0, 1))
        end

        if fallbackAxis.Magnitude < 0.0001 then
            return nil
        end

        return CFrame.fromAxisAngle(
            fallbackAxis.Unit,
            math.pi
        )
    end

    return CFrame.fromAxisAngle(
        axis.Unit,
        math.acos(dot)
    )
end

--==================================================
-- TARGET TRANSFORM v7.9.5
--==================================================

local function getTargetTransform(
    joint,
    base,
    desiredDirection,
    model
)
    if not base
    or not base.Part0
    or not base.Part1
    or typeof(base.C0) ~= "CFrame"
    or typeof(base.C1) ~= "CFrame" then
        return nil, nil
    end

    local part0 = base.Part0
    local part1 = base.Part1

    if not part0.Parent or not part1.Parent then
        return nil, nil
    end

    local currentDirection, shoulderWorld, axisInfo =
        getAdaptiveArmDirection(base, model)

    if not currentDirection then
        return nil, axisInfo
    end

    local correction = getRotationBetweenDirections(
        currentDirection,
        desiredDirection
    )

    if not correction then
        return nil, axisInfo
    end

    local desiredRotation =
        correction * part1.CFrame.Rotation

    local parentJointFrame =
        part0.CFrame * base.C0

    local baseTransform = base.Transform

    if typeof(baseTransform) ~= "CFrame" then
        baseTransform = CFrame.new()
    end

    local pivotWorld =
        (parentJointFrame * baseTransform).Position

    local desiredPosition =
        pivotWorld
        - desiredRotation:VectorToWorldSpace(base.C1.Position)

    local desiredPart1 =
        CFrame.new(desiredPosition) * desiredRotation

    local targetTransform =
        parentJointFrame:ToObjectSpace(
            desiredPart1 * base.C1
        )

    local resultingPivot =
        (parentJointFrame * targetTransform).Position

    local pivotError =
        (resultingPivot - pivotWorld).Magnitude

    if axisInfo then
        axisInfo.PivotError = pivotError
    end

    return targetTransform, axisInfo
end

local function countJointTypes(model)
    local motorCount = 0
    local constraintCount = 0

    for _, object in ipairs(model:GetDescendants()) do
        if object:IsA("Motor6D") then
            motorCount += 1
        elseif object.ClassName == "AnimationConstraint" then
            constraintCount += 1
        end
    end

    return motorCount, constraintCount
end

local function countShoulderJoints(model)
    local count = 0

    for joint, base in pairs(jointBases) do
        if joint
        and joint.Parent
        and isShoulderJoint(joint, base) then
            count += 1
        end
    end

    return count
end

--==================================================
-- MAIN POSE APPLICATION
--==================================================

applyPose = function(model, pose)
    if not model then return end

    cancelPoseTweens()

    if next(jointBases) == nil then
        rememberJointBases(model)
    end

    local rigType = getRigType(model)

    for joint, base in pairs(jointBases) do
        if joint and joint.Parent then
            pcall(function()
                joint.Transform = base.Transform
            end)
        end
    end

    task.wait(0.05)

    local targets = {}
    local changed = 0
    local axisDiagnostics = {}

    if pose ~= "N" then
        for joint, base in pairs(jointBases) do
            if joint
            and joint.Parent
            and base.Part0
            and base.Part1
            and base.Part0.Parent
            and base.Part1.Parent
            and isShoulderJoint(joint, base) then

                local side = getArmSide(joint, base)

                if side then
                    local direction = getPoseDirection(
                        model,
                        side,
                        pose
                    )

                    if direction then
                        local targetTransform, axisInfo =
                            getTargetTransform(
                                joint,
                                base,
                                direction,
                                model
                            )

                        if targetTransform then
                            targets[joint] = targetTransform

                            if axisInfo then
                                table.insert(
                                    axisDiagnostics,
                                    string.format(
                                        "%s:%s score=%.2f confidence=%.2f pivotError=%.5f",
                                        side,
                                        tostring(axisInfo.Axis),
                                        axisInfo.Score or 0,
                                        axisInfo.Confidence or 0,
                                        axisInfo.PivotError or 0
                                    )
                                )
                            end
                        end
                    end
                end
            end
        end
    end

    local tweenInfo = TweenInfo.new(
        0.4,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    )

    for joint, targetTransform in pairs(targets) do
        if joint and joint.Parent then
            local success, tween = pcall(function()
                return TweenService:Create(
                    joint,
                    tweenInfo,
                    {Transform = targetTransform}
                )
            end)

            if success and tween then
                table.insert(poseTweens, tween)
                tween:Play()
                changed += 1
            end
        end
    end

    updatePoseButtons(pose)

    local motorCount, constraintCount =
        countJointTypes(model)

    local shoulderCount =
        countShoulderJoints(model)

    if pose == "T" then
        if changed > 0 then
            Status.Text = string.format(
                "T-POSE | %s | %d shoulders",
                rigType,
                changed
            )
        else
            Status.Text = string.format(
                "%s: no shoulders | M:%d AC:%d",
                rigType,
                motorCount,
                constraintCount
            )
        end

    elseif pose == "A" then
        if changed > 0 then
            Status.Text = string.format(
                "A-POSE | %s | %d shoulders",
                rigType,
                changed
            )
        else
            Status.Text = string.format(
                "%s: no shoulders | M:%d AC:%d",
                rigType,
                motorCount,
                constraintCount
            )
        end

    else
        Status.Text = string.format(
            "Neutral | %s | %d shoulders",
            rigType,
            shoulderCount
        )
    end

    print(string.format(
        "[Avatar Inspector v7.9.20] Rig: %s | Motor6D: %d | AnimationConstraint: %d | Shoulders: %d | Changed: %d",
        rigType,
        motorCount,
        constraintCount,
        shoulderCount,
        changed
    ))

    if #axisDiagnostics > 0 then
        print(
            "[Avatar Inspector v7.9.20] Adaptive axes: "
            .. table.concat(axisDiagnostics, " | ")
        )
    end
end

--==================================================
-- MODEL DISPLAY
--==================================================

-- Removed unreachable showModelFromTemplate; live and saved previews use their own active paths.
local function showPlayerModel(player, scanToken)
    clearViewport()

    local source = EH.avatarSourceMode
    local clone = makeStaticAvatar(player)

    if not clone then
        task.wait(0.35)
        if scanToken and scanToken ~= EH.avatarScanToken then return nil end
        clone = makeStaticAvatar(player)
    end

    -- Slow account API responses must not overwrite another selected player/mode.
    if scanToken and scanToken ~= EH.avatarScanToken then
        if clone then clone:Destroy() end
        return nil
    end

    if not clone then
        Status.Text = source == "Original"
            and "Could not load original account avatar"
            or "Could not clone current game morph"
        return nil
    end

    clone.Parent = World
    currentModel = clone

    resetJoints(clone)
    rememberJointBases(clone)

    if not centerModel(clone) then
        clone:Destroy()
        currentModel = nil
        Status.Text = "Could not position avatar preview"
        return nil
    end

    setViewportMode("Free")
    applyPose(clone, "N")
    if EH.setPreviewReady then EH.setPreviewReady(true) end
    Status.Text = source == "Original" and "Account avatar loaded"
        or "Current game morph loaded"

    return clone
end

--==================================================
-- VIEWPORT ROTATION / FREE ORBIT / ZOOM
--==================================================

FreeViewButton.Activated:Connect(function()
    setViewportMode("Free")
end)

ZoomInButton.Activated:Connect(function()
    changeZoom(1)
end)

ZoomOutButton.Activated:Connect(function()
    changeZoom(-1)
end)

Viewport.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        local pointer = input.Position
        local function insideControl(guiObject)
            local position = guiObject.AbsolutePosition
            local size = guiObject.AbsoluteSize
            return pointer.X >= position.X and pointer.X <= position.X + size.X
                and pointer.Y >= position.Y and pointer.Y <= position.Y + size.Y
        end
        if insideControl(ViewModeBar) or insideControl(ZoomBar) then
            return
        end

        rotating = true
        lastPointer = input.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                rotating = false
                lastPointer = nil
            end
        end)
    end
end)

trackExternalConnection(UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseWheel then
        local mousePosition = UserInputService:GetMouseLocation()
        local viewPosition = Viewport.AbsolutePosition
        local viewSize = Viewport.AbsoluteSize
        local overViewport = mousePosition.X >= viewPosition.X
            and mousePosition.X <= viewPosition.X + viewSize.X
            and mousePosition.Y >= viewPosition.Y
            and mousePosition.Y <= viewPosition.Y + viewSize.Y
        if currentModel and overViewport then
            local wheel = input.Position.Z
            if wheel ~= 0 then
                if viewportMode ~= "Free" then setViewportMode("Free") end
                orbitDistance = orbitDistance * (wheel > 0 and 0.88 or 1.14)
                updateFreeOrbitCamera()
            end
        end
        return
    end

    if not rotating or not currentModel or not lastPointer then
        return
    end

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - lastPointer
        lastPointer = input.Position

        orbitYaw = orbitYaw - delta.X * (viewportMode == "Free" and 0.012 or 0.009)
        orbitPitch = orbitPitch + delta.Y * (viewportMode == "Free" and 0.012 or 0.009)
        updateFreeOrbitCamera()
    end
end))

--==================================================
-- POSE BUTTON EVENTS
--==================================================

TPoseButton.Activated:Connect(function()
    if currentModel then
        applyPose(currentModel, "T")
    else
        Status.Text = "Select a player first"
    end
end)

APoseButton.Activated:Connect(function()
    if currentModel then
        applyPose(currentModel, "A")
    else
        Status.Text = "Select a player first"
    end
end)

NeutralButton.Activated:Connect(function()
    if currentModel then
        applyPose(currentModel, "N")
    else
        Status.Text = "Select a player first"
    end
end)

--==================================================
-- ITEM LIST
--==================================================

local function clearItems()
    table.clear(currentItems)

    for _, child in ipairs(ItemList:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

local function addSectionHeader(text)
    local header = create("TextLabel", {
        Size = UDim2.new(1, -4, 0, 24),
        BackgroundColor3 = PANEL,
        BackgroundTransparency = 0.15,
        Text = text,
        TextColor3 = ACCENT,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        BorderSizePixel = 0
    }, ItemList)

    create("UIPadding", {
        PaddingLeft = UDim.new(0, 7)
    }, header)

    return header
end

local function addItem(name, assetId, category, classicClothing)
    assetId = tonumber(assetId)

    if not assetId or assetId <= 0 then
        return
    end

    category = category or "Items"

    table.insert(currentItems, {
        name = tostring(name),
        id = assetId,
        category = category,
        classicClothing = classicClothing == true
    })

    local card = create("Frame", {
        Size = UDim2.new(1, -4, 0, 84),
        BackgroundColor3 = LIGHT,
        BorderSizePixel = 0
    }, ItemList)

    EH.ehCard(card)
    EH.listCardEdge(card)

    local image = create("ImageLabel", {
        Size = UDim2.fromOffset(48, 48),
        Position = UDim2.fromOffset(6, 6),
        BackgroundColor3 = PANEL,
        Image = "rbxthumb://type=Asset&id=" .. assetId .. "&w=150&h=150",
        ScaleType = Enum.ScaleType.Fit
    }, card)

    round(image, 6)
    create("UIStroke", {Color = OUTLINE, Transparency = 0.45,
        Thickness = 1}, image)

    local itemMarker = makeLabel(
        card, "◦",
        UDim2.fromOffset(12, 14), UDim2.fromOffset(60, 8), 11
    )
    itemMarker.TextColor3 = Color3.fromRGB(235, 180, 136)
    itemMarker.Font = Enum.Font.GothamBold

    local itemName = makeLabel(
        card, name,
        UDim2.new(1, -101, 0, 22),
        UDim2.fromOffset(72, 5), 11
    )

    itemName.Font = Enum.Font.GothamMedium

    local itemId = makeLabel(
        card, tostring(assetId),
        UDim2.new(1, -101, 0, 24),
        UDim2.fromOffset(72, 28), 13
    )

    -- Обновлённое оформление идентификаторов.
    itemId.TextColor3 = ID_GREEN
    itemId.Font = Enum.Font.GothamBold

    local copyButton = makeButton(
        card, "",
        UDim2.fromOffset(29, 27),
        UDim2.new(1, -38, 0, 53),
        Color3.fromRGB(37, 32, 28)
    )

    copyButton.Name = "CopyAssetIdButton"
    copyButton.TextSize = 17
    EH.styleIconAction(copyButton)
    EH.safeIcon(copyButton, "copy", UDim2.fromOffset(3, 2), 23)
    copyButton.Activated:Connect(function()
        copyID(assetId)
    end)

    if category ~= "Animations" and classicClothing ~= true then
        local previewButton = makeButton(
            card, "", UDim2.fromOffset(29, 27),
            UDim2.new(1, -72, 0, 53), Color3.fromRGB(46, 38, 30)
        )
        previewButton.Name = "GlassLensPreviewButton"
        EH.styleIconAction(previewButton)
        EH.safeIcon(previewButton, "eye", UDim2.fromOffset(2, 1), 24)
        previewButton.Activated:Connect(function()
            task.spawn(function()
                local ok, err = pcall(EH.openAssetPreview, assetId, name)
                if not ok then
                    warn("[Avatar Inspector] Glass Lens: " .. tostring(err))
                    if EH.assetPreviewState then EH.closeAssetPreview() end
                    Status.Text = currentLanguage == "ru"
                        and "Ошибка загрузки 3D-предмета"
                        or "3D item preview failed"
                end
            end)
        end)
    end
end

local function displaySavedItems(items, appearance)
    clearItems()

    local lastCategory = nil

    for _, item in ipairs(items or {}) do
        local category = item.category or "Items"

        if category ~= lastCategory then
            if category == "Animations" then
                addSectionHeader("ANIMATIONS")
            else
                addSectionHeader("AVATAR ITEMS")
            end

            lastCategory = category
        end

        -- Legacy saved outfits can identify classic clothing by HumanoidDescription
        -- slots rather than by translated or user-renamed display text.
        local isClassic = item.classicClothing == true
        if item.classicClothing == nil and type(appearance) == "table"
            and type(appearance.properties) == "table" then
            local slots = appearance.properties
            local id = tonumber(item.id)
            isClassic = id and (id == tonumber(slots.Shirt)
                or id == tonumber(slots.Pants)
                or id == tonumber(slots.GraphicTShirt)) or false
        end
        addItem(item.name, item.id, category, isClassic)
    end
end

--==================================================
-- PLAYER SCANNING
--==================================================

local function scanPlayer(player)
    if not player then return end

    selectedPlayer = player
    selectedFavorite = nil
    EH.lastAvatarScan = nil
    EH.avatarScanToken = (EH.avatarScanToken or 0) + 1
    local token = EH.avatarScanToken
    local source = EH.avatarSourceMode or "Original"

    clearItems()
    WornCountLabel.Text = translateText("WORN ITEMS: —"):gsub(":%s*—$", "")
    EH.wornBadge.Text = "—"
    Status.Text = source == "Original" and "Loading account avatar..."
        or "Scanning current game morph..."

    local preview = showPlayerModel(player, token)
    if token ~= EH.avatarScanToken then return end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if source == "Morph" and not character then
        Status.Text = "Character/morph not available"
        return
    end

    local description, descriptionSource
    if source == "Original" then
        -- Do not pass the live Humanoid as a fallback: it might be a monster.
        description, descriptionSource = getOriginalAvatarDescription(player, nil)
    else
        if humanoid then
            local ok, applied = pcall(function()
                return humanoid:GetAppliedDescription()
            end)
            if ok then description = applied end
        end
        if not description then description = Instance.new("HumanoidDescription") end
        descriptionSource = "live-morph"
    end
    if token ~= EH.avatarScanToken then
        if description then description:Destroy() end
        return
    end
    if not description then
        Status.Text = "Original account appearance unavailable"
        return
    end

    local identifiers = {}
    local seen = {}

    local function add(name, id, category, classicClothing)
        id = tonumber(id)

        if id and id > 0 then
            category = category or "Items"

            -- Один ID не дублируется внутри одной категории.
            -- Если ID используется и как предмет, и как анимация,
            -- обе записи сохраняются отдельно.
            local key = category .. ":" .. tostring(id)

            if not seen[key] then
                seen[key] = true

                table.insert(identifiers, {
                    name = name,
                    id = id,
                    category = category,
                    classicClothing = classicClothing == true
                })
            end
        end
    end

    -- Original shows account assets; Morph scans actual live character objects.
    local wornItemCount = 0
    if source == "Morph" then
        local function liveAssetId(value)
            if type(value) == "number" then
                return value > 0 and math.floor(value) or nil
            end
            if type(value) ~= "string" then return nil end
            local digits = value:match("[?&]id=(%d+)")
                or value:match("rbxassetid://(%d+)")
                or value:match("(%d+)")
            return tonumber(digits)
        end
        local hasFace = false
        for _, object in ipairs(character:GetDescendants()) do
            if token ~= EH.avatarScanToken then
                description:Destroy()
                return
            end
            if object:IsA("Accessory") then
                wornItemCount += 1
                local id
                pcall(function() id = object.SourceAssetId end)
                id = liveAssetId(id) or liveAssetId(object:GetAttribute("AssetId"))
                    or liveAssetId(object:GetAttribute("OriginalAssetId"))
                if id then add(object.Name, id, "Items") end
            elseif object:IsA("Shirt") then
                wornItemCount += 1
                add("Shirt", liveAssetId(object.ShirtTemplate), "Items", true)
            elseif object:IsA("Pants") then
                wornItemCount += 1
                add("Pants", liveAssetId(object.PantsTemplate), "Items", true)
            elseif object:IsA("ShirtGraphic") then
                wornItemCount += 1
                add("T-Shirt", liveAssetId(object.Graphic), "Items", true)
            elseif object:IsA("Decal") and object.Parent
                and object.Parent.Name == "Head"
                and string.lower(object.Name) == "face" then
                if not hasFace then
                    wornItemCount += 1
                    hasFace = true
                end
                add("Face", liveAssetId(object.Texture), "Items")
            elseif object:IsA("Animation") then
                add(object.Name .. " Animation",
                    liveAssetId(object.AnimationId), "Animations")
            end
        end
        -- Some morph systems replace the description rather than creating
        -- Animation instances; these live IDs are useful when available.
        for _, property in ipairs({
            "IdleAnimation", "WalkAnimation", "RunAnimation",
            "JumpAnimation", "FallAnimation", "ClimbAnimation",
            "SwimAnimation", "MoodAnimation"
        }) do
            local value = description[property]
            add(property:gsub("Animation", "") .. " Animation",
                value, "Animations")
        end
    else
        add("Shirt", description.Shirt, "Items", true)
        add("Pants", description.Pants, "Items", true)
        add("T-Shirt", description.GraphicTShirt, "Items", true)
        add("Face", description.Face, "Items")
        add("Head", description.Head, "Items")
        add("Torso", description.Torso, "Items")
        add("Left Arm", description.LeftArm, "Items")
        add("Right Arm", description.RightArm, "Items")
        add("Left Leg", description.LeftLeg, "Items")
        add("Right Leg", description.RightLeg, "Items")

        local accessorySuccess, accessories = pcall(function()
            return description:GetAccessories(true)
        end)
        if accessorySuccess and accessories then
            wornItemCount = #accessories
            for _, accessory in ipairs(accessories) do
                add((accessory.AccessoryType and accessory.AccessoryType.Name)
                    or "Accessory", accessory.AssetId, "Items")
            end
        end
        for _, property in ipairs({"Shirt", "Pants", "GraphicTShirt", "Face"}) do
            if tonumber(description[property]) and tonumber(description[property]) > 0 then
                wornItemCount += 1
            end
        end
        for _, property in ipairs({
            "IdleAnimation", "WalkAnimation", "RunAnimation",
            "JumpAnimation", "FallAnimation", "ClimbAnimation",
            "SwimAnimation", "MoodAnimation"
        }) do
            add(property:gsub("Animation", "") .. " Animation",
                description[property], "Animations")
        end
    end

    WornCountLabel.Text = translateText("WORN ITEMS: —"):gsub(":%s*—$", "")
    EH.wornBadge.Text = string.format("%02d", wornItemCount)
    displaySavedItems(identifiers)

    local animationCount = 0
    local itemCount = 0

    for _, item in ipairs(identifiers) do
        if item.category == "Animations" then
            animationCount += 1
        else
            itemCount += 1
        end
    end

    Status.Text = string.format(
        "Items: %d | Animations: %d%s",
        itemCount,
        animationCount,
        source == "Original" and " | Original account avatar" or " | Current morph"
    )
    -- Commit the entire scan atomically only after its async calls have finished.
    local stableItems = {}
    for _, item in ipairs(identifiers) do
        stableItems[#stableItems + 1] = {
            name = tostring(item.name or "Item"),
            id = tonumber(item.id),
            category = item.category == "Animations" and "Animations" or "Items",
            classicClothing = item.classicClothing == true
        }
    end
    local snapshot = {
        player = player,
        playerId = player.UserId,
        sourceMode = source,
        items = stableItems,
        scanToken = token
    }
    EH.lastAvatarScan = snapshot
    pcall(function() description:Destroy() end)
    return snapshot
end

EH.scanAvatarSourcePlayer = scanPlayer

--==================================================
-- PLAYER THUMBNAILS
--==================================================

local playerThumbnailCache = {}

local function getPlayerThumbnail(player)
    local cached = playerThumbnailCache[player.UserId]
    if cached then return cached end

    local success, image = pcall(function()
        return Players:GetUserThumbnailAsync(
            player.UserId,
            Enum.ThumbnailType.AvatarBust,
            Enum.ThumbnailSize.Size100x100
        )
    end)

    if success then
        playerThumbnailCache[player.UserId] = image
        return image
    end

    return ""
end

--==================================================
-- PLAYER LIST
--==================================================

refreshPlayerList = function()
    local serverPlayerList = Players:GetPlayers()
    -- Skip identical rebuilds after repeated events/search callbacks.
    local signatureParts = {string.lower(Search.Text)}
    for _, player in ipairs(serverPlayerList) do
        signatureParts[#signatureParts + 1] = tostring(player.UserId)
            .. ":" .. tostring(player.DisplayName)
    end
    local signature = table.concat(signatureParts, "|")
    if currentMode == "Players" and EH.lastPlayerListSignature == signature then
        return
    end
    EH.lastPlayerListSignature = signature
    clearGuiList(PlayerList)

    local serverPlayers = #serverPlayerList

    local countHeader = create("Frame", {
        Name = "ServerPlayerCount",
        Size = UDim2.fromOffset(172, 78),
        BackgroundColor3 = Color3.fromRGB(43, 36, 30),
        BorderSizePixel = 0,
        LayoutOrder = 0
    }, PlayerList)
    round(countHeader, 12)
    create("UIStroke", {
        Color = Color3.fromRGB(135, 100, 67),
        Transparency = 0.36,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, countHeader)

    do
        local tag = create("Frame", {
            Name = "EHPlayersOutlinedTitle",
            Position = UDim2.fromOffset(11, 5),
            Size = UDim2.fromOffset(82, 23),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = countHeader.ZIndex + 2
        }, countHeader)
        round(tag, 6)
        create("UIStroke", {
            Color = Color3.fromRGB(170, 127, 83),
            Thickness = 1,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }, tag)
        local title = makeLabel(tag, "PLAYERS",
            UDim2.new(1, -8, 1, 0), UDim2.fromOffset(4, 0), 12)
        title.Font = Enum.Font.GothamMedium
        title.TextColor3 = Color3.fromRGB(235, 225, 209)
        title.TextXAlignment = Enum.TextXAlignment.Center
        title.TextScaled = false
        title.ZIndex = tag.ZIndex + 1
    end
    EH.safeIcon(countHeader, "players", UDim2.fromOffset(141, 5), 22)

    local numberLabel = makeLabel(countHeader,
        string.format("%02d", serverPlayers),
        UDim2.fromOffset(80, 27), UDim2.fromOffset(11, 29), 19)
    numberLabel.TextColor3 = Color3.fromRGB(242, 233, 218)
    numberLabel.TextXAlignment = Enum.TextXAlignment.Left
    numberLabel.Font = Enum.Font.GothamSemibold
    numberLabel.ZIndex = countHeader.ZIndex + 2

    do
        local tag = create("Frame", {
            Name = "EHPlayersThinStatus",
            Position = UDim2.fromOffset(11, 57),
            Size = UDim2.fromOffset(115, 19),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = countHeader.ZIndex + 2
        }, countHeader)
        round(tag, 9)
        create("UIStroke", {
            Color = Color3.fromRGB(133, 204, 169),
            Transparency = 0.2,
            Thickness = 1,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }, tag)
        local dot = create("Frame", {
            Name = "EHDashboardOnlineDot",
            Position = UDim2.fromOffset(7, 7),
            Size = UDim2.fromOffset(5, 5),
            BackgroundColor3 = Color3.fromRGB(155, 231, 186),
            BorderSizePixel = 0,
            ZIndex = tag.ZIndex + 1
        }, tag)
        round(dot, 3)
        local caption = makeLabel(tag,
            currentLanguage == "ru" and "Сейчас онлайн" or "Online now",
            UDim2.new(1, -21, 1, 0), UDim2.fromOffset(17, 0), 10)
        caption.ZIndex = tag.ZIndex + 1
        caption.Font = Enum.Font.GothamMedium
        caption.TextColor3 = Color3.fromRGB(196, 244, 216)
        caption.TextXAlignment = Enum.TextXAlignment.Left
        caption.TextScaled = false
    end

    local filter = string.lower(Search.Text)

    for _, player in ipairs(serverPlayerList) do
        local matches =
            string.find(
                string.lower(player.Name),
                filter,
                1,
                true
            )
            or string.find(
                string.lower(player.DisplayName),
                filter,
                1,
                true
            )

        if matches then
            local row = create("Frame", {
                Size = UDim2.new(1, -4, 0, 48),
                BackgroundColor3 = LIGHT,
                BorderSizePixel = 0
            }, PlayerList)

            row.LayoutOrder = 1 + #PlayerList:GetChildren()
            EH.ehCard(row)
            EH.listCardEdge(row)

            local avatar = create("ImageLabel", {
                Size = UDim2.fromOffset(38, 38),
                Position = UDim2.fromOffset(5, 5),
                BackgroundColor3 = PANEL,
                Image = "",
                ScaleType = Enum.ScaleType.Crop
            }, row)

            round(avatar, 7)

            task.spawn(function()
                local image = getPlayerThumbnail(player)

                if avatar.Parent then
                    avatar.Image = image
                end
            end)

            local nameLabel = makeLabel(
                row, player.DisplayName,
                UDim2.new(1, -93, 0, 20),
                UDim2.fromOffset(49, 5), 10
            )

            nameLabel.Font = Enum.Font.GothamMedium

            local usernameLabel = makeLabel(
                row, "@" .. player.Name,
                UDim2.new(1, -93, 0, 18),
                UDim2.fromOffset(49, 24), 9
            )

            usernameLabel.TextColor3 = MUTED

            local selectButton = create("TextButton", {
                Size = UDim2.new(1, -52, 1, 0),
                Position = UDim2.fromOffset(0, 0),
                BackgroundTransparency = 1,
                Text = "",
                Active = true,
                Selectable = true,
                ZIndex = 2
            }, row)

            EH.bindPhysicalPress(selectButton, row, false)
            selectButton.Activated:Connect(function()
                scanPlayer(player)
            end)

            -- Save the exact snapshot returned by this scan, not shared currentItems.
            local rowSaveButton = makeButton(
                row, "＋",
                UDim2.fromOffset(34, 30),
                UDim2.new(1, -39, 0, 9),
                Color3.fromRGB(37, 32, 28)
            )
            rowSaveButton.Name = "SavePlayerOutfitButton"
            rowSaveButton.Text = ""
            rowSaveButton.TextSize = 19
            EH.styleIconAction(rowSaveButton)
            rowSaveButton.ZIndex = 5
            EH.safeIcon(rowSaveButton, "save", UDim2.fromOffset(4, 2), 26)

            rowSaveButton.Activated:Connect(function()
                if not player or player.Parent ~= Players then
                    Status.Text = "This player is no longer available"
                    return
                end

                if EH.isSavingOutfit then return end
                local snapshot = scanPlayer(player)
                if snapshot then saveFavorite(snapshot) end
            end)
        end
    end
end

--==================================================
-- FAVORITES / SIMPLE JSON OUTFIT STORAGE
--==================================================

-- Same simple storage principle as SALAAR OUTFIT REVEALER:
-- one JSON file in the executor's root folder, no extra folder setup.
local OUTFIT_FILE = "AvatarInspector_Outfits.json"
local LEGACY_OUTFIT_FILE = "AvatarInspector/Outfits.json"
local MAX_SAVED_OUTFITS = 50

local function readOutfitFile(path)
    if type(readfile) ~= "function" then
        return nil, "readfile unavailable"
    end

    if type(isfile) == "function" then
        local checkOk, exists = pcall(function()
            return isfile(path)
        end)
        if checkOk and not exists then
            return nil, "missing"
        end
    end

    local readOk, contents = pcall(function()
        return readfile(path)
    end)

    if not readOk then
        return nil, "missing"
    end

    if type(contents) ~= "string" then
        return nil, "invalid file contents"
    end

    return contents
end

persistFavorites = function()
    if type(writefile) ~= "function" then
        return false, "writefile unavailable"
    end
    if type(readfile) ~= "function" then
        return false, "readfile unavailable"
    end

    local encodeOk, encoded = pcall(function()
        return HttpService:JSONEncode(favorites)
    end)

    if not encodeOk or type(encoded) ~= "string" then
        return false, "JSON encode failed"
    end

    local writeOk, writeError = pcall(function()
        writefile(OUTFIT_FILE, encoded)
    end)

    if not writeOk then
        return false, "Could not write outfit file: " .. tostring(writeError)
    end

    -- Read-after-write verification: do not report a persistent save
    -- unless the exact JSON data can be read back from disk.
    local verifyOk, savedContents = pcall(function()
        return readfile(OUTFIT_FILE)
    end)

    if not verifyOk or savedContents ~= encoded then
        return false, "Outfit file verification failed"
    end

    return true
end

local function loadFavoritesFromFile()
    if type(readfile) ~= "function" then
        return false, "readfile unavailable"
    end

    local raw, readError = readOutfitFile(OUTFIT_FILE)
    local loadedLegacy = false

    if not raw and readError == "missing" then
        raw, readError = readOutfitFile(LEGACY_OUTFIT_FILE)
        loadedLegacy = raw ~= nil
    end

    if not raw then
        if readError == "missing" then
            favorites = {}
            return true, "No saved outfits yet"
        end
        return false, tostring(readError)
    end

    local decodeOk, decoded = pcall(function()
        return HttpService:JSONDecode(raw)
    end)

    if not decodeOk or type(decoded) ~= "table" then
        return false, "Outfit JSON is invalid"
    end

    local loadedFavorites = {}

    for _, entry in ipairs(decoded) do
        if type(entry) == "table" and type(entry.items) == "table" then
            local cleanItems = {}

            for _, item in ipairs(entry.items) do
                if type(item) == "table" then
                    local itemId = tonumber(item.id)
                    if itemId and itemId > 0 then
                        table.insert(cleanItems, {
                            name = tostring(item.name or "Item"),
                            id = itemId,
                            category = item.category == "Animations" and "Animations" or "Items",
                            classicClothing = item.classicClothing
                        })
                    end
                end
            end

            if #cleanItems > 0 then
                table.insert(loadedFavorites, {
                    name = tostring(entry.name or "Unknown"),
                    username = tostring(entry.username or "unknown"),
                    userId = tonumber(entry.userId) or entry.userId,
                    savedAt = tonumber(entry.savedAt) or os.time(),
                    items = cleanItems,
                    appearance = type(entry.appearance) == "table" and entry.appearance or nil
                })
            end
        end
    end

    favorites = loadedFavorites

    if #favorites > MAX_SAVED_OUTFITS then
        while #favorites > MAX_SAVED_OUTFITS do
            table.remove(favorites, 1)
        end
    end

    if loadedLegacy then
        local migrated, migrationError = persistFavorites()
        if migrated then
            return true, "Loaded and migrated " .. tostring(#favorites) .. " outfit(s)"
        end
        return true, "Loaded " .. tostring(#favorites) .. " outfit(s); migration failed: " .. tostring(migrationError)
    end

    return true, "Loaded " .. tostring(#favorites) .. " outfit(s)"
end

--==================================================
-- PERSISTENT 3D AVATAR APPEARANCE SNAPSHOT
--==================================================

local AVATAR_DESCRIPTION_PROPERTIES = {
    "ClimbAnimation", "FallAnimation", "IdleAnimation", "JumpAnimation",
    "MoodAnimation", "RunAnimation", "SwimAnimation", "WalkAnimation",
    "GraphicTShirt", "Pants", "Shirt", "Face",
    -- Legacy rigid accessory properties are separate HumanoidDescription
    -- fields and must be preserved in addition to GetAccessories().
    "HatAccessory", "HairAccessory", "FaceAccessory", "NeckAccessory",
    "ShoulderAccessory", "FrontAccessory", "BackAccessory", "WaistAccessory",
    "Head", "Torso", "LeftArm", "RightArm", "LeftLeg", "RightLeg",
    "BodyTypeScale", "DepthScale", "HeadScale", "HeightScale",
    "ProportionScale", "WidthScale"
}

local AVATAR_COLOR_PROPERTIES = {
    "HeadColor", "LeftArmColor", "LeftLegColor",
    "RightArmColor", "RightLegColor", "TorsoColor"
}

local function extractAssetId(value)
    if type(value) == "number" then
        return value > 0 and math.floor(value) or nil
    end
    if type(value) ~= "string" then return nil end
    local digits = value:match("[?&]id=(%d+)") or value:match("rbxassetid://(%d+)") or value:match("(%d+)")
    local number = tonumber(digits)
    return number and number > 0 and number or nil
end

local function captureLiveClothingFallback(character, snapshot, overrideLive)
    local liveMap = {
        Shirt = {className = "Shirt", property = "ShirtTemplate"},
        Pants = {className = "Pants", property = "PantsTemplate"},
        GraphicTShirt = {className = "ShirtGraphic", property = "Graphic"}
    }

    for descriptionName, info in pairs(liveMap) do
        local clothing = character:FindFirstChildOfClass(info.className)
        if clothing then
            local ok, value = pcall(function()
                return clothing[info.property]
            end)
            if ok then
                local assetId = extractAssetId(value)
                if assetId and (overrideLive
                    or (tonumber(snapshot.properties[descriptionName]) or 0) == 0) then
                    snapshot.properties[descriptionName] = assetId
                end
            end
        end
    end

    local head = character:FindFirstChild("Head")
    if head and (tonumber(snapshot.properties.Face) or 0) == 0 then
        for _, child in ipairs(head:GetChildren()) do
            if child:IsA("Decal") and (child.Name == "face" or child.Name == "Face") then
                local ok, texture = pcall(function() return child.Texture end)
                local assetId = ok and extractAssetId(texture) or nil
                if assetId then
                    snapshot.properties.Face = assetId
                    break
                end
            end
        end
    end
end

local function captureAvatarAppearance(player, sourceMode)
    if not player then return nil, "player unavailable" end

    local character = player.Character
    if not character then return nil, "character unavailable" end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return nil, "Humanoid unavailable" end
    local mode = sourceMode == "Morph" and "Morph" or "Original"
    local description, descriptionSource
    if mode == "Morph" then
        local ok, result = pcall(function()
            return humanoid:GetAppliedDescription()
        end)
        if ok then description = result end
        descriptionSource = "live-morph"
    else
        -- Saving the account avatar must never persist a Piggy/game morph.
        description, descriptionSource = getOriginalAvatarDescription(player, nil)
    end
    if not description then
        return nil, "could not read " .. mode .. " HumanoidDescription"
    end
    local rigName = humanoid.RigType.Name
    if mode == "Original" then
        pcall(function()
            local info = Players:GetCharacterAppearanceInfoAsync(player.UserId)
            if info and (info.playerAvatarType == "R6" or info.playerAvatarType == "R15") then
                rigName = info.playerAvatarType
            end
        end)
    end

    local snapshot = {
        version = 4,
        sourceMode = mode,
        rigType = rigName,
        descriptionSource = descriptionSource,
        properties = {},
        -- HumanoidDescription color properties are Color3, not BrickColor.
        -- Store normalized RGB components because JSON cannot encode Color3.
        colors = {},
        accessories = {}
    }

    for _, propertyName in ipairs(AVATAR_DESCRIPTION_PROPERTIES) do
        local readOk, value = pcall(function()
            return description[propertyName]
        end)
        if readOk then
            local valueType = typeof(value)
            if valueType == "number" then
                snapshot.properties[propertyName] = value
            elseif valueType == "string" then
                snapshot.properties[propertyName] = value
            end
        end
    end

    if mode == "Morph" then
        captureLiveClothingFallback(character, snapshot, true)
    elseif descriptionSource ~= "account" then
        captureLiveClothingFallback(character, snapshot, false)
    end

    for _, propertyName in ipairs(AVATAR_COLOR_PROPERTIES) do
        local readOk, value = pcall(function()
            return description[propertyName]
        end)

        if readOk and typeof(value) == "Color3" then
            snapshot.colors[propertyName] = {
                value.R,
                value.G,
                value.B
            }
        end
    end

    -- Fallback to the live BodyColors instance if a description color
    -- could not be read. This also captures runtime body color overrides.
    local bodyColors = character:FindFirstChildOfClass("BodyColors")
    if bodyColors then
        local bodyColorMap = {
            HeadColor = "HeadColor3",
            LeftArmColor = "LeftArmColor3",
            LeftLegColor = "LeftLegColor3",
            RightArmColor = "RightArmColor3",
            RightLegColor = "RightLegColor3",
            TorsoColor = "TorsoColor3"
        }

        for descriptionName, bodyName in pairs(bodyColorMap) do
            if snapshot.colors[descriptionName] == nil then
                local colorOk, color = pcall(function()
                    return bodyColors[bodyName]
                end)
                if colorOk and typeof(color) == "Color3" then
                    snapshot.colors[descriptionName] = {
                        color.R,
                        color.G,
                        color.B
                    }
                end
            end
        end
    end

    local accessoryOk, accessories = pcall(function()
        return description:GetAccessories(true)
    end)

    if accessoryOk and type(accessories) == "table" then
        for _, accessory in ipairs(accessories) do
            local assetId = tonumber(accessory.AssetId)
            local accessoryType = accessory.AccessoryType
            local typeName = nil

            pcall(function()
                typeName = accessoryType.Name
            end)

            if assetId and assetId > 0 then
                -- Keep every valid accessory asset. Unknown legacy types
                -- fall back to Hat rather than silently dropping the item.
                if not typeName or typeName == "" then
                    typeName = "Hat"
                end

                local puffiness = tonumber(accessory.Puffiness)
                table.insert(snapshot.accessories, {
                    assetId = assetId,
                    accessoryType = typeName,
                    isLayered = accessory.IsLayered == true,
                    order = tonumber(accessory.Order) or 0,
                    puffiness = puffiness
                })
            end
        end
    end

    snapshot.accessoryCount = #snapshot.accessories
    snapshot.liveAccessoryCount = 0
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Accessory") then
            snapshot.liveAccessoryCount = snapshot.liveAccessoryCount + 1
        end
    end

    -- GetAppliedDescription returns a separate Instance; release it after
    -- all serializable appearance data has been copied into the snapshot.
    pcall(function()
        description:Destroy()
    end)

    return snapshot
end

local function buildDescriptionFromSnapshot(snapshot)
    if type(snapshot) ~= "table" or type(snapshot.properties) ~= "table" then
        return nil, "saved appearance data is missing"
    end

    local description = Instance.new("HumanoidDescription")

    for propertyName, value in pairs(snapshot.properties) do
        if type(propertyName) == "string" and
            (type(value) == "number" or type(value) == "string") then
            pcall(function()
                description[propertyName] = value
            end)
        end
    end

    if type(snapshot.colors) == "table" then
        for propertyName, colorData in pairs(snapshot.colors) do
            if type(propertyName) == "string" then
                local color = nil

                -- v2 format: {R, G, B} normalized Color3 components.
                if type(colorData) == "table" then
                    local r = tonumber(colorData[1])
                    local g = tonumber(colorData[2])
                    local b = tonumber(colorData[3])
                    if r and g and b then
                        color = Color3.new(
                            math.clamp(r, 0, 1),
                            math.clamp(g, 0, 1),
                            math.clamp(b, 0, 1)
                        )
                    end
                else
                    -- Backward compatibility with old BrickColor-number snapshots.
                    local number = tonumber(colorData)
                    if number then
                        pcall(function()
                            color = BrickColor.new(number).Color
                        end)
                    end
                end

                if color then
                    pcall(function()
                        description[propertyName] = color
                    end)
                end
            end
        end
    end

    if type(snapshot.accessories) == "table" then
        local rebuiltAccessories = {}
        for _, accessory in ipairs(snapshot.accessories) do
            local assetId = tonumber(accessory.assetId)
            local typeName = tostring(accessory.accessoryType or "")
            local enumType = nil
            pcall(function()
                enumType = Enum.AccessoryType[typeName]
            end)

            -- Rigid/classic accessories are restored through the dedicated
            -- HumanoidDescription fields (HatAccessory, HairAccessory, etc.).
            -- SetAccessories is therefore used only for layered accessories,
            -- preventing rigid items from being applied twice or overwriting
            -- the legacy accessory fields.
            if assetId and assetId > 0 and enumType and accessory.isLayered == true then
                table.insert(rebuiltAccessories, {
                    AssetId = assetId,
                    AccessoryType = enumType,
                    IsLayered = true,
                    Order = tonumber(accessory.order) or 0,
                    Puffiness = tonumber(accessory.puffiness) or 0
                })
            end
        end

        if #rebuiltAccessories > 0 then
            pcall(function()
                description:SetAccessories(rebuiltAccessories, false)
            end)
        end
    end

    return description
end

local function showSavedAvatarAppearance(favorite)
    clearViewport()

    if type(favorite.appearance) ~= "table" then
        Status.Text = "Saved outfit has no 3D snapshot (legacy save)"
        return false
    end

    local description, descriptionError = buildDescriptionFromSnapshot(favorite.appearance)
    if not description then
        Status.Text = "Could not rebuild saved avatar: " .. tostring(descriptionError)
        return false
    end

    local rigType = Enum.HumanoidRigType.R15
    if favorite.appearance.rigType == "R6" then
        rigType = Enum.HumanoidRigType.R6
    end

    local model = nil
    local createErrors = {}

    -- Async construction waits for avatar assets to finish loading. The
    -- synchronous API remains as a compatibility fallback for executors.
    local asyncCreator = Players.CreateHumanoidModelFromDescriptionAsync
    if type(asyncCreator) == "function" then
        local asyncOk, asyncModel = pcall(function()
            return Players:CreateHumanoidModelFromDescriptionAsync(description, rigType)
        end)
        if asyncOk and asyncModel then
            model = asyncModel
        else
            table.insert(createErrors, "async: " .. tostring(asyncModel))
        end
    end

    if not model then
        local syncOk, syncModel = pcall(function()
            return Players:CreateHumanoidModelFromDescription(description, rigType)
        end)
        if syncOk and syncModel then
            model = syncModel
        else
            table.insert(createErrors, "sync: " .. tostring(syncModel))
        end
    end

    pcall(function() description:Destroy() end)

    if not model then
        Status.Text = "Could not recreate saved 3D avatar: " .. table.concat(createErrors, " | ")
        return false
    end

    removeExtraObjects(model)
    model.Parent = World
    currentModel = model

    resetJoints(model)
    rememberJointBases(model)

    if not centerModel(model) then
        model:Destroy()
        currentModel = nil
        Status.Text = "Could not frame saved avatar"
        return false
    end

    setViewportMode("Free")
    applyPose(model, "N")
    if EH.setPreviewReady then EH.setPreviewReady(true) end
    Status.Text = "Saved 3D avatar loaded"
    return true
end

saveFavorite = function(snapshot)
    if EH.isSavingOutfit then return end
    local scan = snapshot or EH.lastAvatarScan
    if not scan or not scan.player or type(scan.items) ~= "table"
        or #scan.items == 0 then
        Status.Text = "Scan a player before saving"
        return
    end
    -- A manual save must refer to the currently selected scan. Explicit row
    -- saves keep their own player/source even if another selection starts.
    if not snapshot and (scan.player ~= selectedPlayer
        or scan.sourceMode ~= EH.avatarSourceMode) then
        Status.Text = "Selection changed; scan the player again"
        return
    end
    if scan.player.Parent ~= Players then
        Status.Text = "This player is no longer available"
        return
    end

    EH.isSavingOutfit = true
    local ok, errorText = pcall(function()
        local player, sourceMode = scan.player, scan.sourceMode
        local savedItems = {}
        for _, item in ipairs(scan.items) do
            local itemId = tonumber(item.id)
            if itemId and itemId > 0 then
                savedItems[#savedItems + 1] = {
                    name = tostring(item.name or "Item"),
                    id = itemId,
                    category = item.category == "Animations" and "Animations" or "Items",
                    classicClothing = item.classicClothing == true
                }
            end
        end
        if #savedItems == 0 then
            Status.Text = "No valid outfit IDs to save"
            return
        end

        local appearance, appearanceError = captureAvatarAppearance(player, sourceMode)
        if not appearance then
            Status.Text = "3D appearance was not saved: " .. tostring(appearanceError)
            EH.logDiagnostic("Outfit save", appearanceError)
            return
        end

        local newFavorite = {
            name = player.DisplayName,
            username = player.Name,
            userId = player.UserId,
            savedAt = os.time(),
            items = savedItems,
            appearance = appearance
        }
        table.insert(favorites, newFavorite)
        while #favorites > MAX_SAVED_OUTFITS do
            table.remove(favorites, 1)
        end

        local saved, storageError = persistFavorites()
        if saved then
            if appearance.sourceMode == "Morph" then
                Status.Text = "Morph assets saved; custom geometry may not restore"
                showSuccessToast("Morph assets saved")
            else
                Status.Text = "Outfit saved permanently"
                showSuccessToast("Avatar saved successfully")
            end
        else
            Status.Text = "Session only: " .. tostring(storageError)
            EH.logDiagnostic("Outfit storage", storageError)
        end

        if currentMode == "Favorites" then refreshFavoritesList() end
    end)
    EH.isSavingOutfit = false
    if not ok then
        EH.logDiagnostic("Outfit save error", errorText)
        Status.Text = "Could not save outfit: " .. tostring(errorText)
    end
end


showFavorite = function(favorite)
    if not favorite then return end

    EH.avatarScanToken = (EH.avatarScanToken or 0) + 1
    EH.lastAvatarScan = nil
    selectedPlayer = nil
    selectedFavorite = favorite

    -- Restore the saved appearance snapshot from JSON into the 3D viewport.
    local appearanceLoaded = showSavedAvatarAppearance(favorite)

    -- Keep the saved asset and animation ID list visible alongside the model.
    displaySavedItems(favorite.items, favorite.appearance)
    if appearanceLoaded then
        local accessoryCount = tonumber(favorite.appearance.accessoryCount)
            or #(favorite.appearance.accessories or {})
        Status.Text = "Saved avatar loaded: @" .. favorite.username
            .. " | accessories: " .. tostring(accessoryCount)
            .. (favorite.appearance.sourceMode == "Morph"
                and " | game-only geometry may differ" or "")
    elseif type(favorite.appearance) == "table" then
        Status.Text = "Saved avatar could not be fully restored: @" .. favorite.username
    else
        Status.Text = "Legacy outfit (IDs only): @" .. favorite.username
    end
end

refreshFavoritesList = function()
    clearGuiList(PlayerList)

    -- Outfit Dashboard: scoped controls, no added persistent Luau locals.
    do
        local card = create("Frame", {
            Name = "EHSavedOutfitCount",
            Size = UDim2.fromOffset(172, 78),
            BackgroundColor3 = Color3.fromRGB(43, 36, 30),
            BorderSizePixel = 0,
            LayoutOrder = 0
        }, PlayerList)
        round(card, 12)
        create("UIStroke", {
            Color = Color3.fromRGB(135, 100, 67),
            Transparency = 0.36,
            Thickness = 1,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }, card)

        local titleTag = create("Frame", {
            Name = "EHSavedOutfitTitle",
            Size = UDim2.fromOffset(98, 23),
            Position = UDim2.fromOffset(11, 5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0
        }, card)
        round(titleTag, 6)
        create("UIStroke", {
            Color = Color3.fromRGB(170, 127, 83),
            Thickness = 1,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }, titleTag)
        local title = makeLabel(titleTag, "OUTFITS",
            UDim2.new(1, -8, 1, 0), UDim2.fromOffset(4, 0), 12)
        title.Font = Enum.Font.GothamMedium
        title.TextColor3 = Color3.fromRGB(235, 225, 209)
        title.TextXAlignment = Enum.TextXAlignment.Center
        title.TextScaled = false
        EH.safeIcon(card, "outfits", UDim2.fromOffset(141, 5), 22)

        local count = makeLabel(card, string.format("%02d", #favorites),
            UDim2.fromOffset(80, 27), UDim2.fromOffset(11, 29), 25)
        count.Font = Enum.Font.GothamBold
        count.TextColor3 = Color3.fromRGB(249, 237, 241)
        count.TextXAlignment = Enum.TextXAlignment.Left

        local status = create("Frame", {
            Name = "EHSavedOutfitStatus",
            Position = UDim2.fromOffset(11, 57),
            Size = UDim2.fromOffset(151, 19),
            BackgroundTransparency = 1,
            BorderSizePixel = 0
        }, card)
        round(status, 9)
        create("UIStroke", {
            Color = Color3.fromRGB(133, 204, 169),
            Transparency = 0.2,
            Thickness = 1,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }, status)
        local dot = create("Frame", {
            Size = UDim2.fromOffset(5, 5),
            Position = UDim2.fromOffset(7, 7),
            BackgroundColor3 = Color3.fromRGB(155, 231, 186),
            BorderSizePixel = 0
        }, status)
        round(dot, 3)
        local caption = makeLabel(status,
            currentLanguage == "ru" and "Сохранено нарядов" or "Saved outfits",
            UDim2.new(1, -21, 1, 0), UDim2.fromOffset(17, 0), 10)
        caption.Font = Enum.Font.GothamMedium
        caption.TextColor3 = Color3.fromRGB(196, 244, 216)
        caption.TextXAlignment = Enum.TextXAlignment.Left
        caption.TextScaled = false
    end

    if #favorites == 0 then
        do
            local emptyCard = create("Frame", {
                Name = "EHSavedOutfitsEmptyState",
                Size = UDim2.fromOffset(172, 103),
                BackgroundColor3 = Color3.fromRGB(34, 29, 25),
                BackgroundTransparency = 0.18,
                BorderSizePixel = 0,
                LayoutOrder = 1
            }, PlayerList)
            round(emptyCard, 11)
            create("UIStroke", {
                Color = Color3.fromRGB(132, 100, 68),
                Transparency = 0.5,
                Thickness = 1,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }, emptyCard)
            EH.safeIcon(emptyCard, "outfits", UDim2.fromOffset(71, 10), 30)
            local empty = makeLabel(emptyCard, "No saved outfits yet",
                UDim2.new(1, -16, 0, 49), UDim2.fromOffset(8, 48), 12)
            empty.Font = Enum.Font.GothamMedium
            empty.TextColor3 = Color3.fromRGB(196, 182, 162)
            empty.TextXAlignment = Enum.TextXAlignment.Center
            empty.TextYAlignment = Enum.TextYAlignment.Center
            empty.TextWrapped = true
            empty.TextTruncate = Enum.TextTruncate.None
        end
        return
    end

    for _, favorite in ipairs(favorites) do
        local row = create("Frame", {
            Size = UDim2.new(1, -4, 0, 50),
            BackgroundColor3 = LIGHT,
            BorderSizePixel = 0
        }, PlayerList)

        EH.ehCard(row)
        EH.listCardEdge(row)

        local nameLabel = makeLabel(
            row, favorite.name,
            UDim2.new(1, -104, 0, 23),
            UDim2.fromOffset(8, 4), 13
        )

        nameLabel.Font = Enum.Font.GothamMedium
        nameLabel.ZIndex = 2

        local usernameLabel = makeLabel(
            row, "@" .. favorite.username,
            UDim2.new(1, -104, 0, 18),
            UDim2.fromOffset(8, 27), 9
        )

        usernameLabel.TextColor3 = MUTED
        usernameLabel.ZIndex = 2
        local dateOk, dateText = pcall(function()
            return os.date("%m/%d %H:%M", tonumber(favorite.savedAt) or os.time())
        end)
        if dateOk and dateText then
            usernameLabel.Text = "@" .. favorite.username .. "  •  " .. dateText
        end

        local renameButton = makeButton(
            row, "✎",
            UDim2.fromOffset(30, 30),
            UDim2.new(1, -72, 0, 10),
            Color3.fromRGB(37, 32, 28)
        )
        renameButton.Name = "RenameOutfitButton"
        renameButton.Text = ""
        renameButton.TextSize = 18
        renameButton.Font = Enum.Font.GothamBold
        renameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        renameButton.ZIndex = 10
        EH.styleIconAction(renameButton)
        EH.safeIcon(renameButton, "edit", UDim2.fromOffset(3, 3), 23)
        renameButton.Activated:Connect(function()
            openRenameDialog(favorite)
        end)

        local removeButton = makeButton(
            row, "×",
            UDim2.fromOffset(30, 30),
            UDim2.new(1, -38, 0, 10),
            Color3.fromRGB(37, 32, 28)
        )
        removeButton.Name = "DeleteOutfitButton"
        removeButton.Text = ""
        removeButton.ZIndex = 10
        EH.styleIconAction(removeButton)
        EH.safeIcon(removeButton, "delete", UDim2.fromOffset(3, 3), 23)

        removeButton.Activated:Connect(function()
            openConfirmDialog(
                "Are you sure you want to delete this outfit?",
                function()
                    local removedIndex = nil

                    for i = #favorites, 1, -1 do
                        if favorites[i] == favorite then
                            removedIndex = i
                            table.remove(favorites, i)
                            break
                        end
                    end

                    if not removedIndex then
                        refreshFavoritesList()
                        return
                    end

                    local saved, storageError = persistFavorites()
                    if not saved then
                        table.insert(favorites, removedIndex, favorite)
                        Status.Text = "Could not save deletion: " .. tostring(storageError)
                        refreshFavoritesList()
                        return
                    end

                    if selectedFavorite == favorite then
                        selectedFavorite = nil
                        clearViewport()
                        clearItems()
                        Status.Text = "Outfit removed"
                    end

                    showSuccessToast("Outfit deleted")
                    refreshFavoritesList()
                end
            )
        end)

        local selectButton = create("TextButton", {
            Size = UDim2.new(1, -78, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Active = true,
            Selectable = true,
            ZIndex = 1
        }, row)

        EH.bindPhysicalPress(selectButton, row, false)
        selectButton.Activated:Connect(function()
            showFavorite(favorite)
        end)
    end
end

--==================================================
-- MODE SWITCH
--==================================================

local function updateListMode()
    if currentMode == "Players" then
        currentMode = "Favorites"
        EH.lastPlayerListSignature = nil
        Search.Visible = false
        EH.setModeButtonLabel(ModeButton, currentMode)
        refreshFavoritesList()
    else
        currentMode = "Players"
        Search.Visible = true
        EH.setModeButtonLabel(ModeButton, currentMode)
        refreshPlayerList()
    end
end

ModeButton.Activated:Connect(updateListMode)

--==================================================
-- SMOOTH MAIN WINDOW TRANSITIONS
--==================================================

local windowAnimationToken = 0
local windowBasePosition = Main.Position

local function setMainWindowVisible(shouldShow)
    windowAnimationToken += 1
    local token = windowAnimationToken
    local baseScale = windowBaseScale
    if baseScale <= 0 then baseScale = 1 end

    if shouldShow then
        Main.Visible = true
        windowBasePosition = Main.Position
        Main.Position = windowBasePosition + UDim2.fromOffset(0, 12)
        UIScale.Scale = baseScale * 0.90
        local info = TweenInfo.new(0.26, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        TweenService:Create(Main, info, {Position = windowBasePosition}):Play()
        TweenService:Create(UIScale, info, {Scale = baseScale}):Play()
    else
        if not Main.Visible then return end
        local info = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        local move = TweenService:Create(Main, info, {Position = windowBasePosition + UDim2.fromOffset(0, 12)})
        local shrink = TweenService:Create(UIScale, info, {Scale = baseScale * 0.92})
        move:Play()
        shrink:Play()
        move.Completed:Connect(function()
            if token ~= windowAnimationToken then return end
            Main.Visible = false
            Main.Position = windowBasePosition
            UIScale.Scale = baseScale
        end)
    end
end

--==================================================
-- EVENTS
--==================================================

local playerSearchRefreshToken = 0
Search:GetPropertyChangedSignal("Text"):Connect(function()
    if currentMode ~= "Players" then return end
    playerSearchRefreshToken += 1
    local token = playerSearchRefreshToken
    task.delay(0.14, function()
        if token ~= playerSearchRefreshToken then return end
        if Search.Parent and currentMode == "Players" then
            refreshPlayerList()
        end
    end)
end)

trackExternalConnection(Players.PlayerAdded:Connect(function()
    if currentMode == "Players" then
        refreshPlayerList()
    end
end))

trackExternalConnection(Players.PlayerRemoving:Connect(function(player)
    local cached = EH.accountDescriptionCache and EH.accountDescriptionCache[player.UserId]
    if cached then
        EH.accountDescriptionCache[player.UserId] = nil
        if cached.template then pcall(function() cached.template:Destroy() end) end
    end
    if selectedPlayer == player then
        EH.avatarScanToken = (EH.avatarScanToken or 0) + 1
        EH.lastAvatarScan = nil
        selectedPlayer = nil
        clearViewport()
        clearItems()
        WornCountLabel.Text = translateText("WORN ITEMS: —"):gsub(":%s*—$", "")
        EH.wornBadge.Text = "—"
        Status.Text = "Player left"
    end

    if currentMode == "Players" then
        refreshPlayerList()
    end
end))

--==================================================
-- MAIN BUTTONS
--==================================================

-- Preserve the proven opening routine as fallback; animate only after GUI startup.
EH.mainOpenAction = function()
    setMainWindowVisible(not Main.Visible)
end

-- The module is embedded at build time; no private GitHub request at runtime.
-- Installation runs after the window, floating toggle and all panels exist.
task.defer(function()
    if not Main.Parent or not Toggle.Parent then return end
    local ok, result = pcall(function()
        return AI_CreateBundledAnimationController().new({
            TweenService = TweenService,
            Main = Main,
            UIScale = UIScale,
            PlayerList = PlayerList,
            Viewport = Viewport,
            PoseBar = PoseBar,
            ItemsPanel = ItemsPanel,
            getBaseScale = function() return windowBaseScale end,
        })
    end)
    if not ok then
        warn("[Avatar Inspector] Animation init failed; original transition preserved: " .. tostring(result))
        return
    end

    EH.animationController = result
    EH.mainOpenAction = function()
        local state = result:getState()
        local wantVisible = state == "Hidden" or state == "Closing"
        local animated, err = pcall(function()
            result:toggle()
        end)
        if not animated then
            warn("[Avatar Inspector] Animation failed; using direct safe fallback: " .. tostring(err))
            pcall(function() result:destroy() end)
            EH.animationController = nil
            EH.mainOpenAction = function()
                setMainWindowVisible(not Main.Visible)
            end
            -- The launcher must still work, even if an animation failed.
            Main.Visible = wantVisible
            UIScale.Scale = windowBaseScale > 0 and windowBaseScale or 1
        end
    end
    print("[Avatar Inspector] Bundled Cascade Panels / Dissolve controller ready")
end)

Close.Activated:Connect(function()
    showExitConfirmation()
end)

--==================================================
-- START
--==================================================

updatePoseButtons("N")
styleSelectedControl(FreeViewButton, true)
local loadResult = table.pack(pcall(loadFavoritesFromFile))
refreshPlayerList()

-- Theme-only icons are deferred until after the working GUI is initialized.
task.defer(function()
    if not Main or not Main.Parent then return end
    -- Slightly inset from the left edge, never at the far-right end.
    EH.safeIcon(Search, "search", UDim2.fromOffset(7, 4), 26)
    EH.safeIcon(Viewport, "viewer", UDim2.fromOffset(11, 7), 24)
    -- Removed obsolete EH.itemsIconCircle call; item icon is owned by the current header.
    EH.safeIcon(BrandPill, "status", UDim2.fromOffset(3, 3), 21)
    EH.safeIcon(ModeButton, "hanger", UDim2.fromOffset(6, 3), 29)
    if EH.safeIcon(Close, "close", UDim2.fromOffset(6, 5), 21) then
        Close.Text = ""
    end
end)

if loadResult[1] and loadResult[2] then
    Status.Text = loadResult[3]
else
    local reason = loadResult[1] and loadResult[3] or loadResult[2]
    Status.Text = "Storage unavailable: " .. tostring(reason)
    warn("[Avatar Inspector] Outfit load failed: " .. tostring(reason))
end

AI_DIAG_STAGE = "INITIALIZATION_FINISHED"
AIDiag("11 All initialization steps finished")
print("Avatar Inspector v7.9.60 loaded successfully")

end

--==================================================
-- PROTECTED STARTUP
--==================================================

local success, result = xpcall(
    StartAvatarInspector,
    function(err)
        local message = tostring(err)

        if debug and type(debug.traceback) == "function" then
            message = message .. "\n" .. debug.traceback("", 2)
        end

        return message
    end
)

if not success then
    warn("========================================")
    warn("[AI-DIAG] AVATAR INSPECTOR v7.9.62 STARTUP ERROR")
    warn("[AI-DIAG] LAST STAGE: " .. tostring(AI_DIAG_STAGE))
    warn("[AI-DIAG] ERROR: " .. tostring(result))
    warn("========================================")
else
    AIDiag("12 Protected startup completed successfully")
    print("AVATAR INSPECTOR v7.9.63 INITIALIZATION FINISHED")
end