# Simple Rope concept in Godot

This project demonstrates a simple rope creation concept in the Godot Engine using physics-based nodes. Project also includes a simple 1x2 vector calculator (includes only addition).

## Features
- Physics-based rope using `PinJoint2D`.
- Configurable rope length.
- Final end of rope attachable to player.
- Ball creation and rope breaking.
- Simple 1x2 vector calculator (includes only addition)

## Requirements
- Godot 4.x (Recommended)

## How It Works
The rope is created by instantiating multiple `RigidBody2D` nodes as segments, connected using `PinJoint2D`. The first segment is attached to a fixed poin (created at mouse cursor position), while the last segment can be attached to player or another chosen location with mouse cursor.

## Installation
1. Clone or download this repository.
2. Open the project in Godot.
3. Run the scene to see the rope in action.

## Usage
- **C** creates rope starting position at mouse cursor location (can be overwritten by pressing **C** again).
- **F** creates rope ending position and connects it to starting position with multiple joints.
- **H** connects rope starting position to player.
- **A/D** moves player left/right when held.
- **B** creates a falling ball at mouse cursor location (Ball can be used to break the rope).
- **R** deletes all nodes in scene (including player and floor).

To use vector calculator:

**Option 1:** change scene in project -> Application -> Run and changing main scene from main.tscn to vector_calculator.tscn.

**Option 2:** navigate to vector_calculator scene in editor and press Run Current Scene.
Vector calculator supports only addition (subtraction is possible by adding vector with negative values). 

## Future Improvements
- Better physics for rope and objects connected to rope.
- Better physics for player.
- Connecting rope to more objects.
- More functions to vector calculator (bigger vectors, multiplication and division)
