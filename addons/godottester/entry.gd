@tool
class_name UnitTester
extends EditorPlugin

const PLUGIN_NAME:String = &"Godot Tester"

const PGN_PATH:String = &"plugin/godottester/"

const PGN_RELOAD_PLUGIN:String = PGN_PATH + &"reload_plugin"
const PGN_OPEN_TESTING:String = PGN_PATH + &"open_testing"

var dock:Control

var open_testing_shortcut:Shortcut
var reload_shortcut:Shortcut


func _enter_tree() -> void:
	_ensure_shortcuts()

	dock = preload("uid://crl6ej8ex8s20").instantiate()
	add_control_to_bottom_panel(dock, PLUGIN_NAME, open_testing_shortcut)

func _ready() -> void:
	print("%s Ready!" % PLUGIN_NAME)


func _shortcut_input(event: InputEvent) -> void:
	if !event.is_pressed() || event.is_echo():
		return
	
	if reload_shortcut.matches_event(event):
		restart_plugin()

func _exit_tree() -> void:
	remove_control_from_bottom_panel(dock)
	dock.free()

func restart_plugin() -> void:
	print("Restarting %s..." % PLUGIN_NAME)
	EditorInterface.set_plugin_enabled(PLUGIN_NAME.to_lower().replace(" ", ""), false)
	
	EditorInterface.set_plugin_enabled.call_deferred(PLUGIN_NAME.to_lower().replace(" ", ""), true)

func _ensure_shortcuts() -> void:
	var editor_settings:EditorSettings = EditorInterface.get_editor_settings()
	if !editor_settings.has_setting(PGN_RELOAD_PLUGIN):
		var sht:Shortcut = Shortcut.new()
		var sht_event:InputEventKey = InputEventKey.new()
		sht_event.device = -1
		sht_event.keycode = KEY_BACKSLASH
		sht_event.alt_pressed = true

		sht.events = [sht_event]
		editor_settings.set_setting(PGN_RELOAD_PLUGIN, sht)
	
	if !editor_settings.has_setting(PGN_OPEN_TESTING):
		var sht:Shortcut = Shortcut.new()
		var sht_event:InputEventKey = InputEventKey.new()
		sht_event.device = -1
		sht_event.keycode = KEY_PERIOD
		sht_event.alt_pressed = true

		sht.events = [sht_event]
		editor_settings.set_setting(PGN_OPEN_TESTING, sht)
	
	reload_shortcut = editor_settings.get_setting(PGN_RELOAD_PLUGIN)
	open_testing_shortcut = editor_settings.get_setting(PGN_OPEN_TESTING)

