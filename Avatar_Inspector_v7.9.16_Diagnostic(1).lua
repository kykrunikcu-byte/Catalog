--[[
    AVATAR INSPECTOR v7.9.61

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
        stroke.Transparency = 0.10
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local gradient = stroke:FindFirstChild("EHListNeonGradient")
        if not gradient then
            gradient = create("UIGradient", {
                Name = "EHListNeonGradient",
                Rotation = 15,
                Offset = Vector2.new(-0.55, 0),
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(144, 91, 120)),
                    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(251, 183, 147)),
                    ColorSequenceKeypoint.new(0.57, Color3.fromRGB(255, 218, 162)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(186, 108, 128))
                })
            }, stroke)
        end

        -- One slow sweep and one soft breathing effect per large list border.
        TweenService:Create(gradient,
            TweenInfo.new(5.6, Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut, -1, true),
            {Offset = Vector2.new(0.55, 0)}):Play()
        TweenService:Create(stroke,
            TweenInfo.new(2.8, Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut, -1, true),
            {Transparency = 0.23}):Play()
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
    viewer = [=[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]=],
    players = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAABkKUlEQVR42u39aZBd6XkeCD7P+5275I5MILFWoVB7EUkWF5RILZaFmpZMiZblrRMRbU90jGYiyIgZW4wZWS1RGse9d8ayzJFoBS1HRxS7e+SwRx0dmZYlUhIptiUXZC3cqopronYAVdiRCeS+3HvP9z7z45x782YigSoWq6hC4TxBEMisvCfP+c73vfv7vECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAgUKFChQoECBAn/tYLEE338IIHTj6hNQsToFCrwDD7wKYVugsADujDWVhHq9znodwPQEMT6zuc6zp4SZo0K9vlXb1+vExCkCkwCmgcmjQh3Ifo4gC+ugQIECBQoUFsDbyLyv1QwTmZZ/+oVLXH7ogE6ehDcaDb/5Z2Q4+JkAPI2nAQDHcOyjH01JakeLYmrKMD7DkwCOH4cDdd3kZwsUKATA20k4PH3wYNhdvhiOvAd29hzKfUPliq57f+grJ2g2IU8ko5dCqd2sNDcWW8nGIw/c28TETAo2VAQGCxQC4O10qAUCNeIkDLMT4okT8cafEa+erA/YYv9wLGl3aGm3JepXZMVNZROqDiUGAAoueSpD6uYbQVwKtDmI82ZaHlnbWOWJRmv79TE9nVkFJ4HjgPMWFkeBAoUAeCuFwpO15NzscCmOW6W0sDKUmI0aMSrHOI0HEXWXGYclVAQFUiUYCZEQXfA2BKehSWER4EXKLitpzynlgrvm+5J0cegaVnAWreKwFygEwPdb69drxMQEMTnpvf737O9/cigEvw+we2KqA7K426VRgsOUxsxs1KXdJPoBliEZmKUFmV0bNKRyOMgWoXUK8wLnAV1zYgXQCsSrJjzHSnh+90+tXyS3CgHVajY9cYqT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]=],
    items = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAA7RUlEQVR4nO29aZBdR3bn9/+fvO/VAhT2hQBJEFwAkig02U32IrfGEuiY8FgdWqxxFD55CX3p/uBQjByKGWnGE/FeOcKyx5LskccfTH1RxMw4wlFlT2sLtTS2TPRMq1vdDXZzK7AJsLkDIFnYa3/v5vn7w7331XuFwsoiUUv+EKiqd9/Ne/PezDyZefLkOUAikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQi8SnBe52BtY4EAkKz2ey8y+bSk5oAxk8RGOk6OH5nNxo5osWkpzr3usOrfCqM3PqUO7zSePG8zcVvmgCazaY6VZYoXnwikUgk7o40ArhDJBDNBtEEmk1gdHTU73WeNgoCiEbx7nuGWc1RkWk0kEgkEndEGgHcBgIICWg2yWV6/LGxsbB7YoLHhk9pHMBIOZedwEQY7t+fXbVLfSEO1Bdq8zUutKmMHlmPim0x1MiF1nXloL66uNAiQ5vegi8ArcHNyDPvD/PR65bLPKMrr2vzp/8Kbk7W4myo9TxD9Uzqq6v781IU62IonnMu1DgQa4rMY6uv1e67htae3cjPzF3SS9Mf5sePj8cb5IBqNIrrN5simUYDt0kSALdJpewDCQJSo2F4dn//R7owxFjbHDFfr+eRyIJgge12pFktC0H9srAZ8s2SD1AwCTkztEA6JKPregFgFPNosOL86JqxYAsG1AUNEhYEj/LMSb+35WgwkL0CoHwmWdEYl3tGAJAoUoTBXDCJssBWdM3VyOlgbC0gxtDKFgZq+bV2rT13eW6bH9zdihPnZheOHh9tSSKaTY6fOsWRsXFP04HbJwmAmyCBzWaDS+f5L/3L39x0YPC+XQrx/qj4gAXucWkbyT6D6CIhibRM8D6RAwAGJPUZSEBRQE6Dy2G2zL0dgEl0wgBEgnOi2gbLJO8naIJcTnG5C3yGiDCoty5VWfIln5fi5XfFc5ISYKY2HAsg54Kx7ZQr1wKBiw7MmjGP1FQ92E/z1qU3d/+nvzvVkx8VwqaUSUkY3ITsXmdgVdNsEIBJ6gwrr/zl7++Ynp95KI+tx4PZEyYcduEAgL0QhmAkScghQVZWQxNgRlACQYigVAwolq2hBOClgCYpSSLoAijSgLKbC6uhhhNc0pWo803v5+tTlt9JBAspIlGABCFGF8woEbmES4LmBeV0fZS7/w19a+3yNxunt7WHp3j8uAPQ+PhxGxk5Iglamq9EL+n1LE+nXla8/UKjvz45sKd/0I/k7XjUaIcAOwj4QRD399frmwb7a7CyO3Y5CMIlSOr8ri5/2xVTRW6MLCQHimt1Z/ResyICqPsi5fMCRLDiXUV3zMy1kccIQZAwCegHhP7GYe8E90si399Z//Cn/Nq/WOi5dCF0k93AMqQRwPUUXXOTxtFiBHv+r35zUzZVf9D6/emY4+fNwlF37CbVB2ArwAF3YX6hjaplq6uRFn8KXe3/thpuby/KLqm0/urxkvaP6nmLd1UIPgEIoZhEtfK4Q47PCdwBYj6SlwB+9+z8jj8HcLpz3UajnH2Mrr+XtgKshg5k1XLy+edrD9x3YYflul9mw0Z9GcLPIvBhOPoFtAAFgHUAIHvaeIdiBnHd0dvMRdHsu+RJz+hhNdTqlalEve+mel4WaoGO/Z8g6+gbhTakKLIG98ugfU/Bv8mF2vfkm87vGfmvZ0l6cSoWUyU6pBEAymU+oBgrlnP918Ya9W21qb0knwR5VPCnBD5O8AE5Npsxk3sfSBEwFXVW1ZC9p5aVauneKn7rZrM4f+4dMqy2GrwS+bnu3XS3VgHlGgIJFhoUAjQGQHABbhwk/AkDv6Z6vlOY/duz3/zfTgO4CABoNDg2fIojI+MikYy3StIIAJ3eoVOPT558vvbQpSu7seCHPcYvQfwCiScF7jVhC8ggeJ3s6N+Xtu/Ep4CqeRUpSIWytRgfLACaEyEjrjpwSm5/nZHfqzN7c+j80FV+4xvte5v71ck9XkC6t1Q9f7MyIkHR8z95ZXpPnM+fpPSUwR4neIDgXhLbRAwIqpM0LnZUqfF/yqgQskLVe7NaICFB1EgOEthKcS+FJ43+HxD62YXYPjq798ruamkQAKSGaWwk3JsnWV1s6Iq7tOdXo5G9M7xp16Z6PAzqGULDkh4BsJ+0PQI2E6jfwyxvWIrplVSsfhZLq4tfgUKx5iqgJWAWwAeEXof7D4DsZL9npzbHhy7y+PFYJBKJZDG4sQVAo2FNFBt61Ghk009t3jGbtQ7B+bQZvgDgcbkegGErwc0CMt5k1CSVHdVSU9TlJggdJVeXAOr6ycL6eO2Uz1L95nWfO2q9XgXIjZ7w+mWBxesWw//KykcsRgIggFiskUZQVyGeFfw1M/2Yqr0cEN68cmn6/MO/NjoPlCsETYDcuBu61k4FW0Gu6/nHxsIUzuzwLDwcMz0Vpc9DGAbwEKndAPoA1j6NvNxO/V8P3M36x93cQ6gEMeZouCrXBzK9GcTX2q5X+xFe3dZ+9P3OSEANSwJgg6GxkYDj414JgQ/+ze/s7Dc8BvFJp44COAroEMjdBDYBsEWF05JrFT9ELvZC1ZLfrYx9WCTqXImoPgvuvQY/a5GqwyZZGDKV79Cljm3EzWBl7YjFNMuVQfcti3uSgkcDFyRcFnWewpkITRjwkmhveH/t/L6/9w9nylwQahAc1UYzFtqQy4DjAI6XBX36L369r7bgD7p4VMAwoEMUHwSxk8AgCXPvWohaQtXWgaJyLtbrW1Xunh/L0LUW3jmyzDVWAbdqMcvaQOg20t3m9ZckEQlQDAL6jRxyFCuF5fQtGFXDzLzUaLzN0VEnoLHxUzaywRo/sHrq0KdO18aeQpsM4MK/amxRX9inWvZ5EV8S9DkCB4Nxl4QhCZkZ6N5Zmu7SJBfXMCtqd9kz5ZAiij0uLtIBLe54QbGzp5AncBA5xby4IiEqEmijsCsYAFDvNgO6zt5+lVRXghRVycJCE0KRghX6EC5ImgcUQWYU6iIyCiYuKuPUJWQJuDpKOgUCmcQaiMBKE1COmtBdLpVOAJXiEC0QbRIz7piE9LqAk0b8cCCrvb5pcuYKf210vjIXXhxDbAxhsKFGAM1m8Z8sev72tfqBUA9Haf45Ax7zqEdgvJ9mfXAZIC9sg24sKAmUw1NfMPKqiCmIM4IWALQpCiy2E4GgA6AoADmAeUoLIAWCBi5E+TyBjOA2QUPF8ILlPvjeUcjq0WIrsNp2Uzacov0joNjlMyXgCqS2kX2ANkPoB5AV7b8rDTvPmAOIKOTuIIUtALZDHBLVB8mWm2JVQroj5YkAoW5mg6APgpwneBHgVDsXzg9lb0ljH5DHowCi2SSaG6PxAxtEABRrwARQuI7S88/XLsbJXajpkEOfl/QkgIdI7DSzgUAiL436gOvMegsVNEkzINDgecwJXHHhXTO+Q+BsdF0GOCPCTeXOQJEwipCiK5rQAtkqDFtId7URbEHyAGjIpU1W2MHHIh+9AkBaHRWVUChHQqjsbq3Y4xvKwf6sgCkztgHWQR80WN3dM7NFszwjILkVl2BOsyipBnGPyw/A8AiEBwHsyUIIZkCMN9eVCGIwYxaM7r5ZwB7IHyFDjPKsv472lRNnr0q6Wpodb5hRMbABBIAkNptNNptF2WpsJEwOTe5iKzzOTEcBHRF4CMBOEpugYudZuQZ3oyW/Tr/V9hhpuORu7wp6JbpesgynkNlZKbs2uECfBrA5a3F2YYHqq2ugv67p6WkM1IZceUtTEIYgXM0XNET4tVo/M58P1t5sAwCmMf3ZvbC7YDM2A4NdB6YBDAIz84UXoEH2Rbd2VHtBU21Y6IdZG3ZdOgCz7cwAwBdmXHVqK0LfdNseouKTJC9DaAEIefTdGS0re/qys8eSERII0WhCdAeLfdXbBDwseZ8b6o5szq8sXD3zr5suYarwNahyByHX/Q7CdS/tupxDFPPMv/iDLRfbU0dA+zLErwoaFnQ/wQEUAtG86uRvcEUj6aBD3oZ4jcT7UXpDwosmnKwPtl7d9p+MXvrMHnKdc/ov/mDLtnzqMRO/4LBnCH1OwAECOwX1AQxWOCW5rrUu+gSgJCfJlqQ5gpdFvEPox6S+G2Uv71lYeI/HR1tFOm0IAbBuTYFVaJB6LHUn//ifDU3PtQ4AHBb0tKDHJd0PcSuA/mLOCrNlGn9phy6QhbGJNCvgI4d+CnCC4ESQ3myhdX5rH659ho+67jn8tX9wrZXbuzWECYP/SMQP4HpZ0NsQr0BqL+4e7J0aVSuzkrPw1cI+gFtI7Kb0IIEnKDyVWX74Qn1wV6Px88WouCvOA9ZxR7luH2ypE4izf9oYZD7wUF/QUUlfgekLcjwJcqeRdS/N+JYOIxevJ4UQSAJ5HgXwAqh3ALwuYMKgNzz3d7Qw9+EHUxcvTR3ep2On9/PM/LwdunRJ2L9feLa82IvVr+KPZw/v04unz/PZw/s6FffF0+f5bCfBGqXM/osvAs8ePnfHzzax/RyHd8NxrBkxPl6bxendc3V7IBoO03GUxNOgHpfjPpL91XqAezlF60KAVxuIWLhjagO8DOgcoVOkvRidJxHjmd072pN8brRcnbmb1ci1w7rTAXSs/JoNYuQUMT4eT//BH/Rl+bV9pD8VhWcIPQ7HXhGbjaibER5VLAEt6fuLFa3SHKUwYokAZwRdMOe7bv6TSLzaJzuTDwx9/GGM81/8xh+2C0cU5/DS8LC/9J3vYAQQvl5e9M+KX89iX/HHufLvc4v3Lb7rOrAWKZ/32T/DXT3b8NfLlZvnCAItnXz+4/aF6TnMzklmmyDtBbEH4CZJDjKTq1ZM94SqMMsPHf1kscinjMSAwO0A78+leQHIguofT+I1ofExNCqMjxgmxsXR9SkA1t0IYKmZL1BY+mXU50n+R4SeAXg/iW0AdpEYICiXWGn4l1wPgaWNORkJXINwTtTr5njJxVdawOlavnBu7/HRjrauvNS6rDSfMdTYiGGk8PbbaDTsHz2F/VNZ/clAf1qyz0F8DND9EHaA2BzMWIwEOrsriv0BxSK/AbTC9wPmAZsGNOnQBYLvGPDjQP93s+d3/+T+b3xj9p4++WfAutIBCCDGxkxqdJ7rvbH/ZsCZ7w+BhwAcAXEI0AMCtgGsFRP7oqL0GPpUFmWlbzoCOeBXHXpH0ItO/DVM/x8t/OjCdO3snpHmzGf8uBuHiSOdyD+jo6M+OLBj0nK95sb/N0J/TuAExNMgrhDIi23a7GwhLsvVAIayRFkaLNQhDQHaS+EgiMMOPe4Kjw7uubRHLzQ6I2Q1GrboXmz9sO5GAN3oTxuDH9f79vtC+wvG7Kt0+1lQjwLYWg4R7YZzfkBWuOEtjVQ0A+BdGX4I4TvR8P37dvb/lF/9zTlg42iN7yWVPUe3ld6Hf/LP92aYecrdniP1VUDDAndmwZi7e1m+N67nxbSvBakF40fuOk3gu3Xi+221JnZtxceVPqDRaNh6CwW3biRad68PFI1/ujbwMBf0TFDti3I8AWgXCvPawGLp6GYWfpIUCcwRmBFxxYl3Kfwgj/G7rtZbVePvygQ2miHJvea+X/mNj3LgFYT47wX9UOI7gK651CpGbVDlSWipJCA6ptx1EQNybQV0v5kdibBnXLXPXbnS/8Dpv/iDPqDcNi5xbB05E1k3AqAbPf987UKrfmC+7c8Q/CqAZyk8DGBzaUC/bIipjkFJ0ZMbChPcaUEXAJ4j+VPJJt7YHs/c/8ujsxJYCR6SYuEfMI0APiWKd1wYY3Yf3/vL/+3H7G+/DOKHgN4AeN7lUyicg6DLd0BP4fR+JkH0gdzl0iGnniH5pbZ0dHDh2p7uPHyaz/hZs+Z7q25lm8bGwtnsR9sGajv3eav9tAK+QuJpCY8A2gKyVi4F1VDo9pZWCIfALDNSQO5xDuAHED4G8b6oH/Qx+/Otv/RbZ4r7jQQ8st3w7PP5eqsYq5nOXPwYDMdGYyEURsLknz39NCN/GeTPeGHavQPQzswsSEBUsad4iaJXKKyEBLINKSd5FdDHAM8o6mUS3/NabWJydubS0W5DoRvEilxLrNkRwBIjH558/uu1c/3vbTcNPGJqfwlBP1M2/kdB7CE5RLJfQB8Kg5/ru2qpsh1ALEL7zAG8IPjbBE4x4u2Q1Rbtco+PO57dF1Pj/2zh6KhzdNTHJ091GfyMx1DXJOhnDHqd1HsgLlNcKNr2jS9XpCcJ1EEOCNomcT+Ewwh4yuBfMMUn9oTazrGxsVDe8NN+zM+ENSsAUDryLBVC2rd539Z6bD9UC7XDUToC4gkJj5hxZyDrZqQVnjyvK7nK14SRNCPdJblmIF0S9FGgvRWl10OOt+Z1dUZjI6HR0Qg3U+O/R4yMHBGaoBoNk0Sfr1/JjK9LeI3ge3RcBnRNwkypz+l0/h0Pw12QQGHqhTqILaDuh3DYaUchHfGaHfy5vjO7dPL5GgFVvb+KWGZrUiKsXUOgU6c6L/y97/7+AD9qPUTEz0H2uIiHAe4nsCsY+yUgd5dRNy4kFWsC0R0UZiWcB+xtut5izc5oTqe3Z4Pv4futaY6OC4BGgXXTE6xFFl15jQKjo5A0jW8137yaD2Rt9+0kN4mihD1y7KVhkOQNdw8WrgAECGbGPhXGQpI4B2E+0D04s8nJyTclfFgGgmFpNrwmO4I1V3u7DX3UaBi+unngqtr7YgvPKupZGA8JelDAgwR3BTNzyb2Y//WY+S8a/rAyHXUpzkl2CcBPIUxA/FG9P3uV8+23tuSPXSl9ya3ZAl+vqNGwqkf+8E/++73BcdTMPh+lz4N4Aq5HadyamVmUw72jPOox/64cu5oZIcGBFsFJSO8w4DVJP6bxpfkW3vzwwM5rX/xiEW+gy4Z0TdWLtTcF6JbeX3104OJc66E811MuHIXZIUmHJD4EYDtJK9q9DIVfv+us/NDxLCFIPifwIxJvg3jDoVeR2UsY2vTmX+U/rhr/YtLEqqFbGbd34dCFWs1+1JK+49RLgt4neYHwmejeGQDcYBrQ7XEYRtQJ7EXhIfopwI66OBwMjz1w5cKOaipIQI1Gg2vKkzPWoACoFG4nT369dkkf73DyEXccBfm4oAMg94DYSrDmLsXSHnQ5gx8jGczIwuAnCpgTeIHkGwR/BAsvtwbiu//L3/no6vHj41GCrbUC3khIoMbGAo8fj9t+8R9fnt868IbcX5TwI1HvQpgtrYNhtLLsl5/DuUvFAAAIgZmAHRIPSDgM6YgJh23a9v/6V7BZlWJwDbImKvNSCzCpYefH6zv7Bv1Q9PAzlH8JsMch7QOwncY+gJWTzut2+EkSrej3rdg91pJ0TcSki69nGU7kMXz72rWZdw7955jeyG6j1xo9e0EEvv3Hja2DVh+m+MtG/F2XHqbYJ6ovhGJ5sBzqL1NPIDMwWIC7I7pmQbxP4E0ILzv0Y0P2Kuv95//FL1yabqKpjlchdRTUq5o1NwKQRJw4WI8Wtym3/XA+LPGghH0AhkBmLqga6C0n4SqLMJcUo3J3nwH4IYXXSZ1091cuLMy8dfi/GL1GjrpeaGSp518blBac1PPP10Do4V8dvVL31gSl70n8LmGnQF0gOOdRubv8Zq1UAtoxViPJOsBdkg4CeMyMBxXyPX1tDQyPn1qTm79WuwCo1mjLnl+GP2sOTMerW+uhvtvFBwgcBPggjTtEDgCl11j2XqNM33Hq4cWwYgbUBYDnAZwm9O8o/mUr52tHu3b24QQ8KfvXECTw9XMda8/tvzp6Ra7vy/z/AvXXAt8E9HHhHBTTEPLSwaq69QIdnwKl8ZAZM0hbAewn8Qilh+G6L2J26GfwQL3TSawhMbDaBUAHEiLpFzNkC/PzOwQcBPCYoAcJbTOijtuY0gQjQ6n1kzQv4SNSrzt1EuDf7v6V337pgb//Ty5K4MmTz9cEVNZea6hYNzYERI66AOr5ogz3/Gf/9PzHj7S+R+JvSLxK8l0RF1mYC2eZ0WxZP8M9iERGckjAPhAHPOrB+YjdW7O+wRPNn19zuoBVLQAqYdxtZBEGtpna2mvyp4sAnnhQ4MBSA4/rl3bKZQASXszo2yBnSH5g0Pfh8dtBC29Uow0Smpo6lxr9OqDSCRw9OtrKjW/S8GOX/4TARUCeZYYss3KjMP0m3pZFALUQMiN3uvhIMHs8GB5p2eCuY88e6wSOXQvzf2CVC4CKqgBfG2vU29Ot3RHxMRLDBB8DsaOI3nPj910N5QSoHV0q/PldJPEBwDdc/NGedv7K9l8dvVJs8Cl2ez333GieNvesXQgI586VMQBBCdaanb8C+Os0Tgg4C+BKHuNCO48qdwddNwqoVgq88AilUonUL2kfwMcdOEKGAxcc2zQ2EnoCvq5y3dGaEABAofzbVsv2KuZPZ7DPC3gI1OZgVn3f01CrD0bCCidQENSWNCXDRwDOGPkiyBcz2E9ZzfnHxwwv/l2r1neLiqOu/7fYX/5Jn3OZ/esq7NOWMze90XEsk8dbfb6rNF35LfKinjxxSd5v9731nHu7z9d9r7LBF4K/0bAX//D5DCcaNr95x0yf8126vQHHGyJ+AuAthy66e9sAC0Ugw+tuWO1CdC8ubOSQoIcD/UiEHs+sdt+H8wf6e/PdWNUCYFWaAvcs5ZR8fKK5qZ7VDzLyCzAcAbBNgqJXrt6qEHTd9aasABLclQO4BuCSXB+Iet2dPzTDKzmvXKwS8fjxKMlHv7g4FfgsV0uXG3HcZBRyE9vm6z1k3+LzXaXpzhs7P3q+vxt67nOD578ubz336nwYraxGwW+MOoBcY43LPjD47oL7dgJwYE5RjwF8CNI2AJl0/bJgtY8kupdOYi3ziF2gHjHY+zn0gfXvPQeg4x1qfPxUEgB3TKfplh/Hfn/g44WF+xjjAYH3C9wFYROKXX2V9rbHpoOlf2iXBKgNohj2O885/W0Tz7jCW+1a/OiNk4NzjUbDms0ictDNlnMkEM0GiwASK0NVScrNLcWx4VMcwQgwMiE0gSaK/9fdt9n1e3y4eAFlGgyf4omJIzw2fEqYOKLx4VPcPXGEx4aHhZEJlTe66zTjGMfIxJHFd9VsqmMl3etW+/r8LvMORkbKazWXnFd9XnrfTl7LvDW7XkeZl85wvIgJCQDg8dHW1X/zO5ci7F0SNRoDgJqIAQAGaRNBK/YCXD8UKMzKi81jMAy4Yy+BAyAfCJlvP/n81y9+8Rt/2AaAie73swpZldJpacx2/dXv7rkwnx816pko/7KAYcoO0jgQSOYxlr31om13FYq6DKs1RemSA+9n4DsCz0TxJ0E8hf65szt/oTlV3IldVv5Ly618VWXjX2nJPoIianGnEXRX9pHFStR936XHRzCCnjRV4waAkQl1n7P08/VpxoGRI8L4KeJWaSqaXQ/U/XcXt/Peqmt2C8bl89qbt2Xv26x2axaxnCo7gQ//7e8Ntqam9w5Y/UEGe9yEJ516UtABAnsADgro4zLTZJXxXeu1YACQ53FKwssgTkj8f+ayq68+9Iv/4+WeNEWMyVUnDNaEALjy541H5tv1n8mop518UtIhkg9lFgYA4EYCwCWH1AZxEdJZAG8YeIbOM7LaW/VW/a2hiUsX17pTh8RtoDJsMSq7EvGjseam+Szbu5m1xwQddvoTBA8BegzgbhGDtxAABIB2O84SPCXie4R/O0Z/eU/++Ps8frzVSbNKBcDqnAJ091wAcoS+WghD0X0rqAGKGbS8ArOatxUjfzgIBxkpLJCYlmOmCMhpbG2e67v4FWzWS/8yXj092XclzPVtrsP6M/g1MR90y9WeVwhD2aX2fK1/ga6dD07/7//xT+dGPwXzYAk8caIRThyDd1//5PNfr/Vv38fJ3fBjpQccoHBS+Uv79wcA+OI3il1pFWNjY+H44ual6z43Gg0bbTaFrunObaUZbZZ6toIXXnghm5ycFAB8afdE7WBrc0B9V3zx9PfiW9sv++7dRzh0+jxfBLB9+2U/fnx8WXdsXXBsbMwmJiZUOeB8odHInms2483y2mg0rPlL+zvr8O9MnQsH398cMJTVpvqstvAnl2oXw/9MxbrO/9+/m/fbP2/NziIjAr3GXIizEK8BmIahXUaW6fUz2VE0d7QDPeZm5YhhewB3Xh386SUAHQGAZoOVPmI1sTpHAOWGjurze9/87z7XZ7Vj8vgFC3bQXA868GAWQh/QOwLouY4UAeQgpkh+COldCGdBfkyzi6JfVPT5QsGPOmF1woNRkllbQg7lIkPmbhkIR+As3efh8Lu1+ogx7/kczBQBZAaLsCDChZgHwj2GzOW1EAIgKcBjnruADDAYrRiGmqvtISwAgDH2taIyC1rwNnOzWHOEet3UbuVs1QLMXf0wE8V5mEne7o9gMGnBxdzqrHmuupnanrPFzINF9kEm1jgPuQyqO2s1lM9DxsyJzMCYR8VAOGiM7gSAQLjB4tLn77wDd4JGWrBiK07uIWRwMIh0hxZChFumestZs4wtb6ldPY8bzBg8ujMLHujInF5jyIK3YwYLAKSaWzs3tRGdkTZo5nsA7DXnfpIPinoIwi4Q/d157BIAAoF6Vrz7VoxTBCbgfCWYvxIdp/q56dTQr/zGR520XduVVxOrcgRwYvdET0Ouow7SC1vNWM7OqzNuLsIMZI3AFgF9FHaBfKLwEOOzJswJjMUaFQOhAMJUWJQ7AAdNAlg5E5HLAUUacLelSfSKjuo6OURDcWvKJEo00ZwmOQxUDoChiLotAwpHN4AbHKWJkwOWGQnRmUlEoAHmgkImd4kIMCACZAQiGGCZQIEeICHKMiNVpimyrSKNGAHABZPatuicjTSQDoeREhf3YQOAKDmLmy/Fi+eCqGKoTgcZVMZWJ+gywZFRLlhmoKIrZHCXGwJpoqiYZxDlCiIywKjohQpARdjnSDilCAMDlQnYTHBI1FaSgwQHHKpft8642MFoiZ66eB10L+K4O2dDq/frJoDR26kdny2rUgBch8WyZ6DoyEG2AcRlCqE3WREIjkbUaVZnwBBQLONEdzngBLyz6ixQRUSJcjdXGRRMVOU2EqCxE1zibp/n+kPl7csFEKvWNHvO7/2uONS19tWpnsXsp9hCaezaFVm8xWK4qnLpdGmaMrqBin8q98dX53SlKc5B1y46qdSwgYUBRvU8nQyXFlk3sT4pA3oAXc8pQkVBLt63J29mkEMqnP3E0qLPAJVGInSiFOilNgClWC9zk2VmVqsFEEAeHXn0jiXqzSinmpHFcL8FBb/7ruGzZ3UKgBO9H9t5ZF8ATMhFzIOal9D2wtNHufy/jOEGCosQgYAvLuxmZsiCEcUyYuhRzSyZ3qn6qeo7Vm7D71qjcyPJoaXncPHW3WujXDy/a4l80XZFHV1X13VVvafOOUs/96ZRVzZumqZ7uVzFfbqF1zLcTHIufQeLk+7r87o0b5KCpI7TTnben6wUTr15WLJsXMR+rEKK3bh0ixEJ5CpcTVGaFzEr2RxMbbppsL/ee4HmTR76HrIqBcCx4eGel9cfMe+B1yCfonEHwVi+/55CXA6hXLctzLdiedC6E5ZlX9WJZUu+Y9LJxSaZWG2wW9B1hunqCKWbsChHUbqOv50RXjF2JAxAEBQZMZXRrsT5udatEq8GVqUAwMRETwubnolXB2p97xHYDmmXzCKkCCh3ISu1wzccWLJSW6sz+ex0pWUn0akgqsatSy7Q1cmtSsXp6uGTjI1W4O5d+z46oppdA7sbUE6RVDmfuQWC4I6OiXMmogb3vJaFj+Zb2dmpen0W6FL+ja6+FQBgtQqAZlMYXdSYhE1brrbaC+/W69xiwH5K80bmAmQgo/yWI4FSoi970nUHb3apWwxvE8BqeD/EbfT63ecXZ99Wx1+eGwxg25Wb2RUofkzDWTOd+/f/5w8uHh/vXe7kKh023vuSuglV1J/Kcsum88cs+N9x6OcMfAbg/TAOyOVm1TCeUBnY95bXX1Io7P3zZvaAiVXIjcrqVi3vtuqKJEFOmJsxGGGxsAk+b+QPFf3feg3fDdZ+a9fXRq91pVvVnoJW927A0p6cpPb9vX84k9dqZ2Pub0B6XcB7IK9IiiSMYACKnXu3q6FnMW7o/EfvYL/oEW58Tvq/yv7fqKyWHl/mvFtSKAVoALJgtDy6y/08gBddOGG5f3vP7OFXd31t9FqjDFRSplu1jR9Y/QKgWzWD8+eHrmas/YQIPwDwI0JvA5qtZQH1WuiM3wpP4IXQvolzh0TihqijP4YLxdLipv46t2zqZy0LIDgJ4m/h/ifK+cKO6fjTbuO1tcJtSb97TbU3f3R01BuNhv2jL27Z14qtL+fEMch/DsChYLYp727uxnKpeG08Y2L1UZpGAGAkkfX31RCjo53nFwH+bXT9WautP38QL3/I4+NRYyMBI2O+2nv9blanEnAZhoeLnWGjo6PelD5sf/N3X2EWLbpkZlPuOgRiRxZYB4DS9gulfydnx47lxlCLBaebhRFLbAQss8AsGKJ71o4x5tEvxRjPSXgFtG/L8LcHjv/22SrBBI6E4fHjwA3Cz69G1mwlP/0Xv943uLBnTw08EsyeceErgD9OcreAOsGagFqlAipCxCUSt4aUBBgEAwET5xz4iMbXQf+ht/ndq7l+fO3yrivdm7BKq5Q1Vc3WlAAQQIyNGY8fdwBSo2EfPVPfnQUe9FxPkXgC0kGQ90m4D+RuI4b66zWEYOgyWgfRsSgrP7NzHOi1GuucVNnkrYYiXqG5zUo8y22ZzNwGnzgv7Pl1+/foqg8kEWPEfCtHO8arJD4SdJawN3P4K3Xai5y3UzuO//ZVABgbGwkjOBIw0sxJrh0b4JI1JQBKFlsiCkOLc8+iv4+17Yq1fcb8kSg9KeCIwQ6LepDkzr5aDZkVj9sx5e0WAJXpaHn168xGq5tWFib3mjLPn5Sbh8W4zayshKZFywndO87JosX0jeV3T/mxS2pIgtHQynPMt/JrpCYkvsSgV2O0M8jwli5d+Gjff/n7M92XXu1LfTdjLQqAYiQwMmI4ckTdWyzVkM1+4X+6bwatx1x8wshDIh8gtINkP8RasUemsvdjZflVGHOWrbvUBSwpUEepViDQOftesyKDgJXIhD5hXvgJBgBV2+5sI7zJMwmyXo+fZbCYaocQaXC0UfT8Ey68Egbwk2vXwvlHy14fAPRCo9CfPTca19qwv5s1KQCAG8+3pIZd/BY2h3a2M8/DriyEzZ6xzy3W6KzBVWwjCBYRAbiTmVFyBSjm0WKwzBG7tnMGExDBnCHWWCML5Wm8l6qegGU21d45K/EMYYXCYdxtXkIo0oZgUUIupyMDEH2xDGUCnXRlDBaoaBIFKMqQyzOPAII7QXhGTru3JxfmBidnttemDn/tHyx037MwOtOqX+e/FWtmFWAp1WCv0WiwOXyKmDjC8eFTIkcjCu+/19RovIvCU6SAccPERMB7l4j3Fxxf31dWt1PEiSPE5Cnx1t5qoLGRgN2DNeAgMHfpnhb+mRW4xqEVaLwrkQ/gE+Rl4Boxt0UY2BH53Oj13ka6kEYCvnVfhunMMHNJOPhOzue+fdM0RToR4+OF3czISLnUt2b7z/VDOY6nSluBROLTohMjYh21/HXzICXFAk6z2XHbXXiTLf9Gt4fZRcYBVB5nT0xMEMeAY5OLW5IrD0XFsdJb7ipgJTwTj6zQs3zSvKxEPnq8Ht/4rJ7yu2WakQk1m0DlMv6T5nG1sd4EQDFUazbZROUbHmg2m2wumhXfmC7BcZOTqh3nq2Q9MNGj9b9RPAJ0vi8NQ7rK75YxDJrFjvF1KAASicQGZt2NAJahy763OnKTk2+xpLOsw5DE6uB2DIE6P26ZJpVyIpFIJBKJRCKRWG+sex2ABDabDTYBVEE9l1/0WbowuPR497GV4FbLVbdipfLzSfOxWvjk76MTnLWJTqTj9a75X9cCoFDYCUCTGB/miYkJHjt2r3OVWNVUth4TR4RmU5WTqXudrcRtIondPtkSiU+KhHVl/dfNunqootE3iROlr8NjcH4KUXwTG4exsZEAACNrzNXX7bKuBMByNBoN+/qz6I/z6O8b3FQPC5611O7ZdtLf+VEyD8xX35XH5+exovT33/qcm7FS+fmk+Vg5+rHQztlXy7T49m+fpe+jv1677cY6BwDzc+gbqMXcmfd5a+HKFcw//GujK1zqq491IwCWC788NjYWjoXTe1iLD0D1/ebYHYkhKB8wM7hEY+E81Lv2iFuxL7wyGS2OS3JfmcGEmX1ybx4rlB8LYVXUAS+CeRGk7G5srEtvItU7ke6gtw7BAReFBQu8QsdHMH0wTTv70C/+48udWzQatt6Ug6ui8FcKScS3/tf65em5fvRj64L7vkA9ZKZH3e0hc+5zagugQXQ9exF0tifmrqqmZUVIWnhxZKUKndV175aVyo/RVkcdICgVMTrvxuWSa9EvTPnz9q/BTtTgOcIuO/B+AN6KAW+GXO/tbIWzGPmta9UUoJPPdcDqKPwVQAIv/us/GMr7pw+yzw6Z/FGKB514ANA+ANspDoGoQ6qVe3mqoLDsjiMlqCPhC8/ihaPIlWv+i9e960usUH60Yh79Phndmbibx6oiuS+ae9/+CECQjIA7chBzEC+AmDTwXB79dAj23YWolx/4+//kYk+6NewKrGLNOgTpfvkCePFbjaG8b+4h0p6h68sAnxL0EMEdAAdBIJTxw6q2V1X9pU2gWxh0xRBeUXH5yZvdyuRnVbR+AN3N/o6C+nWl6v51ZykLJ2HBAAHbI7TLiEfkmDHjoy6v1zPEa3/6exN/Of/9y8crxzHFLsIkAD5rJHG88M5SFMTJ5zOdm9ofagufc+PnBRyFdMjM9vTXs8LTqzugItTLJ3c+mVh57p0o6vYIXdaVOs3qMcbNMaIGISfJ2dZC/Zlw5OVGo3FhtNsX5RoeCaxJAQAAu0snHQBw7ty5WmgPPGgBRyk8QXKvgH6XNN/KIS2GeFnZfjyxzlDpVFh00Yuo05sJDMOhUOPVQa+fPXasdWl0FL40ivVaZM0KgKHT5zsNue6DwTJtbwsPBGAfoG0E+spJoYMAvHDgKN3lCDOxvunqv0V1AkORrAPcAeIBd90H46b7798RAORrtdfvZs0KgOsIEeainHUI/SRqBtBdxgIAKxfEIrHO6HEUToEiQCcAMzJ3r4GsGZT1X8jXjf/JNfsgL3b9vcu2RShcpXgJwDwJI2EoIru60qQ/cUdQAhyC+6JNeSAUKK3ZNrMca/RhiO3bLy9awcxvzxnieYJnBL0vadoFF8QqZngSAonbRwRUThXleYxtAtcgTUdpYf7KO4URxjrYb7JmpwATE0fKdXoRTeTzX/md8/2ulyOxB8BuQJuyLAyRxhgj3D1Hxz1YoQiQrtcGdBt49C4sA6XDsDVf6OsZEl0GATdW9ywxGkAZFQqV1UcIZhCyPKot4CMD3qD8DJFfODT9H+bAv+hKuHZZkwKgaKSjxYsfHzeOHo8vNBqXjz2969QkZ7bQsE3yze3oT/TVLAPoAiK6h2+srIAW60hxXfVIgG5FT7ncs6zgSKwatGhJXJRlpfcpNfzX+QUsyr3o7sli55+7KEEELgJ4lcTfOPnyfVvxIZ87Xiw/j4+XK4drVxm4JgXAcjw3OpoDuHj5m//DRDvXFgRtE7jVpX21zLIarK+WLe4BUmVIVzb5nujA5Y+idKsDRb1KdgSrl8qgZ+k2i+XKqwoQu2g/xI6waOcR8602IL9A8BSI78Dsu7X5hbf4XNcGoZGRNV8R1r4AmJjoKYRtD+44e/XsxR9G16ZIborRP5+731+v1/qyLMBQCH9XEQtSnT6fsCWVx8hO1OCq8Uf3QngIaUVhtVB27QRBY1lu5VfqGhB00YkGXTZ9Wjk4dGG+1YZLHxN8ycXviPq25Xx1xwhmymsaSS/Njde0EFj7AmC0mApobCw0JybEL36jrT9qfHBlG046+jJ3/5DEwVarvXeh3d5OIQOtCCQLBQpWRYkQC81vx45ccFKxjBxLCRnIjEIARdzJjrPEp4ehCN5cbOuIgCIALwW3YXG/lyqrvSIsNCMMDpes3BbqzpzEJIC3Bb5M8EetK/jJA//Vb02Vd2A59L+lC/m1wLrpw5aaY+qvfnfTh7P5buVxV1/ddkm+Jyd3Z/IBRwg0BgkDEPoBBRqjhHlC83A4THJinuAsqTbFmru2kNhOcJMAExTLrUTr5j2uKcqt3GakF/v5WhBmIM2QnAdkMvYRqLuLRvNifR8uxTaZzZFqR1esZZSgqFxzDlyMjkkLdqnuAxe2/epvXCWu0wWt+cYPrCMBUNFoNKxZ+HLrKSD98T8bumzaHjE3mLfrmfUpy5ANepsDDmWBisw4G/PWnDNEeBQtm0PIptt9eXvbQla71prf3p/Vd+bRt0SDGZDDXbBVsqV2o2EmuJMGg0xsawE1TaGlqYD6HB02V28NZLC+dozMDE46FeC54sIAts/WrdW6Zu2ovKXBiHzbIczy6Ghr6a0KXwDrLz7guqu4t5LOeqGRTUzCNu2Gbb46WKtlnrElU53ezi3ftXW2fWZuhw5NXxJGkHe7FNMLjeziHAbr+VB9OlvgphodUwCGPpNHS9wAZnVOTQH5VDseGNqxgBfPtTg6mgvgi88/nz17uB7en7zEOHNNBw8CmNshDFy6ZSjxbhqNhjVHR7Uehv0bAglUo2FSw1Q6Cb0bx46SWP3/NPKZ+HQoy/qmZaYqtHz3/7LOjI2NBG0A57Jr1BLw1jSbDWJ4mCdOwDA8fNdKG5KFu5B1MufbKJRlfdMyIyCSqsoYQBER+ARsZPcRYniYaDaZ7D4SicS6ZMNItkKKC81ms4gSVNG8wd/AYiz5zscmm80iuhBQRpFJ3HPGx0+xUxZNlIF9yrIrvPZcR885HTrGYKlcE4lEIpFIJBKJxHpkw+gAbgIXbcVvPfXr1iE0b3Je4rOjeZvHgO55f5rvAxtcAFSKwY6iqLmo4FvKyMgRYfwUT+w+wmPlsROfRSYTt+TYMsdO3OjcyWGNYxwjZfTf9RTlJ3F7UFi/0V4Td8WGrQ8b6qElEM0GTwB27BiKWPAjI+sy6mvi9ih39xlGJgSsP1v/W7GhBMCN6FSCRy4b3jp33TuZADD8yH698+q5sHn7YC3TbNDmAcUZ3lV0TtZn19d7vwhoaPATNRxOzRI77/y+2AnY9ABZmyOwDcAVXGoPaEt9sWyq963WoPJr5vftqucYuBRxrBk3uvBfXxXxJtxok9Dbf/RH/X2bzg2x1tqUBfSbQijODwIABpgYojwKMW6SbE8IYbPgkVmYQ+6C3ZlJdYxGuK+fd2+uEOwTNaQYnfA73FVpLriRmTLJagHO3ODm1jZTO/fCSwBlgZJZYB5dM4rtqx55bTAL185M7rz2xW98o11dUmNjAceP+0ZRDq6fSnibaGws4PD3+z/+YO+QR9/Zp7Cz7a1doLZYwKCcteLMKjx4se03SoJri1H7BW4DmRs5Q8EjFG5yy2UoQ2GvG7rCqd/9JXjnPpYKv0wka4LqIAxAlNAi0CIYAUBAJikEsC3iquSTRPYxrP0hVD/LqdnzO/uGZ3i89PW3gVhHlbAXLbr5W1zkO/l87dL7H9+nuj0B5+MQDkLcE+E7CPUTVgdUekmqKrRI0QVAVB+lLQL7QXhZyaQ79RVfuKpZT+9+pXrLO30npetfMxRCmGUUuEggisU0gIAVbrwQIcwJuBxokw5/H8x+Gt1Pi/lP77v//Q/4xT9sA+W0sPAbuK5HAuupEvawVAAUjX/qPtRaw+78OQBfAnUYjp2CBovYQYU/uZtft/IgmFhNLHHefkNcDojzJK4JOEfwnbZ0ivCTdctefHlo7txzz43mG0UArH2fgNez6Ku99NypRsNm3p3cFWs4CrcvU/q8oMOEHdg8WEcWDHLBcf3+6MXGzo5TUPfi8laFGr3jKqJ1VatWKtjinb6Vwp3nYlF3BgRcjPhbfVlFCSCF6Ohv57E/dx+QfJuBQ4RlLXp8opWFt/+ocZ7k/OJysdDtEmw9sR4FwPUcO1hvXzq7T46jBJ4SdIDkgLvHmbmFQNpt9uzq+ZWGAauE5Zrm0rLpLlx1YgMMANxTxhJpI3KWuc3V60NTAOYLT7Eimk1idF3J7A7rXgCMjY2Fqan3NjOEHfK4x0x7QO4gNBhoclfOYop/yxKu3H8W8SIAll6Bq8+JVURh49dTPhRVBIRS6SmYQUA/gSEBe4JxP6S9sqnNajQucXT0rpZ51xLrTgBUTnqraC+vvTYWZk7NDWV92aZgzABkkg/SbDAzYyvPy5EebrkGVakHlg55U7zx1U13+ag7YCQAL+PCEMwk9bPtm9QXBiYQMwCFc9DmqDB6DzL+GbBuXYJVDE/OmDL1y9VPqSYgEMxCsGr2rmoGmdgwyIvBfSQQUWj7DEBGY80j+vNHN9eqk9ezdeC6FwDAO/AcDnMX4YtbAdAJAabk1n/D0BnEqTPlMwgZBNKR09mGTPdv8aJt9NaNdVdR1t0U4DqG9se+q1emYp5fCZkuA7omcS66BjOjkaJET+HD1x9LA7uCVKnYMzOjGUMg0WrHuog2wEuiJjML1+b2ZLftMnwts+4EQFXoXe6c89aLzSv5jnBuAOE9EAcA3+9ifztqUxHzq5gFSp1BAbp6iMQaYZkV2a6PRVznYrGn0PlIslh8NQP4xwLfEbN3rg3OXnjpgx+1qisIHTPydVcl1p0AWEpZcLNn/4/f+8izhXcs4H4QD8G104EBAJaFIhx8d8Nfd2O9jQS7FH9dUqEK8goUgV5b7bwN8jLBN0D7sYOnoPzsoV8YnTq8juf93axjAcCeVjxzoTa17ZH4HvN8r2gPA9pRGuQO5LlvqfUFWmCPOpDLXAdAZxH5pvdelpWuU8tm7FNIc6fXvJ3rfhr5KK/cFdW5CvstFcs8NKKdRyzMt1sE3pFwSvQfCjw5n8fXLjy0+9J9ZeNf3EC2fruDdSwAeuChS5faVx/deyFvX3uTfdopoO3SAxC2k9w538q3oBgRZIJIFGvGy84FCslxw1pBLq9PuFmau+H6+xC3CmJxN2luja7TlN/6WZemWYl8lFciXIX5X1mGhU2AJNIsL/VA5yieotmPF+gvWaY3D/7yP51czP/GsO3YEA9Z8cILjewLM/1DccHvjxYPOO0Ayfso7ASw1cBtTt9MWBAQCcai1si73AYSgnXiyS+DvLQf6YQZLw1RbpLmbpD74j2K+91SwtxNmlviXrayxee95bMuTbMC+SjitVOA2hIWSC0IjIXuD5Argpwm9LHED5x4ZyDre7fNqQ93/kJzaqnScCP4CthQAqBCAi9+qzGkVtjXCmFPDRyC+yY6d4DaEiwLEYoEcpcEuausDOzEm79ZfVVVqXsEwJ1vd72dJ+ltzPBb9Vx3k+YWeCwi9fY87y2edWmaFcgHyaKbNy64a5aM82bWdo+G4ru2gVdCpsl83i68V3vv6rO/9Pxct+K4FEPrvuFXbEgBUKGxRv29wf5NfdHr7bxV61MYCH2hj14zGV2x5ciC5FFVvOi+PBIW2G7HG767Wq1wJoKs/J0X594szd1QqwV17lHe51b3uJs0d5yX27zm3aS5GfV6Ha1WC1mtL89prbrP576pHrnQJkKbPleLNWvPbWtjlseXCQFeCK51bfiTSCQSGxOhK2T4BlHyJJanCh+/GAZ8Y4+GE4nEBmTDSj2V605oNjk+fIojGCm+2D3ReScn7lHeEnfHMSyW2bHJ4WXm8ePAyBGVoYG10RR+iUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSicRnyv8PyP+AyQgb3JwAAAAASUVORK5CYII=]=],
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
    local usePNG = (kind == "viewer" or kind == "players" or kind == "items" or kind == "copy")
    if usePNG then
        local okPNG, resultPNG = pcall(EH_pngIcon, parent, kind, position, size)
        if okPNG and resultPNG then return resultPNG end
        -- Native fallback is created only if PNG registration failed; no duplicate icon.
    end
    local ok, result = pcall(EH.icon, parent, kind, position, size)
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

-- v7.9.61 Photon Horizon visibility fix.
-- The ORIGINAL user-selected image is packed as a compact PNG, not JPEG.
-- It fills Main and is inserted BEFORE foreground panels. Only panel surfaces
-- become partly translucent; the 3D ViewportFrame stays fully opaque.
 -- The image is visual only: never handles input, never changes existing actions.
do
    local bgWriter = writefile
    local bgGetter = getcustomasset or getsynasset
    if type(bgWriter) == "function" and type(bgGetter) == "function" then
        local imageOk, imageUri = pcall(function()
            local imagePath = "AvatarInspector_Photon_Horizon_BG_v7961.png"
            bgWriter(imagePath, EH_decodePNG64([=[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qEADAPGaJA0Ae6AHGgBQStIAgHa0cAAA0TkQKtAA0BkVaAAA6RkA9kAFGgAAANgDFWgAAACAAA0AAAAQoAEAAAACNAAAAECABgAAAAjQAAAAAAjQAAAAAAEaAAAAIEADAAAABGgAAADgLfFcz+MoAO2+ub3piazSjEMBAACoQAM73N9ccRAAAAABGtjPJIo5CAAAQEQcP+hxFAAAAICOqEADAAAABGgAAACAAA0AAAAQoAEAAAACNAAAAECABgAAAECABgAAAAjQAAAAAAEaAAAAIEADAAAABGgAAACAAA0AAACAAA0AAAAQoAEAAAACNAAAAECABgAAAAjQAAAAAAEaAAAAAAEaAAAAIEADAAAABGgAAACAAA0AAAAQoAEAAAACNAAAAAACNAAAAECABgAAAAjQAAAAAAEaAAAAIEADAAAABGgAAAAABGgAAACAAA0AAAAQoAEAAAACNAAAAECABgAAAAjQAAAAAAjQAAAAAAEaAAAAIEADAAAABGgAAACAAA0AAAAQoAEAAAAQoAEAAAACNAAAAECABgAAAAjQAAAAAAEaAAAAIEADAAAAIEADAAAABGgAAACAAA0AAAAQoAEAAAACNAAAAECABgAAAECABgAAAAjQAAAAAAEaAAAAIEADAAAABGgAAACAAA0AAACAAA0AAAAQoAEAAAACNAAAAECABgAAAAjQAAAAAAEaAAAAAAEaAAAAIEADAAAABGgAAACAAA0AAAAQoAEAAAACNAAAAAACNAAAAECABgAAAAjQAAAAAAEaAAAAIEADAAAABGgAAAAABGgAAACAAA0AAAAQoAEAAAACNAAAAECABgAAAAjQAAAAAP4fgjHKNiFWDD4AAAAASUVORK5CYII=]=]))
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
                ImageTransparency = 0.08,
                ScaleType = Enum.ScaleType.Crop,
                Active = false,
                Selectable = false,
                ZIndex = Main.ZIndex
            }, Main)
            print("[Avatar Inspector] Photon Horizon PNG asset registered (v7.9.61).")
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
    Header, "AVATAR INSPECTOR v7.9.61",
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
    Size = UDim2.new(1, -120, 0, 36),
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
    PaddingLeft = UDim.new(0, 30),
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
create("UIPadding", {PaddingRight = UDim.new(0, 7)}, ModeButton)

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

local ItemsTitle = makeLabel(
    ItemsPanel, "ITEMS",
    UDim2.new(1, -70, 0, 24), UDim2.fromOffset(41, 8), 12
)
EH.ehSectionLabel(ItemsTitle)
ItemsTitle.Font = Enum.Font.GothamBold

EH.statusChip(ItemsPanel, "EHWornCountPill",
    UDim2.fromOffset(13, 30), UDim2.new(1, -26, 0, 26),
    Color3.fromRGB(142, 222, 175))
local WornCountLabel = makeLabel(
    ItemsPanel, "WORN ITEMS: —",
    UDim2.new(1, -54, 0, 22),
    UDim2.fromOffset(34, 32), 11
)
WornCountLabel.Name = "WornItemsCounter"
WornCountLabel.ZIndex = ItemsPanel.ZIndex + 3
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
        Search.Size = UDim2.new(1, -120, 0, 34)

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

        Status.Position = UDim2.new(0, 145, 1, -45)
        Status.Size = UDim2.new(1, -204, 0, 30)
    else
        Search.Position = UDim2.fromOffset(12, 58)
        Search.Size = UDim2.new(1, -120, 0, 36)

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

        Status.Position = UDim2.new(0, 145, 1, -45)
        Status.Size = UDim2.new(1, -204, 0, 30)
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
            Color = selected and Color3.fromRGB(252, 197, 145) or OUTLINE,
            Thickness = selected and 1.8 or 1,
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
        Size = UDim2.new(1, -4, 0, 64),
        BackgroundColor3 = LIGHT,
        BorderSizePixel = 0,
        LayoutOrder = 0
    }, PlayerList)
    EH.ehCard(countHeader)

    local listIcon = makeLabel(countHeader, "",
        UDim2.fromOffset(18, 18), UDim2.fromOffset(10, 8), 12)
    listIcon.TextColor3 = Color3.fromRGB(234, 181, 137)
    listIcon.Font = Enum.Font.GothamBold
    EH.safeIcon(countHeader, "players", UDim2.fromOffset(8, 6), 23)

    local listTitle = makeLabel(countHeader, "PLAYERS",
        UDim2.new(1, -56, 0, 18), UDim2.fromOffset(35, 8), 10)
    listTitle.Font = Enum.Font.GothamBold
    listTitle.TextColor3 = WHITE

    EH.statusChip(countHeader, "EHOnlinePill",
        UDim2.fromOffset(9, 30), UDim2.fromOffset(115, 27),
        Color3.fromRGB(142, 222, 175))
    local countText = makeLabel(countHeader,
        string.format("%02d ONLINE", serverPlayers),
        UDim2.fromOffset(92, 22), UDim2.fromOffset(28, 32), 10)
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
    EH.safeIcon(Search, "search", UDim2.fromOffset(23, 9), 16)
    EH.safeIcon(Viewport, "viewer", UDim2.fromOffset(12, 9), 21)
    EH.safeIcon(ItemsPanel, "items", UDim2.fromOffset(12, 9), 21)
    EH.safeIcon(BrandPill, "status", UDim2.fromOffset(5, 5), 18)
    EH.safeIcon(ModeButton, "folder", UDim2.fromOffset(8, 9), 17)
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
    warn("[AI-DIAG] AVATAR INSPECTOR v7.9.61 STARTUP ERROR")
    warn("[AI-DIAG] LAST STAGE: " .. tostring(AI_DIAG_STAGE))
    warn("[AI-DIAG] ERROR: " .. tostring(result))
    warn("========================================")
else
    AIDiag("12 Protected startup completed successfully")
    print("AVATAR INSPECTOR v7.9.61 INITIALIZATION FINISHED")
end
