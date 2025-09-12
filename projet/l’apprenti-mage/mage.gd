extends AnimatedSprite2D

@onready var attack1_sound = AudioStreamPlayer2D.new()
@onready var attack2_sound = AudioStreamPlayer2D.new()

func _ready():
	add_child(attack1_sound)
	attack1_sound.stream = load("res://assets/music/magic-spell-333896.mp3")
	
	add_child(attack2_sound)
	attack2_sound.stream = load("res://assets/music/magic-smite-6012.mp3")

	play("default")
	animation_finished.connect(_on_animation_finished)

func _process(_delta):
	if Input.is_key_pressed(KEY_W):
		if animation != "Attack1":   # Vérifie l'animation en cours
			play("Attack1")
			attack1_sound.play()
			
	if Input.is_key_pressed(KEY_D):
		if animation != "Attack2":   # Vérifie l'animation en cours
			play("Attack2")
			attack2_sound.play()

func _on_animation_finished():
	if animation == "Attack1":       # Quand Attack1 se termine, on revient à "default"
		play("default")
		
	if animation == "Attack2":       # Quand Attack1 se termine, on revient à "default"
		play("default")
		
