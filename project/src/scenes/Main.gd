extends Node
@export var effectAnimationPlayer: AnimationPlayer

func _init():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _ready():
	Dialogic.start('start')
	get_viewport().set_input_as_handled()

func _on_dialogic_signal(argument:String):
	if argument == 'close':
		get_tree().quit()
		return

	if effectAnimationPlayer.has_animation(argument):
		effectAnimationPlayer.play(argument)
