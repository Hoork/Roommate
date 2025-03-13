@tool
class_name RoommateEdgeBlocksSelector
extends RoommateBlocksSelector

@export var selected_edge := Vector3i.ZERO


func select(source_blocks: RoommateBlocksArea.Blocks) -> RoommateBlocksArea.Blocks:
	var result := RoommateBlocksArea.Blocks.new()
	
	var biggest_values := Vector3i.MIN
	var smallest_values := Vector3i.MAX
	for block in source_blocks.get_in_bounds():
		biggest_values = biggest_values.max(block.position)
		smallest_values = smallest_values.min(block.position)
	
	var required_x = null
	var required_y = null
	var required_z = null
	
	if selected_edge.x > 0:
		required_x = biggest_values.x
	elif selected_edge.x < 0:
		required_x = smallest_values.x
	
	if selected_edge.y > 0:
		required_y = biggest_values.y
	elif selected_edge.y < 0:
		required_y = smallest_values.y
	
	if selected_edge.z > 0:
		required_z = biggest_values.z
	elif selected_edge.z < 0:
		required_z = smallest_values.z
	
	for block in source_blocks.get_all():
		if required_x != null and required_x != block.position.x:
			continue
		if required_y != null and required_y != block.position.y:
			continue
		if required_z != null and required_z != block.position.z:
			continue
		result.add(block)
	
	return result
