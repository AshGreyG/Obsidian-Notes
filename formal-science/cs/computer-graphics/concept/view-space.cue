package concept

view_space: {
  content: #"""
    *View space*, also called camera or eye space, expresses the scene relative
    to the camera. The camera is conventionally at the origin, with its forward
    and up directions defining the axes. The view matrix $V$ transforms a
    world-space point into this camera-relative system:

    $ bold(p)_"view" = V bold(p)_"world" $

    $V$ is the inverse of the camera's world transform. Consequently, moving
    the camera causes the world to move in the opposite direction in view
    space. Depth tests and view-dependent effects are often easiest to reason
    about after this transformation.

    A common look-at construction starts with the camera position $bold(e)$,
    a target position $bold(c)$, and an approximate up vector $bold(u_0)$:

    $ bold(f) = (bold(c) - bold(e)) / (|bold(c) - bold(e)|), space.en
      bold(s) = (bold(f) times bold(u_0)) / (|bold(f) times bold(u_0)|), space.en
      bold(u) = bold(s) times bold(f) $

    Here $bold(f)$ is the camera's forward direction, $bold(s)$ its right
    direction, and $bold(u)$ its corrected up direction. In a right-handed
    OpenGL-style camera looking along negative $z$, the view matrix is:

    $ V = mat(
      s_x, s_y, s_z, -bold(s) ⋅ bold(e);
      u_x, u_y, u_z, -bold(u) ⋅ bold(e);
        -f_x, -f_y, -f_z, bold(f) ⋅ bold(e);
        0, 0, 0, 1
    ) $

    The dot products in the last column translate the world so that the camera
    position becomes the view-space origin. The signs and forward-axis choice
    are API conventions; they must agree with the projection matrix.
  """#
  related: [
    "concept/world-space",
    "concept/clip-space",
  ]
}
