--[[
    AVATAR INSPECTOR v7.9.69

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
local BG = Color3.fromRGB(9, 8, 13)
local PANEL = Color3.fromRGB(21, 18, 26)
local LIGHT = Color3.fromRGB(39, 32, 42)
local ACCENT = Color3.fromRGB(222, 151, 122)
local ACCENT_PURPLE = Color3.fromRGB(247, 188, 138)
local OUTLINE = Color3.fromRGB(102, 72, 90)
local WHITE = Color3.fromRGB(245, 241, 252)
local MUTED = Color3.fromRGB(187, 165, 175)
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
        edge.Color = tone or Color3.fromRGB(147, 97, 105)
        edge.Transparency = transparency or 0.16
        edge.Thickness = thickness or 1.25
    end
end

function EH.ehPanel(parent, kind)
    EH.ehStroke(parent,
        kind == "viewer" and Color3.fromRGB(193, 128, 115)
            or Color3.fromRGB(135, 88, 104),
        kind == "viewer" and 0.09 or 0.2,
        kind == "viewer" and 1.55 or 1.25)
    -- A single UICorner + UIStroke gives continuous frames without detached rails.
end

-- List neon stays on existing panel strokes. No child Frames in ScrollingFrames,
-- no extra fragmented side strips, and no per-item animation loops.
function EH.listNeon(panel)
    local ok, reason = pcall(function()
        local stroke = panel:FindFirstChildOfClass("UIStroke")
        if not stroke then return end
        stroke.Color = Color3.fromRGB(247, 171, 143)
        stroke.Thickness = 2.2
        stroke.Transparency = 0.04
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local gradient = stroke:FindFirstChild("EHListNeonGradient")
        if not gradient then
            gradient = create("UIGradient", {
                Name = "EHListNeonGradient",
                Rotation = 15,
                Offset = Vector2.new(-0.55, 0),
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(152, 112, 190)),
                    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(251, 183, 147)),
                    ColorSequenceKeypoint.new(0.57, Color3.fromRGB(255, 218, 162)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 112, 190))
                })
            }, stroke)
        end

        -- One moderately paced sweep and one subtle breathing effect per large list border.
        TweenService:Create(gradient,
            TweenInfo.new(4.3, Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut, -1, true),
            {Offset = Vector2.new(0.55, 0)}):Play()
        TweenService:Create(stroke,
            TweenInfo.new(2.4, Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut, -1, true),
            {Transparency = 0.14}):Play()
    end)
    if not ok then
        warn("[Avatar Inspector] List neon was skipped: " .. tostring(reason))
    end
end

function EH.listCardEdge(card)
    local stroke = card:FindFirstChildOfClass("UIStroke")
    if stroke then
        stroke.Color = Color3.fromRGB(188, 122, 129)
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
        BackgroundColor3 = Color3.fromRGB(45, 35, 49),
        BorderSizePixel = 0,
        Active = false,
        ZIndex = parent.ZIndex + 1
    }, parent)
    round(chip, 8)
    create("UIStroke", {
        Color = Color3.fromRGB(177, 119, 119),
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
    outfits = [=[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]=],
    save = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAABV3ElEQVR4nO39e3AlWX7fiX2/v5N578WzCqgq1KPf3dM9M4XhaEY9JCVq7a12bFgOxg4lW0bZ3oiVl2EFGeEIml7Pcl/+4967u5I4WsuKocJ/DO2wYr1hO6LAJSlKSy53FdGlXQW9Ck1zRbJRM9M93V39qCfqhTfuvXl+X/+RmRcXKKAKqKruQgH5iQYaBdzMPJl5zu/8zu91gIqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiopDB592A55VVD47Dfym4guG5X/Vw39EKgGwR6Siv7VaRAvA7CUCM7h4Yo7ntvn8O++d4ZsA8OZ2f/z82nmQeKf4/uYbp/sD/eJF4Nz0tDAzp1YLaLXaIitBUFFRUVHxpJDAZrNpUtPUbNrTbk/FzkhN04WZoGbTJFXabUVFRcWDqKTkDpQzCMn71pX6/e/VL3fuDDUctV5M02S4niRaqwWv1WCRinB4ENMYolQjLOTnciIaASAxeM9dkAtpen8DsvhMvpueWb/dqbs2/y0S2HqvPaQeNj/jZODfPUAhCh7k9OhCNpIyUydGT9Jep7e27imWz/xCe22rMVACW60mW62WQFbGwm1InnYD9iN9C//srEnyvhAQeOef/Pr4tU736FGkE5LGlfpoUBxGtPEY4hgig4ExhuiWsW7BhiXUJJiMBsIAoOfMYCGD6BAA36qyhl0LAOf+UXeDONCW4OVPTpEibcuc40jgpOCAlc85amOgGmUIDlOU0AuGlV6m9QzWAeJy3Wq3s268fu93mvP6n7cWiA2BPTs7Y60WhFaLEFRNd/dTPZJdoLebyc35Ew2rzY9H1o5LybGQdadonHBggokdpTApaAJCDQBAiEIN5DCgVIBBMmM+QwqKoGVwF7jNa9B2v9yhfftIAAAbbaHMN34rapubEgCCyqVuMXiZCwACUP6BKLAHaE3yJQOXQSwLvEfXTZM+iRaud5XdGh6dWpxIrnZwrt3ZzisggZW3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]=],
    edit = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAABtnUlEQVR4nOz9aYwk6ZqdBz7nM3P32CMjct/3rKrMukv3vWSTBDmqAihy1COS4giRwGAgYfjnXmAg6kJsLpIwgkf84EADqkE1ewaYamBAgvoxQAQwIkXwtqangSpK7GaTXXXXilpyq6zMqtwzIjNWX8y+Mz/M3MMjMzJr6VoysvzcmxWrm5tZ2Pd+73Le80IfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx999NFHH3300UcfffTRRx99fFOhr/sE+vhmwiBcfgZMT08LYLr3l6Yf/cbGtzd9PT1tECqP2EcfffTRRx99fM2QjWwX/+r14Ho92P5SPE8b1Xveo/iH3Pd0n4j+jenjS0N3oU9Pi2lg7tzG8zY/b2ZmLL4Yt70IKerqvMccc0xNnXURRvRDhCehbwD6+Nphs2EHpqfFuXfE7rN668JNfe/MfnP3nOeYY2r+bCdh0PmoaYocgKT+4v4c6BuAPr4w2Ijpernrz/iTdly/Xk/fWqZ6NK4lWh4SOydJmgthvV2tZLg6nDusjihODCpbWmvlw2Egd7vhhfagASZX1+VDg24vrud7dtPQqzPZ089vI/ToG4wCfQPQxxeKjd38yS63Z6cSqt8fupOuDcd8ZDC2V2q1tBqkRCJPcqnm3AMiJk5DHhK3HZN2YjKCojMiAFmuVpp4kNhM8PLI2IGHevVvNLZ8z27VAaTOt/roG4A+/sSw0VaL3bZ4Yzp56wLVY4dJq9lotSXVYnN1qJJWRhyy4YYZqUQP2KGCQhBOYlBFURWFPFhJNFlOnmRpIMttJzGJOTkAIUmyGGPD5A+CqveHYPlBSFpD+XK2Y2ikzcGVNufIpJn4ld+YbYC+AejjTwTbYu58YP6sNbOxyOzZ5M4bdwZja30orDZGFTwmkh0ojBE8gj0iazCKYcc4JKgKpUiKWBAIsrtmxTaSiUCQbRsR7dAW+bqlB45e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]=],
    search = [=[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]=],
    delete = [=[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]=],
    viewer = [=[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]=],
    players = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAABkKUlEQVR42u39aZBd6XkeCD7P+5275I5MILFWoVB7EUkWF5RILZaFmpZMiZblrRMRbU90jGYiyIgZW4wZWS1RGse9d8ayzJFoBS1HRxS7e+SwRx0dmZYlUhIptiUXZC3cqopronYAVdiRCeS+3HvP9z7z45x782YigSoWq6hC4TxBEMisvCfP+c73vfv7vECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAn/tYLEE338IIHTj6hNQsToFCrwDD7wKYVugsADujDWVhHq9znodwPQEMT6zuc6zp4SZo0K9vlXb1+vExCkCkwCmgcmjQh3Ifo4gC+ugQIECBQoUFsDbyLyv1QwTmZZ/+oVLXH7ogE6ehDcaDb/5Z2Q4+JkAPI2nAQDHcOyjH01JakeLYmrKMD7DkwCOH4cDdd3kZwsUKATA20k4PH3wYNhdvhiOvAd29hzKfUPliq57f+grJ2g2IU8ko5dCqd2sNDcWW8nGIw/c28TETAo2VAQGCxQC4O10qAUCNeIkDLMT4okT8cafEa+erA/YYv9wLGl3aGm3JepXZMVNZROqDiUGAAoueSpD6uYbQVwKtDmI82ZaHlnbWOWJRmv79TE9nVkFJ4HjgPMWFkeBAoUAeCuFwpO15NzscCmOW6W0sDKUmI0aMSrHOI0HEXWXGYclVAQFUiUYCZEQXfA2BKehSWER4EXKLitpzynlgrvm+5J0cegaVnAWreKwFygEwPdb69drxMQEMTnpvf737O9/cigEvw+we2KqA7K426VRgsOUxsxs1KXdJPoBliEZmKUFmV0bNKRyOMgWoXUK8wLnAV1zYgXQCsSrJjzHSnh+90+tXyS3CgHVajY9cYqT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]=],
    items = [=[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]=],
    copy = [=[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uPra670d/vTiPXX9VEykqhj/r47nwgh4PzgWMIilS7a0tISikMeqoLUbl/4v67Umr8XUjrPmxyGeToAzLj9BYprkFMhjoo5Bms48TmUDn+img3Kxy1CsJ2L5xH5PlTvt0QdICRLz5m6iyDwRr1y7iFA+uQaLHB2BZcpR7pgojGX4YmJgj7H04YE2IjkgMHCoB6EvogdYj0CPwrqkW5B95Mg+q5E3BuCa17AxiNjo16d23/2bv9bfc8J22/J6/vldKKRzxVfIC3H78/mziE7nHkOT/ujbE599PGhOzDaaA+9NG3GsNtAUTFMWrSXTFICWqKaIJjJrOTVlZI2ESUoITrg0RaAOAAQylzKjZUA+jwaQAUwB1QhMKt+3y3yRUxMwISgY2KOpP1rsrHBIuBvIkAuPYWzi48G8NlcuQR482SjM8RnJVPA+hZ4Du2a2Ze4bElYo3nHjShTWorT18tnGLn7x7/Tu58MvpTGwVxhVfHW8EALgUchHp3levrxc++mNVi2tZ806QmOnlzYmEAItI5O69bpqssFJs1hrIkH0WAM14xEnLK9EBLlSmfo0SwGAdHrkwIL1PXqDASckNAFtGZN1zzwAnCaVwLBD+C5EwWCQCUYxKji9BjCwsMA9/o+Uco1DfJS040g4UjhNqYGDGNVNAjcT4u7G9ubd1841tjqX4Z3OYpWqe0R54QSAJC4tXTQAuPjQun7ipUtLBixheXlJnY70wXe/m7x6Im3UTmwHALBYC5mnrUFvMN1UrQ4AfXiMIaY1b+bLWoeMtRDTWK+nYTCo9WXTLtXr4C6Tqe3B7maowSasFkIWrRe000e9JoSE6AKo18RMNrBuYrFhCBkRk8fucKpHoQegCXAQHvzsm0DDo3o9QAEekcXEbJBsDron/5eLWw/q8GXZdGABS1jCwvJ5oTNyy1YcHl44AfCkkcS8UOly+GQnX2ot3ZzV4KVV9dbOCQDeew/A1nVhZV6YW+aPurOhNrHKnRX4PObj5bllzq3A6jdmudls+nsnThxsFZ9b5gcfnuN77wEffPBFrvYDvPfuS/rgwxsE3nuk/QHgvXdf0uXLwIUOvHLfPV+80AJAAjudNjsAluavcGG85vTCstDBcHXi3GWVv3/RRzK124YLMHx4jni3EGx77tfQvflC36eKI4Dy+P/iT/m/L7hgfBQksN1uW37Pqvt2VKke2AMYNuj93uv9DLWD8v3B5+uMf9S5/36HkQ6ATqkNFR7Jr/SCKp4IR2Z58IqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioonx/8fIsh2tj9WIn8AAAAASUVORK5CYII=]=],
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
    local ink = Color3.fromRGB(247, 194, 152)
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

    if kind == "search" then
        outline(3.1, 2.8, 14.4, 14.4, 10, 2.2)
        strokeLine(16.3, 16.4, 21.5, 21.5, 2.5)
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
    local usePNG = (kind == "outfits" or kind == "viewer" or kind == "players" or kind == "items" or kind == "copy" or kind == "save" or kind == "edit" or kind == "search" or kind == "delete")
    if usePNG then
        local okPNG, resultPNG = pcall(EH_pngIcon, parent, kind, position, size)
        if okPNG and resultPNG then return resultPNG end
        -- Native fallback is created only if PNG registration failed; no duplicate icon.
    end
    local fallbackKind = kind == "outfits" and "folder" or kind
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
        Color = Color3.fromRGB(128, 88, 100),
        Thickness = 1.1,
        Transparency = 0.48,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, card)
    create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 36, 47)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(34, 27, 38))
        }),
        Rotation = 25
    }, card)
end

function EH.styleIconAction(button)
    button:SetAttribute("EHActionButton", true)
    button.BackgroundColor3 = Color3.fromRGB(34, 25, 38)
    button.TextColor3 = Color3.fromRGB(250, 220, 190)
    local edge = button:FindFirstChildOfClass("UIStroke")
    if edge then
        edge.Color = Color3.fromRGB(214, 146, 126)
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
    local scale = create("UIScale", {Scale = 1}, obj)
    local pressInfo = TweenInfo.new(0.09, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local releaseInfo = TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local hoverInfo = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

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
    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(scale, pressInfo, {Scale = 0.975}):Play()
            if obj:GetAttribute("EHActionButton") then
                TweenService:Create(outline, pressInfo,
                    {Transparency = 0, Thickness = 1.7}):Play()
            end
        end
    end)
    obj.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(scale, releaseInfo, {Scale = 1}):Play()
            if obj:GetAttribute("EHActionButton") then
                TweenService:Create(outline, releaseInfo,
                    {Transparency = 0.12, Thickness = 1.4}):Play()
            end
        end
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

local oldGui = PlayerGui:FindFirstChild("AvatarInspector")
if oldGui then oldGui:Destroy() end

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
        Color3.fromRGB(13, 10, 19)
    )
    Toggle.Name = "AvatarInspectorFloatingButton"
    Toggle.Text = ""
    Toggle.ClipsDescendants = false
    Toggle.BackgroundColor3 = Color3.fromRGB(13, 10, 19)

    local corner = Toggle:FindFirstChildOfClass("UICorner")
    if corner then corner.CornerRadius = UDim.new(1, 0) end

    local outline = Toggle:FindFirstChildOfClass("UIStroke")
    if outline then
        outline.Color = Color3.fromRGB(242, 176, 126)
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
        UDim2.fromOffset(44, 44), Color3.fromRGB(33, 19, 45), 22, 0, 0, 2)
    local diskGradient = create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(64, 35, 79)),
            ColorSequenceKeypoint.new(0.52, Color3.fromRGB(10, 8, 19)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(27, 19, 46))
        }), Rotation = 45
    }, disk)

    local eventSphere = layer("EventSphere", UDim2.fromOffset(19, 18),
        UDim2.fromOffset(21, 21), Color3.fromRGB(7, 6, 13), 11, 0, 0, 3)
    create("UIStroke", {
        Color = Color3.fromRGB(132, 78, 154),
        Thickness = 1,
        Transparency = 0.13
    }, eventSphere)

    -- The single elliptical orbit intentionally crosses the dark sphere.
    -- Using UIStroke rather than broken Frame segments keeps its edge smooth.
    local orbit = layer("CosmicOrbit", UDim2.fromOffset(7, 21),
        UDim2.fromOffset(45, 16), Color3.fromRGB(239, 170, 106),
        9, -27, 1, 5)
    local orbitStroke = create("UIStroke", {
        Color = Color3.fromRGB(250, 185, 108),
        Thickness = 2.5,
        Transparency = 0.04,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }, orbit)
    create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(168, 89, 144)),
            ColorSequenceKeypoint.new(0.43, Color3.fromRGB(253, 206, 145)),
            ColorSequenceKeypoint.new(0.73, Color3.fromRGB(255, 149, 73)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 77, 149))
        }), Rotation = 0
    }, orbitStroke)

    local satellite = layer("OrbitSatellite", UDim2.fromOffset(43, 12),
        UDim2.fromOffset(7, 7), Color3.fromRGB(255, 197, 121),
        4, 0, 0, 6)
    local star = layer("OrbitStar", UDim2.fromOffset(12, 41),
        UDim2.fromOffset(4, 4), Color3.fromRGB(182, 123, 215),
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
EH.ehStroke(Main, Color3.fromRGB(180, 115, 116), 0.08, 1.65)
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
    create("UIStroke", {Color = Color3.fromRGB(110, 72, 91),
        Thickness = 1, Transparency = 0.63}, inset)
end
create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(23, 16, 25)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(9, 8, 13)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(27, 18, 30))
    }),
    Rotation = 25
}, Main)

-- v7.9.62: new user-provided large black-hole image; preserved background layer logic.
-- The NEW user-selected image is cropped and packed as PNG, not JPEG.
-- It fills Main and is inserted BEFORE foreground panels. Only panel surfaces
-- become partly translucent; the 3D ViewportFrame stays fully opaque.
 -- The image is visual only: never handles input, never changes existing actions.
do
    local bgWriter = writefile
    local bgGetter = getcustomasset or getsynasset
    if type(bgWriter) == "function" and type(bgGetter) == "function" then
        local imageOk, imageUri = pcall(function()
            local imagePath = "AvatarInspector_Photon_Horizon_BG_v7962.png"
            bgWriter(imagePath, EH_decodePNG64([=[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]=]))
            return bgGetter(imagePath)
        end)
        if imageOk and type(imageUri) == "string" and imageUri ~= "" then
            local wallpaper = create("ImageLabel", {
                Name = "EH_PhotonHorizon_Background",
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
            print("[Avatar Inspector] Photon Horizon PNG asset registered (v7.9.62).")
            -- Decode and filesystem failures cannot prevent the GUI from starting.
            pcall(function()
                wallpaper:GetPropertyChangedSignal("IsLoaded"):Connect(function()
                    if wallpaper.IsLoaded then
                        print("[Avatar Inspector] Photon Horizon image displayed.")
                    end
                end)
            end)
        else
            warn("[Avatar Inspector] Photon Horizon background not registered: " .. tostring(imageUri))
        end
    else
        warn("[Avatar Inspector] Photon Horizon needs writefile + getcustomasset/getsynasset; original theme preserved.")
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

create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(36, 25, 34)),
        ColorSequenceKeypoint.new(0.58, Color3.fromRGB(22, 17, 26)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 26, 38))
    }),
    Rotation = 0
}, Header)
addStroke(Header)
-- Connected rounded header contour; no floating segmented fragments.
EH.ehStroke(Header, Color3.fromRGB(172, 111, 117), 0.11, 1.35)
local HeaderContour = Header:FindFirstChildOfClass("UIStroke")
if HeaderContour then
    create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 67, 104)),
            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(229, 168, 134)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(189, 103, 122)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(118, 67, 104))
        })
    }, HeaderContour)
    local glint = HeaderContour:FindFirstChildOfClass("UIGradient")
    if glint then
        TweenService:Create(glint,
            TweenInfo.new(12, Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut, -1, true),
            {Offset = Vector2.new(0.38, 0)}):Play()
    end
end

local HeaderTitle = makeLabel(
    Header, "AVATAR INSPECTOR v7.9.62",
    UDim2.new(1, -182, 1, 0),
    UDim2.fromOffset(16, 0), 15
)

HeaderTitle.Font = Enum.Font.GothamBlack
HeaderTitle.TextColor3 = Color3.fromRGB(255, 248, 242)
HeaderTitle.TextSize = 17
HeaderTitle.Size = UDim2.new(1, -182, 0, 27)
HeaderTitle.Position = UDim2.fromOffset(18, 3)

do
    local subtitle = makeLabel(Header, "EVENT HORIZON / 053",
        UDim2.fromOffset(260, 14), UDim2.fromOffset(17, 29), 9)
    subtitle.Font = Enum.Font.GothamBold
    subtitle.TextColor3 = Color3.fromRGB(244, 184, 136)
    subtitle.TextSize = 9
    subtitle.Position = UDim2.fromOffset(24, 29)
    local marker = create("Frame", {
        Size = UDim2.fromOffset(6, 6),
        Position = UDim2.fromOffset(15, 33),
        Rotation = 45,
        BackgroundColor3 = Color3.fromRGB(238, 174, 129),
        BorderSizePixel = 0,
        Active = false
    }, Header)

    local orbit = create("Frame", {
        Name = "EventHorizonOrbit",
        Position = UDim2.new(1, -164, 0, 8),
        Size = UDim2.fromOffset(32, 32),
        BackgroundColor3 = Color3.fromRGB(44, 31, 40),
        BorderSizePixel = 0,
        Active = false
    }, Header)
    round(orbit, 10)
    local ring = create("Frame", {
        Position = UDim2.fromOffset(8, 8),
        Size = UDim2.fromOffset(16, 16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = false
    }, orbit)
    round(ring, 10)
    create("UIStroke", {
        Color = Color3.fromRGB(238, 169, 120), Thickness = 2
    }, ring)
    local core = create("Frame", {
        Position = UDim2.fromOffset(14, 14),
        Size = UDim2.fromOffset(4, 4),
        BackgroundColor3 = Color3.fromRGB(255, 214, 164),
        BorderSizePixel = 0,
        Active = false
    }, orbit)
    round(core, 4)
    local orbitSatellite = create("Frame", {
        Name = "OrbitSatellite",
        Size = UDim2.fromOffset(5, 5),
        Position = UDim2.fromOffset(23, 5),
        BackgroundColor3 = Color3.fromRGB(255, 205, 154),
        BorderSizePixel = 0
    }, orbit)
    round(orbitSatellite, 5)
    create("UIStroke", {Color = Color3.fromRGB(190, 116, 112),
        Thickness = 1, Transparency = 0.2}, orbit)
end

local LangButton = makeButton(
    Header, currentLanguage:upper(),
    UDim2.fromOffset(64, 32),
    UDim2.new(1, -112, 0, 8),
    Color3.fromRGB(43, 31, 43)
)
EH.styleIconAction(LangButton)
LangButton.Name = "LanguageButton"
LangButton.TextSize = 11

local Close = makeButton(
    Header, "×",
    UDim2.fromOffset(34, 32),
    UDim2.new(1, -44, 0, 8),
    Color3.fromRGB(44, 28, 42)
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
Search.PlaceholderColor3 = Color3.fromRGB(188, 170, 181)
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

local ModeButton = makeButton(
    Main, "📁 OUTFITS",
    UDim2.fromOffset(100, 36),
    UDim2.new(1, -112, 0, 58),
    Color3.fromRGB(43, 31, 43)
)
EH.styleIconAction(ModeButton)
ModeButton.TextXAlignment = Enum.TextXAlignment.Right
create("UIPadding", {PaddingRight = UDim.new(0, 14)}, ModeButton)

local PlayerList = create("ScrollingFrame", {
    Position = UDim2.fromOffset(12, 104),
    Size = UDim2.fromOffset(190, 310),
    BackgroundColor3 = PANEL,
    BackgroundTransparency = 0.42,
    BorderSizePixel = 0,
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(180, 112, 125),
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
EH.ehStroke(Viewport, Color3.fromRGB(171, 130, 190), 0.19, 1.45)
-- Compact viewer header; the avatar owns the center of the viewport.
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
        BackgroundColor3 = Color3.fromRGB(27, 20, 30),
        BorderSizePixel = 0,
        Active = false,
        ZIndex = 9
    }, EH.emptyPreview)
    round(halo, 40)
    create("UIStroke", {Color = Color3.fromRGB(178, 118, 115),
        Thickness = 1.4, Transparency = 0.24}, halo)
    create("UIGradient", {Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(39, 27, 42)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 11, 19))
    }), Rotation = 60}, halo)
    EH.safeIcon(halo, "placeholder", UDim2.fromOffset(16, 16), 48)
    local caption = makeLabel(EH.emptyPreview, "Select a player",
        UDim2.new(1, 0, 0, 20), UDim2.fromOffset(0, 97), 11)
    caption.TextXAlignment = Enum.TextXAlignment.Center
    caption.TextColor3 = Color3.fromRGB(213, 167, 145)
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
            or Color3.fromRGB(189, 143, 139)
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
    Color3.fromRGB(43, 31, 43)
)
EH.styleIconAction(FreeViewButton)
FreeViewButton.TextSize = 9
FreeViewButton.ZIndex = 21

do
    EH.statusChip(Viewport, "EHModelReadyPill",
        UDim2.new(0, 12, 1, -31), UDim2.fromOffset(132, 24),
        Color3.fromRGB(189, 143, 139))
    local viewerState = makeLabel(Viewport, "SELECT PLAYER",
        UDim2.fromOffset(107, 22), UDim2.new(0, 35, 1, -30), 9)
    viewerState.Name = "EHModelStateLabel"
    viewerState.ZIndex = Viewport.ZIndex + 3
    viewerState.TextColor3 = Color3.fromRGB(249, 193, 150)
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
    Color3.fromRGB(43, 31, 43)
)
EH.styleIconAction(ZoomOutButton)
ZoomOutButton.TextSize = 18
ZoomOutButton.ZIndex = 21

local ZoomInButton = makeButton(
    ZoomBar, "+",
    UDim2.fromOffset(34, 26),
    UDim2.fromOffset(42, 2),
    Color3.fromRGB(43, 31, 43)
)
EH.styleIconAction(ZoomInButton)
ZoomInButton.TextSize = 18
ZoomInButton.ZIndex = 21

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
EH.ehStroke(PoseBar, Color3.fromRGB(143, 94, 103), 0.33, 1.1)

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
    BackgroundTransparency = 0.42,
    BorderSizePixel = 0,
    Active = true
}, Main)

round(ItemsPanel, 12)
addStroke(ItemsPanel)
EH.ehPanel(ItemsPanel, "viewer")
EH.listNeon(ItemsPanel)

-- Reuse the existing worn-items chip as one combined title/count block.
-- No additional frames: icon, title and count all belong to this chip.
EH.wornHeader = EH.statusChip(ItemsPanel, "EHWornCountPill",
    UDim2.fromOffset(13, 5), UDim2.new(1, -26, 0, 50),
    Color3.fromRGB(142, 222, 175))
EH.wornHeader.EHStatusDot.Position = UDim2.fromOffset(9, 35)
local ItemsTitle = makeLabel(
    EH.wornHeader, "ITEMS",
    UDim2.new(1, -48, 0, 21), UDim2.fromOffset(36, 7), 12
)
EH.ehSectionLabel(ItemsTitle)
ItemsTitle.Font = Enum.Font.GothamBold
ItemsTitle.ZIndex = EH.wornHeader.ZIndex + 2

local WornCountLabel = makeLabel(
    EH.wornHeader, "WORN ITEMS: —",
    UDim2.new(1, -29, 0, 22),
    UDim2.fromOffset(21, 29), 11
)
WornCountLabel.Name = "WornItemsCounter"
WornCountLabel.ZIndex = EH.wornHeader.ZIndex + 2
WornCountLabel.TextColor3 = ID_GREEN
WornCountLabel.Font = Enum.Font.GothamBold
WornCountLabel.TextXAlignment = Enum.TextXAlignment.Left

do
    local rule = create("Frame", {
        Name = "EHItemsSectionDivider",
        Position = UDim2.fromOffset(12, 59),
        Size = UDim2.new(1, -24, 0, 1),
        BackgroundColor3 = Color3.fromRGB(128, 87, 98),
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
ItemsStatusChip.TextColor3 = Color3.fromRGB(233, 188, 160)
ItemsStatusChip.Font = Enum.Font.GothamBold

local ItemList = create("ScrollingFrame", {
    Position = UDim2.fromOffset(6, 63),
    Size = UDim2.new(1, -12, 1, -97),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(180, 112, 125),
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
    Position = UDim2.fromOffset(18, 461),
    Size = UDim2.new(1, -36, 0, 4),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Active = false
}, Main)
do
    local bridgeLine = create("Frame", {
        Name = "EHContinuousBridge",
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, 3),
        BackgroundColor3 = Color3.fromRGB(188, 126, 118),
        BorderSizePixel = 0,
        Active = false
    }, EHBridge)
    round(bridgeLine, 2)
    create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 62, 93)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(236, 178, 139)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 62, 93))
        })
    }, bridgeLine)
end

local StatusConsole = create("Frame", {
    Name = "EHSystemStatus",
    Position = UDim2.new(0, 13, 1, -51),
    Size = UDim2.new(1, -26, 0, 41),
    BackgroundColor3 = Color3.fromRGB(31, 23, 31),
    BackgroundTransparency = 0.20,
    BorderSizePixel = 0,
    Active = false
}, Main)
round(StatusConsole, 11)
create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(53, 34, 47)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(29, 22, 31)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(47, 32, 44))
    })
}, StatusConsole)
create("UIStroke", {
    Color = Color3.fromRGB(157, 100, 111),
    Thickness = 1.25,
    Transparency = 0.14
}, StatusConsole)
local BrandPill = create("Frame", {
    Name = "EHStatusIdentity",
    Position = UDim2.fromOffset(10, 7),
    Size = UDim2.fromOffset(122, 27),
    BackgroundColor3 = Color3.fromRGB(58, 39, 51),
    BorderSizePixel = 0,
    Active = false
}, StatusConsole)
round(BrandPill, 8)
local StatusIcon = makeLabel(
    BrandPill, "",
    UDim2.fromOffset(16, 16), UDim2.fromOffset(8, 5), 12
)
StatusIcon.TextColor3 = Color3.fromRGB(243, 184, 141)
StatusIcon.Font = Enum.Font.GothamBold

local BrandLabel = makeLabel(
    BrandPill, "SYSTEM STATUS",
    UDim2.new(1, -28, 1, 0), UDim2.fromOffset(25, 0), 10
)
BrandLabel.TextColor3 = Color3.fromRGB(249, 196, 153)
BrandLabel.Font = Enum.Font.GothamBold

local StatusActive = makeLabel(
    StatusConsole, "ACTIVE",
    UDim2.fromOffset(64, 20), UDim2.new(1, -84, 0, 10), 10
)
StatusActive.TextColor3 = Color3.fromRGB(249, 196, 153)
StatusActive.TextXAlignment = Enum.TextXAlignment.Right
StatusActive.Font = Enum.Font.GothamBold
StatusActive.Visible = false

-- The right-hand indicator reflects that the GUI is alive, not whether scanning is active.
do
    local signal = create("Frame", {
        Name = "EHSystemIndicator",
        Position = UDim2.new(1, -23, 0, 16),
        Size = UDim2.fromOffset(8, 8),
        BackgroundColor3 = Color3.fromRGB(235, 180, 131),
        BorderSizePixel = 0,
        Active = false
    }, StatusConsole)
    round(signal, 8)
    create("UIStroke", {Color = Color3.fromRGB(254, 210, 155),
        Transparency = 0.35, Thickness = 2}, signal)
end

EH.statusChip(StatusConsole, "EHMessagePill",
    UDim2.new(0, 136, 0, 7), UDim2.new(1, -181, 0, 27),
    Color3.fromRGB(231, 172, 128))
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
create("UIGradient", {Color = ColorSequence.new(Color3.fromRGB(25, 30, 40), Color3.fromRGB(29, 25, 37)), Rotation = 25}, ModalPanel)

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
create("UIGradient", {Color = ColorSequence.new(Color3.fromRGB(25, 30, 40), Color3.fromRGB(29, 25, 37)), Rotation = 25}, LangPanel)

local LangTitle = makeLabel(LangPanel, "Choose language", UDim2.new(1, -60, 0, 30), UDim2.fromOffset(12, 10), 14)
LangTitle.Font = Enum.Font.GothamBold
LangTitle.ZIndex = 82

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

--==================================================
-- RESPONSIVE LAYOUT
--==================================================

local function updateLayout()
    local camera = workspace.CurrentCamera
    if not camera then return end

    local screen = camera.ViewportSize
    local mobile = screen.X < 650

    local width = mobile and 360 or 800
    local height = mobile and 620 or 520

    Main.Size = UDim2.fromOffset(width, height)

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
        Search.Position = UDim2.fromOffset(12, 58)
        Search.Size = UDim2.new(1, -132, 0, 34)

        ModeButton.Position = UDim2.new(1, -112, 0, 58)
        ModeButton.Size = UDim2.fromOffset(100, 34)

        PlayerList.Position = UDim2.fromOffset(12, 100)
        PlayerList.Size = UDim2.new(1, -24, 0, 90)

        Viewport.Position = UDim2.fromOffset(12, 198)
        Viewport.Size = UDim2.new(1, -24, 0, 150)

        PoseBar.Position = UDim2.fromOffset(12, 352)
        PoseBar.Size = UDim2.new(1, -24, 0, 32)

        ItemsPanel.Position = UDim2.fromOffset(12, 388)
        ItemsPanel.Size = UDim2.new(1, -24, 0, 150)
        ItemList.Position = UDim2.fromOffset(6, 60)
        ItemList.Size = UDim2.new(1, -12, 1, -65)

        Status.Position = UDim2.new(0, 181, 1, -45)
        Status.Size = UDim2.new(1, -240, 0, 30)
    else
        Search.Position = UDim2.fromOffset(12, 58)
        Search.Size = UDim2.new(1, -132, 0, 36)

        ModeButton.Position = UDim2.new(1, -112, 0, 58)
        ModeButton.Size = UDim2.fromOffset(100, 36)

        PlayerList.Position = UDim2.fromOffset(12, 104)
        PlayerList.Size = UDim2.fromOffset(190, 310)

        Viewport.Position = UDim2.fromOffset(214, 104)
        Viewport.Size = UDim2.fromOffset(300, 310)

        PoseBar.Position = UDim2.fromOffset(214, 420)
        PoseBar.Size = UDim2.fromOffset(300, 32)

        ItemsPanel.Position = UDim2.fromOffset(526, 104)
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

-- Prefer the avatar description attached to the Roblox account rather than a
-- game-specific morph applied to Player.Character. Fall back to the live
-- HumanoidDescription only when the account lookup is unavailable.
local function getOriginalAvatarDescription(player, humanoid)
    if player and player.UserId then
        local ok, description = pcall(function()
            if Players.GetHumanoidDescriptionFromUserIdAsync then
                return Players:GetHumanoidDescriptionFromUserIdAsync(player.UserId)
            end
            return Players:GetHumanoidDescriptionFromUserId(player.UserId)
        end)
        if ok and description then
            return description, "account"
        end
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

    local character = player.Character
    if not character then return nil end

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        return cloneCharacter(character)
    end

    local description, descriptionSource = getOriginalAvatarDescription(player, humanoid)

    if description then
        local rigType = humanoid.RigType
        local success, cleanModel = pcall(function()
            return Players:CreateHumanoidModelFromDescription(description, rigType)
        end)
        pcall(function() description:Destroy() end)

        if success and cleanModel then
            removeExtraObjects(cleanModel)

            local originalParts = countParts(character)
            local generatedParts = countParts(cleanModel)

            if generatedParts >= math.max(6, originalParts * 0.55) then
                return cleanModel
            end

            cleanModel:Destroy()
        end
    end

    local fallback = cloneCharacter(character)

    if fallback and countParts(fallback) >= 6 then
        removeExtraObjects(fallback)
        return fallback
    end

    if fallback then
        fallback:Destroy()
    end

    return nil
end

--==================================================
-- CAMERA AND MODEL CENTERING
--==================================================

local function clearViewport()
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
    local color = selected and Color3.fromRGB(83, 54, 68)
        or Color3.fromRGB(43, 31, 43)
    TweenService:Create(button, TweenInfo.new(0.18, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        BackgroundColor3 = color,
        TextColor3 = WHITE
    }):Play()
    local stroke = button:FindFirstChildOfClass("UIStroke")
    if stroke then
        TweenService:Create(stroke, TweenInfo.new(0.18), {
            Color = selected and Color3.fromRGB(255, 206, 161) or OUTLINE,
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
local function showPlayerModel(player)
    clearViewport()

    local clone = makeStaticAvatar(player)

    if not clone then
        task.wait(0.5)
        clone = makeStaticAvatar(player)
    end

    if not clone then
        Status.Text = "Could not load avatar"
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
    Status.Text = "Avatar loaded"

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

local function addItem(name, assetId, category)
    assetId = tonumber(assetId)

    if not assetId or assetId <= 0 then
        return
    end

    category = category or "Items"

    table.insert(currentItems, {
        name = tostring(name),
        id = assetId,
        category = category
    })

    local card = create("Frame", {
        Size = UDim2.new(1, -4, 0, 76),
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
        UDim2.fromOffset(32, 28),
        UDim2.new(1, -42, 0, 37),
        Color3.fromRGB(39, 29, 42)
    )

    copyButton.Name = "CopyAssetIdButton"
    copyButton.TextSize = 17
    EH.styleIconAction(copyButton)
    EH.safeIcon(copyButton, "copy", UDim2.fromOffset(6, 4), 20)
    copyButton.Activated:Connect(function()
        copyID(assetId)
    end)
end

local function displaySavedItems(items)
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

        addItem(item.name, item.id, category)
    end
end

--==================================================
-- PLAYER SCANNING
--==================================================

local function scanPlayer(player)
    if not player then return end

    selectedPlayer = player
    selectedFavorite = nil

    clearItems()
    WornCountLabel.Text = "WORN ITEMS: —"
    Status.Text = "Loading player..."

    showPlayerModel(player)

    local character = player.Character

    if not character then
        Status.Text = "Character not loaded"
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        Status.Text = "No Humanoid found"
        return
    end

    local description, descriptionSource = getOriginalAvatarDescription(player, humanoid)

    if not description then
        Status.Text = "Could not read avatar details"
        return
    end

    local identifiers = {}
    local seen = {}

    local function add(name, id, category)
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
                    category = category
                })
            end
        end
    end

    -- AVATAR ITEMS

    add("Shirt", description.Shirt, "Items")
    add("Pants", description.Pants, "Items")
    add("T-Shirt", description.GraphicTShirt, "Items")
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

    -- Count all currently worn appearance items:
    -- classic accessories + layered accessories/clothing from GetAccessories(true),
    -- classic clothing slots, and the equipped face asset.
    -- Body-part meshes (Head/Torso/arms/legs), body colors and animations
    -- are intentionally excluded from this counter.
    local wornItemCount = 0

    if accessorySuccess and accessories then
        wornItemCount = #accessories
        for _, accessory in ipairs(accessories) do
            add(
                (accessory.AccessoryType and accessory.AccessoryType.Name) or "Accessory",
                accessory.AssetId,
                "Items"
            )
        end
    end

    local classicWearableProperties = {
        "Shirt",
        "Pants",
        "GraphicTShirt",
        "Face"
    }

    for _, propertyName in ipairs(classicWearableProperties) do
        local assetId = tonumber(description[propertyName])
        if assetId and assetId > 0 then
            wornItemCount += 1
        end
    end

    -- ANIMATIONS

    add("Idle Animation", description.IdleAnimation, "Animations")
    add("Walk Animation", description.WalkAnimation, "Animations")
    add("Run Animation", description.RunAnimation, "Animations")
    add("Jump Animation", description.JumpAnimation, "Animations")
    add("Fall Animation", description.FallAnimation, "Animations")
    add("Climb Animation", description.ClimbAnimation, "Animations")
    add("Swim Animation", description.SwimAnimation, "Animations")
    add("Mood Animation", description.MoodAnimation, "Animations")

    WornCountLabel.Text = string.format("WORN ITEMS: %d", wornItemCount)
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
        descriptionSource == "account" and " | Original account avatar" or " | Live fallback"
    )
    pcall(function() description:Destroy() end)
end

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
    clearGuiList(PlayerList)

    local serverPlayerList = Players:GetPlayers()
    local serverPlayers = #serverPlayerList

    local countHeader = create("Frame", {
        Name = "ServerPlayerCount",
        Size = UDim2.new(1, -32, 0, 64),
        BackgroundColor3 = Color3.fromRGB(45, 35, 49),
        BorderSizePixel = 0,
        LayoutOrder = 0
    }, PlayerList)
    EH.ehCard(countHeader)
    -- Match the existing items status chip instead of the darker card gradient.
    local headerGradient = countHeader:FindFirstChildOfClass("UIGradient")
    if headerGradient then headerGradient:Destroy() end
    local headerEdge = countHeader:FindFirstChildOfClass("UIStroke")
    if headerEdge then
        headerEdge.Color = Color3.fromRGB(177, 119, 119)
        headerEdge.Transparency = 0.35
        headerEdge.Thickness = 1
    end

    local listIcon = makeLabel(countHeader, "",
        UDim2.fromOffset(18, 18), UDim2.fromOffset(10, 8), 12)
    listIcon.TextColor3 = Color3.fromRGB(234, 181, 137)
    listIcon.Font = Enum.Font.GothamBold
    EH.safeIcon(countHeader, "players", UDim2.fromOffset(8, 6), 23)

    local listTitle = makeLabel(countHeader, "PLAYERS",
        UDim2.new(1, -56, 0, 18), UDim2.fromOffset(35, 8), 12)
    listTitle.Font = Enum.Font.GothamBold
    listTitle.TextColor3 = WHITE

    -- Single existing player-count header: no nested status chip/frame.
    local onlineDot = create("Frame", {
        Name = "EHOnlineDot",
        Position = UDim2.fromOffset(7, 37),
        Size = UDim2.fromOffset(7, 7),
        BackgroundColor3 = Color3.fromRGB(142, 222, 175),
        BorderSizePixel = 0,
        Active = false,
        ZIndex = countHeader.ZIndex + 2
    }, countHeader)
    round(onlineDot, 7)
    local countText = makeLabel(countHeader,
        string.format("%02d ONLINE", serverPlayers),
        UDim2.new(1, -18, 0, 22), UDim2.fromOffset(17, 29), 11)
    countText.ZIndex = countHeader.ZIndex + 3
    countText.Font = Enum.Font.GothamBold
    countText.TextColor3 = Color3.fromRGB(249, 193, 150)

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

            selectButton.Activated:Connect(function()
                scanPlayer(player)
            end)

            -- Save this player's outfit directly from the player list.
            -- scanPlayer() fills currentItems synchronously before saveFavorite().
            local rowSaveButton = makeButton(
                row, "＋",
                UDim2.fromOffset(34, 30),
                UDim2.new(1, -39, 0, 9),
                Color3.fromRGB(39, 29, 42)
            )
            rowSaveButton.Name = "SavePlayerOutfitButton"
            rowSaveButton.Text = ""
            rowSaveButton.TextSize = 19
            EH.styleIconAction(rowSaveButton)
            rowSaveButton.ZIndex = 5
            EH.safeIcon(rowSaveButton, "save", UDim2.fromOffset(6, 3), 23)

            rowSaveButton.Activated:Connect(function()
                if not player or player.Parent ~= Players then
                    Status.Text = "This player is no longer available"
                    return
                end

                scanPlayer(player)
                saveFavorite()
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
                            category = item.category == "Animations" and "Animations" or "Items"
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

local function captureLiveClothingFallback(character, snapshot)
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
                if assetId and (tonumber(snapshot.properties[descriptionName]) or 0) == 0 then
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

local function captureAvatarAppearance(player)
    if not player then return nil, "player unavailable" end

    local character = player.Character
    if not character then return nil, "character unavailable" end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return nil, "Humanoid unavailable" end

    local description, descriptionSource = getOriginalAvatarDescription(player, humanoid)
    if not description then
        return nil, "could not read original HumanoidDescription"
    end

    local snapshot = {
        version = 4,
        rigType = humanoid.RigType.Name,
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

    if descriptionSource ~= "account" then
        captureLiveClothingFallback(character, snapshot)
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

saveFavorite = function()
    if not selectedPlayer then
        Status.Text = "Select a player first"
        return
    end

    if #currentItems == 0 then
        Status.Text = "Scan the player before saving"
        return
    end

    -- Save a data-only snapshot. Every save creates a separate outfit,
    -- including when the same player has already been saved before.
    local savedItems = {}

    for _, item in ipairs(currentItems) do
        local itemId = tonumber(item.id)
        if itemId and itemId > 0 then
            table.insert(savedItems, {
                name = tostring(item.name or "Item"),
                id = itemId,
                category = item.category == "Animations" and "Animations" or "Items"
            })
        end
    end

    if #savedItems == 0 then
        Status.Text = "No valid outfit IDs to save"
        return
    end

    local appearance, appearanceError = captureAvatarAppearance(selectedPlayer)
    if not appearance then
        Status.Text = "3D appearance was not saved: " .. tostring(appearanceError)
        return
    end

    local newFavorite = {
        name = selectedPlayer.DisplayName,
        username = selectedPlayer.Name,
        userId = selectedPlayer.UserId,
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
        Status.Text = "Outfit saved permanently"
        showSuccessToast("Avatar saved successfully")
    else
        Status.Text = "Session only: " .. tostring(storageError)
    end

    if currentMode == "Favorites" then
        refreshFavoritesList()
    end
end

showFavorite = function(favorite)
    if not favorite then return end

    selectedPlayer = nil
    selectedFavorite = favorite

    -- Restore the saved appearance snapshot from JSON into the 3D viewport.
    local appearanceLoaded = showSavedAvatarAppearance(favorite)

    -- Keep the saved asset and animation ID list visible alongside the model.
    displaySavedItems(favorite.items)
    if appearanceLoaded then
        local accessoryCount = tonumber(favorite.appearance.accessoryCount)
            or #(favorite.appearance.accessories or {})
        Status.Text = "Saved avatar loaded: @" .. favorite.username
            .. " | accessories: " .. tostring(accessoryCount)
    elseif type(favorite.appearance) == "table" then
        Status.Text = "Saved avatar could not be fully restored: @" .. favorite.username
    else
        Status.Text = "Legacy outfit (IDs only): @" .. favorite.username
    end
end

refreshFavoritesList = function()
    clearGuiList(PlayerList)

    if #favorites == 0 then
        local empty = makeLabel(
            PlayerList,
            "No saved outfits yet",
            UDim2.new(1, -12, 0, 35),
            UDim2.fromOffset(6, 6), 11
        )

        empty.TextColor3 = MUTED
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
            Color3.fromRGB(39, 29, 42)
        )
        renameButton.Name = "RenameOutfitButton"
        renameButton.Text = ""
        renameButton.TextSize = 18
        renameButton.Font = Enum.Font.GothamBold
        renameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        renameButton.ZIndex = 10
        EH.styleIconAction(renameButton)
        EH.safeIcon(renameButton, "edit", UDim2.fromOffset(5, 5), 20)
        renameButton.Activated:Connect(function()
            openRenameDialog(favorite)
        end)

        local removeButton = makeButton(
            row, "×",
            UDim2.fromOffset(30, 30),
            UDim2.new(1, -38, 0, 10),
            Color3.fromRGB(39, 29, 42)
        )
        removeButton.Name = "DeleteOutfitButton"
        removeButton.Text = ""
        removeButton.ZIndex = 10
        EH.styleIconAction(removeButton)
        EH.safeIcon(removeButton, "delete", UDim2.fromOffset(5, 5), 20)

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
    if selectedPlayer == player then
        selectedPlayer = nil
        clearViewport()
        clearItems()
        WornCountLabel.Text = "WORN ITEMS: —"
        Status.Text = "Player left"
    end

    if currentMode == "Players" then
        refreshPlayerList()
    end
end))

--==================================================
-- MAIN BUTTONS
--==================================================

EH.mainOpenAction = function()
    setMainWindowVisible(not Main.Visible)
end

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
    EH.safeIcon(Search, "search", UDim2.fromOffset(8, 6), 23)
    EH.safeIcon(Viewport, "viewer", UDim2.fromOffset(12, 9), 21)
    EH.safeIcon(EH.wornHeader, "items", UDim2.fromOffset(9, 7), 21)
    EH.safeIcon(BrandPill, "status", UDim2.fromOffset(5, 5), 18)
    EH.safeIcon(ModeButton, "outfits", UDim2.fromOffset(8, 5), 26)
    if EH.safeIcon(Close, "close", UDim2.fromOffset(8, 7), 18) then
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