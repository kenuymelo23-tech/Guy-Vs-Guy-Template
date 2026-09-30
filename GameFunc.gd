extends Node

func play_sound(stream: AudioStream):
	var player := AudioStreamPlayer.new()
	player.stream = stream
	add_child(player)
	player.play()
	player.finished.connect(player.queue_free)
func freeze(seconds):
	get_tree().paused = true
	await get_tree().create_timer(seconds, true, false, true).timeout
	get_tree().paused = false
func quit(seconds):
	await get_tree().create_timer(seconds).timeout
	get_tree().quit()
