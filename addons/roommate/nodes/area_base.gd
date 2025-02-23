@tool
class_name RoommateAreaBase
extends Node3D

@export var size := Vector3.ONE
@export var space_priority := 0


func get_blocks(block_size: float) -> Array[Block]:
	var start_space_position := position - size / 2
	var box := AABB(start_space_position, size)
	var start_block_position := (box.position / block_size).floor() as Vector3i
	var end_block_position := (box.end / block_size).ceil() as Vector3i
	
	var results: Array[Block] = []
	for x in range(start_block_position.x, end_block_position.x):
		for y in range(start_block_position.y, end_block_position.y):
			for z in range(start_block_position.z, end_block_position.z):
				var block := _create_block()
				assert(block)
				block.position = Vector3i(x, y, z)
				block.block_size = block_size
				results.append(block)
	return results


func _create_block() -> Block:
	assert(false, "Not Implemented")
	return null


class Block:
	extends RefCounted
	
	const DEFAULT_MATERIAL := preload("res://test/test_material.tres") # TMP?
	
	var position := Vector3i.ZERO
	var block_size := 1.0
	var geometry := Dictionary()
	var materials := Dictionary()
	
	
	func handle(target_material: Material, tool: SurfaceTool, blocks: Blocks) -> bool: # virtual method
		return false
	
	
	func to_position(block_position: Vector3i) -> Vector3:
		return block_position * block_size + Vector3.ONE * block_size / 2
