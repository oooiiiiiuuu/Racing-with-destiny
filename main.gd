extends Node # 如果你场景的根节点是 Control，就用这个；如果是 Node，就写 extends Node

func _ready():
	$CanvasLayer.visible = false  # 游戏一开始隐藏“Game Over”文字
	start_game()  # 启动游戏（等同于启动计时器）

func start_game():
	$Timer.start()  # 启动 GameTimer 计时器
	get_tree().paused = false  # 保证游戏处于非暂停状态（保险起见）
	
func _process(delta):
	if $Timer.is_stopped() == false:
		var time_left = int($Timer.time_left)
		$CanvasLayer2/Labell.text = "Remained Time: " + str(time_left) + "s"
func _on_game_timer_timeout():
	end_game()  # 当计时器时间到了，调用结束游戏函数

func end_game():
	$CanvasLayer.visible = true  # 显示“Game Over”文字
	get_tree().paused = true 
