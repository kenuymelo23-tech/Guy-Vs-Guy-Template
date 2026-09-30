extends CharacterBody2D
class_name Template
var rng = RandomNumberGenerator.new()
var speed:float = 210
var maxspeed:float = 210
@onready var sensor = $DirectionSensor
@onready var dir
@export var health:float = 1000
@export var maxhealth:float=1000
var Damaged: bool = false
@onready var Indicator = $HealthIndicator
@onready var healthlabel = $HealthIndicator/HealthLabel
var accel :=10
func _ready():
	rng.seed = rng.randi_range(1,2827272727272882)
	print(rng.seed)
	var startx = rng.randi_range(-maxspeed,maxspeed)
	var starty = rng.randi_range(-maxspeed,maxspeed)
	velocity = Vector2(startx,starty).normalized() * speed
func _physics_process(delta: float):
	var collision = move_and_collide(velocity * delta)
	if collision:
		$Bounce.play()
		velocity = velocity.bounce(collision.get_normal())
	veldrain()
	indicator_upd()
	look()
	healthcheck()
	if velocity.length() > 0:
		velocity = velocity.move_toward(velocity.normalized() * maxspeed,accel * delta)
func damage(damage):
	var label=preload("res://damage_label.tscn")
	health -= damage
	var damagelabel=label.instantiate()
	damagelabel.pos=global_position
	damagelabel.damage=damage
	get_parent().add_child(damagelabel)
	if health <= 0:
		GameFunc.quit(2.5)
		queue_free()
func flash(hit:bool):
	if hit == true:
		$Sprite.material.set_shader_parameter("flash", true)
		GameFunc.play_sound($Hit.stream)
		await get_tree().create_timer(0.05).timeout
		$Sprite.material.set_shader_parameter("flash", false)
	else:
		if hit == false:
			$Sprite.material.set_shader_parameter("flash", true)
			await get_tree().create_timer(0.1).timeout
			$Sprite.material.set_shader_parameter("flash", false)
func knockback(dirx,diry):
	velocity.x=dirx
	velocity.y=diry
	
func veldrain():
	if velocity.x > maxspeed:
		velocity.x -= 10
	else:if velocity.x < -maxspeed:
		velocity.x += 10
	else:if velocity.y > maxspeed:
		velocity.y -= 10
	else:if velocity.y < -maxspeed:
		velocity.y += 10
func indicator_upd():
	Indicator.value = health
	Indicator.max_value=maxhealth
	healthlabel.text = str(health)
func look():
	for chara in get_tree().get_nodes_in_group("Characters"):
		if chara != self:
			if chara.global_position > global_position:
				$Sprite.scale.x=-1
			else: if chara.global_position < global_position:
				$Sprite.scale.x=1
		sensor.look_at(chara.global_position)
	if $Sprite.scale.x==-1:
		dir = 1
	else:
		if $Sprite.scale.x==1:
			dir = -1
			
func setspeed(xspeed, yspeed):
	velocity.x=velocity.x*xspeed
	velocity.y=velocity.y*yspeed
func healthcheck():
	if health >maxhealth:
		health=maxhealth
