extends Control


@onready var line_edit : LineEdit = $ColorRect/MarginContainer/VBoxContainer/LineEdit

@onready var answear : Label = $ColorRect/MarginContainer/VBoxContainer/Label3
var vectors_values_1 : Array = []
var vectors_values_2 : Array = []


func calculate_vector():
	var text : String = line_edit.text
	var split_text = text.split("+")
	for split in split_text:
		var vector_value = split.split(",")
		vectors_values_1.append(vector_value[0].to_int())
		vectors_values_2.append(vector_value[1].to_int())
	var vector : Vector2
	for val in vectors_values_1.size():
		vector += Vector2(vectors_values_1[val], vectors_values_2[val])
	answear.text = str("Calculated vector = ", vector)


func _on_line_edit_text_submitted(new_text):
	calculate_vector()
