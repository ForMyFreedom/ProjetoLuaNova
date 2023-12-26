extends Node
@export var deskLayer: Node
@export var desk: Control
@export var questionLabel: RichTextLabel
@export var endButton: TextureButton
@export var responseTextEdit: TextEdit
@export var animationPlayer: AnimationPlayer
@export var effectAnimationPlayer: AnimationPlayer

const allQuestions = {
	"1": 'fed kpeedeenu
(a: xexle, b: xexle){
	x = a+b
	y = a-b
	trogro x/y
}'
}

func _init():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _ready():
	Dialogic.start('cap5-part2') # ('start')
	endButton.connect('pressed', _on_end_button_pressed)
	get_viewport().set_input_as_handled()

func _on_dialogic_signal(argument:String):
	if argument == 'close':
		get_tree().quit()
	if effectAnimationPlayer.has_animation(argument):
		effectAnimationPlayer.play(argument)
	return # @@@@
	Dialogic.paused = true
	deskLayer.visible = true
	questionLabel.text = allQuestions[argument]

func _on_end_button_pressed():
	var response: String = responseTextEdit.text
	var errorResponse = assertRacket(response)
	if errorResponse == '':
		sucess()
	else:
		failure(errorResponse)

func sucess():
	Dialogic.paused = false
	deskLayer.visible = false
	# @@@

func failure(errorResponse: String):
	animationPlayer.play('ada_appear')
	pass #@
	
func assertRacket(response: String) -> String:
	return '' # @@@@@@@@@@@@@@@@@@@
