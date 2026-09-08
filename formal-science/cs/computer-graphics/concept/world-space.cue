package concept

world_space: {
  content: #"""
      *World space* is the shared coordinate system for every object in a scene.
      Applying each object's model matrix gives all objects a common position,
      orientation, and scale, so their arrangement, intersections, and lighting
      relationships can be evaluated together.

      $ bold(p)_"world" = M bold(p)_"object" $

      World space is independent of the camera. Moving the camera changes
      view-space coordinates, but does not change an object's world-space
      position. Scene bounding boxes and camera fitting are naturally defined
      in this space.
    """#
  related: [
    "concept/object-space",
    "concept/view-space",
  ]
}
