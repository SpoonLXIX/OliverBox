extends Node

func _ready():
	##Connect the lobby created callback
	Steam.connect("lobby_created", Callable(self, "_on_lobby_created"))
	Steam.connect("lobby_joined", Callable(self, "on_lobby_joined"))
func create_lobby():
	#Creates Friend Only Lobby with max 4
	Steam.createLobby(Steam.LOBBY_TYPE_FRIENDS_ONLY,4)

func _on_lobby_created(success: bool, lobby_id: int):
	if success:
		print("Lobby Created!")
	else:
		print("Failed to create lobby")
		
func _on_lobby_joined(success: bool, lobby_id: int):
	if success:
		print("Successfully joined lobby")
	else:
		print("Failed to join lobby")
		
