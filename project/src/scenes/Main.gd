extends Node
@export var deskLayer: Node
@export var desk: Control
@export var questionLabel: RichTextLabel
@export var endButton: TextureButton
@export var responseTextEdit: TextEdit
@export var animationPlayer: AnimationPlayer
@export var effectAnimationPlayer: AnimationPlayer

func _init():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _ready():
	Dialogic.start('cap2-part2')
	get_viewport().set_input_as_handled()

func _on_dialogic_signal(argument:String):
	if argument == 'close':
		get_tree().quit()

	if effectAnimationPlayer.has_animation(argument):
		effectAnimationPlayer.play(argument)
