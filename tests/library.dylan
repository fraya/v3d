Module:   dylan-user

define library v3d-test-suite
  use common-dylan;
  use io;
  use testworks;
  use v3d;

  export v3d-test-suite;
end library v3d-test;

define module v3d-test-suite
  use common-dylan;
  use format-out;
  use transcendentals;
  use testworks;
  use v3d;

  export suite-operations;
end module v3d-test-suite;
