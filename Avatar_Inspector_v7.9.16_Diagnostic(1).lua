--[[
    AVATAR INSPECTOR v7.9.58

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
    save = [=[iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAA54UlEQVR42u29aZBcV3bn9/+f+zJrQRX2hQBJEFwAkig02U32IrfGEuiY8FgdWqxxFD55CX3p/uBQjByKGWnGE5FZjrDssSR72vIHQ18UMTOOcFTZam2hlsaWiZ5pdau7wW5uBTYBLuACgGQBBaD2ynz3/P3hvczKKhSqALBI1nJ/jCIqs/K9fHc799xzzz0HSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQ+IZiq4OMhgYBQr9fbdVlf+qE6gJFzBAY73hy5uy8aPK6FS8/xHu/yiTC45ncaKcpbX1yF9Xpd7S5LFBWfSCQSiaQBfHozfr1G1IF6HRgaGvJUK59S3QNEraj7RWpWfUhk0gYSiUQiaQCfyMwjAfU6ucyMPzw8HPaNjvLkwDmNABgs17KjGA0D3YeymzbeFWJPdb4yV+F8k8rokdWo2BRDhZxv3NIO6qqK8w0yNOkN+DzQ6O1Dnnl3mItetVzmGV15VX2fdQVlDc6EyqIytMqkrqo6X99SzlgVQ1HO2VBhT6woMo+NrkazawKN/fuQX5gd14tTH+SnTo3E2/Vj1WrF/et1kUzaQBIAn4DqDwEkCEi1muHZQ90f6mo/Y6UvYq5azSORBcECm81Is0oWgrploQ/yPsl7KJiEnBkaIB2S0XWrADCKeTRY8fnomrZg8wZUBfUSFgSP8sxJ/2zb0WAgFwuAskyyYjAuV8aiXilShMFcMImywEZ0zVbIqWBszCPG0Mjmeyr5RLPSnL0+u9OP7GvE0csz8ydODTUkEfU6R86d4+DwiKflQBIAazbo6/Ual67zX/xXv7ntcO99exXi/VHxAQvc79JOkl0G0UVCEmmZ4F0iewD0SOoykICigJwGl8Nsme92ACbRCQMQCc6Kahosk7yboAlyOUX7jOuJMGhxX7KOcnS+XracAIpykhJgpiYc8yBng7HplCvXPIFrDsyYMY/UZDXYm3lj/I19/+nvTi5ut0LYlDIpCYOVlLdUBStQr7EYh2qrlTf+6vd3T81NP5THxuPB7AkTjrlwGMABCP0wkiTkkCAru6EJMCMogSBEUCoUimV7KIvB0erIkiSCLoAiDSinubAeejhB3rJsWjTDaIUZSKUqABZSRKIACUKMLphRInIJ44LmBOV0fZi7/y19R+X6t2rndzYHJnnqlAPQyMgpGxw8LglimuKSBnCP9bKoz779fK27Otazv7vXj+fNeMJoRwE7AvgREPd3V6vbersrsHI6djkIwiVIav97uwGzkgECBIwsJAeKe62nBtRa36QsL0AEK+oqumN6tok8RgiChDFAPyT0tw67GNzHRb63p/rBm/zaH8zfsnxLfgNJA7jTwS8JqNM4VGiwV/76N7dlk9UHrdufjjl+3iyccMc+Ul0AdgDscRfm5ptojWx1DNLiV6Fj/N/RwF08i7JDKm2+fqxbZiWW6g/agk8AQigWUY087pbjcwJ3g5iL5DjA712a2/0XAM6371urlauPoTT4kwZwd5w9fbrywH1Xd1uu+2U2YNSXIfwsAh+Go1tAA1AAWC1U9UVjfNGalLzl3btSRjrkySLtQZumEy2um1Z5WZgF2v5/gqxtbxSakKLICtyvg/Z9Bf8W5yvfl2+7sn/wv54h6WU9LVyVSBrAktmHbV2xXOu/Olyr7qxMHiD5JMgTgj8l8HGCD8jRZ8ZM7l0gRcBU9Fm1VPZFvaw0Sy/u4rzjIaElKoPWX/2t8fBfKG+pPKHcQyDBwoJCgMYACC7Ajb2EP2Hg11TN9wgzf3fpW//beQDXAAC1GocHznFwcEQkkvNW0gAWC4DOMXv27OnKQ+M39mHej3mMX4L4BRJPCjxgwnaQQfAq2ba/K9Xlp9BOrXUVKUiFsbXQD+YBzYqQETcdOCe3v8nI71eZvdF/pf8mv/GNZqrBW7GtPvABoN5yIiln/idvTO2Pc/mTlJ4y2OMEDxM8QGKniB5BVZJGdh5NSXzCbaVSOfCOdVCx5UJUSPYS2EHxAIUnjf4fEPrZ+dg8MXPgxr7W1mAhSGqm4cGQanWLd9ylM79qteziwLa926rxGKhnCA1IegTAIdL2C+gjUE3d5jMSAJKK3c9ia7VT+xKKPVcBDQEzAN4n9BrcfwhkZ7s9O9cXH7rGU6diaWUgkTwGt7YAqNWsjuJAj2q1bOqpvt0zWeMonE+b4QsAHpfrARh2EOwTkHEFrUkqJ6qlrqjLLRC0yDzQ8Vap5Rbex9yQPUnLvW6b9RYbQHgHhgUuuW+h/rPDPFAqAkAs9kgjqJsQLwn+qpl+QlVeCghv3BifuvLwrw3NtdofdYDcuge6tqQAuGXmHx4Ok7iw27PwcMz0VJQ+D2EAwEOk9gHoAlj5NBtAm7ij6RP8DrUFMWZpuCnX+zK9EcRXm65XuhFe2dl89L22JqCaJQGw1QTA8GDAqRFvCYH3//h39nQbHoP4pFMnAJwAdBTkPgLbANiCwWmZgVrqk61ZqLXlt5qzD4uL2nciWq8F98UOPxtU0Jb1wcKRqaxDl9q+ESt3Tra1otY1WrlOyi1DUvBo4LyE66KuULgQoVEDXhTtde+uXDn4D/7xdNsWpBrBIW01Z6EtuQ04AuBU2dDn//LXuyrz/qCLJwQMADpK8UEQewj0kjD3jo2o5SRo6bOicurBHXXuRf9bdvh0KM3LzpxcRwN9ZUG3jA6gO7ju7jUGAoX7L8UgoNvIfkexU1gu34JRFUzPSbXa2xwacgIaHjlng1vQR2DLaAAdB3vU6lNX/3Vtu7rCQVWyz4v4kqDPETgSjHsl9EvIzED39tY0F6/3Cwd/tLwHgRxSRHHGxUU6oIUTLyhO9hTyBA4ip5i3mkJUJNBE4VfQA6Da6QZ0i7+91ksnIkW1ZGFhCaFIwQp7COclzQGKIDMKVREZBRMXjHHqELIEXG0jnQKBTGIFRGDLElBqTZ39uG0TaBsO0QDRJDHtjjFIrwk4a8SPerLKa9vGpm/w14bmWu7CCzrE1hAGW0oDqNeLH7KY+ZsT1cOhGk7Q/HMGPOZRj8B4P8264DJAXvgG3V5QEijVU5838qaISYjTguYBNCkKLI4TgaADoCgAOYA5SvMgBYIGzkf5HIGM4E5B/YV6wfIc/GItZP1YsRXYOnZTDpxi/COUp3wmBdyA1DSyC1AfhG4AWTH+O65hu4w5gFhUMXspbAewC2K/qC5IttwSqyWk21KeCBCqZtYLei/IOYLXAE42c+FKf/aWNPw+eSoKIOp1or51NIEtIQCKPWACKEJH6fTpyrU4thcVHXXo85KeLAx+2GNmPYFEXjr13aK8qjRBkzQDAg2ex5zADRfeMeNFApei6zrAaRFuKk8GioRRhBRd0YQGyEbh2EK6q4lg85IHQP0ubbPCDz62dIQlGsC66KiEQqkJoeV3a8UZ31Aq+zMCJs3YBFgFvddgVXfPzBbc8oyA5FZaRHKaRUkViPtdfhiGRyA8CGB/FkIwA2Jc2VYiiMGMWTC6e5+A/ZA/QoYY5Vl3Fc0bZy7dlHSzdDveUnaxbCsM/nq9znq9aFsND4ax/rG9bITHmekEoOMCjwLYQ2IbVJw8K/fgbrfl1563mh4jDePu9o6gl6PrRctwDpldkrKJ3nn6FIC+rMGZ+Xmqq6qe7qqmpqbQU+l35Q1NQuiHcDOfVz/hE5VuZj4XrNlnPQCmMLWu67gPfUBvxxtTAHqB6bkiClAvu6JbM6o5r8kmLHTDrAm75ToAM83MAMDnp11VagdC11TTHqLikySvQ2gACHn0fRktExbMCUvPWLGQmUYTojtYnKveKeBhybvcUHVks35j/uaFf1N3CZNFrEGVJwi56U8QcisIgGL9XK4z//Kb2681J4+D9mWIXxU0IOh+gj2lQDRvTfK3uaORdNAhb0KcIPFelF6X8IIJZ6u9jVd2/idD40isCef/8pvbd+aTj5n4BYc9Q+hzAg4T2COoC2CwIijJLaN1ISYAJTlJNiTNErwu4iKhn5D6XpS9tH9+/l2eGmq0+80WEAC2eQc+qCWeumN/8i/6p2YbhwEOCHpa0OOS7oe4A0B3sWaF2TKDv/RDF8jC2USaEfChQ28CHCU4GqQ3Gmhc2dGFiTRs145jX/tHE43c3qkgjBr8xyJ+CNdLgt6GeANSc+H04OKlUWtnVnIWsVrYBXA7iX2UHiTwBIWnMsuPXa327q3Vfj4rDUbcChMlN7MA6AwCcenPar3Mex7qCjoh6SswfUGOJ0HuMbLqpRvf7Y7qS1IIgSSQ51EAr4K6COA1AaMGve65X9T87AfvT14bnzx2UCfPH+KFuTk7Oj4uHDokPFve7IXWP8Uvzx47qBfOX+Gzxw62O+4L56/w2fYFG5Ty8V94AXj22OW7Ltvorssc2AfHyXrEyEhlBuf3zVbtgWg4RscJEk+DelyO+0h2t/YD3Msl2iJbALx1gIhFOKYmwOuALhM6R9oL0XkWMV7Yt7s5xueG8iVjZFNqApvOBtD28qvXiMFzxMhIPP/Nb3Zl+cRB0p+KwjOEHofjgIg+I6pmhMciCtXSvbZiR0stIQCXIsBpQVfN+Y6b/zQSr3TJLuQ9/R99EOPcF7/xh80iEMVlvDgw4C9+97sYBISvlzf989b4OFj8crn8/XLn2DmIRW9sRMryPvvnuKeyDXy93Ll5jiDQ0NnTHzWvTs1iZlYy2wbpAIj9ALdJcpCZXJViuSe0GrN80bZPFpt8ykj0CNwF8P5cmhOALKj60RheFWofQUPCyKBhdEQc2pwCgJtWAHTw/h//zp6M+jzJ/4jQMwDvJ7ETwF4SPQTlElsW/iX3Q2DpY05GAhMQLot6zRwvuvhyAzhfyecvHzg1NNVpe0jhqdemj2p40DBYRPut1Wr2T57Cocms+mSgPy3Z5yA+Buh+CLtB9AUzFppA+3RFcT6g2OQ3gFbEfsAcYFOAxhy6SvCiAT8J9H83c2XfT+//xjdmNnvl2mYb/BgeNqnWLte7w/9NjzM/FAKPAjgO4iigBwTsBFgpFvatAzhLHErYiixLEMgBv+nQRUEvOPE3MP1/tPDjq1OVS/sH69NprH5CjB5vZ/4ZGhry3p7dY5brVTf+vxH6CwJnIJ4HcYNAznYYscIdoGxXAxjKFmXpsFCF1A/oAIUjII459LgrPNq7f3y/nq+1NWTVarYQXixpABtDIPxZrfejatchn29+wZh9lW4/C+pRADtKFdFuu+YHZEUY3tJJRdMA3pHhRxC+Gw0/uG9P95v86m/Otmb8rWA1/mztOsVY7vTS++BP/+WBDNNPudtzpL4KaEDgniwYc3cv25crGYtANiA1YPzQXecJfK9K/KCpxujeHfioZQ+o1Wq22VLB2ebpHIuls/6s1jtV6XmY83omqPJFOZ4AtBeFe21gsXW0koefJEUCswSmRdxw4h0KP8xj/J6r8VZr8Hd2JqXgIJ8q9/3Kb3yYAy8jxH8v6EcSLwKacKlRaG1QK5LQUklAtF25qyJ65NoB6H4zOx5hz7gqn7txo/uB83/5za6W9iGJw5somMim3AbU6dOVq43q4bmmP0PwqwCepfAwgL7SgT7ebtYH0PL9NRQuuFOCrgK8TPJNyUZf3xUv3P/LQzMS2BI8JMUiPmDSAD4pdZUsU64s9og88Mv/7Ufsbr4E4keAXgd4xeWTKIKDoCN2wKLGWfyaBNEFcq9LR516huSXmtKJ3vmJ/Z3PkJYA60wtbDv5DA+HS9mPd/ZU9hz0RvNpBXyFxNMSHgG0HWSl3AqqlLa9pR3CITDLjBSQe5wF+D6Ej0C8J+qHXcz+Yscv/daF4vsGAx7ZZXj2dJ4Mfp9im7fW4idhODkUC6EwGMb+/OmnGfnLIH/GC9fu3YD2ZGZBAqKKM8VLDL1luBIJZBNSTvImoI8AXlDUSyS+75XK6NjM9PiJTkeh2+SKTBrAp2XwW5BhPHv665XL3e/uMvU8Ymp+CUE/Uw7+R0HsJ9lPsltAFwqHn1unaqnlO4BYpPaZBXhV8LcJnGPE2yGrLPjlnhpxPHswpsH/Kc9aQ0POoSEfGTvX4fAzEkNVY6BfMOg1Uu+CuE5xvhjbK0+CpednFWSPoJ0SD0E4hoCnDP4FU3xif6jsGR4eDi2FIS0BPkvKQJ6lQUgH+w7uqMbmQ5VQORal4yCekPCIGfcEsmpGWhHJk8vYgVQY/Ugz0l2SaxrSuKAPA+2tKL0Wcrw1p5vTGh4MtbZFuJ4G/2fE4OBxoQ6qVjNJ9Lnqjcz4moRXCb5Lx3VAExKmS3tOe/LXMpFFSKBw9UIVxHZQ90M45rQTkI57xY78XNeFvTp7ukJArdlfRS6zDSkRNq4j0Llz7Qp/93u/38MPGw8R8XOQPS7iYYCHCOwNxm4JyN1lFFdUKYzFoRFhRsIVwN6m6y1W7IJmdX5X1vsuftCY4tCIAGhoE80EG9Mm0FK/h4ChIUiawrfrb9zMe7Km+y6S20RRwn45DtDQS/K2pwfVDi8KM2OXCmchSZyFMBfoHpzZ2NjYGxI+KBPBsHQb3pATwYbrvZ2OPqrVDF/t67mp5sHYwLOKehbGo4IeFPAgwb3BzFxyL9Z/i9z8Fxx/2HIddSnOSjYO4E0IoxB/XO3OXuFc863t+WM3ylhyG7bBN7NdoDUjf/Cn//2B4DhhZp+P0udBPAHXozTuyMwsyuHeNh7p1kAvhQSABAcaBMcgXWTAq5J+QuOLcw288cHhPRNf/GKRb2CjZh7aeEuATun91Ud7rs02HspzPeXCCZgdlXRU4kMAdpG0YtzLUMT1u8XLD+3IEoLkswI/JPE2iNcdegWZvYj+bW/8df6T1uBHGvzr0y7Q+v3A/NGrlYr9uCF916kXBb1H8irh09G9rQDcZhnQGXEYRlQJHEARIfopwE64OBAMjz1w4+ru1lKQgGq1GjdUJOeNKABaBrezZ79eGddHu518xB0nQD4u6DDI/SB2EKy4S7H0B13O4cdIBjOycPiJAmYFXiX5OsEfw8JLjZ74zv/y9z68eerUSJRgG62Bt5QWIFDDw4GnTsWdv/hPr8/t6Hld7i9I+LGodyDMlN7BMFrZ9suv4dylQgEAQmAmYLfEwxKOQTpuwjGbskO//hX0qWUYTEuAT6phF3uASTW7MlLd09XrR6OHn6H8S4A9DukggF00dgFsBem85YSfJNGKed+K02MNSRMixlx8LctwJo/hOxMT0xeP/ueY2sphozfyEhEC3/6T2o5eqw5Q/GUj/r5LD1PsEtUVQrE9WKr6y/QTyAwMFuDuiK4ZEO8ReAPCSw79xJC9wmr3lT/4hfGpOupqRxUSNkRcwQ2nAUgizhypRos7ldshOB+WeETCQQD9IDMX1FL0eBupVy74FaNyd58G+AGF10iddfeXr85Pv3XsvxiaIIdcz9eyNPNvmBlNkqjTpysg9PCvDt2oemOU0vclfo+wc6CuEpz1qNxdrlVWnM0YW5pkFeBeSUcAPGbGIwr5/q6megZGzm3Iw1+2/tuzI5qPZPjzes9UvLmjGqr7XHyAwBGAD9K4W2QPUEaNXSb3TGdQDy/UimlQVwFeAXCe0L+j+FeNnK+e6DjZhzPwZOzfUOtE4OuX296eu3516IZcP5D5/wXqbwS+AeijIjgopiDkZYBVddoF2jEFSuchM2aQdgA4ROIRSg/DdV/ETP/P4IFqe5JQEgCfRJuKpF/LkM3Pze0WcATAY4IeJLTTiOqdLGmCkaG0+kmak/AhqdecOgvw7/b9ym+/+MA//GfXJPDs2dMVAS1vr2T420BaADnkAqjTRRvu/8/++ZWPHml8n8TfkniF5DsirrFwF84yo5mtKuZFIiPZL+AgiMMe9eBcxL4dWVfvmfrPbzhbwLoWAC1h3OlkEXp2mpo6YPKniwSeeFBgz1IHj2Vj+JeR/rxY0TdBTpN836AfwON3guZfb2kbJDQ5eTkN+k0iEADgxImhRm58g4afuPynBK4B8iwzZJmVB4XpK0RbFgFUQsiM3OPiI8Hs8WB4pGG9e08+e7LaOWElAbDGDfjqcK3anGrsi4iPkRgg+BiI3UX2Hq2kPbQjwzSjS0U8v2sk3gf4uos/3t/MX971q0M3igM+xWmv554bytPhng0+8C9fji0tXoI1ZuZuAP4ajaMCLgG4kcc438yj2gnIb+k/xeziRUQolUakbkkHAT7uwHEyHL7q2KnhwbAo4es6tx1tmCWAJO6sZAcU86cz2OcFPASqL5gtmvnbn28VkIQVQaAgqClpUoYPAVww8gWQL2SwN9la848MG174+9ba3y06jjp+Vjlf/nHLucz5dRX+acu5m97ufSzzjKu9vqdrOp63eBYteiYueXbe+dhdFJzljp6187vKAV8I/lrNXvjD0xnO1Gyub/d0l/Mdur0Ox+sifgrgLYeuuXvTAAtFIsNl+yBQRBoqdpDYL+jhQD8eocczq9z3wdzh7sXPXVvXAmBdugIvF9brozP1bdWseoSRX4DhOICdEhS9FeqtlYKus98s5OxzVw5gAsC4XO+Les2dPzLDyzlvXGv3olOnoiQf+uLCUuDT3C1dTuNYQQtZwbf51gjZq7y+p2s6n225VIe85y6wavm1Yl20Xwy1vEbBbww5gFzDteve0/vOvPsuAnBgVlGPAXwI0k4AmXTrtmDrHEl0L4PEWuYRe0E9YrD3cuh96z5wGUA7OtTIyLkkAO6p+TuqTcO/3/PR/Px9jPGwwPsF7oWwDcWpvpb1dpFPB8v40C4JUBNEofY7Lzv9bRMvuMJbzUr88PWzvbO1Ws3q9SJz0ErbORKIeo1FAom1odVJysMtxXsD5ziIQWBwVKgDdRQ/t3xvvePfkYGiAsprMHCOZ0aP8+TAOWH0uEYGznHf6HGeHBgQBkdVftE9XzOCEQyOHl+oq3pdbS/pxWG1b33eZepgcLC8V33J5+qLy9f+3vazls9W76iO8lna6niRE7IU8kONm3/8O+MR9g6JCo0BQEVEDwCDtI2gFWcBblUFCrfy4vAYDD3uOEDgMMgHQua7zp7++rUvfuMPmwAw2lk/63OZtB7V/cU52/XXv7v/6lx+wqhnovzLAgYoO0JjTyCZx9gK5NH27W6loi7Tak1SGnfgvQy8KPBCFH8axHPonr205xfqk+3qaHv53yYXbzn411qyD6LIWtweBJ2dfXChE3V+79L3BzGIRde0Bnc5wDs/s/T1rdeMAIPHhZFzxGrXLDe46ysLuxXrorxnp2Bc/lkXP9uy31uvq8MSpJafwAf/9vd6G5NTB3qs+iCDPW7Ck049Kegwgf0AewV0LZcdqowbgWolGADkeZyU8BKIMxL/n9ns5isP/eL/eH3pxLEeDYMbQgDc+IvaI3PN6s9k1NNOPinpKMmHMgs9AHA7AeCSQ2qCuAbpEoDXDbxA5wVZ5a1qo/pW/+j4NQ4lT79Nj8q0xWj5lYgfDte3zWXZgT5WHhN0zOlPEDwK6DGA+0T0riIACADNZpwheE7E9wn/Toz+0v788fd46lRjvQuA9bkE6Jy5AOQIXZUQ+qP7DlA9FDNoeQMmO9b9ZQpuBxkpzJOYkmO6SMhpbPTNdl37Cvr04r+KN8+Pdd0Is119VVh3Bp8Q8163XM05hdCfjTfnKt3zdO15cOp//4/fnB36BNyDJfDMmVo4cxLeef+zp79e6d51kGP74CfLCDhAEaTylw4dCgDwxW8Up9JaDA8Ph1MLh5dueV2r1WyoXhc6ljt3dM1QvbSzFTz//PPZ2NiYAOBL+0YrRxp9AdW98YXz349v7bru+/YdZ//5K3wBwK5d1/3UqZG42qQ0PDxso6OjagXgfL5Wy56r1+NKz1qr1az+S4fa+/AXJy+HI+/1BfRnlckuq8z/6XjlWvifqVjVlf/7d/Nu+5eNmRlkRKBXmAtxBuIEgCkYmmVmGVtiBNTiXrbY3azUGHYFcM/N3jfHATQWNJEaW/aIpAGsNhDKAx2t1+9+67/7XJdVTsrjFyzYEXM96MCDWQhdSzWAJQ0WAeQgJkl+AOkdCJdAfkSza6JfU/S5wsCPKmFVwoNRkllTQg7lIkPmbhkIR+AM3efg8Hv1+ogxX/Q6mCkCyAwWYUGECzEPhHsMmcsrIQRAUoDHPHcBGWAwWqGGmqvpIcwXxqrY1YjKLGjem8zNYsURqlVTs5GzUQkwd3XDTBTnYCZ5szuCwaR5F3OrsuK5qmZqes4GMw8W2QWZWOEc5DKo6qxUUJaHjJkTmYExj4qBcNAY3QkAgXCDxaXlb9eBO0EjLVhxFCf3EDI4GES6Q/Mhwi1TteGsWMaGN9RslccNZgwe3ZkFD3RkTq8wZMGbMYMFAFLFrZmbmojOSOs18/0ADpjzEMkHRT0EYS+I7tsIAIFANSvqvhHjJIFROF8O5i9Hx7lubjvX/yu/8WH72o7jykkDWIUz+0YXDeQqqiC98NWMC6lg70CEGcgKge0CuijsBflEESHGZ0yYFRiLPSoGQgGEqfAodwAOmopYIYWRWS4HFGmA37PUXSw6vK3piIbiqymTKNFEc5rkMFA5AIYi67YMKALdAG5wlC5ODlhmJERnJhGBBpgLCpncJSLAgAiQEYhggGUCBXqAhCjLjFR5TfHYKq4RY2EMg0lNWwjORhpIh8NIiQvnsAszveQsvvwWw1pRLogqVHU6yKAytzpBlwmOjHLBMgMVXSGDu9wQSBNFxTyDKFcQkQFGRS9MACrSPkfCKUUYGKhMQB/BflE7SPYS7HGoess+48IEI93a9Vx0L/K4O2dCg7cYP4fSLsC9YbGcGSg6cpBNAFGrjP/ioC9pRJVmVQb0t7ZxorsccALe3nUWqCKjRHmaq0wKJqoVNrKIG9RKLnGv5VleFSu/FoS19jQXfX7x38qOuGTjo9U7VfyJxo5TkUUtlidmyq3TpdeU2Q1U/KfyfHzrMx3XsJVQRQvLrtLCBhYOGK3ycEFa8zblR8cn1Jbd7f09FQ258L2Lns0MckhFsJ9YevQZoNJJhE6UAr20BqAU6+XTZJmZVSoBBJBHRx4d0uoae7nUjCzU/QYU/N6nhiQAShVg8ctmHtkVABNyEXOg5iQ0vYj0wUW9f+luolQ4d/nCxm5mhiwYy23EsMg0s2R5tyi5VHnKqAwbfs8WHa6w+7noM1z46s690Y5slR1b5Au+K9ISgVAawUpb+MJ25uLXtwiR9mOseE3ndrmK7+HKqhlXtNUtFYrLPseyzyYpSGoH7WS7/mSlcFpSv4ulZ5H7sZVSTCvaakDIVYSaojQnYkayWZiadFNvd1W3aABJANwZJwcGFlVed8ScB05APknjboKxrP9VY/IJ5b5t4b4Vyzet88Ky7TuDjC7f6K0JKHkHr1PYKejaaroErqqvqVPq6LaBQpaRZQRhAIKgyIjJjHYjzs02kgZwr4yOLhphU9PxZk+l610CuyDtlVmEFAHlLmSlddhWaKXyPHF78cnO2V4dx4dbwRyWaeb2dlIaaKuNic9OQHae+1jI9LJ8RKgl478j6ciqTSwI7gsuzpmICtzzShY+nGtklyar1ZlFxr+hISUBcKfU68LQgsUkbNt+s9Gcf6da5XYDDlGaMzIXIAMZ5atqAmxl+bwTlZSr6e9JBtzbIudTfQLezWOUguOOJv7ys8EANl25md2A4kc0XDLT5X//f/7w2qmRxdud6/VQ2bruya2sPy3PLZvKH7Pgf8+hnzPwGYD3w9gjl5u11HhCZWLf1cX4LT7nt0xj2kgVtsW5XVvpToTF6n1RgpwwN2MwwmLhE3zFyB8p+r/1Cr4XrPnW3q8NTSztw+u1ztb3acDSn5ykDv6DfzydVyqXYu6vQ3pNwLsgb0iKJIxgKGx+umMLPQu9of2zRNknlvx9yWfSzzr7uV1bcZWfO9MQyNIxKAtGy6O73K8AeMGFM5b7d/bPHHtl79eGJmplopJW313PQ2y9C4BO0wyuXOm/mbHyUyL8EMCPCb0NaKaSBVQrYSEJpFBGA5dWCO6QSKymHXq5MRBJYlt3ldu3dbOSBRAcA/F3cP9T5Xx+91R8s9N5LS3W1pDW2fyhoSGv1Wr2T764/WAjNr6cEych/zkAR4PZtrxzuBvLreKktSc+hhAo9hIiiay7q4IYHc08vwbw76LrzxtN/cWDeOkDnhqJGh4MGBz2jRQcdMOkBhsYKE6GDQ0NeV36oPmt332ZWbTokplNuusoiN1ZYBUASt8vlPGdfMH3ZQVpqIWG00ppxBJbAcssMAuG6J41Y4x59PEY42UJL4P2HRn+7vCp377UumAUx8PAyCngNunnkwawhpz/y1/v6p3fv78CHg9mz7jwFcAfJ7lPQJVgRUClZQIqUsQlEney3pcEGAQDARNnHfiQxtdA/5E3+b2buX4ycX3vjc5DWMsFskkCYG1VMmJ42HjqlAOQajX78JnqvizwiOd6isQTkI6AvE/CfSD3GdHfXa0gBEOH03rLQaTj9eLN4lvdQBf2t9eFJFmjtc1alGWtQqZ/7Gfh6p162e/o6A8kEWPEXCNHM8abJD4UdImwN3L4y1XaC5yzc7tP/fZNABgeHgyDOB4wWM9Jbrhj5RtRA1jkaaJazS4/i+4uVnYpVg4a80ei9KSA4wY7JupBknu6KhVkVvr/tFx5OwVAy3W05T661G0UC/uC68KuyOXdn+960LnWQACsgTQS7sj3ftVKEZb3Rep4r7P92CE1JMFoaOQ55hr5BKlRiS8y6JUY7QIyvKXxqx8e/C9/f3qxUNGGTAqyYZcAAojBQcPx4+o8YqmabOYL/9N902g85uITRh4V+QCh3SS7IVaKMzLt5E0tz6/CmbMc3aUtYEmDOkqzQusAyToRA2tRnWsikflxh64+3vejfYxwhTIJssURP8tkMa0TQqTB0UQx84+68HLowU8nJsKVR8tZHwD0fK2wnz03FDdy5OgNawO43XpLqtm1b6MvNLM9eR72ZiH0ecYut1ihswJXcYwgWEQE4E5mRskVoJhHi8EyR+w4zhlMQARzhlhhhSyMp/GzNPUEYC2yUKxFGcIapcO412cJobg2BIsScjkdGYDoHecmTaCTrozBAhVNogBFGXJ55hFAcCcIz8gp9+bY/Gzv2PSuyuSxr/2j+SVLieLgwQad+VtkG1hyCQBrtRrrA+eI0eMcGTgnciiiiP47oVrtHRSRIgWMGEZHA94dJ96bd3z9YNndzhFnjhNj58TVo9VAw4MB+3orwBFgdvwzbfwLa3CPo2F9PMfHepaeCWJ2u9CzO/K5oXxlO8NgwLfvyzCVGabHhSMXcz73nXx1+4SIkZHCb2ZwsNzqSxtF60ITkESVvgKJxCfW11o5IjbRyN9sIqzYwKnX22G7i2iy5e/ojDC7wAiAVsTZM6OjxEng5NjCkeRWhKLivTJa7jpgLSITD65RWT7us6zFcyyKenz7Ty1qv1WvGRxVvQ60QsZvNqG26XQYSUS9zjpaseGBer3O+oJb8e3pEBwrfEjtE4HJs2D99GJ1tOHKbdwKfbLQfqvmMFiSYyCRSCSSBrBRlgUdBoPVSr3als6yAUMS66o3rxpyTHd0TWrlRCKRSCQSiUQikWwAGwwJrNdrrANoJfVcftNn6cbg0vdH1vjJBj/m9SPr5DnWCyNrcod2hub61rD8b2oBUBjsBKBOjAzwzOgoT55MUj+xAi1fj9HjQr2uVpCpVDEbZsYXO2OyJRJroUVuVr9fbrbBD9SJM2Wsw5NwMqX+Ttw7w8ODAQAGN1ior7QEKKnVavb1Z9Ed59Dd1butGuY9a6i56NhJd/t/JXPAXOtv5ftzc2v7XN3dH+/6tXqej/sca1gjmG/m7KpkWqj9e6+P7mrljgfrLADMzaKrpxJzZ97ljfkbNzD38K8NzW328bFpBMBy6ZeHh4fDyXB+PyvxAah6yBz7ItEP5T1mBpdoLIKHescZcSvOhS/OlifJfW2UCTP7+NE81uh5LIR10Qe8SOZFkLJ78bEuo4m06kS6i9k6BAdcFOYt8AYdH8L0/hTt0kO/+E+vd/axzWYc3HxLgG//r9XrU7Pd6MaOefeDgXrITI+620PmPOjUdkC9nWW3zoHeGlytvxUpaeHFO2vV6Gzd954HzBo9j9G4TnoipSJH572EXHItxIUp/6+7+O5W1uBZwq478F4A3ooBb4Rc7+5phEsY/K2J1hKg/ZxJAKwvQ821f/PN/rx76gi77KjJH6V4xIkHAB0EsItiP4gqpEp5lqeVFJadeaQEtSV8EVm8CBS5dsN/4b73fIs1eh6tWUS/teuIutf66Lz4LtbrgmQE3JGDmIV4FcSYgZfz6OdDsO/NR730wD/8Z9eWTjgpIMhnONu3JTLAa9+u9eddsw+R9gxdXwb4lKCHCO4G2AsCocwf1hp7ra6/dAh0CoOOHMJrKi4//rBbm+dZPzOAlq3/uy4J7+XKIkhYMEDArgjtNeIROabN+KjLq9UMceLPfm/0r+Z+cP1UK3BMcYowCYDPYvCPFNFZioY4ezrT5clDoTL/OTd+XsAJSEfNbH93NSsivboDKlK9KB3jTcroUoHfyiVW9JUqzaoxxr4YUYGQk+RMY776TDj+Uq1WuzrUGYtyA2sCG1YD2FcG6QCAy5cvV0Kz50ELOEHhCZIHBHS7pLlGDnWkeEmZghIrrySLFRpd9CLrdB+BATgUKrzZ69VLJ082xoeG4EuzWCcB8CnSf/5KeyBXvTdYpl1N4YEAHAS0k0BXuSh0EIAXARyle9QwE5t86Hf8SrUTQ5GsAtwN4gF33Qfjtvvv3x0A5JvBLyDbNA0YIsxFOasQuklUDKC7jAVrtPZObPYViESBIkAnADMyd6+ArBiUdV/NN038yQ1bkBc6ft9rOyMUblIcBzBHwkgYisyurrToT9ydNJAAh+C+4FMeCAVKmyr47AYtDLFr1/UFL5i5XTlDvELwgqD3JE254ILYyhmehEDiLtYDBFQuFeV5jE0CE5CmojQ/d+Ni4YSxCc6bbNglwOjocbUboY587iu/c6Xb9VIk9gPYB2hbloV+0hhjhLvnaIcHKwwB0q3WgE4HDy1dHJa5INIAWcdTA9HhEHB7c88SpwGUWaHQ8voIwQxClkc1BXxowOuUXyDyq0en/sMc+IOOC5MA+NQbGRgqKn5kxDh0Kj5fq10/+fTec2Oc3k7DTsn7mtGf6KpYBtAFRHSqb2x5AS30keK+WiQBOg095XbPsoIjsX6m7wVP4qItW3afRWkDtbQ/FdM9WZz8cxcliMA1AK+Q+FsnX7pvBz7gc6di2ffKncONawzcNEbA54aGcgDXrn/rfxht5tqOoJ0Cd7h0sJJZVoF1VbLQYejRomSfi7IDl/9ju/Ow3a+SH8F6XhgWDj1Lj1ks116tBLEL/kNsC4tmHjHXaALyqwTPgfguzL5XmZt/i891HBAaHEy7AOtgLbCoEXY+uPvSzUvXfhRd2yK5LUb/fO5+f7Va6cqyACuFv6vIBan2nE/Yks5jZDtrcGvwR/dCeCjtKKyjOb+d4p3Gst06BL2wvADgwtCnlcqhC3ONJlz6iOCLLn5X1Hcs5yu7BzFd3tNIeulunJYAnylDxVJAw8OhPjoqfvEbTf1R7f0bO3HW0ZW5+wckjjQazQPzzeYuChloRSJZKFCwVpYIsbD8tv3IBScVy8yxlJCBzCgEUISYVIH1gKFI3lwc64iAIgAvBbdh4byXWl57RVpoRhgcLll5LNSdOYkxAG8LfIngjxs38NMH/qvfmmzbnArVH9wEkYI20WGgxe6Y+uvf3fbBTL5PedzbVbW9ku/PyX2ZvMcRAo1BQg+EbkCBxihhjtAcHA6TnJgjOEOqSbHiru0kdhHcJsAExfIoUdIFPhtjkCDRjPTiPF8DwjSkaZJzgEzGLgJVd9FoXuzvw6XYJLNZUs3oipWMEhSVa9aBa9ExZsHGq95zdeev/sZN4hZbUDoNuB6p1WpWL2K5LWog/cm/6L9u2hUx25s3q5l1KcuQ9XqTPQ5lgYrMOBPzxqwzRHgULZtFyKaaXXlz53xWmWjM7erOqnvy6NujwQzI4S6YJQHwmcz8JriTBoNMbGoeFU2iocmA6iwdNltt9GSwrmaMzAxOOhXgueJ8D3bNVK3RmLBmVN5Qb0S+8yhmeGKoccsEU6sZNmF+wE2ZG3Al6azna9noGGzbPljfzd5KJfOMDZmq9GZu+d4dM80Ls7t1dGpcGETeGVJMz9eya7Poreb91alsntsqdEwC6E9j8TPtxFmVk5NAPtmMh/t3z+OFyw0ODeUC+MLp09mzx6rhvbFxxukJHTkCYHa30DO+airxWyaWoSExBQjdKIIAVK1mUs1UBgm9l8COktj6SbW6gdq/PNy32mc627eVZl6q2fDwYNAWCC5rm7Vg9XqNGBjgmTMwDAzcs9GGZBEuhMngt8FU21Ut9AREUq02LjoOgDOwwX3HiYEBol5n8vtIJBKbVVBunSUBINTr9SJLUFtVuM3vhRqhxS/rrNeL7EJAmUUm8ZkzMnKO7baoo0zsU7ZdEbXnVg2x8zOdw4GbY3svkUgkEolEIpFIJLayDWClOtCSA8Ar0WlDqKe6WxfU7/A9LFr3p/X+lhcALcNg21BUXzDwLWVw8Lgwco5n9h3nyfK9M2nsrQtOLvPe7drm5NiARjCCwTL771ZIAZ5YOuNj82Z7Tdx7n0gawFaY8es1ngHs5EkUueAHBz05+WxlLVDEyIhhcFTA5vP1TwLgbjrBI9cNb12+pU5GAQw8ckgXX7kc+nb1VjLNBPX1KE7znrJzsjqzuer9GqD+3o81cDg5Q+y5++/FHsCmesjKLIGdAG5gvNmj7dWFtmnVtxq9yifM79tbzdEzHnGyHre68OdWGuTLNfbbf/RH3V3bLvez0tiWBXSbQig+HwQADDAxRHkUYtwm2f4QQp/gkVmYRe6C3Z1LdYxGuG+eujdXCPaxBlKMTvhdnqo0F9zITJlklQBnbnBza5qpmXsRJYCyQMksMI+uacXmTY+c6M3CxIWxPRNf/MY3mu1+MjwccOqUbxXj4JbTADQ8HHDsB90fvX+g36Pv6VLY0/TGXlDbLaBXzsrCshAAi2O/URJc2406JHAnyNzIaQoeoXCX1V6kwt5Ui6uPOZNKvPsYS0VcJpIVQVUQBiBKaBBoEIwAICCTFALYFHFT8jEi+wjW/ACqXuLkzJU9XQPTPFXG+ksawCZZ7y/Z5tHZ05Xx9z66T1V7As7HIRyBuD/CdxPqJqwKKFskACBSdAEQ1UVpu8BuEF52MuluY8UXoWo2U93rM+qPZehfMxRCmGUWuEggisUygIAVYbwQIcwKuB5oYw5/D8zejO7nxfzN++5/731+8Q+b7WVhETdQSQBsAgFQDP7J+1BpDLjz5wB8CdQxOPYI6i1yBxXx5FZZSrSjyybWpwRaqW1cDohzJCYEXCZ4sSmdI/xs1bIXXuqfvfzcc0P5VhEA2SYs00Ks9jJyp2o1m35nbG+s4ATcvkzp84KOEXa4r7eKLBjkguPW89ELg53toKDuxe2tlWpUd99dtakqnGs0iHXX36uOpm4rBFzI+Nv6YytLAClER3czj925e4/kOw3sJyxr0OMTjSy8/Ue1KyTnFraLhc6QYEkAbDROHqk2xy8dlOMEgacEHSbZ4+5xenY+kHaHM7sWTzdJDVi/CxDeVpK3coAAQg/A/WUukSYiZ5jbbLXaPwlgrogUK6JeJ4aQBMBGZHh4OExOvtvHEHbL434z7Qe5m1BvoMldOYsl/qot3Ar/WeSLAFhGBW69TqwvodCatRe1FyFBZaRgBgHdBPoF7A/GQ5AOyCb7VKuNc2jIN3s1bToB0ArS28r28uqrw2H63Gx/1pVtC8YMQCZ5L816MzM28rzU9LDqHhS5vMqb8o1vnCWKOhNGAvAyLwzBTFI3m75NXaFnFDEDUAQHrQ8JQ5uzbmyzN/7A2LQpU7dc3ZQqAgLBLARrrd4FpFQ/W00/8EK5jwQiCmufAchorHhEd/5oX6VD8G/a/mGbv60vwnM4zF2ELxwFQDsFmFJY/y2kDZT/qL3kMwgZBNKR09mETPdvd1uk9m1Sq8/mNwL2H4pdN29Mxjy/ETJdBzQhcTa6ejOjkaJET+nDN+FgX5LYFaRKw56ZGc0YAolGM1ZFNAGOixrLLEzM7s/yrVBH2WZt9I5wznnjhfqNfHe43IPwLojDgB9ysbsZta3I+VWsAqWO5KBKgeE24uy+pM0W5QAmVG72FDYfSRaLP00D/pHAi2J2caJ35uqL7/+40bqD0HYjVxIAG1MgzFz6P37vQ8/mL1rA/SAegmuPAz0ALAtFOvjOgZ8WBRtbEnBB2W8P21aSV6BI9Npo5k2Q1wm+DtpPHDwH5ZeO/sLQ5LEtciow2+S9oM301crkzkfiu8zzA6I9DGh36ZDbk+e+vdIVaIGLzIFc5j4L84pWX2negta+jHd9f34Cz8R7KCs/sbphR1bnVtpvqdjmoRHNPGJ+rtkgcFHCOdF/JPDsXB5fvfrQvvH7ysG/cICMSQBsdGlwdHy8efPRA1fz5sQb7NIeAU2XHoCwi+SeuUa+HYVGkAkiUewZL7sWKCQHb98Bl7cnaI2tjbd+D7FaEot7uWZ1dIulfPWyLr1mLZ6jPdO7Cve/sg0LnwBJpFle2oEuUzxHs5/M01+0TG8c+eV/PrbIZrBFlk1bhuefr2VfmO7uj/N+f7R42GmHSd5HYQ+AHQbudHofYUFAJBiLXiPvCBtICNbOJ79c13Zvj7bWaACAla65p2HnjkWn8Lh6muJ7uWZV3MtRtlDeVcu69Jo1eI4iXzsFqClhntS8wFjY/gC5IsgpQh9JfN+Jiz1Z1ztNTn6w5xfqk0uNhlshVsCWXOpK4LVv1/rVCAcbIeyvgP1w30bnblDbg2UhQpFA7pIgd5Wdge188yv1V2k5AXD3x13vpCSLBzN8tZnrXq5ZTQDEIlPvovKuUtal16zBc5AspnnjvLtmyDhnZk33aCj+1jTwRsg0ls/Z1Xcr79589pdOz3YajksxtGXsv1s7KOhwrfpub/e2rujVZt6odCn0hK7QRa+YjK7YcGRB8qhWvuiuPBIW2GzG29ZdpVIEE0FW/psXn13pmnuhUglqf0f5Pat9x71cc9fPcof3vJdrVqJaraLRaCCrdOU5rVH1udy3VSPnm0Ro0mcrsWLN2Z1NzPDUMinAC8GVgoQmEonE5pvx0ZEyPKX73tp9oUwfv5AGPO38JhKJLcaWlXoq951Qr3Nk4BwHMVj8Yd9ou07OpP6xoTjZ0WYnxwaWWcePAIPHVaYG1lYz+CUSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSiUQikUgkEolEIpFIJBKJRCKRSCQSnyr/P8j/gMkjHqJBAAAAAElFTkSuQmCC]=],
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
        local path = "AvatarInspector_EH_v7958_" .. kind .. ".png"
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
    local imageKind = kind == "folder" and "save" or kind
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
    elseif kind == "close" then
        strokeLine(5, 5, 19, 19, 2.4)
        strokeLine(19, 5, 5, 19, 2.4)
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
    local usePNG = (kind == "viewer" or kind == "players" or kind == "save" or kind == "folder")
    local ok, result = pcall(usePNG and EH_pngIcon or EH.icon, parent, kind, position, size)
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
    Header, "AVATAR INSPECTOR v7.9.58",
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
print("Avatar Inspector v7.9.58 loaded successfully")

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
    warn("[AI-DIAG] AVATAR INSPECTOR v7.9.58 STARTUP ERROR")
    warn("[AI-DIAG] LAST STAGE: " .. tostring(AI_DIAG_STAGE))
    warn("[AI-DIAG] ERROR: " .. tostring(result))
    warn("========================================")
else
    AIDiag("12 Protected startup completed successfully")
    print("AVATAR INSPECTOR v7.9.58 INITIALIZATION FINISHED")
end
