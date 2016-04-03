function loginPlayer(username, password)
	local account = getAccount(username, password)
	if (account ~= false) then
		logIn(client, account, password)
		for i=1,30 do
			outputChatBox(" ", client)
		end
		triggerClientEvent(client, "onClientPlayerLogin", client)
		outputChatBox("Вы авторизовались на сервере.", client)
	else
		outputChatBox("Аккаунт не найден.", client)
	end
end
addEvent("login", true)
addEventHandler("login", root, loginPlayer)

function registerPlayer(username, password)
	outputChatBox(username .. " " .. password, client)
	local accountAdded = addAccount(username, password)
	if (accountAdded) then
		for i=1,30 do
			outputChatBox(" ", client)
		end
		outputChatBox("Вы зарегистрировались на сервере. Пройдите авторизацию.", client)
	else
		outputChatBox("Ошибка при регистрации либо аккаунт существует.", client)
	end
end
addEvent("register", true)
addEventHandler("register", root, registerPlayer)