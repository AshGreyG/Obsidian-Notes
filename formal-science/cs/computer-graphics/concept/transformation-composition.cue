package concept

transformation_composition: {
  content: #"""
    *Matrix composition* is the operation of combining several geometric
    transformations into one transformation matrix. It is not merely a
    convenience for reducing the number of matrix-vector multiplications:
    the order of the factors defines the order in which the geometric
    operations occur.

    This concept uses homogeneous coordinates and column vectors, as defined
    by *homogeneous-coordinate*. A point is written as

    $ bold(p) = mat(x; y; z; 1) $

    and a direction is written as

    $ bold(v) = mat(x; y; z; 0) $

    A transform is applied by left multiplication:

    $ bold(p)' = M bold(p) $

    Suppose $A$ and $B$ are transformations. If $A$ must happen first and
    $B$ second, then:

    $ bold(p)_1 = A bold(p), space.en bold(p)_2 = B bold(p)_1 = B A bold(p) $

    Therefore the combined matrix is $M = B A$. The rightmost matrix acts first.
    Reading a product from left to right as the execution order is a common source
    of graphics bugs.

    Matrix multiplication is generally not commutative:

    $ A B != B A $

    Consequently, exchanging two factors changes the geometry even when the
    same individual transformations are present.

    Let $bold(p) = mat(1; 0; 0; 1)$, let $S$ scale the x coordinate by two,
    and let $T$ translate x by three:

    $ S = mat(2, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1),
      space.en
      T = mat(1, 0, 0, 3; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) $

    Scaling first and translating second gives:

    $ T S bold(p) = mat(5; 0; 0; 1) $

    Translating first and scaling second gives:

    $ S T bold(p) = mat(8; 0; 0; 1) $

    The second result scales the translation as well. This illustrates why a
    model transform is conventionally assembled as translation, rotation,
    then scale when written for column vectors:

    $ M = T R S $

    The actual execution order is scale in local space, rotate, and finally
    translate into world space.

    - *Rotation around a pivot.*

      A rotation matrix rotates around the origin. To rotate around a pivot
      $bold(c)$, translate the pivot to the origin, rotate, and translate it
      back:

      $ M = T(bold(c)) R T(-bold(c)) $

      The rightmost $T(-bold(c))$ executes first. Omitting either translation
      rotates the object around the wrong point.

    - *Graphics pipeline.*

      A vertex normally travels through local, world, view, and clip spaces:

      $ bold(p)_"clip" = P V M bold(p)_"local" $

      where $M$ is the model matrix, $V$ is the view (camera) matrix, and $P$
      is the projection matrix. The pipeline therefore executes in this order:

      $ bold(p)_"local" ->^M bold(p)_"world" ->^V bold(p)_"view" ->^P
        bold(p)_"clip" $

      Code written as `projection * view * model * position` follows the same
      column-vector convention: `position` is multiplied by `model` first.
  """#
  related: [
    "concept/affine-transformation",
    "concept/homogeneous-coordinate",
  ]
}
