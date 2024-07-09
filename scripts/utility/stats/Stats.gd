extends Resource

## Holds the stats for an entity.
class_name Stats

## Is emit when a value is changed.
signal on_prop_changed(prop : Variant)


func _property_type_checker(name : String) -> Variant.Type:
	if name not in self:
		printerr("Property '" + name + "' not found")
		return TYPE_NIL
	
	# returns type 
	return typeof(self[name]) as Variant.Type


## It is used to increase the value of an entity stat.
func _increase_property(name : String, value : float) -> void:
	# checks if the property is not a float
	if _property_type_checker(name) != TYPE_FLOAT:
		printerr("Cannot increase the property of a non integer")
		return
	
	# increase the property by value
	self[name] += value
	# emit prop changed signal
	on_prop_changed.emit(self[name])


## Returns the multiplied value of a provided stat
func _multiply_property(name : String, value : float) -> float:
	# checks if the property is not a float
	if _property_type_checker(name) != TYPE_FLOAT:
		printerr("Cannot increase the property of a non integer")
		return NAN
	
	# emit prop changed signal
	on_prop_changed.emit(self[name])
	
	# return multiplied property
	return self[name] * value
