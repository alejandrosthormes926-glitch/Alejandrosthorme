
```lua
--// Alejandro Luag Script
--// Contraseña: ale.123

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

--// Variables del Script
local ScriptName = "Alejandro Luag"
local Password = "ale.123"
local MenuAbierto = false

--// Estados de las funciones
local Estados = {
    Velocidad = false,
    AutoAgarre = false,
    AntiAFK = false,
    AntiLag = false,
    AutoDinero = false
}

--// Crear GUI Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = ScriptName
ScreenGui.Parent = game.CoreGui

--// Bolita Azul (Botón para abrir menú)
local Bolita = Instance.new("TextButton")
Bolita.Name = "BolitaAzul"
Bolita.Size = UDim2.new(0, 50, 0, 50)
Bolita.Position = UDim2.new(0, 20, 0.5, -25)
Bolita.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
Bolita.Text = "🎮"
Bolita.TextSize = 20
Bolita.TextColor3 = Color3.new(1, 1, 1)
Bolita.Font = Enum.Font.GothamBold
Bolita.Parent = ScreenGui
Bolita.ClipsDescendants = true
Bolita.AutoButtonColor = true

--// Esquina redondeada bolita
local UICornerBolita = Instance.new("UICorner")
UICornerBolita.CornerRadius = UDim.new(1, 0)
UICornerBolita.Parent = Bolita

--// Marco del Menú Principal
local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuPrincipal"
MenuFrame.Size = UDim2.new(0, 300, 0, 400)
MenuFrame.Position = UDim2.new(0, 80, 0.5, -200)
MenuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MenuFrame.BorderSizePixel = 0
MenuFrame.Visible = false
MenuFrame.Parent = ScreenGui

--// Esquinas redondeadas menú
local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 15)
UICornerMenu.Parent = MenuFrame

--// Título del menú
local Titulo = Instance.new("TextLabel")
Titulo.Name = "Titulo"
Titulo.Size = UDim2.new(1, 0, 0, 50)
Titulo.Position = UDim2.new(0, 0, 0, 0)
Titulo.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
Titulo.Text = "🔷 " .. ScriptName .. " 🔷"
Titulo.TextColor3 = Color3.new(1, 1, 1)
Titulo.TextSize = 22
Titulo.Font = Enum.Font.GothamBold
Titulo.Parent = MenuFrame

local UICornerTitulo = Instance.new("UICorner")
UICornerTitulo.CornerRadius = UDim.new(0, 15)
UICornerTitulo.Parent = Titulo

--// Botón cerrar
local BotonCerrar = Instance.new("TextButton")
BotonCerrar.Name = "Cerrar"
BotonCerrar.Size = UDim2.new(0, 35, 0, 35)
BotonCerrar.Position = UDim2.new(1, -40, 0, 7)
BotonCerrar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
BotonCerrar.Text = "X"
BotonCerrar.TextColor3 = Color3.new(1, 1, 1)
BotonCerrar.TextSize = 18
BotonCerrar.Font = Enum.Font.GothamBold
BotonCerrar.Parent = Titulo

local UICornerCerrar = Instance.new("UICorner")
UICornerCerrar.CornerRadius = UDim.new(0, 8)
UICornerCerrar.Parent = BotonCerrar

--// Contenedor de botones
local Contenedor = Instance.new("ScrollingFrame")
Contenedor.Name = "Contenedor"
Contenedor.Size = UDim2.new(1, -20, 1, -70)
Contenedor.Position = UDim2.new(0, 10, 0, 60)
Contenedor.BackgroundTransparency = 1
Contenedor.ScrollBarThickness = 5
Contenedor.Parent = MenuFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = Contenedor

--// Función para crear botones toggle
local function CrearBoton(nombre, descripcion)
    local Boton = Instance.new("TextButton")
    Boton.Name = nombre
    Boton.Size = UDim2.new(1, 0, 0, 60)
    Boton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    Boton.Text = nombre .. "\n" .. descripcion
    Boton.TextColor3 = Color3.new(1, 1, 1)
    Boton.TextSize = 14
    Boton.Font = Enum.Font.Gotham
    Boton.TextWrapped = true
    Boton.Parent = Contenedor
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Boton
    
    local EstadoLabel = Instance.new("TextLabel")
    EstadoLabel.Name = "Estado"
    EstadoLabel.Size = UDim2.new(0, 15, 0, 15)
    EstadoLabel.Position = UDim2.new(1, -25, 0, 10)
    EstadoLabel.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    EstadoLabel.Text = ""
    EstadoLabel.Parent = Boton
    
    local UICornerEstado = Instance.new("UICorner")
    UICornerEstado.CornerRadius = UDim.new(1, 0)
    UICornerEstado.Parent = EstadoLabel
    
    return Boton, EstadoLabel
end

--// Crear botones de funciones
local BotonVelocidad, EstadoVelocidad = CrearBoton("⚡ Velocidad 2000", "Activa velocidad super rápida")
local BotonAutoAgarre, EstadoAutoAgarre = CrearBoton("🖐️ Auto Agarre", "Agarra objetos automáticamente")
local BotonAntiAFK, EstadoAntiAFK = CrearBoton("☕ Anti AFK", "Evita ser expulsado por inactividad")
local BotonAntiLag, EstadoAntiLag = CrearBoton("🚀 Anti Lag", "Optimiza el rendimiento del juego")
local BotonAutoDinero, EstadoAutoDinero = CrearBoton("💰 Auto Dinero", "Recolecta dinero automáticamente")

--// Sistema de Contraseña
local PantallaLogin = Instance.new("Frame")
PantallaLogin.Name = "Login"
PantallaLogin.Size = UDim2.new(0, 350, 0, 200)
PantallaLogin.Position = UDim2.new(0.5, -175, 0.5, -100)
PantallaLogin.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
PantallaLogin.BorderSizePixel = 0
PantallaLogin.Parent = ScreenGui

local UICornerLogin = Instance.new("UICorner")
UICornerLogin.CornerRadius = UDim.new(0, 15)
UICornerLogin.Parent = PantallaLogin

local TituloLogin = Instance.new("TextLabel")
TituloLogin.Size = UDim2.new(1, 0, 0, 50)
TituloLogin.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
TituloLogin.Text = "🔐 " .. ScriptName
TituloLogin.TextColor3 = Color3.new(1, 1, 1)
TituloLogin.TextSize = 24
TituloLogin.Font = Enum.Font.GothamBold
TituloLogin.Parent = PantallaLogin

local UICornerTituloLogin = Instance.new("UICorner")
UICornerTituloLogin.CornerRadius = UDim.new(0, 15)
UICornerTituloLogin.Parent = TituloLogin

local TextoInstruccion = Instance.new("TextLabel")
TextoInstruccion.Size = UDim2.new(1, -20, 0, 30)
TextoInstruccion.Position = UDim2.new(0, 10, 0, 60)
TextoInstruccion.BackgroundTransparency = 1
TextoInstruccion.Text = "Ingresa la contraseña para continuar:"
TextoInstruccion.TextColor3 = Color3.new(1, 1, 1)
TextoInstruccion.TextSize = 16
TextoInstruccion.Font = Enum.Font.Gotham
TextoInstruccion.Parent = PantallaLogin

local InputPassword = Instance.new("TextBox")
InputPassword.Size = UDim2.new(1, -40, 0, 40)
InputPassword.Position = UDim2.new(0, 20, 0, 95)
InputPassword.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
InputPassword.Text = ""
InputPassword.PlaceholderText = "Contraseña..."
InputPassword.TextColor3 = Color3.new(1, 1, 1)
InputPassword.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
InputPassword.TextSize = 16
InputPassword.Font = Enum.Font.Gotham
InputPassword.ClearTextOnFocus = false
InputPassword.Parent = PantallaLogin

local UICornerInput = Instance.new("UICorner")
UICornerInput.CornerRadius = UDim.new(0, 8)
UICornerInput.Parent = InputPassword

local BotonEntrar = Instance.new("TextButton")
BotonEntrar.Size = UDim2.new(0, 120, 0, 40)
BotonEntrar.Position = UDim2.new(0.5, -60, 0, 145)
BotonEntrar.BackgroundColor3 = Color3.fromRGB(0, 150, 50)
BotonEntrar.Text = "ENTRAR"
BotonEntrar.TextColor3 = Color3.new(1, 1, 1)
BotonEntrar.TextSize = 18
BotonEntrar.Font = Enum.Font.GothamBold
BotonEntrar.Parent = PantallaLogin

local UICornerEntrar = Instance.new("UICorner")
UICornerEntrar.CornerRadius = UDim.new(0, 8)
UICornerEntrar.Parent = BotonEntrar

local MensajeError = Instance.new("TextLabel")
MensajeError.Size = UDim2.new(1, 0, 0, 20)
MensajeError.Position = UDim2.new(0, 0, 1, -25)
MensajeError.BackgroundTransparency = 1
MensajeError.Text = ""
MensajeError.TextColor3 = Color3.fromRGB(255, 50, 50)
MensajeError.TextSize = 14
MensajeError.Font = Enum.Font.Gotham
MensajeError.Parent = PantallaLogin

--// Funciones del Script

-- Velocidad 2000
local function