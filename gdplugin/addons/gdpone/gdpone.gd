tool
extends EditorPlugin

var dock

func _enter_tree():
	# 添加一个自定义控件
	add_custom_type(
		"GDButton",
		"Button",
		preload("gdp_button.gd"),
		preload("icon.png")
	)
	
	# 通过添加一个 UI 场景来作为编辑器额外的窗口。
	dock = preload("res://addons/gdpone/gdp_dock.tscn").instance()
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	


func _exit_tree():
	# 释放控件
	remove_custom_type("GDButton")
	
	# 释放场景
	remove_control_from_docks(dock)
	dock.free()
