extends Node

@onready var musics : Dictionary = {
	"title": %Title,
	"combat": %Combat,
	
}

func play_song(song: String, starting_point: float = 0.0) -> void: ## Stops the current song playing and plays the selected song
	if not is_song_playing(song):
		print("Playing: ", song)
		stop_all_songs()
		musics[song].play(starting_point)
	
	print(musics[song])

func stop_all_songs() -> void: ## Stops all songs
	for song in musics.values():
		if song is AudioStreamPlayer:
			
			if song.playing:
				song.stop()

func is_song_playing(song: String) -> bool:
	return musics[song].playing
