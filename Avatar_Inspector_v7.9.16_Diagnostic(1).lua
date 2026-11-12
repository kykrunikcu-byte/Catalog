--[[
    AVATAR INSPECTOR v7.9.56

    CHANGES IN v7.9.56:
    - Two real PNG icons are embedded in this Lua file: players and save
    - Safe local asset resolver via writefile + getcustomasset / getsynasset
    - Original icons remain fallback for unsupported executors
    - All other graphics and original functionality remain from v7.9.54

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

-- Event Horizon line-icon system. One geometric renderer, no image IDs,
-- unicode pictograms or external assets. Every piece is decorative and
-- does not intercept pointer/touch input. The icon's parent remains the button.
--[[
    AVATAR INSPECTOR v7.9.56 - TWO REAL PNG ICONS TEST
    - Embeds exact user-provided PLAYER and SAVE silhouettes as PNG/Base64
    - Decodes once, writes to executor workspace, loads with getcustomasset/getsynasset
    - Displays them as ImageLabel; falls back to original native renderer when unsupported
    - Preserves v7.9.54 code and startup (except this isolated icon resolver)
]]
local EH_EMBEDDED_BASE64 = {
    players = (
        "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAA2I0lEQVR42u1913Jj2ZXlgiFokp4JkulNVWV5J5Vcj+kY9zDzwtf5Fn4AvqcRM90RI7Wkbqml" ..
        "lqsqlcky6ZNJD5JJ70AA83DW1tm4CRD3giAAAntF3AA9cc89e21ztgEMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAY" ..
        "DAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAw" ..
        "GAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMhguEmC1B45DLZnoBJAAkAaQA9ALo49cAoMSrACAP4AjAIYCj9Mzssa2gwQjg4gn9AIABAEMABinwKQA9" ..
        "fA0SQAHACa9DAPsAtgDsAjgAcJiemT2ylTUYAbSnwItwDwDoBzACYBzAFIArJII+ZQn0AIhzrYsU/AI/PgSwDWAZwBqADX6uyeDAVt1gBNB6034UwLC6Rin8" ..
        "QgBpAJMkAHEF4kr4Y8oCEAI4ArAHIBcggB2+vgSwAmA9PTO7ZU/CYATQfOHvA3AdwD0AdwBco8AP0woYpNBf4tVHrZ9QayzCL25AkdcxYwF7vET7H9MCWAXw" ..
        "DYD7AB6nZ2bX7YkYjACaI/gi2FcBvAngHQBvALgJYIzCL8IuAp9Qmj8MThQhFMTsV9aBEMBfAXwPYJEksQcXONy3J2UwAmi8uT8N4DaAu9T6N0kEVwBMwAf7" ..
        "ehr87yVGcEIrYAvAAoA5APPiDtA1WAXwPD0zu2BPzVAvkrYEr+AqgHcB/ADABwBu0d+XI71eZd4XI2j7KBCroJcuxwStkE3GCXIAHgMYzGUzhfTM7LI9NoNZ" ..
        "AGfT/BLJfxvAxySAN2kNpCiQer3i6vNYBQGOusZx5RbIVVQuhbgFO3ABw6cAvgLwOd2DhfTM7F6HPIseFTtBYA3y6ZnZvO1YswAatdlS1LB3KPzv8/UOgMvU" ..
        "wskmP5M4SSdIDpfgjx97GaOYYEziDwAeXGC3q4f31MM1EKFPqqsA4DCXzRwjkExlpGAWQD0bbwTu6O41mv3vUetfV2Z/XF3tgkO4QOABgCUAfwbwCwB/uCju" ..
        "AIk3RUIbgDtVGYIPrkomZb+KtxR5zwcU/gO4oOgmPz5i7OSQHxfSM7OHJuZGAJU23zj9+3twEf534AJ/V7kRe9pM6DUKKk6wDeA7AL8G8C8A7qdnZlfafP0H" ..
        "4PImdE7FNC0uIYFLihQukQxiSuvvw+dKvIQ/HdlRcZIduGPV7fTM7I6JuxGA+JeTNPE/4PU2hX+cmy/e5rdRDMQMVgB8CeC3JIEv2vGIMJfN9FOgrwC4QYEf" ..
        "53WFz0XyKQZJDH3KIoipexYraJcWwC4Ffgsus3KBJCAnJosANs0iMAKYhjvP/wAu0PcWhf9ywO9uR6FHhbiAuAQrAL4A8I8Afglgrl38YuZUTFDLX4U72bhG" ..
        "K2ACPqNS0qglzjEQ4s+LK7DPSwhhjQSQIwEskwSWAcxbvUWXEQA1/xj9/R9S+N/jRhwNudnaGQUAzxkL+D9wyUOrrSYBCv8Nkq5kU05T+Md49cMF/WJ8lXqL" ..
        "KOSYh8+sFDdhBy5vYoOvLwB8zbV5YRWY3XUKMKbM/g/hgn436WemAlq2HhdA0ntLVf5GKXBpTR6Hzy2IKvRQgjPN+1uCryfIt0jwe+AzKd9ijEVbWyPwqdOJ" ..
        "QGwjqdZUYh0xtY5yzzpAK6c1JfWzeboVEhcYU8SSymUzC+mZ2W0jgM7X/hPceB/CnfG/jfJIP84o+CfUOHm1iWMBC+tEkURRCW0SPsEoGZEIYoH3PEAL5yf0" ..
        "fYUIWhlneQP+WPUGvz5C4g3uv0QVNycWINJYleeVqPB5D4kmqciwn3GHz3PZzINuJoFkFwj/KLXQ69yIr1P4RwLCXw8kZfdQXXJMdYTyaP2J2rzSMETO9Qf5" ..
        "fQl2hX0ulQhrnNp2FcDzXDazDWCjya6AZC5+yPdyV2n9AZTnVoSxuuolZrGsJK4wxo8neCUBlHLZzNP0zOyGxQA60++/Q3P/ffr8b8Ad/w3XaXYLdOBpn0Sw" ..
        "Bx+FXuPXT6h5imozjnAzXlbBr36UJ/qkqmzo09yBhHpv3wD4ZwD/CpcglGuGpstlM2mu9w8BfML1nuZ99aC8T4I282M42+mLXp9KpBLMH1jjunzK6+turLbs" ..
        "dAtggNr+TWr+SfhCnrMI/z5cpPklfcstav9duKjzc7jinW1+XSyBFInnMtyx1zSJYITva0QFxkYiBsI0mffT5fkZn/EIgK9z2cx8emZ2s5EEqy0LulpvA/gR" ..
        "hV+CrJdO2WuNOnKN1/ib/byO+fz7+SwkCHmSy2buN3J9jABaj2EK2m3lfw7WKfza19+moC/BHy1twkebxQLYU66AmP4i6PPwkXA5D58iKUiq6yWSRiqCoIgm" ..
        "HIGLuosfHKe5e9ios3ARfqbyXmaQT4Rf4izDLd4DQWsgRTKWVOoBfn4C4FIum3nKZ7fbDenFHUsATPOdpuBfh2/kUcm8Rg3TWieeiNZfphDPUeMvwJ3F74up" ..
        "WemsOZfN7JA85uCz3aSd2E3+/U2Slfiqw/BpybU0YFw927QiD2lBtkHiaiSu09//EVyQ9R58Uk8jhDdqHKTW93XsR/ZCD/fLV3CZlQ/5nCwGcEF9/6vclP8F" ..
        "wE8ZiBqBj7RX86mDXz+haS91+JJQImb+Il+X6m3blctmpkgCV7kJp0hYN+Gi+pKeLJ2FajUdCfrDq3BVg78E8HMA3zfiDJxn/JMAPgLwd/T776E8qapYQyDP" ..
        "cvR61liBfsa6wvIzrtdjWgIdmzTUqRZAH4XoJgVqFD76XEtzlCpYAGvU2KvU9I/BEly6AzvpmdndM7zfDWrnNQBPqLlvMbbQQ6tFE7YUyIT1jYcoqNdIJqu0" ..
        "Vs4q/BLp/5iBv7uonFEZP8W6kvhIHI1vsBLWIkhyj9ygy3bCtR4A8CyXzSx2atJQpxKAzjeXRp31pvlKb74nJIEXNA8fAnjZCD+Rf2MLwBatlxVaG3ll+ksw" ..
        "rQ+1jy8rRcOHVDwkl8tm9s9YIJOmxv9PcEd9aQpRMoKJLk1Si00S/tOsghjXd5oEkFLEu8m4jBHABTH/xf+XFl79EU1M6dF3TK28TJP/W5qJi+mZ2dXzeP9C" ..
        "BrlsRmfB7VLD3uY9hXXdxJpJUDhvUmuvkdR26lzjUbjj1XfgIv238Wr6bpRuSTF1r7pparGCRVatCYuc+SciPmf9+31wQVmJDZRonT0jCXQc4h14T5LzL8ds" ..
        "4/ClpGEheeRLFPhnfP0ewMNm1NxTOz8F8CcAv4Gr+Z+DCzIWQ25unVs/Bl/+fAfABMkyqvAP8+9IUtUV5WLpEup4SOFLqJiMBFlXaGk9BfCoyvWYz2WeZLZF" ..
        "ay2YcVmssf/jyv2QasXLtLhuiRXJEmazAC6I/z9K0z8Nf+xXCvn70p13kwG+JzT3HwNYPu+6cn22zuO6F7ls5ohCPMH7GqvDqhHLaJKXnCxEdWHG4ZJ73mI8" ..
        "YSCwdmETeoJNVvapbWU+wgbJIEh4MbV3+7kWEjhN1LEulWSin/tF5j2kSQz7RgAXkwBKVQigkpl6SG2yQo37EK4v/6P0zOxaEzR/vsLXVnPZzEMSwDjvT+rm" ..
        "o1h3khc/TDLoo3sRRftLYtUb8C3ToLR5vdimxn9C7b/A180qWlzcmtvwhUZCKoNn2Ns6FVusgasAphsQNzECaAJSapNf4qYPG8AR7S+FNM+5IZ81Q/hrYA3u" ..
        "fFoShtKIfs5eUhpuGK6r8FaEQOawMo0nqf3rOUqWGIsEAXfg0nK/pJv1DL4V+mEgnqEtgQEStdRh7FBYp0hw/Sgf0hLFNZa07TRjJ5LcZQTQ5gFA3UsuVSVg" ..
        "VE34Jdlng9pH/MyWF4qkZ2Z3mKU2wA15mxqwP4RVozd2isJxmZt7i4RXa20H+TuT8DUM9ZjbBfiaiR1eC3B1+ve53ktwBUy1uhwfMlh6xL/xLcnpNbgjySn4" ..
        "bL+ozV2T/N1rtDA24Yqrcp10JNhpQUAJ5AQDUtX8Un1cJuO4pNGkWADLaOERkA7UMU/9Ga2SRQpPMcKfS1AQhinIUwCGawUD+X0JjE2p+EHU8mXADzx5Dpdw" ..
        "8wu4Lka/AvAXAA/SM7MvwrY455o8hguW/gLAP/Fv/ZlWxQIJLuozTNLCukp35zVaX6lOEphOcwGk0k6afETJn9dlvRKQWgaw1eKc8KD1sgMX9c6RqMYiEnmC" ..
        "G1sI4Bm/pot6egL33AMX7ZdS6sE6TP+iMtMlHfkhfMbdCipk3Z1GToFg6SGAzVw2s0kSP4bvEhwPEFYi5PtN0AqQwa9l911hnYwAWowhZaIORHABxIwUC2CP" ..
        "Jt9GGzTXLFV4r1KMtFXBAiiFIABJ4b1CwkzUIJ1LFHzp6DNEoYpysnIE36tvGT634jHciLO904Q8oqv0TK1FQrmDJd5LGNdF51D0cc2GO80C6BgXgB1nx6jV" ..
        "LlfwjWsRwAl8q+lNaqqWd5CtIACSGLRK0/awDgK4pGIAlRqjBAlgFL5ScYLkmohIYmL6lwk+gJVGTzRi34M5uIDid/xfS/z/+ZDEVVLkmoSvLJ0Uq6QTqgU7" ..
        "KQbQy815TVkAekPHAkIUfNgn1Pw5mqOb1FrthgJ8ssxLlJ/jF2ts7hjNeTFrpU4iFRCgIzFxc9nMGMqPHqVhSZS5CeJi7TB28S1cY86H59WEg7GBJ3AnC1/A" ..
        "HTFuKbcgXyN+ouNGkkr9Blzm4x0GRc0CaLMA4BB8M42o7b6KyvdfpSVQarebpHBuw1UnbkUMbknG2wDXaLyaWUst1wvfr2AgsNa9NawAyfGXjr2S5TdPzfzg" ..
        "vCcbs83XY/jTBSEAIYFSDUtJpx0P0g16By6T0gigzSANN/QoqSi/G6MVIMMlwqbctgL7fJ/1vEed9ioTeFIVhF/WchC+ZZkE0GRWX5h0XxH+Nfj03uf8vBmE" ..
        "KZWc8yTNXfjWYIUQ+0JeU/CzGMfhcij6jADaB6JtJBssFpEAxBWQoZMn7WgBEHn4+XdRCUDqA3p4VWpCKmSqZ/P18pKfj5JbsUUf/DEJoNlNSjfpMkkyzy4t" ..
        "gLBrFyS8pHKFLjQ66RQghrM1ONHFKck2XxvJpDsJocWqkZ005qwmzJoE+vBq6/Iway2BVUmtnqcQNnuM+TG1/zzc6YfcTykiAehx5b3ogBOBTrIAdO+7oAUQ" ..
        "DylQJWUe97bx+oilUqiDAIKuQLyC2SzaMcZ10CPJw56llwIWwDq178tm59OnZ2YP+P+ln8MmKp8GFAMf6+9LfwA5UuwI2ekkAojXaf5rApAHrafRtisBlOqM" ..
        "UehJO4lT/k5R+b4S/e9TVkPYdZUYgEzvbdXJSjCBqlYQsJIVIENLe+AbxBoBtJFZLIGdIHsXQwpUPOAXt3vPxKi99HWTDT2w5OQUqyql3IAUwp//i0smR4DH" ..
        "CBd4O083YJeXtP0qRiQAaSeeNAJoP8gAjpM6Hq4Ikg6OJdr4XrVgRjntKKm1kQGaIpiV9obEQ1JqTaISgLawWn2qUgy4e6UQ9xBcd5k/eEzX4kKjk4KAsqnz" ..
        "igj0Zi6eQnzBgFdvRG3XbAzCJeaMIFogSltJYpofnqKV46gdLKzlkiGksDVL4cXOsL9k3aT2AEYA7eUXS875kSKBZMiNIcEu8Xd723F9ctlMCu4c+gpfo1oA" ..
        "kgEn0412qxBAUGOfVYhjbSD8YsHUO2vwkPGD7U4hgHiHEUBwTnwh5L2KfydBHikkasf1SZxCAGE0XInCn+O1WSUGID6uaLs8aqca13Kv4i1cU3GZeiNYM6XA" ..
        "x5LNuNUJ/n+nEoA+HitF2KRy/CettmqluqKFG3kEvpAnFfF5x0gAy3DHYhuVNjMTdSQ1+iU3fz0BvJjSvCm0rv13H3xzkGQFAT9N+FHBajoxAmgviPkfjPSG" ..
        "1ao9ygoYgsuRb8dOsCL8l+HLcsOa2vKze3BJMU9oBVSrJxCNJ62womTP6bXV7lU/Kzeb6TZJ/cME/IjwMHtfk4CcIpyFDI0AzhEnZOcluKyzLdSu+KrkBkhB" ..
        "0SSAq7lsZryN/P9JuFZXN+F7AsYiEIDESbao/R/DjQ2vZs7qM/xt5QpE2V9iWcnk41bU1MtQVt3htydiXEKqGU+LmxgBtArsCrMO31BSTNuSMuFOQ7AvvPTQ" ..
        "v8luuK0W/lG4tlTvwZWlpqnV4hGeaQl+QOgLAHM1mp2WuIb7yrI6DmlZ6UxC6UGom7U0e5+PwPU0mFKuUyLC2klG4yaA/UZNWDYCaCx24fvK78MHAsMW9kjb" ..
        "7Em4ks97JILhNri3CRLAm3xvadSXriym7DpqdLhlSrDOFxDhrzVwQ5v/ulHLFRLAYD1DSc64zys1QYmydkIAG+igzsCdRgA6s+1IXWETg+LcsGm4iTC3+TqV" ..
        "y2aGWqT5UzT9r/O93IAfeVZPz4M8XDnsYUhNruvnC4iWaCXttEbhJx5PkxCaaQWIZSf9IocixAEkviTDYl7WOwXaCOD8IZluh/D9/SQnoBRCOEDTULrmXiUJ" ..
        "vAbgRotIYIQa/w0Kf5oCFGb4RVBI9xnEklZixZAEsMdLr2cxxN6SyL+0FJeBrTfhWmtdOu/FY82+TEUeg+8JGCbPo6Rej+HbxcEIoD2R50OSqLXWdFHzvi9R" ..
        "2O4CeJ++961mtoIi4VyDm8P3Dt0RGXYaFUdcl+dwJwBbYdaE6a5Szbeu4gBR8gFSKrZyk67V67Sses5x/QZInD+g6yT9DOU4MhaSAGR46T465Py/IwmAPqt0" ..
        "gHkBdxoQtvIruBa9yu/+GMCPAHxAEhiosNl6Grx5Byks7wD4kK83UaGHX0jTX3rxfwc3XHMtQiBrA66//hz8JJ6o6CMB3Oa9fEASmDgn4e+n5fQzuBHm76u4" ..
        "iaQ2R3EBxBLS7dMvfD+AjhsNlp6ZPcxlM0twjScvw2XLTdRxrxI4mqbAxeBnByCXzazCRYP3+H/zDdy8MoPvLfio/w3ex6UaG1dPBpLXY5r9iySBxYiBrD24" ..
        "49U5EuIdRM8IlHbkV/geD/geNjndZx9A/pQjyaiW03VF3O9x/YYi7APJYCzCH//toX3bxBkBKBJYyWUzf4Wf7HKTD1Ty28Pkg+t+8nEVPCtQCy8DWMplM3Nn" ..
        "7WyrGnDKUeS0Ev53uJl1A88wcw701KNdau4lcJR2lEq29MxsPpfN5GhVSXvtKbV/khEINaZcNWm9PkTLbSuXzZwpyEbL6TUAPwTwY67fNMknjOuk28qVuHaL" ..
        "tIC20CHn/x1NAIS0n36b/t8YfNQ8yvhqORkYo/maojZZhcuk689lM4+4mQtR58bRVB2Fj06P8/+I5r8GHzUPW6Go708ana7DZf3JEWlUbHNN5yms1xAtkq5J" ..
        "dZhCecK/cU0J2Xwum4nDTQnKR1hHCd7eouD/FMC78PkSYdO69f2IS/mIV1kb9k6YERjrYAJALpu5CuC/A/hfDARNweeCR5llL2OmJCFGcuSfk2S+p2YUrbYD" ..
        "4KDKmCtpOJLiexmGT+2VEVR36B9P8/t66GkUnPD9yhy+3wD4NwDz9SSy8Djy7wD8T77epmYtRiQC6RO4C3+2Pg+XxCXXIoB19vevRaCSu/EGff2PSPpT8A08" ..
        "ovZ5zPN9fQ/g3wH8HsBn6ZnZebMALg624QZEpuGjvlfruG/ZPGIJnMBPIJqCOylYpFsgpvbLXDZzrExGqa3X9QYyw2BKXdP0k9MoL1ypJ2B7BD9EZJHva/0M" ..
        "WWwSSHwAP4BlsI54gAxvHYcfyCIjz6/ybz8H8IyxFjl5KCiykcaeQ1yzNwF8QsvpOr8etWGKdgOO6ffPw80wfIoOOwLsBgI4pt/6KfxADKn1j1LpFwyqiTYW" ..
        "DT5F83qV1xqFRZptlOCr4vr4e4PwufFSpCI95+sZbKIh/1PSo59yE8/Xaf6LyXuUy2aW4QZtXFNWSkJZHGFLfkUw9Sj3AZLKNIX4FtdzFz6XQwigV7kTU3wv" ..
        "79Mq6W/A2sm8SLFOVtIzs7tGABcrGHjM4JVMiB2EL/cdUWxfj4aVqHYPX2Us2SF8PwJJnS0ol0tXHvYrQpBBHX04WxmyjDnPw3fC/QpuCu/zBkTZ1+GOEqfh" ..
        "jvJu8H1LxmU96cnybGQa7yQDt9vqXoooH9Sh11FiJ+kzCr8IvXT9kcSp1U7U/h0fA6gQD/gpYwL/gxojKgFUaitWCFzBphy6C4+suWxgcQviFTRnvcQkQzjX" ..
        "GaT8C4Bf0X/dadBa9sMdsf1vAP8N/pRFMv+izAwMNm/VPR1Kak0rWRZ6LWUdi8riirp2BbojuxT4hwD+GcA/pWdmn+hYTicMBu0GF0BjDW5Q5DjcMdEErQDZ" ..
        "aIk6N02URplRtWIx4uaVtl3i+vyJAawHjezFn56ZPchlM88B/FFp/+twpxnxOshLdw1q1LrVQ5wntDiEPL8gCbwM3H++U4Qi3i3SzyObRfqv92kab6O8WKhW" ..
        "r/14CB9XT+05UdqsWOM66/MR83Vb3ecfAXyenpldOocl3aBb8WsSTTC+UAq5/07LyShWsLBOKnytgNObvoYN+kk16TO46cV/hjv+2+tUueh4AuCIa5nnvk/N" ..
        "+Fe4Y7HHNPXEZ4/SQKTRqOf/BucY7lBj/Q7uuO9+emY2d06EekAS/RTAb0k2jyksWpsXGrQeYfL26312YjXl4E44/sL7+hYu+HfcqfLR8S5ABXNtjaadDHd4" ..
        "D+7oaUAFlZKn+PytIlXtL4vJLNmJ4iu/oMn/c7jA39o5r+0uXYET+HZhfXSxegOaOap7FT+nNQz+bSkd36DZ/2deD+C6JR10snx0TRAwYBVIVt9P4AKDb8JF" ..
        "nofRmpZV9eIAvkttDsDXDFr9Lj0zu9pMKwvuNOCncAHWH8OdiAiptivytJo2aDl9Cpfw8wWFP9/pstCVBMBNOwqXJ/5juMyxe7QELqP6UdxZ/Mx6NFXpFO0p" ..
        "x30r1Faf0hf/shXZarlsphfu3P4TuOq7H8Nl5g21aB21xRR8ljJFao/xkseMZ3wOFyhe6gbh72oC4KaV2vT34fLGb8L3jBuFP5tuNXRUWybuSnOKFzRZfwng" ..
        "i/TM7EYL17OXmv9HtAT+I9e0F/6kpdWQo74tuPP9R9T4n5JIlxpRkWgxgIuBdT70PbhClCvwqaivwaX4jiJa7fh5QP73Id/rOnx57nfUXN9o4W/FWTUzBV/Q" ..
        "7B+hC3BA90oyMFs1ck2P9Nqi5n/AWMl9uJz/1U4O+JkFUF1ryQhs6Qd4D66c9GP4pqDyc832aU8CGv8lXM3BU7go9dcAnp5XtL/ONR2ie/UDvr5By2ocfjhH" ..
        "b4P+XZicA+mHsMZ13OD6fUntPwdXI5Hvtv3f9QRQYfP2wyW1fFghNjCB8iCh3nzFClo7mJASxvctBjT+EtwZ+wJNVtnICzRfnzUyyaeB6yjpvK9xDW/DNzS9" ..
        "DFf7kDxna0CaoK7DD0JZ4TqK9fSklW6TEUD7ksA0tf9r1GB3+fkkXu0skwi8xgIfC/SAzZIigpjSVMfq+ytwOQvin67DJdscgKW07Sj8ah1HKew34Bub3qWL" ..
        "NQk/h1GyKWNqHYOZgYXAesYr+PaSzyHJVVIOvUgT/xu4JJ9lkuhqrXJjI4DuJoIRaiwhgdv8XHeXlUsPntQ95+IVtJJknkkW4rEKTu3BR/ifw0X2/0gzf+sC" ..
        "rmGKcRTpsHyHFtY0XYJR+GIocbN0485EDQ0vA0z1INNDtZYvqf0f8HoO1w9xx3a4EUDYGEGaG1b3GJygFpumfyu1BUIItXIJdpVJvwHfHGMbPkI9R7P18UVP" ..
        "SGGfwwnlSukGKKNc1zF+LGt5Ce5Ithr0lGNp/iol0CvwHZBW4Hs1dKWvbwTQGCJIcUOOUPBvKq2mG2RIWW9KWQOCE27cdfrxL/i6Dj+Db4VfXwdw2Ekbln36" ..
        "pYvPBPy8vkn4pigy+EQHDHW1n5j70u3oOfyY8yP45qcLcIk+u3ANXI9tJxsBNNK/lWk315WFMKg2rZBAQvn1MnZ7DS7At8QN+5Jm/z6AjW4ITJFUR3mNKctg" ..
        "UlkAAyhvzlpSbtOOWr8d+B4MqxT+TRN6I4Dz3MADSpsN8hKhD8YCimrzSn9BqT2XISZFACedMngywjpq/78f5TkDup+fJtKCWssDFQc4orY3H98IoCUaTSLY" ..
        "MfUqk2V0eSsAFE1DhV7bnsB6xpRFIAR7bP69wWAwGAwGg7kAzTFNYwBi9RSRVJop2G1mrFrDSvuyBKBkpr0RQDtv3jMJbZAEunmz67UwoTcCMBhqEaZOpbag" ..
        "qhFAW23US3BHWQW4UWGm0epfSxkEIklBsn9l3Foc7ghQaiSMCIwAGroBU3i1538soIn09N4k/CQiGX8lffPkHFtq1I9RXigEpdGOumRtExX2ZgI+HXgAfqhL" ..
        "Sv2MJFzFuZYyCi3HzxFY21K35VkYAUQ3L2ViTx98kY9sUklI0RVsMvLrEnzyj8wSlEk1UvwjjTKPFQEcqO8VFEkcww8k3YNLC97rkHWWsWrDXDed7hsPEKg8" ..
        "B51iLXkAKfV7R3BJVS95yUgxSRrSa74Ll3G5ZQRgkE05CJeCKoUpMrxTb1JdE6BJIak2onwtpX5GkoGkH10e5e3Ij9UlMwUkZXgZLr11g0RwQJdi54Ku8xBc" ..
        "GvUNuBLrKbi8f+nILEM9dTZgIvAaR/mEJaC8JDhPQpA1FaE/gCu2WoIrtKraTKWTJgAZAZyu8cW8HIPLRZd89DT84M4hpYlSykKQDRrMUNMWglgFOhtQNqjO" ..
        "DjwObOBdRQAr8ENHd+E7BG0B2Gt3MqCZ38N1TsOPQL8HPwa9L0Cuem31nq3UJFXM/FgFQpB0YRntvk0CeEQSWKbFsANgl/MjzALoEo0/Bl+FNk7hH1VEIBN8" ..
        "+5Vmkjz/lLriFTYpUL0ffkGZp0B5fvtJQGvtwFcK7lDoxcxd5mZegGtwkW83TcYKwAGur260Ik1WJuBHofcEiDYeiI2UTtm3pQARFxWpHimL4IDruEbLSjoG" ..
        "zcF1CH7eiZOAjQDwt2hyH1zhzhRcJd8NuKq+cQq7+KdSkdYP35xC+/0yobYH9TUNDU4ORiBAmEf5qLEjtXmDfQMewPW5W1cuwmGbrHm/0vr34DsDXefXB5Sm" ..
        "j+PVKsp6cYLqI9rEHTuAbw/+EK5J6LckVokhHMAVaeWNAC628I9T6K/C1Zzf4MfT3IhDKO9MozW+7u6j21KdZahlcNqP/E29WeMBEzevtNkhySBH4Z8jISzz" ..
        "4yft4BqQdG/CNVn9IYC3qPllzRMBq6kHjekVWED5yLBSBStBiGCTbtYTWgM5dS1wTTtuUlA3jQcfo/Z5kxvwNjWQdKqV46WewIasZ2LweUNv7CL88dcGN/I8" ..
        "/My+B632aekCvAHgPwP4D3wG15Rr1Q7QPQZ24cesz8H1ZfyKMYOFTio1Tna40PfS1B+hsL8F4G2+3mCg75IKNtWLWhOFG42gduyjMF1hkGuaP5MHMJDLZlYl" ..
        "ltCiY8R++FZfcsIyiNPbpoUZ9Bmv8nvxOmVBjh6n+LUjrqX0fBgGMJHLZqQF2X56ZnbbLID2FP5hCvhtmp+3SALX+Pll+Mh+J+GYm1Pahj+hFpuD64g718xO" ..
        "uNT+03Bt1v8ebn7g6/Btwdsdh4wPzHE9n9HNWqWl9fQid29KdrDwX6PJ/y58b385zhuhfx+jlowHgnBoU9M/qB2Dbcbl6lUm9i34rrhjAPo4vWe7SdZAkms+" ..
        "Ct8xKdgnMcxwj/Nez2C7dvk4SYtgEL678QoJdhhAIZfNFC9qe/FkBwr/CDX8+3Cjv99RASd91JRQpnQ8oulZrzsQBWGEIVaBuMRF6BeTFb79tjThfATgeS6b" ..
        "WQLw8pzTjePwR6Y6uFcMCJ8m3HrX8CzkHatiFUtWovQlHKb1qJVIP0l1/aIFCZMdJvwy9vtduGjz2/xcmnX2Nkjwav1+sQn/IywkvtFHIpikFvuWVsHTXDZz" ..
        "ntHtAvyJhRxrxlA+OSl4tl9ralKxyjrH6lzfeMifkWGxKUUMKeVKxriWh0YAzRf+CZr6H1H7v0WfXwZTNnOmX7u5Dn0kQSmmGYEPjo7SGliGy41vdBXdCXyf" ..
        "/k3wTP2Mghpv0TqLJaDXtV/FkWQa0dJFkZt4hwj/OIX/Zww0/ZiBpstnFP5i4Kr2MzrZJIz5WkB5c9Ba76EQ4n3Ues6iqSbhsvA+Uuv1M7pKlxv9bOhebDAO" ..
        "8YLCsUoyKNb5TMK4CZXWq971C5LAAOMpV+hu3gPwAa9bzDC9EIhdYKGXib6jfAgfAvg7buwp+Jn0YgKfR6CpoAhAzuYrJZ4E17pSzUAc5YUtjQxw6fvOw8/M" ..
        "24BLcHkMN2X4c8YHGj4mmxbaxwA+YWzmdfgxa7oSsJIAB9e50j1KCXZwPmOjkoqqkfIuyWyBLtW/A/gd3OlA2/ckSF5Q4R+geX+Xwn+XWu1duPP9gYDPGFbw" ..
        "a50h66GTeZTn7ety35PABtYZaDqFOKl8yQR8taEuIuqNINxhrLweFZTrVxaSvK8BAN/mspmFBm/gHZLMJi2B9/ncrsIHKgdRnu2oKyfz6nMReCmZlpkKumRY" ..
        "z21MqXWtti5RFEQ8sK+kbDnF973Hffq83eMByQso/P3UHG9Tm9wjGUwof79eF6faz+uS3cMK1x5f9+ELTsTEzysCEGEPlrqKUOoKwz5l4QxV0WL1WAtFZW30" ..
        "w4/QBnyp7Qnc8dZqozYwyWQ5l828hEuvFa0pqdhX4CLsksB0gPJSXv0MhEwL8ANWTrimI/Al3JLhOaBegyPbEme0DHtQnj16pOIcR3B5A+YCNEDwhd0naT7+" ..
        "gNdr8NVkwsKNCFxpDS+sLgU4UlYq5t8mPxcCkC4/+QABiID1Ki3ci/JpuBKxlypFCWT2K8GV302cgQD0vR7wHubgCmLuw50SfA9g/jy0WC6buQFfeTlKC2BE" ..
        "WTyVeiTkFVlpAtjlx3L0KaQpY9qk6jMNP5xUyo91A5ez4pjk9h2APwP4PVwK8XK7WgLJCyL8PdwcV+Eqyt7hdZ0Pu6+B9yImpXTh2eMm22Twao1EsAdfUvq3" ..
        "Cjz42X/5QFCwhPLiISGDfm5W6XJT5KZNK/dG3+cA10IKl6KSQLzCHrjEj/dIYAkKTYxfO4+o9jLXLanIT9wSqa48UcKv4wElvFruK/EeOenQ3ZyGSDDXuaaS" ..
        "Bj6sCGKwAcojRYJ5HeX9HpDLZtqSBGIXhADG4ZJ53oDP53+dpuMAyvvwRSnN1UkoonX2KOxrSrhfonzktMzy26NFsKV81kidaRnM7IdvGFLgph3j/V0n8U0q" ..
        "N+cK/ADNXpQnNZ0lOLjOexE//Q8A/gXAt80sKCLhJ1FnT0SmHyeUyyUTnSdRPsxVphKLCzKCcLkitSwrIc2v4IqyPqdltQpXP5A3Agj/MEf50N5hkO9Nmv1S" ..
        "yafbbcVCCII+BtJ+umh+aSq5DHd0tUShX1MCsqd90nMykQeUdTBKEpBx5LfV/V9C+UBNsTLqKYo5UO7OAnxF4WdwTTIubDNNrmefsgbSXNPbVCaiUHRnokRg" ..
        "v8RDEoAEPZ8D+IYu1XdgLUE71Q4k2/yhXaJJdZva/x5N4ukzsHU8QABH1HhS+y3CL6O7lwOCf9CMTr3UuPsA1mklrCprZI0Cehm+i1FaEUKqzqBWSgW18hSK" ..
        "LeXezF1UAlDrucEU6GGuoVh1qyRYsa7S3GPxCPtKk0A//86xcvWKfIZtQwCxNhb+Hm7se3Bn/B/R9L8Jf3Yc9mivGnsfU5ieMOj1CL4ZxLoK+O2iDSbP8ixd" ..
        "8vq1SXubsZFb8GfrZ0GRAp+DO9v+A4BfA7hfrYHmBbYKxuFrJK4qN/M9rutZqkUPVezoIVx+wM/TM7P3jQDC+XGvw+X0f8wHckf5/WfBkTL3X8CdT39GEpij" ..
        "wO+3ayIH1yZOQb9Nl0gandxjkGsIZ08qOqKG/AzAL+GSXB5e9Br4Ksqmh2QgJ0w/5b67ooKkUXFCEtjmvvotgP8L4NN2ae/ezgQwROH/r3y9C3csNoz6M7vk" ..
        "2Ggdvl7+IbXcI7ha+fULtnkvw5+OvE1r6R1uXKl+TJ5hzY7gMgV/C+Df4LrjLMB1Iu646TtcT7E6P4FLWLpDi6unir9/2n6Tk4xVAH8C8P+4jkvt0H24nWsB" ..
        "einwEvSaIhOfRfi3aeLfB/AbAFkA/8DN/ZDfv2i+7RpcP8Av4c6e/wgXdf6O97rJDRjVBSiq5zBN0/hdkswtAKOVJhtfdHA97wP4FYB/BPCvcPkQL1Ge8h1W" ..
        "wUqG5zB8V6q3cA51F/WgnYOA0rX3KvzgiHrfb175tI/hott/oim20gGbdieXzeikmUPGL+4xZqKHaoQh/WB5rjyLu3CBUDmPlwy9TiOBLQBbuWxGWoOPKOUT" ..
        "tWOxkIB0Rr4LF1hezmUzK60e/daWBKDaSE8xQBMU/ih529JXfwe+YOMzAF92gvCrTXvEXnVCdocor10vwnc8jtd49kHXUGb0pan95ahw4yJaTRGwStfwAeMD" ..
        "Me5H7Q6EgTyHYe5pCdT2cS3NBQgI/02UR/yTFd53vIbpCmrDDfi++d/Bnct+l56Zne9AzXWcnpmVTSvpvI94/4uMfUiWYq1GpvGARSANReTU4QaAyzyq7Ujw" ..
        "1CdH9/AbruUKfB5IGPlKKBKQ5qiSjtzysuF2jAFchqur/glcZHsY4VtF6TFbR9ROq/SRv6Jv/A1Uamsum+nhOXsnbdxNuCSUrxkb+JafSxHOAcL1ItAWgaQn" ..
        "SybdNWqzkU6LBQTuZ4tu430SwQr3lW5sEsUKKJtGxUQ3cwG48ENwEddPAPwI7nhrOMKf0KW4+/BTc6TA5TFccctOgOU7ES9p9cg0XB3AisEXwtRCEeVjuuPU" ..
        "gJKDsAZfK9FJml8+3me/vyR8P8AxEmJcvVZbO/09qfIchQus3gCwnctmjlt1IhBvI+HvpW/0JnykeRyn13AHF1sq27Zp+i/CJfl8T/P/KdooC6sJm1iSnL7j" ..
        "GjwnKe6GcAOqaTAZmyaJM1fpE3fyWso04UW8Oqm5UOcaSjrySCsVcTu5AFLm+zrNo3qSfaQn/hof2HNqwQfU/OudeHZdgwQkBqIn4W7VYcLqTTxATSgzFScY" ..
        "u+lk7Kl9tQjf4zAfUd564MuWpRox0dUEQNN/msJ/C9FysIMWwD59Xa355tDZ0erTSOAYLvg3RwtoXmkwGYEVdY/00Ay+RhK4jPYZ8XVeyMM3MXkBP1L84BRL" ..
        "Kl6FQCUYmIY/DehOAqDpL3ntV+AHRiYjmKhSey3z4Fcp/F+RCDY72NcPQwJCii9oFc1Rk60zPhAk0lqQ/gxX4AKCHU8APK9/qQhgiZ/vRrACpJVZP9fsOq+x" ..
        "VgVS28ECGIaf1iuTe6Q5Q5jovwzH3OPDWIdrwyQlmC1PtmiTDbxNrfUEPvV5kWt2EoEEpL5+WJH2FDdxqsOXcQu+TFxXie5HiAUIAUzS2r1JpdfXdQTAopYJ" ..
        "mpLT8F1vovpEBbhEn0Vu7G+50Ve6WfNXwDa11/dwJyLL/FrUQJb4sSPUZNPwdRqdbgVswveG2IRvDlMIKW9JFQMY4/6XOZVdZwFIvv8t+pJRynyDBPASvhfb" ..
        "VwAWTfhf2cCHNF0fkQDm4ZODwu4LmTEgHXfHacFdh0sM6u3wNdyl1n/JSwKqYfeaNH/t5esg13C8FUlV7UAA49Qgk2TBqL6Q9IXbgDvv/xKu68quiXxVEpAg" ..
        "6WNaTbo0NUyhS1JtZqkTuEZTtrcLllGOmrUFIE1gw4yFk5qMOMpHp3cdAci0mjH4Tq5RLYA8H8IKff8FntsaqpPAHny7qifKCqhnck4/N+80/CSmTscRNb/U" ..
        "QkgrteMI7pQcCUqT11EAl5odR2kHC0ASS6SPe6VOt5Umxggkwi1ns6b5w5HAS7hjwYeMC2zABVNrjTcrBb4vffakW9FwJ5YJB3CsCECCgEcRSUCqBPvU/u9H" ..
        "k5OCWkYAZDppyax7uEfpZ6e1/xJNsiP1P3pM1F9Zd70mm7SaJB4QNSAoG1k2sVhy3XAkuKvM/0NFAPmQbpTUrMRVLKAXTU4KaqUFkET5hNqRkASgK9WOGYiZ" ..
        "57UVyOO2IOCrmzcf8GXn4YKm38HlT5zUWP9Y4Pvix44oK2CwC8hXz44QEhDtHySAShaVWLJCADLCLNktBCB50dLSWhYgCgNKdpZ08N03EY9MBuvwtRJCAPW4" ..
        "ciPwDUtbmt7aJEjymeSfSGp1qQ4Z1LMiu8YCkDNROQ6RcVm13lMx8BC2lQuwbWIdmQTW4I4Fv4fLC6iV1FLp+Ug+hxS39HYBAUgCmpwGSEagTH6utWYJpfET" ..
        "gaurLAA9JTcMdBBKGHgTwG43Ffo0GGJFLcMFto4jCAH4DGWAySAaO6qtna2nYwr+NnwANer+70X5PIaucQH6ET3opzeeTPIRE+zI5LjuzXwIn+e+ABfZjnoc" ..
        "KEdaEtDthgCs7MF9EkAxggsgx4B6lHkKjRlu294EwIynIV59Ed9HCb7uX0ZDR8nFNlTGFtxx4DPGBU4ChFus8iwEOsV1GN2RECRWgIyJO4lAnHpuocTAervF" ..
        "ApDzT+lKk4hIANLlZge+pNUI4Gw4pAvwggRwrIS/FPK5pLqMAOQoTwjyJPB5WBJIKTe42A0EIMG/fuUvRokBFKj5ZUx3vtkL16EEsApf5homDhAL7KW+LrQA" ..
        "juCPAIvqCpsLcILyPpZH3UAAWlP0ob4YwBFN/6gNLg2V4wCynjsob3UVZQhGUsV2kl2wbAX4hKAjrkGU8fQx+CY22/DHiR1PAINwdeTT8K2Rw2pwiQEEmdfQ" ..
        "OI0mGW1ay8dDPJcYfCAr2enJQGy0sg7fZ1GUWyIQOylWiaeUuNZr8B2G9rqBAC6BbZHhK6DCCrH4WnlEH9VkqB2bias4S5Q9UlI+bdMTWlqIDfjmIEeKNCVj" ..
        "Ml5B5nQm6ybdrgW4zlWHHU0AbB55CS5hpJ7qv2Ig0FIwEmjIc5GW1f18HuKfBn39sAQQ74Z1U+XV0iVoC6+mU5cqKLhDav7nvJbQgkK2VjyklPIRExG1hRb6" ..
        "E3XlLe+/IdpfTmZi8MdbUfaJjmonumjtNinE38NVWG6i9jGqVGM+gDt6XWu2/99KAtCBvxiiDa0UNtVnsBYEPDvkOcS4nlHXNR4g9Fi3LBybzyzATWL6gkKd" ..
        "U+sXzPAr0HV4DtePYaECaTQFTY3UMiikz/+DedBhrQDJA5BKLCOAs0NiKzoIKK5WPOReCkvknQgZKy6RfQlOX6mwJltw9SsL8H0stlthxTb7qEa0f0ppiTiq" ..
        "D/usZgWcKAI4NAJoCEpK82vrKkpsJdati5eemd3KZTOaSIVAC/CThaV/xQu4RizztBS2W1XH0mwCkMq/BHwP/2LETSYJE/sMmuy3wnTqQEhuegI+1VrINRGw" ..
        "FOKKNKCeYUF9XOpSEigoC0COCa9xbSXZ6hEvGTZ62Kr3nGzB/0vAn38eRRBeHf3Pwyet7CN89Zrh9GcjJdkF+AKXQkiNL4R+jPrq4jsmHpDLZubhp1MvwHVN" ..
        "7iepLtHvX2QcYKeVVazNJoACXs2fDvag0xpGfyw/J2esx3QBdowAGh4LOEblJKtq1prudJvvdlLmRGFpULMCPznpiBbACtqkfL3ZBKDTd/PK5xSfSQu71i75" ..
        "Cu6CNGbcSs/MHpjcnhkn8KXVUl4drLHQpzAIkIFYdjKZeb/Lx7EdA8jlspk9Cr1YVnutGgXecgKgedRPvyiH8gGVRVSvIZfI6hE1vqRfrqHJqZMdvGEPctnM" ..
        "Ftd1Cr7hZT4g5NVOBbbhzrOly/COrerf0oXbtlVdKwo29ugXSTbgGFwrqYka7zPGTfUM7rhFWliZ9m8cdrmmaRK0tLzWA1uCwn8IF81+BOBTuMlMD40ALgaa" ..
        "fmZLRlyEG0rxBQV5Aa+WoBaULyoR/wX+zp9IAquWAdjQZ7NH62oRboLwHHyw6rhCjGAbLqD1ewD/ACDLj59wGKmhzdGyc1vmnt8E8Amvd8FRyfBtkXTrrxW4" ..
        "9tW/p6Z5wQ1raPyzuQrgHoAPAHwE4E0+m0G6AVLEskgi/iM1/zOLx1wstKxmOz0ze8xI6V+4meYAvK5IoJcEtUdff46b7Wu48V8m/OeHdZrxYoXt8hnI/LpD" ..
        "av6/AvicP7tqwm8WQD3apgeuMcgNAHcB3IYbFDrM97dLTfOMm26OY60M5/9sJvlM7sIP/xwiATwQf99mMRoBNGKzyZjkKfh56XH42X8rANbMt2z6c5mgRTZM" ..
        "7d8HdyKToxtmwm8E0FBrQIhAUoYP6SJsN7tZgqHsuaTgazdKAI7ZRsxgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPB" ..
        "YDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaD" ..
        "wWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBiag/8PVfWXWNBvEqEAAAAASUVORK5CYII="
    ),
    save = (
        "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAAs0UlEQVR42u19WXMiW9bdYhBolkolSjXdulPfHm63/UX42X6yHfYb/4cfwP/hl9iOsDu6v75T" ..
        "3ZqVmgeQQIAfztp1NqcSiSERymSviAwkJCHIc/baw9kDYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8Fg" ..
        "MBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGBJAzm7BIKJGfRVAGUARwBKAPL8v8TkA6AHo8/4t8fmcuqfydT+4FnEd9Gfrj/nZ+2M+1wPQ" ..
        "BXDDxx6AKwAdAK1KtXZmO9wIYJjglwGsAljntcKrDGAZwBq/BjdXH0CBz5X5dY6EIY+yIWUzDrvnuQyvXUgA/eBnoxJAfwgByGvKPb7m1SERtACcAzjhdVap" ..
        "1q5txxsBaOFfA7DN6xGvDQCbJIMN/mxNCXaPmn+FBFHglVcbW2ukpC0AIwAPuccdAE0AlySBJoX/CMBHAPsADkkE15VqrW0EsNiCv0nhfgRgJyABeX6LlxBA" ..
        "MdDyJV5a8PNqs/eUy2AEMDsC6NDcFwKQ6wzAMYX/E78+AnAK4ALAZaVaaxoBLJbgL1G77wF4BuAJgF0+t8FrTRGAPC8uwVJAAvlb7mm4cZO65/2UEsBt39/2" ..
        "GXO3/E4PQJsE0KLgCxGc8zrmdUoCOCQpRAAOFjU+kFtA4V+ntt8D8BWAVwCekwTWaM7LJfGAtUD4i+Y4PTiIC3BNEhAXQJNCi1pfLIJ3AN7SPTgkObQXyTXI" ..
        "LZjwbwF4AeBrAN+QAF7SCqhQyIu8JMBXgj8VKJicPXiIO3BDq+BGkcMNCeGYmv8drw90DyISwWGlWjs3Asie8D8H8GcAPwL4Tmn+HQCPqfURmPQm9OkmgzD+" ..
        "0FZxgYiC/4kk8IYWwa8A9ivVWssIIBv+/jqF/XsAfwPwF1oAT+njy7HfKOiN6L8a7h/5EX+vQ5fghPEAsQZ+o/D/RCI4rlRrl0YA6RX+MlwA7wWAHwD8EcCf" ..
        "KPzPqPXX6dePg57JWmqFX1sHTfr9QgCv1SWuwX6lWrswAkif8Jfgju5eUPD/ShJ4BRfxl+O9ZZOdhcUNBvME3vHxI4X/NYBfAHzIamAwl1HhX6LwfwXgDxT+" ..
        "H+GCf0/gMv4k068Af06vj+pyE2oWw8NCL4gB6FyNLtxpwSVc8C9ibOCQJPATgL8D+BnASaVa62Tt5mT1OGsj0Px/hgv6PSExlOAz97SQ90zoM+sa9JTgCwrw" ..
        "WZyS1LUNl/+xTsJowh0f9kgMC+03pUH7r9O3fwEX9PtBaf5Nav0S4qP7eRP+TBNBfsjzZSqNx9wne3AB4pfcO68APIka9Q2zAB6+6b/FxXtFF+A53Bn/ljL5" ..
        "JzUjk8a02Xx2CpGcgivxfha5LtfcR5dwuQPXAJpRo97NUupw1rTdMoVdMvye0qSTY77iAxL+20hhlMuQPArwZeCrdAVe0n38hvtpg4rGLIAHiHWa/rJgT+CP" ..
        "+XIxQj0KAZpLsJiWwwqVRw7utOAY7pRgH+7osGME8LDM/xJcRt/XcMG/7+GO+9aVeWcwjGIFlEkCyySCDtyx4AZ80NAsgAeGVbjgzStaAK/gingK8NV7ptUN" ..
        "d2l+qfIsKUugCRcg3IYvGLs0Ang42n+J7LxLs7/CxSrTfMsp038c4e9hsJ5fOgHdFRe4rfVVP/D14/5fXOlwmKegG5Dc9n8fKnIJvuecugoxj5NYAYIy99Jj" ..
        "7qsdAJ+iRv08C8lBWbEANuCPb8L03uKYml+6+HTgm0y04aLAbfV895bNexcByP/oBeQk5axCAqFw9wIfdUW5Nz3c3nZsHMwi0Bg2/7iLAML3kL9Dc0vwTlq0" ..
        "Sacmadgyqdme5/7agwsIvqE7cMz9YAQwZ+2/AhetfUES2OBiT7qBpa+cdJM55eM5/JHQFS2LYQJ3W+ebPnx5qiaALlzCibx2HAHcqHVbhz/alKy2m4RcnN6M" ..
        "CCA/5H70R3gPBcQ3GNWdmZbpCm7Ad3GShi6rY5BAaCmWqflf8PqdJHBhBDB/LMMV9nwLd/y3qTTiJKx/Q59P0kHf8/GIRCDNJrq3uAJ3EYB0sAktACGX7hAC" ..
        "kOeL9EUlKJW/4/1MagXMwuQflQCA29uHhe6QaPoVCr0kg72EO77bgW/pNspn1ySQJ4FU+Jp7vPcHRgAPw/x/CZfz/w0XvjThBm5T+I8p+D/zek0SOFHC38ft" ..
        "fepG2WC9GMvgJngeMbEDCVLpbsRJ5yvMkgAmeQ+5EVyAvLKO9uBOgs4Ct2qV927U9yrrJElme7x2o0b9IO2NQ1JNAKq33xP4zj7bGL+8Vwv/CVyDiNcA/gng" ..
        "H3B14p8AXFgn2VTsizUqgmMVw5Esv6Iii9sIJc4akD6Ru7QG3keNejvNbcbTbgEsw3fv3VY+8bh+cFdp/o/08X4F8C9aAO+y3hgiS+BaXUaNugRzu2qvrCG+" ..
        "+cttJ0TiZiwpEnjM/XZBC8MIYA7af1kFeCQivnQHAcQtdFf5/W8p9D/RCvhgwp9a7HNdQYF9Bt/9uRDsiWEujx74EsYYtuGCxKdpvUFpTojJwWdqLVPw5Vx8" ..
        "ku4w11xIaQTxGq4bzLnJUaoUQ0ly9SvVWqdSrUkK73taeE2Mn8abh8+7KMGfNKwj5Q1l0k4AMplnjVdpwteSCHtLWQFv4pidKceGh72nw33dgj/ObcIfl44L" ..
        "sQBWA6sztSimnAAkb1vGdy0rjQ6MfgyoR3ld0nQ8iAvuWBDwwaMb07lHugFfcH07Q5TAKAQgyiYTreLTbgGIFbCMLyP//TFfS+5FG0BTC3+Wyj+zjiFtu/IU" ..
        "+tsIYBh0hqXEAWRAzF2jzYwA7oEE8vhyWo9OrhnntcQV6IY/MxJINXo0/c+GxABGzUYUq1n2W94I4OG4AvkpX2No0omZ/alHG35O4DQxAJGZIgYnQRsBpBz9" ..
        "wGKw3gHZwg3cKY8UdE2bNZkLLiOAOQntXXnk/SHP92Ke66qrP6JvaUjPXunCV3P2Eng9GAFkCyL8s6iEMzyM9b1B8kVTMALIjgtgyLYFIMVWfSOB7LgAorGn" ..
        "NcW0T2eEkE0CuKuRyyT7xQggI8hMYMfwBXoYjPFM4+Zlao8UMyS4/YReJ/NgTsPnI6xKtXa1ABZA2N+xn8BeSf2eyVJX4NwYv5ef8G/TLPSSwSYVk1I81Ysa" ..
        "9RZcr4NWhq27WSofI4A5mXWzmJSTy6Dwr8MPvZTyaclll0YoB1GjfgDWt2fw2LOAwU7K5ualmQAq1VonatTlWCcpEshnbXOwaWoFblbC13CzErfh6idycB1z" ..
        "zuGqID/Blc2+YburrPRBkHRxsX6MANSNSTN0e+1+4PNNUgw0dGOksRaA7/kJXL/E/wTgvwD4bwD+J4D/AeC/A/ivwXP/GW6k+vOoUV/NMAFYADwDMQAblnm7" ..
        "2b9L4f8rgL8B+AstgW34MlZJkb0AENFFEAEpRo36R8YH0uwSCMFnooDHCODLIExSgzB06ecXLkeKhH8TrhX2HwD8SAL4Aa4lVtgOSw/SKMOfqEifhTUAH6NG" ..
        "/aRSraW5D/6kHZzvUjypVj75jBAAEiSBVC8qzfZH9Pd/BPAf4Ial7lHIdSpsLyC9MuMFP/Dv/g3An0gc6xkoiU46zTv1BJC18eAGp7FlgMVXfKzAdUxags+K" ..
        "iyuIKvL3ZEzZFVwrrRO4wShpHout5ymaC2AEkEm/X7ok78J1rd1Upv0y/NjrOCtQuisV+Ltr/Htpub6G9La/kiCgXBYANALIJPIUcmlYKUEvCYCFAzHiWqT3" ..
        "1d9I63Uhj7QSgJBbiY9mAWQkBmD4Uni1X6/bWY9z9KVn7S0h5Y0v4SP/VuuRMQKwBR1ED64F9gVchl8hsAZGWX/5m1Vqfq0x0xrw6t/xvRGAIf1gJ+MmXGaf" ..
        "5PWXxzDfe8o1LCt/OQu5FpYzYgSwELih9r8JfF8t4KO6AXqYZhasLCMAI4CFiANIgxQdA5jEvSoqC8Ki50YAhhT6u9No7hwFXw/CSDMsXmQEkHnoAilMaPLq" ..
        "U4RwEEaaBd+CxkYAC7GmucAd6I25H/rq+0IG4gB2CmAEsFBrqtNdp2mDHZZJ91JMAD1lHRkBZIQAzJz7ErruPZfAeueQjb4R+nTECMAsgOyB1XpluLz9FWW2" ..
        "9xLaK2l2AW7gCpluYDMBMkMAdq47CJlfv8WrrDb/tP6zuBZp3is29SmjBGCL6s3/DbhKwG24VN7+hHEAnU8gpbTLNibdCOAhxgAsDuDvxwpcGe8aLYLchMKv" ..
        "h2kIuUgn4TTfH0MWCCBq1GUzpvl8OmmIqS/pv5Oa7CEBSInwUkoJoI8MtfEyAvAaqaS0Um6RLIMhpni4uae5D5oEpFuQ9AZIKyz4lzEC0JVuuUUy94Y0KV1R" ..
        "Zr8O3k16/CeXbg6yxo7DaXQVbShIgGIGCKCE5Pq8zcU8HBZYG7UTcdSoS/uuJ3DtwFaVa1SYgAB0C60SBX8VLsC4CaAdNepFFR/oAehUqrX2OJ/3HjstS6ek" ..
        "5QTjGH0jgPm/99IEBCCmbX6Ij3ifMQw9oy8X8zt9uLPr67gBnhSkdQA7cJ17n8I1An1Ea2AJ43UD0l2EPmt8Cv4jkkuPP79SLkIbwHXUqF/e1To8atS3uGaI" ..
        "GvU2gCv2MZglCvD5Ecsx+z435v7JTCwhzQRQwGCTx9SYdWzdLTP6ljE8z/5zBhuFpQN/lp3j34rmf0EC2INv4lnG5EFSERp5rztwTUbyJJdrCr9k2F0DuIwa" ..
        "9Qu4piRX/FleaeB1XiV+hhaA86hRP6tUa80ZWwC3ZUiaC5BSAkh62GNuxoIvAzhEm25TwJYCn1u0i5zfS5tunckmgrhB4dzltcPXXydBLE1BAJJY9IgC3uf7" ..
        "lZZjMptRrisAl3Dtw8/4fkXzCtmJxdYjURwA2I8a9RNaA+0Z3X6t5e0UIAMEoAtVxiGAYePBZ3pywPHcWxRSMdd3lUYMCaAXuCpiDVwrM3yFlzbVN0ksGwG5" ..
        "jKop9T0pKgIAhfkRBbeDwVOCvNLqRwCO+Tvioqzxd7rq87UA7PN33gM4jBr1i3twCQwZIIB70doJYpXm+bdwU3uekQA24Pv1CwHogacF5SLcKNNbTPQl5beX" ..
        "FRGsKQtg0nyAJb5OX7kbTQwW1ehEoRx/dsqrqwhghX9zpT7fFYlQCCLH15+1wjAXIEMEkAaff4ma8xu4IZ3f0W/fpoCsKCHNKTO/r2IdYja3KUDhsZbu/7eM" ..
        "wQDjNDGWdRLLBv93R5n8Orc+r8jrSlkqK0r7twMCuKHAP+X/uYYbUd6aQQwgC41NjABSihJcfv63cBN6v6fW0+23dTMOPa9PxzmAwfTcHL7M19dabtqNLiRS" ..
        "VsLeU1/rgZvh8E3dYbgAf1rQVj+X19njPYoA/Aw3imyAQKc8MswFBGAWgBHAvUI0qBzTfcXvZQzXQ1+HcY4RMeR3exTAleB3C7wX1wB+BfA8atSPKtXaqfxh" ..
        "gvkCOWSjv0GiC2vwmNXZrvjBEq3fgT8SK2ZsP+Vv+Zmcgqwo12BZkeO3AP4M4JuoUd+Z8TobjADuxf/fpr+/RzdgA4OFOr2YK9Scd/3OQ8Q47zdHMngJ4K90" ..
        "k57w2DQNBG8uQMq0/G2ZgIltEh797cJF/b+hlluL+d86dz/L/mkPXzYe1W7ScxLAJeMBH+gaJGH6WyWgWQCz1Q4xOf0lav9veT2LIQBZhzDYF5rV4ZUWd0C/" ..
        "3zDPICSAClyA9A+8V8sxhGowCyA1KMEd9YkL8DkP3hCriNboJlV4r6z7kFkA94IwSSSX4P3VRUv6DLoXuCSLhNt6880qI3OSrFEjAMPoiDmu6tKHveQlWXx2" ..
        "7+NxA59FeIkvm5ma/24EMDONJG2jkxwcccONfMLrQhFAqJkWbd8VYu7VGVxtwAfer25C/086I0sKs3UGMgL4YvO1KKCtBDfeDV/zCC6qfRRDAou6Bl0Sbpv3" ..
        "XIT/nSKA6zssrHH+1zX/z1XM+i7s6YAFAQcJQNexJ2VZyMZ+D3fMtcX7vrqg2j8kgD5J4JiC/zvv1XGC6yBFSK2E19csgIxATMSbJF0AlrWecWO/hkt1fQNX" ..
        "A9/EYGFNJ/i+O8QS6cZc92nS6unDvSE/697xPrvB77ZpGX3ifXpNa6mT8PqaC2AWwJ0bBUg2SnwB4CNc6qvU50tdvEzv6SE+OBi28+rjy2KgMLpdUM8XExD2" ..
        "sEV4GMEPm5iExBBOFsorrd+G7yFwwvv0G62A44RrAAALIhoB3GIJSbVYIUkCqFRrV1GjfgTfYSdHzXYJlxsQNsrQSTP5QJBFCG+C35EkIvkM0i5dCGEaQhRB" ..
        "vebVCUhAH9npZh+hf61Ll6WsWfzxJoC31PxvAXyqVGvnM1pjOwY0AojVECJAhaQ3SKVaa0aN+iFfW4T/CK6Pn5QF55R27AfCnQ9M7BsMRtI/j+6CLzJax/Rl" ..
        "wT0K/TktmQsKbSdG0+fV+9fWQz9wX8TNEp9cAoAfAfwTwPtKtXY2g/W1PAAjgDs3ycxaglWqtYuoUZc+eGLuPofviLOiBKgXbFxtwvYCgoDSsGtwtQcVtb6F" ..
        "EeM9vZjfkYYdR4xbnJAMWjFxigIGG7RqAugrodfXBYVfTkkO+PUs3bsk90nOCCAbkGOiK5qmvRmRQBNAM2rUz7nR90kAT6ixCxjss5e7w6QtqI0tacdXMQIp" ..
        "8xPGhWj/QxLWPlx0/kK5BuLHL6krF7gJ0t68SetH2oqdwyX9HAG4nGEvwDA+0U+ICMwCyAhkMx7zcabHRJVq7TJq1EUg5JhwVVkAmgD6QzZeXrkrRbgy4wqf" ..
        "X1ZCr7sFjRoPuFGuyqkiq/fU1Cf8WQu+9VcxcKH6wWfQR3HSWuyKgt+a8foKqequygYsbjlwLoYATqjpzuDbVs2SBNoAjqJGvUXTdylGY92meUSwpcvOY25y" ..
        "meAjrbglIHjXTL98jOl/RgI4USTwiY+n/J1r5T6E/rUmANG+IoC9e+z+KxaInq1gWGACCIVLtLH4t/eWKELtN5UGjBr1TfiWWzs00ZvKpRmW2xDn94uJLFF/" ..
        "SZC6IBEc8DoF0LrH8V5JrHuSLoARQMZI4bbkmweNSrV2FjXqoKY/wWDf/nGDVWHQUUx38ddPAZzOIFI/S+hegHYKMMTsW2RoH7mQxg1CgTyn8OtjwtuaiNzW" ..
        "v0/78xIkbSrLIo1rnDPhNwIYdh+SHjM2D8gJhiQdTZrYlI8hRBlP1p7h+K5ZQfIPJAhoLoARQLoRNeqlmBZk4tPHTR0eZ9Pn8GWLMp2ElDbIFKILZSF1bRdZ" ..
        "DEDHAFI19vkWLRw3BHOSzxOazKklgEq1dh016lcYrPY0K8AsgExC++rTJjWFZJLmI7Q0tVQ3AjBMhA585t4xfMruuH0HwpLfz2O9mM2Y1r0+TjKUEYAhdZDK" ..
        "ulO4JJ6rCddZu0J6YnE7xfdG11EYjADuNHnTvMl1kGuazyRpxrocOc2ukQ4CGowAYjd82t+/HAGGbcgnea2wVXpqtSfzJE7pIrVtqxsBDDOh+ylfzxJc3r+e" ..
        "OtybQPiFDLN0fi5NX2+GuDxGAAsK7R+meTPoQSSi/Sf5PLIvdAnvFdIfQbeTACOATLsAfcSf3Y+y6fXvFJTffArfA6CTgf2et31vBDDM3y2kfIOE2n6ayHcO" ..
        "g007shQ8s5MAopjyRewhvvfcuCjA18yXUk6Mn8/sMdjAsz+mUEhD0Ev4XoD9DAh+1wggGxaA7pA7SZBLYwm+kcYq0pssomcRNpXJPqpV048RFukJ0MkIAVhF" ..
        "YEYIQKLTbYw3HCNu8ctw/fR2AGwivSO8ZRTZMVwiUAc+KFi4xecfth966h5noZXWCgZPR4wAUk4A1xNszmEE8Aiup952WgmABUKncB17jnl/ckOEP2yUmRsi" ..
        "/HIEeJOi7j9fgF2THsMNYynF7ImcEUD6CCD0c0clgHyMC7DOzRHrAsSU3j5UEjiBb9t1Aj+W/EZZSjq5J2wvLsIvw1IvlQuQVuEv0b3bJcGXTfc7pNkU0uOq" ..
        "pvVNtSCksiNQgDO45p0yaXeLn2lFab/8EB+5Q4E/UkRyL41SZ4gCP/smXLPUJXMD0k8Ak6KPL5thijuhm2iGmjVNGrBFwf+JZu8SP+Mu/HTiECL41xT+13CD" ..
        "TN/x+zQTwEwnPxkBzG9Rk2rfJbPqpBNuqoNdlWqtEzXqx3CDNtcxOEKsGDwnwq/LiD8A+HcSyMdKtXZkomIEkHVkrWlki9pbtJ4+CbjB4Ciycwr9W2r93wD8" ..
        "QgI4zMC9sE7ARgAjEUBmTMRKtdbmQFKZ2iO+v6T3ynFnmyb+7xT4nwD8TPI4rlRrp0bwRgCLAIkDZCHhRZOACHeJsY1jxgU24KLh13CnBW+o9X8B8HulWjvI" ..
        "0Nqmqt+jEcD9Q4ZgZqXoJYwHHNAMvoAL7m3AnwjIDMADcPRXBn3+JNPGjQAysBlCM/CKwi9n55lqGFGp1ppRo/6Bpn4R/hgsD99B6BrA9T0M6pyn+Q9zA4wA" ..
        "4iC99KToJXM94zmI83qB11iOAo0AFKwceHCDxH1tyMbaiuWzZPveCCDuPliiSLbXV7s+tr5GALGxAQsQZZ/kLSdgwQkgTsi7cNFwOQa0nnGL4+4ZARg+l74a" ..
        "ASyGhWdWnhHAF5tD177b5FiDEYBpB4PBCGBR7kOYIGMwGAEsCKREdhMuRdYmyBqMADKKuEywElyjjMdIcU9Ag8EIYDQCCFFWBLBJV8BgMALIKAHkYywAaQq6" ..
        "FkcAaWkKapg5MhUwthiAQwGuX/wqrQG7L4ZRiMAsgAxZQgXYKYDBXICFhbWMMhgBLLhfp7vGGAyZhzUEGSSBcWYMpg5Ro16Gi3PIFOQcBttkybSlNlx3oI5t" ..
        "CyMAQzaEfwtu+OkzXnLceQM/aLUF1xptH8BR1KhfAGgbERgBGNKr8ctwR5sVAC8B/AHA9/y+jMGBKKcA3gP4Fa5L8BGAi6hRl36BbburRgCGhy30yxTsVWr5" ..
        "x3CTj58B+ArAdwC+hRsTtgRfBi3afwcuHXoVbr7gCVzX4AtlEbTsThsBZDEGkNpTAE7AXYNLZtqhhn/K60nwWIFLfJKuwB24pqhSCyGZkR/hx4WdkgzOokb9" ..
        "HEDLiMAIwPAwhH8NroZhB8Aetf0LavwXFHxJc17lpdf+ht9LReSyshr2SQKHEhuAa59+HDXqxUq1dm4rYASQBe1/6zHgQwuE0b9fodbfpkn/JBD853xuG24Y" ..
        "yDLij36LfC0ZIbZGMjkjoUQU/i1+vUYSOYwadRgJGAFkjQjS4Odv05QX7b7H6ytq7ifU4noK0G15H9INuaRIRdyCbV6bfM1t+LqJQtSo9yvV2oVtHyOANEN3" ..
        "jX2ogl+mgD6iL/81NX2FFkCFwl+hsC4rwZc8B6g4h3zWXvB9nq5AiXtkWbkOW/z/mySAEoAiB5E2+T96dnRoBJBG4S8+RBKIGvUVavJ1Ze5/BRfNf04LYIs/" ..
        "k6/L+HLGQT947KnvC0OsgjVFAiv8H4/4P7b4vrYlLgA3XekyatTPK9XapVl4RgBpM//7Q4RwaR5ajea+RPQr6npFEqgobbxCkkiyq1FRWQTL/F9CRuIePIEL" ..
        "Dh7y8ROA/ahRP6xUa2e2tYwAHjpu4GYCXsKdid88AK2/RC2+S2F/RRLYC0z9Lfgy5hKvUPh7U1o1eeUOyKNYBWu0CI7hTwjkOHE5atRX4YKJnTm7BdIHwupf" ..
        "goVdRE0f5vtLFtyRbNbwj+5z89Lk3wPwRwB/4/UjgL8A+BNN/2dwkfoN+Kj8CuK7GU2yzr0hr1MOXJFnyh35nu/5z3y/P/L9fgdgj2QQR3T3IfzhZYCNBxe0" ..
        "7yKAexR+aU32DVyQ7yv6+XvK95aCnmX4YZdJa7f8HT8rB9aBBAk3VVxgjxbBJ7gU437UqA9YAvdErH1Y63cjgDtcgBZdgHsfD07NuErN+pha9XtqTn2WL5pe" ..
        "hL6A+w9a9tTe6SsyWOElgUFJQ34Cn158DXdScHzP6yvZjm0kM/kpM9ZE2gkgKTafm3aIGvVNpeGf8HqmNP8uhX+dgrakNp3ehPdFAmJp9Eg+kjjVJUG1lTuy" ..
        "SeGXysMrAC0mD90nCXRJPkkSfCbc57QTQFIMLMEtCaTl70HwpRHpK7gKPTnT36Pm3KU2XVcC9ZCOKOV96IBjGT6tuKBcgnUSgGjetahR/wDgHMDVPdQU9Cj4" ..
        "TUUA0wZGe1lwJ4opF34xgXMJ3Ic1+OO04gyFfo0msiTzSPBMovw7/J015eMvpWStJB4gcZYVCpsEKlf4ub9hTOAAru+AxF4uZpQ7oIe/tklS0xBAF76PQtcI" ..
        "YH4EMIklEPd7S9ykEmCb1X3Zhj+/l0u+F40vkfwk/fse7tdykCQk0Y6SLyDBzSO42oJPcBWHbwD8DuBd1Ki/TzqtuFKtdaJGXQtsbwxCu7mFUIwA5ohesKD9" ..
        "Ke+DRNXLSHg0GI+6RPP9AcAPvF7Rz38EP49gFoKan/PekiSiLcY3WjT/9wG8o+XziOSbixr1fVoDSZ4QdJXmnmav9FXMI/Ut5NJMANLEokk27geL1JvANSgM" ..
        "E/5xMwGZwbeuLAsp1PkaLrr/PXyQb+UeSVNXPPYweCyaw+xPFgq8L+uKdCX+ItWNHwCcRI26rO9FAhmFPWX6J+G32ynAPFGp1lpRo341hAAmYXXt1021QVR9" ..
        "/p4y8/co7I/gz/RX73ENpOGnmK6dGGEoKkFcwuwthxLdg6eKGHbhSo4lrTgC8CFq1PMALqewCiwRKGMWANRG7k4ptL27CGCUjRc16hvwke8nFPwf4LLjdmkN" ..
        "SCBwnfdf/nduRua6+KuiTVtwkfC2spLkGFGy/GZVGdkLTHLANx8pK9I8oXvwAcBb+PTmiEVGY/UmpAsmacvLCbh42gWwGMAc0U/QpJv4SIepu1twufk7DHZV" ..
        "FAF8C58MI8IlEf6C+v9QZJCfQLDyigylzbe4Smf0u8/hKvba8FWAUvq7QrIQMiorIkj6yCynPv8SfE1Bhe/xMXwvg7JyEz5EjfrxmJaATH/e4WNpyr0v1pSc" ..
        "KhgBzBFJmHW6UCQfvpbkq8dtOtVuW+rzpffeLr9+Sa0mGy83g3uvOxp1lZkvwbZT+HLdYz53rYS8pPzvR3AJM9JMRBcZlYcI913kMAp5dNWj9DKQ4KyOpZQB" ..
        "lKJG/ahSrTWHaPtwrcoBQa8M2UPDiDV3SxDQLIA5C38SZqpugFEILQG9mXiWv4TBopg9CrrU5z+Fr8uXgp3VGd6HggpyiWa6pNY/oDn9Eb7JpxBATgm39Bx4" ..
        "RAKTJiPb8OW/smf0fc8n+BnksaiErxwQgDQ+fRc16gcMEDbvcNXyitzEDZtmz2mrackIYP4uwLSkIcGv5WHBL9VuWwJ82/DddyV994WyAMIy3VlCtP41zXvR" ..
        "+ocU+rdw5+wfSAhS8NTHYCNQ3V/wGcnsmdKcopnlPhURX3o8LTHkVSxCjg8fKVJ6BuA3AK8BfIwa9ZOQCGLIZVURcXHIvsAIz0usZAM+wckIIOXIYzAVuBDj" ..
        "48uCS7GObrn9mAKyw436CD79dVboKa0vvQwu4OvydbLNW7hkm098/jwwb3PwjUHX+Tk+wEXgjzGYoryuNv5yjD+dT3BN5DRiVWlwIQApMvoVLqvwMGrUm7SA" ..
        "WpVq7SogALHapj3dEKtp4x4sOyOAETZJEqnA8lqfj8HYf09MUC3cYu6/VNpxG74Tz8oQ4e8lLCBS4HJOrR4pc/+IgivHafLz41vO06/hWnmd0UI4VdcJL2k/" ..
        "JsGvdWXlJDVWvRfEY8QlKCk3QMqipey4gsEhJqdRo37KGEgfvpaipFyYaeWmnEAw0QggIQLIJ0QCBWVy7vB1d5VPLMG+Z0oLPVbBsqLSNnHvtZeQ4Msgj1Nu" ..
        "/NfUhO+UIIjwXlIQWreYyDre0YbLz5cci3NFABf83E34xqCbivzKM9hTmgiEkFcw2KPwOYnvQLk++yTBG0XSo3RHHtX11AFBI4A5BwFzCSyomMHrFOw2N51o" ..
        "eyGAXfW1aKLlEc39STee5Dp04avaxL//HcBPAH4mAUQU+iZcpd1EiTOVaq3J/PkrIRB+fQY/QmxHuT9iBQkJFKcQ+Nuez6v4g1gFzyj80pfwE+/FPq0VeY/r" ..
        "CRCAPgXowVKB5x4ETIKFtQ+8Q4GXKjxdrBP6+NKZpzDElJ3W5JdjPS2Ax9zk71Qg7DV9/EMA50kN8eTrtEkEkkx0SIGSkuUXFMAr+OxGbR4XMV3izbD7uKzW" ..
        "TGYVnJAEtuGrLq/5+EQFMfNTWGe5hPeeEcCUBDBuMVB+iOmv01Iv4c+cZcKOaLmBfvgjaKxx/N44H79JrStmuAT1fqXWf0vtdzGKiT8hEZyTBJrUqrqc+ZSu" ..
        "wRl8tuOqIkjxv/MjfOZx72MRfuKRuAaryh1ZJzGtqPjFsFOAhWwWmnYCEA2ZhAVQpnDv0W98zI2lz8PXlP+ZT1Dbh38nGXwX8GmxH2neS+nsr3w8qFRr17O+" ..
        "0Wza0VJptVLDL8lGEXytw2NlMUlcJUmBC+/3EtdFH2vK6UGTa/sEydRf6CGyScWejACmdAGSuhdiKuaV5tiGP9NfwvTR7mFkoctVtfCL0L+BP8+XYN9xUub+" ..
        "GETQAdCJGvW2slAOleBX6EJdwR+ZyRGcFpjClAQal8uxCn+cK0HCJn8mFtxyAtpekoFS32bcWoINbqZV+F53N/AJHysJmfvD/Eyp0gvP8w9UoO81H99S6891" ..
        "ICetjmuevR8qX3yPloGU3kpKslhPOjawFNyTadyCcHaBnPm3+LNNFQScds+F1oARwJxJAAmRQJ4kkONmLKlgExIkmtDcl8i+HGFJK+2PcAk5H+CSXT4CiO6h" ..
        "h97YrgEAMIdACo3aKmYh7oB2pdbhg69JQucQ9JXlsYLkMjIlPiOf0whgjsKfT9gXK6vNk0RyiwQoC0OEX9pkH8N3yHkPn7q7r/zts4ck/DFkcK5ODE7gTil2" ..
        "6FY9h6uVkOKoLnyG3yz2oc4kTJJo5Cj2TMVAjADm+P6TykDTmHWBh3SpPVeC/5HC/47C/xufP4FL4kmFpiFBSaGOBOdkmKmkITfhKw63ec3ing/t8DRmnCk0" ..
        "+9vwpdWXRgBzAFN1dQXfQ4U+Yxaf+BI+VfeD0vrvlcn/oVKtRWldH4kRALhgWu6F+vxNEpvMQbiBT58uIpn+A8DsAnTWFfiBvHc9wz6uS/C8AjSdwJKQjSh+" ..
        "/j6FXaL6b+GP+Q4oLBfICCrVWjtq1A9p1XTVPXhK1+CUVoIE6pYDy27csu9ZRuZlX81jKpMRQAwBLA2JAcxL+KXNliQp9ZXW022ufoM/3vsAF/w7o7nfQcbA" ..
        "1OIDRQCHivCOMFh6LNOFhQQemoVXQLrmNWSSAHIBA/fnIOhx2iYfaHzx8cXPF5P/LXyQ7wSu4WUb2UaTBHCJwSIj8aWlT6Hc22Vl3d3n+LNR9t4sBrIaAYwZ" ..
        "nJlHHnYv+P9dtSkkhyBH/3cfwL8D+Ac1/if4XP6ImrD1kCP7SbsCcLUFV/CNS87hIunXGGxl1oLP3dd9GnQfRZ0CPqumqsP2nvj/FgOYE+S4qXPPi5AfEhSS" ..
        "JB55T+dwyTv/B8D/5tfH1ILNSrV2ggWFyiaUNRSBknsYwTf82IIvO5Zc/7vqMGYt/NJ9yZqCzhGSOdfClyOf78s66Kn4wyX9eTm3P4AL8P0Drlz3E1J0nHdf" ..
        "FkHUqEtG4xV84pCMFpdeDFKQ9ZhkK0Qwj/0r/RgkY9PyAOa4edq4fdzzrElA+/ofKez/gCvU+ah8/7NFMfMnXMcz3kMhzSW404DHcIlDf6RF9ZK/J12BNuaw" ..
        "hyULUE5qrowA5ockZr2Nq/F1HfgNN8F7AH8H8L8A/F8A/6Kff3UflXpZcQlCbRo16tLFWAaanNMaqND07sI3D9WBwiRdg/6QfSf9Ga6NAB4OZjUFtwvfbrur" ..
        "NusJXET/FwD/BPD/qP33g6aUhsmI4Txq1CXQJicqp7QEpFpS9wMoqUuO6aYV/jh38vMkqbS7dFnqCNSPeT6XkPBL803J/T6jn/+G/v1P8Ln7p+bnJ0oCzahR" ..
        "f0+f+xS+5fk+fBuyLfgmoWvwjUikccssFE3qswCzQABt+CBgH8kNqxBTv6v+xzl8cE+KdX6l9n8LV6VnWn82JHAF4Cpq1OXER08u2oKfyyDDWNbhszHj9vk0" ..
        "+yO0Bo0A5ggRzHMMHsf0J1xYYXa52sr/PIOLUEtk/2d+LUG+jonqzIngKGrU+1wLGfSxw7hAh+slpdVX8EeyMuOwEBMnkISyOEhcQe8nHQC8NgKY74ZocSrM" ..
        "CQajsf0JmD48i24qs1++/kSN/3ea/Qem9e99zY+jRv0CvoOzNB8pkAAuSAyb8AlGUl8gsQHZ93dVC+ZjlIn0aJQEJiOAOeMKvge+tPLuBf7/OAMsxcSUvH3p" ..
        "sy9+v3Tn2Tdff24koBOJtLsm7cof8bGlLIMt5SYu3SH8ekJzIXhegr8XWTjazQIB3FA4D3mtBmZdXpFAnFXQU6/TpvAf0a//CX701IkKQJ2Y8D8MImAOQYea" ..
        "/x38sNan1P6SbahrDG6bWyCnPNJERIigp/aZZHTCCOBhxAH2aZqXufgSCb4tXbQHn8rZUWZ+RC3/M9zRngzcOAPQNl//YVoDAM7YI2INvlX5tXLpLpV10IE/" ..
        "MSiN4PtLbEHatB1nwfzPkgvwFu4MXrq1PA0CP3HowPfb1xV7MlVGBmq+S3NjjgUjA2lUKlpfio6kx6JMcpaRbjLeTFqHxcUFrtQ+kQrOY6S8BiBLBHBBMz2H" ..
        "wbRgGde1GiyoJPGcU+Clz/4vfPwEP0L7slKtnZpopY4IzkgCl1zLbbi6AhnrJrMdn8KPeZNBJjp56BqDDVpfw1V1HmaFAHJZ+BBRo77Mxf0ewL8B+I8AvuMC" ..
        "S6aY+Pktkob4+b/S1/8XyeCoUq1dmhhlAxztvkpNv03NL6Pdn/OSykOZalSii3hOjS+j194o9/D3ebdmNwIYXOgyWf2PAH4A8DUGu8vk4DvzyEjtt2ph35ip" ..
        "vxBEIGPNHitrQNqVS1xghQRwGeyTt/BTiE+yUOeRy9gib8BHgGUktJwBF+Dr9s/hR0jvw03YOTExWRgiWOa+2ITvObCmhF9aw8vpwiF809ZTANdZOQXKZXCB" ..
        "xYyTS3eT6QUxAPHzLbK/eEQgXaWFECRJSB4lbiSFSEeYwyg2I4DJFlc6xkjWlxwHSsJIB65U17L4DEIG0l9S9ovuQdjmfrGeDgaDwWAwGAwGg8FgMBgMBoPB" ..
        "YDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGgyEO/x9PcNpFeYkUYgAA" ..
        "AABJRU5ErkJggg=="
    ),
}

local EH_B64_ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local EH_B64_DECODE_LOOKUP = {}
for i = 1, #EH_B64_ALPHA do
    EH_B64_DECODE_LOOKUP[string.byte(EH_B64_ALPHA, i)] = i - 1
end

local function EH_decodePNG(encoded)
    local out, outCount = {}, 0
    for i = 1, #encoded, 4 do
        local a, b, c, d = string.byte(encoded, i, i + 3)
        if not a or not b then return nil end
        local x = EH_B64_DECODE_LOOKUP[a]
        local y = EH_B64_DECODE_LOOKUP[b]
        local z = c and EH_B64_DECODE_LOOKUP[c] or 0
        local w = d and EH_B64_DECODE_LOOKUP[d] or 0
        if not x or not y or z == nil or w == nil then return nil end
        local n = x * 262144 + y * 4096 + z * 64 + w
        outCount = outCount + 1
        if c == 61 then
            out[outCount] = string.char(math.floor(n / 65536) % 256)
        elseif d == 61 then
            out[outCount] = string.char(math.floor(n / 65536) % 256, math.floor(n / 256) % 256)
        else
            out[outCount] = string.char(math.floor(n / 65536) % 256, math.floor(n / 256) % 256, n % 256)
        end
    end
    return table.concat(out)
end

local EH_EMBEDDED_IMAGE_URI = {}
local EH_EMBEDDED_IMAGE_TRIED = {}
local EH_EMBEDDED_NAMES = {
    players = "AvatarInspector_EH_players_v7956.png",
    save = "AvatarInspector_EH_save_v7956.png"
}

local function EH_getImageURI(kind)
    if EH_EMBEDDED_IMAGE_TRIED[kind] then
        return EH_EMBEDDED_IMAGE_URI[kind]
    end
    local encoded = EH_EMBEDDED_BASE64[kind]
    if not encoded then return nil end
    EH_EMBEDDED_IMAGE_TRIED[kind] = true

    local resolver = nil
    if type(getcustomasset) == "function" then
        resolver = getcustomasset
    elseif type(getsynasset) == "function" then
        resolver = getsynasset
    elseif type(syn) == "table" and type(syn.getcustomasset) == "function" then
        resolver = syn.getcustomasset
    end
    if type(writefile) ~= "function" or not resolver then
        warn("[Avatar Inspector ICON PNG] Local PNG support not available for " .. kind .. "; using original drawing")
        return nil
    end

    local success, uri = pcall(function()
        local path = EH_EMBEDDED_NAMES[kind]
        local exists = false
        if type(isfile) == "function" then
            local checkOK, found = pcall(isfile, path)
            exists = checkOK and found == true
        end
        if not exists then
            local png = EH_decodePNG(encoded)
            if type(png) ~= "string" or png:sub(1, 8) ~= "\137PNG\r\n\26\n" then
                error("Embedded PNG decoding failed for " .. kind)
            end
            writefile(path, png)
        end
        return resolver(path)
    end)
    if success and type(uri) == "string" and #uri > 0 then
        EH_EMBEDDED_IMAGE_URI[kind] = uri
        print("[Avatar Inspector ICON PNG] " .. kind .. " loaded from embedded PNG")
        return uri
    end
    warn("[Avatar Inspector ICON PNG] " .. kind .. " failed: " .. tostring(uri))
    return nil
end

function EH.embeddedIcon(parent, kind, position, size)
    local uri = EH_getImageURI(kind)
    if not uri then return nil end
    local sz = size or 22
    local success, icon = pcall(function()
        return create("ImageLabel", {
            Name = "EHIconPNG_" .. kind,
            Size = UDim2.fromOffset(sz, sz),
            Position = position,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = uri,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = 0,
            ScaleType = Enum.ScaleType.Fit,
            Active = false,
            ZIndex = parent.ZIndex + 1
        }, parent)
    end)
    if success then return icon end
    warn("[Avatar Inspector ICON PNG] ImageLabel creation failed: " .. tostring(icon))
    return nil
end

function EH.icon(parent, kind, position, size)
    local suppliedPNG = EH.embeddedIcon(parent, kind, position, size)
    if suppliedPNG then return suppliedPNG end
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

    if kind == "players" then
        -- Smooth, symmetrical shoulder curves like the reference icon.
        -- No half-hidden UIStroke / gradient: those produced jagged gaps.
        local function curvedShoulders(x0, y0, cx, cy, x1, y1, steps, width)
            local previousX, previousY = x0, y0
            for i = 1, steps do
                local t = i / steps
                local inv = 1 - t
                local x = inv * inv * x0 + 2 * inv * t * cx + t * t * x1
                local y = inv * inv * y0 + 2 * inv * t * cy + t * t * y1
                strokeLine(previousX, previousY, x, y, width)
                previousX, previousY = x, y
            end
        end
        -- Rear person first, so the front portrait reads as a single shape.
        outline(14.7, 4.2, 5.5, 5.5, 5.5, 2.1)
        curvedShoulders(13.9, 17.1, 18, 10.5, 22.1, 20, 8, 2.25)
        outline(4.5, 2.7, 7.2, 7.2, 7.2, 2.1)
        curvedShoulders(2.0, 21.0, 8.4, 5.4, 14.9, 21.0, 12, 2.35)
    elseif kind == "viewer" then
        -- Four scanning corners, eyes and a small smile.
        strokeLine(2.5, 8.5, 2.5, 4)
        strokeLine(2.5, 4, 7.4, 4)
        strokeLine(16.6, 4, 21.5, 4)
        strokeLine(21.5, 4, 21.5, 8.5)
        strokeLine(2.5, 15.5, 2.5, 20)
        strokeLine(2.5, 20, 7.4, 20)
        strokeLine(16.6, 20, 21.5, 20)
        strokeLine(21.5, 20, 21.5, 15.5)
        dot(8.4, 10.8, 2.1)
        dot(13.6, 10.8, 2.1)
        strokeLine(8.7, 15.5, 10.5, 17.1, 1.75)
        strokeLine(10.5, 17.1, 13.5, 17.1, 1.75)
        strokeLine(13.5, 17.1, 15.3, 15.5, 1.75)
    elseif kind == "items" then
        -- Stacked layers: trapezoid cap plus two thin horizontal separators.
        strokeLine(4.0, 8.1, 7.0, 4.2)
        strokeLine(7.0, 4.2, 17.0, 4.2)
        strokeLine(17.0, 4.2, 20.0, 8.1)
        strokeLine(4.0, 8.1, 20.0, 8.1)
        strokeLine(4.0, 13.0, 20.0, 13.0)
        strokeLine(4.0, 18.2, 20.0, 18.2)
    elseif kind == "search" then
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
    Header, "AVATAR INSPECTOR v7.9.56",
    UDim2.new(1, -182, 1, 0),
    UDim2.fromOffset(16, 0), 15
)

HeaderTitle.Font = Enum.Font.GothamBlack
HeaderTitle.TextColor3 = Color3.fromRGB(255, 248, 242)
HeaderTitle.TextSize = 17
HeaderTitle.Size = UDim2.new(1, -182, 0, 27)
HeaderTitle.Position = UDim2.fromOffset(18, 3)

do
    local subtitle = makeLabel(Header, "EVENT HORIZON / 056",
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
print("Avatar Inspector v7.9.54 loaded successfully")

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
    warn("[AI-DIAG] AVATAR INSPECTOR v7.9.56 STARTUP ERROR")
    warn("[AI-DIAG] LAST STAGE: " .. tostring(AI_DIAG_STAGE))
    warn("[AI-DIAG] ERROR: " .. tostring(result))
    warn("========================================")
else
    AIDiag("12 Protected startup completed successfully")
    print("AVATAR INSPECTOR v7.9.56 INITIALIZATION FINISHED")
end
