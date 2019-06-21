# <pep8-80 compliant>

"""Utility functions for use in addons"""

import bpy


def get_sel_meshes():
    """Get selected objects and filter for meshes

    returns:
        list: A list of selected bpy_types.Object items

    """

    sel = bpy.context.selected_objects

    sel = [item for item in sel if item.type == 'MESH']

    if not sel:
        sel = [bpy.context.active_object]

    return sel


def set_object_context(context_mode):  # pylint: disable=unused-argument
    """Set the objects context.

    Args:
        context_mode (str): 'OBJECT' or 'EDIT'

    Returns:
        string: Original object context.

    """

    og_context = bpy.context.object.mode
    bpy.ops.object.mode_set(mode=context_mode)

    return og_context


def sel_mode(vert=None, edge=None, face=None):
    """Get selection mode"""

    sel_mode = bpy.context.scene.tool_settings.mesh_select_mode

    if vert or edge or face:
        bpy.context.scene.tool_settings.mesh_select_mode = [vert, edge, face]

    return sel_mode
