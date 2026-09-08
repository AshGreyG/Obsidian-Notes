package concept

transformation_matrices: {
  content: #"""
    The following matrices use homogeneous coordinates, column vectors, and
    left multiplication. A matrix product acts from right to left.

    The matrices can be derived instead of memorized. Begin with a general
    homogeneous matrix and a point:

    $ M = mat(
      m_11, m_12, m_13, m_14;
      m_21, m_22, m_23, m_24;
      m_31, m_32, m_33, m_34;
      m_41, m_42, m_43, m_44
    ), space.en
      bold(p) = mat(x; y; z; 1) $

    Matrix multiplication gives:

    $ M bold(p) = mat(
      m_11 x + m_12 y + m_13 z + m_14;
      m_21 x + m_22 y + m_23 z + m_24;
      m_31 x + m_32 y + m_33 z + m_34;
      m_41 x + m_42 y + m_43 z + m_44
    ) $

    An affine transformation must keep the final coordinate of every point
    equal to $1$. Therefore its last row is $(0,0,0,1)$. The first three rows
    can then be read directly from the desired formulas for $x'$, $y'$, and
    $z'$. This observation derives all of the usual affine matrices.

    - *Deriving translation.* The definition of translation is:

      $ x' = x + t_x, space.en y' = y + t_y, space.en z' = z + t_z $

      Comparing these equations with the general product forces the diagonal
      coefficients to be $1$, the other linear coefficients to be $0$, and
      the last-column coefficients to be $(t_x,t_y,t_z)$. Thus:

      $ T(bold(t)) = mat(
        1, 0, 0, t_x;
        0, 1, 0, t_y;
        0, 0, 1, t_z;
        0, 0, 0, 1
      ) $

      For a direction, use $bold(v)=mat(x;y;z;0)$. The same last column is
      multiplied by $0$, which proves that translation changes points but not
      directions.

    - *Translation.* A point is translated by $bold(t)=(t_x,t_y,t_z)$ with:

      $ T(bold(t)) = mat(
        1, 0, 0, t_x;
        0, 1, 0, t_y;
        0, 0, 1, t_z;
        0, 0, 0, 1
      ) $

      The last column contributes to a point $(x,y,z,1)$ but not to a
      direction $(x,y,z,0)$.

    - *Deriving scaling.* Scaling is defined by:

      $ x' = s_x x, space.en y' = s_y y, space.en z' = s_z z $

      There are no additive constants and no cross-coordinate terms, so the
      only nonzero entries in the first three rows are the three diagonal
      scale factors. Keeping the homogeneous coordinate unchanged gives:

      $ S(s_x,s_y,s_z) = mat(
        s_x, 0, 0, 0;
        0, s_y, 0, 0;
        0, 0, s_z, 0;
        0, 0, 0, 1
      ) $

    - *Scaling.* Scaling independently along the three coordinate axes is:

      $ S(s_x,s_y,s_z) = mat(
        s_x, 0, 0, 0;
        0, s_y, 0, 0;
        0, 0, s_z, 0;
        0, 0, 0, 1
      ) $

      A negative scale reflects across the corresponding coordinate plane.
      Uniform scaling uses $s_x=s_y=s_z$ and preserves angles, while a
      non-uniform scale generally changes angles and lengths.

    - *Deriving rotation around the x axis.* Rotation leaves $x$ unchanged and
      rotates the $y z$ plane. The two-dimensional rotation definition is:

      $ y' = y cos θ - z sin θ, space.en
        z' = y sin θ + z cos θ $

      Reading the coefficients of $x$, $y$, and $z$ from these equations gives
      the second and third rows. Adding the unchanged $x$ equation and the
      homogeneous coordinate gives:

      $ R_x(θ) = mat(
        1, 0, 0, 0;
        0, cos θ, -sin θ, 0;
        0, sin θ, cos θ, 0;
        0, 0, 0, 1
      ) $

    - *Rotation around the $x$ axis.*

      $ R_x(θ) = mat(
        1, 0, 0, 0;
        0, cos θ, -sin θ, 0;
        0, sin θ, cos θ, 0;
        0, 0, 0, 1
      ) $

      The $y$- and $z$-axis matrices follow by applying the same two-dimensional
      derivation to the $x z$ and $x y$ planes, respectively:

    - *Rotation around the $y$ axis.*

      $ R_y(θ) = mat(
        cos θ, 0, sin θ, 0;
        0, 1, 0, 0;
        -sin θ, 0, cos θ, 0;
        0, 0, 0, 1
      ) $

    - *Rotation around the $z$ axis.*

      $ R_z(θ) = mat(
        cos θ, -sin θ, 0, 0;
        sin θ, cos θ, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1
      ) $

      These matrices use the right-hand rule. A general rotation can be built
      from axis rotations, or from an axis-angle or quaternion representation.

    - *Shear.* A shear in which $x$ changes with $y$ and $z$ is:

      $ H = mat(
        1, h_1, h_2, 0;
        0, 1, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1
      ) $

      It maps $x$ to $x+h_1 y+h_2 z$ while leaving $y$ and $z$ unchanged.
      Other shear directions are obtained by placing the coefficients in the
      corresponding off-diagonal entries.

      This matrix follows immediately by comparing the defining equations
      $x' = x+h_1 y+h_2 z$, $y'=y$, and $z'=z$ with the general matrix product.

    The general affine matrix combines a linear part $A$ and a translation:

    $ M = mat(
      A_11, A_12, A_13, t_x;
      A_21, A_22, A_23, t_y;
      A_31, A_32, A_33, t_z;
      0, 0, 0, 1
    ) $

    For example, a model matrix is commonly written as $M=T R S$. The object
    is scaled in its local space, then rotated around the local origin, and
    finally translated into world space. To transform around a pivot
    $bold(c)$, use $T(bold(c)) R T(-bold(c))$; the rightmost translation moves
    the pivot to the origin first.

    The composition formula follows directly from substitution:

    $ bold(p)_1 = S bold(p), space.en
      bold(p)_2 = R bold(p)_1 = R S bold(p), space.en
      bold(p)_3 = T bold(p)_2 = T R S bold(p) $

    Therefore the single matrix is $M=T R S$. The rightmost matrix is applied
    first because it is closest to the column vector.
  """#
  related: [
    "concept/homogeneous-coordinate",
    "concept/affine-transformation",
    "concept/transformation-composition",
  ]
}
