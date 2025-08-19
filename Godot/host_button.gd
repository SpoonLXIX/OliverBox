extends Button
const PACKET_READ_LIMIT: int = 32
var lobby_data
var lobby_id: int = 0
var lobby_members: Array = []
var lobby_members_max: int = 4
var lobby_vote_kick: bool = false
var steam_id: int = 0
var steam_username: String = ""

func _ready():
	Steam.connect("lobby_created", Callable(self, "_on_lobby_created"))
	Steam.connect("lobby_joined", Callable(self, "on_lobby_joined"))

func create_lobby() -> void:
	if lobby_id == 0:
		Steam.createLobby(Steam.LOBBY_TYPE_FRIENDS_ONLY, lobby_members_max)
func _on_lobby_created(connect: int, this_lobby_id: int) -> void:
	if connect == 1:
		#Set the lobby ID
		lobby_id = this_lobby_id
		print("Created a lobby: %s" % lobby_id)
		
		#Set this lobby as joinable
		Steam.setLobbyJoinable(lobby_id, true)
		
		#Set some lobby data
		Steam.setLobbyData(lobby_id, "name", "Spoons' Lobby")
		Steam.setLobbyData(lobby_id, "mode", "Testing")
		
		
		
		




func _on_pressed() -> void:
	create_lobby()
