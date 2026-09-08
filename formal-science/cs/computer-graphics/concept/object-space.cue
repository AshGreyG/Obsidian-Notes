package concept

object_space: {
  content: #"""
    *Object space*, also called model or local space, is the coordinate system in
    which a mesh is authored. Vertex positions are relative to the object's own
    origin, orientation, and scale. The model matrix $M$ maps an object-space
    point into the shared world space:

    $ bold(p)_"world" = M bold(p)_"object" $

    With column vectors, $M = T R S$ applies scale first, then rotation, and
    finally translation. Keeping geometry in object space makes a mesh
    reusable: each instance can use a different model matrix without changing
    its vertex data.
  """#
  related: [
    "concept/world-space",
    "concept/transformation-composition",
  ]
}
