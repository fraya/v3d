Module: dylan-user
Licence: See LICENSE file

define library v3d
  export v3d;
  
  use common-dylan;
  use io;
end library v3d;

define module v3d
  use common-dylan;
  use transcendentals;
  use format;
  use streams;
  use standard-io;
  use print;

  export
    <v3>,
    $v3-zero,
    v3,
    v-x,
    v-y,
    v-z;

  export
    similar,
    squared,
    magnitude,
    cross-product,
    unit?,
    normalize,
    unitize,
    distance;
  
end module v3d;
