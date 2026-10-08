extends CanvasLayer

@export var tiempo_maximo : float = 10
@export var tiempo_ans : float = 7.5
@export var tiempo_apurado : float = 2.5
@export var cara_sprite : AnimatedSprite2D

var tiempo_ahora : float = 0.
var ansioso : bool = false
var empezar_timer : bool = false

func _ready() -> void:
	Mano.agarrar.connect(func(agarrar:bool): 
		empezar_timer = agarrar)
	tiempo_ahora = tiempo_maximo
	AudioManager.play_music(AudioManager.canciones[AudioManager.Canciones.NORMAL])


func _process(delta: float) -> void:
	if empezar_timer:
		tiempo_ahora -= delta / 0.2
	if tiempo_ahora <= tiempo_ans and not ansioso:
		ansioso = true
		cara_sprite.play(&"ansioso")
		AudioManager.play_music(AudioManager.canciones[AudioManager.Canciones.ANSIOSO], AudioManager.music_player.get_playback_position())
	if tiempo_ahora <= tiempo_apurado:
		cara_sprite.play(&"apurado")
		#AudioManager.play_music(AudioManager.canciones[AudioManager.Canciones.APURADO], AudioManager.music_player.get_playback_position())
	if tiempo_ahora <= 0:
		get_tree().change_scene_to_file("res://defeatscene.tscn")
		pass
