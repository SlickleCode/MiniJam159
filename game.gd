extends Node2D

var depth = 0

func _physics_process(_delta):
	depth += snapped(Input.get_action_strength("Go_Down") * .2, 0.1)
	$DepthLabel.text = "Depth: %1d" % depth
	$Background.position = Vector2(160, 5300 - depth)
	if depth >= 10_000:
		$DepthLabel.text = "You Win! Congrats."
		depth = 10_000
	if $Creature.is_visible():
		$Creature.position.x += 1
		if $Creature.position.x > 400:
			$Creature.hide()
	elif depth > 200 and randi_range(0, 1000) == 0:
		$Creature.frame = randi_range(0, 35)
		$Creature.position = Vector2(-20, randi_range(50, 280))
		$Creature.show()
