import bpy
from bpy.props import *
from bpy.types import Node, NodeSocket
from arm.logicnode.arm_nodes import *

class StartFunctionNode(Node, ArmLogicTreeNode):
    '''Start Function Node'''
    bl_idname = 'LNStartFunctionNode'
    bl_label = 'Start Function'
    bl_icon = 'CURVE_PATH'
    property0 = StringProperty(name='', default='')
    min_outputs = 1

    def __init__(self):
        array_nodes[str(id(self))] = self

    def init(self, context):
        self.outputs.new('ArmNodeSocketAction', 'Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
        row = layout.row(align=True)

        op = row.operator('arm.node_add_output', text='New', icon='PLUS', emboss=True)
        op.node_index = str(id(self))
        op.socket_type = 'NodeSocketShader'
        op2 = row.operator('arm.node_remove_output', text='', icon='X', emboss=True)
        op2.node_index = str(id(self))
        
add_node(StartFunctionNode, category='Event')
