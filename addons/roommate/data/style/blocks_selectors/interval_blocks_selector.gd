# Copyright (c) 2025 Kirill Rozhkov.
#
# This file is part of Roommate plugin: https://github.com/Hoork/Roommate
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@tool
extends "./blocks_selector.gd"

var interval := Vector3i.ZERO


func _init(init_interval: Vector3i) -> void:
	interval = init_interval


func _block_is_selected(offset_position: Vector3i, block: RoommateBlock, 
		source_blocks: Dictionary) -> bool:
	return offset_position.snapped(interval) == offset_position
