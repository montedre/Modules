package arm.node;

@:keep class SimpleFirstPeson extends armory.logicnode.LogicTree {

	public function new() { super(); notifyOnAdd(add); }

	override public function add() {
		var _SetVisible = new armory.logicnode.SetVisibleNode(this);
		var _OnInit = new armory.logicnode.OnInitNode(this);
		_OnInit.addOutputs([_SetVisible]);
		_SetVisible.addInput(_OnInit, 0);
		_SetVisible.addInput(new armory.logicnode.ObjectNode(this, "Player"), 0);
		_SetVisible.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_SetVisible.addOutputs([new armory.logicnode.NullNode(this)]);
		var _SetMouseLock = new armory.logicnode.SetMouseLockNode(this);
		_SetMouseLock.addInput(new armory.logicnode.NullNode(this), 0);
		_SetMouseLock.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_SetMouseLock.addOutputs([new armory.logicnode.NullNode(this)]);
		var _PlayerController = new armory.logicnode.PlayerController(this);
		var _OnUpdate = new armory.logicnode.OnUpdateNode(this);
		var _CameraController = new armory.logicnode.CameraController(this);
		_CameraController.addInput(_OnUpdate, 0);
		_CameraController.addInput(new armory.logicnode.ObjectNode(this, "Player"), 0);
		_CameraController.addInput(new armory.logicnode.ObjectNode(this, "Camera"), 0);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 0.20000000298023224), 0);
		_CameraController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 0.02500000037252903), 0);
		_CameraController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_CameraController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		var _SeparateXYZ = new armory.logicnode.SeparateVectorNode(this);
		var _MouseCoords = new armory.logicnode.MouseCoordsNode(this);
		_MouseCoords.addOutputs([new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0)]);
		_MouseCoords.addOutputs([_SeparateXYZ]);
		_MouseCoords.addOutputs([new armory.logicnode.IntegerNode(this, 0)]);
		_SeparateXYZ.addInput(_MouseCoords, 1);
		_SeparateXYZ.addOutputs([_CameraController]);
		_SeparateXYZ.addOutputs([_CameraController]);
		_SeparateXYZ.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_CameraController.addInput(_SeparateXYZ, 0);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		_CameraController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_CameraController.addInput(_SeparateXYZ, 1);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		_CameraController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_CameraController.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_CameraController.addOutputs([new armory.logicnode.NullNode(this)]);
		_OnUpdate.addOutputs([_PlayerController, _CameraController]);
		_PlayerController.addInput(_OnUpdate, 0);
		_PlayerController.addInput(new armory.logicnode.ObjectNode(this, "Player"), 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 0.10000000149011612), 0);
		var _KeyboardState = new armory.logicnode.KeyboardNode(this);
		_KeyboardState.property0 = "Started";
		_KeyboardState.property1 = "w";
		_KeyboardState.addOutputs([_PlayerController]);
		_PlayerController.addInput(_KeyboardState, 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		var _KeyboardState_001 = new armory.logicnode.KeyboardNode(this);
		_KeyboardState_001.property0 = "Down";
		_KeyboardState_001.property1 = "a";
		_KeyboardState_001.addOutputs([_PlayerController]);
		_PlayerController.addInput(_KeyboardState_001, 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		var _KeyboardState_002 = new armory.logicnode.KeyboardNode(this);
		_KeyboardState_002.property0 = "Down";
		_KeyboardState_002.property1 = "s";
		_KeyboardState_002.addOutputs([_PlayerController]);
		_PlayerController.addInput(_KeyboardState_002, 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		var _KeyboardState_003 = new armory.logicnode.KeyboardNode(this);
		_KeyboardState_003.property0 = "Down";
		_KeyboardState_003.property1 = "d";
		_KeyboardState_003.addOutputs([_PlayerController]);
		_PlayerController.addInput(_KeyboardState_003, 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		_PlayerController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		_PlayerController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 1.5), 0);
		_PlayerController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_PlayerController.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_PlayerController.addInput(new armory.logicnode.FloatNode(this, 0.5), 0);
		_PlayerController.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}
