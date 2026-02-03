local http = game:GetService("HttpService")
local player = game.Players.LocalPlayer

-- Iniciar sesión (puedes cambiar tus credenciales aquí)
local response = http:PostAsync("https://www.roblox.com/login", {
    username = "usuario_que_quieres_hackear", -- Aquí pones el nombre de usuario
    password = "contraseña_del_usuario",     -- Aquí pones la contraseña
    rememberMe = true
})

-- Extraer la cookie de sesión
local cookie = response:match("ROBLOSESSID=([^;]+)")
print("Cookie obtenida: " .. cookie)

-- Usar la cookie para acceder a la cuenta del usuario
local request = http:GetAsync("https://www.roblox.com/users/" .. player.UserId .. "/profile", {
    ["Cookie"] = "ROBLOSESSID=" .. cookie
})

print("Respuesta de la cuenta: " .. request)

-- Acceder a la cuenta de Gmail (si está vinculada)
local gmail_response = http:GetAsync("https://www.roblox.com/users/" .. player.UserId .. "/gmail", {
    ["Cookie"] = "ROBLOSESSID=" .. cookie
})

print("Respuesta de Gmail: " .. gmail_response)
