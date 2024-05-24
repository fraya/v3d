Module: dylan-user
Licence: See LICENSE file

define library v3d
  use common-dylan,
    import: { common-dylan,
	      transcendentals };
  use io,
    import: { format,
	      print,
	      streams };

  export
    v3d,
    v3d-impl;

end library v3d;

define module v3d

  // class and accessors

  create
    <v3>,
    v-x,
    v-y,
    v-z;

  // operations

  create
    squared,
    magnitude,
    cross-product,
    unit?,
    normalize,
    distance;

  // constants

  create
    $v3-zero;

  // utility

  create
    v3,
    similar;

end module v3d;

define module v3d-impl
  use common-dylan;
  use format,
    import: { format };
  use print,
    import: { print-object };
  use streams:
    import: { <stream> };
  use transcendentals,
    import: { sqrt };

  use v3d;

  // Additional exports for use by test suite.

end module v3d-impl;
