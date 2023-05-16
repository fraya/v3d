Module: v3d-test
Synopsis: Tests for v3d library
Author: Fernando Raya
Copyright: (c) 2020

define test test-zero ()
  let v = make(<v3>, x: 0.0, y: 0.0, z: 0.0);
  assert-true(zero?(v));
  assert-equal(v, $v3-zero);
  assert-true(zero?($v3-zero));
end;

define test test-plus ()
  let v1 = v3d(1.0, 1.0, 1.0);
  let v2 = v3d(2.0, 2.0, 2.0);
  let v3 = v3d(3.0, 3.0, 3.0);
  assert-equal(v1 + v2, v3);
end;

define test test-negated ()
  let v = v3d(1.0, 2.0, 3.0);
  let r = v3d(-1.0, -2.0, -3.0);
  assert-equal(-v, r);
end;

define test test-commutativity ()
  let u = v3d(1.0, 2.0, 3.0);
  let v = v3d(4.0, 5.0, 6.0);
  assert-equal(u + v, v + u);
end;

define test test-inverse-element-of-addition ()
  let v = v3d(1.0, 2.0, 3.0);
  assert-equal(v + (-v), $v3-zero);
end;

define test test-minus ()
  let v1 = v3d(1.0, 1.0, 1.0);
  let v2 = v3d(2.0, 2.0, 2.0);
  assert-equal(v2 - v1, v1);
end;

define test test-scalar ()
  let v1 = v3d(2.0, 2.0, 2.0);
  let v2 = v3d(6.0, 6.0, 6.0);
  assert-equal(v1 * 3, v2);
end;

define test test-identity-scalar ()
  let v1 = v3d(2.0, 2.0, 2.0);
  assert-equal(v1 * 1.0, v1);
end;

define test test-div ()
  let v1 = v3d(6.0, 6.0, 6.0);
  let v2 = v3d(3.0, 3.0, 3.0);
  assert-equal(v1 / 2, v2);
end;

define test test-magnitude ()
  let v = v3d(0.0, 3.0, 4.0);
  assert-equal(magnitude(v), 5.0);
  let u = v3d(2.0, 3.0, 4.0);
  assert-equal(magnitude(u), sqrt(29.0));
end;

define test test-dot-product ()
  let u = v3d(1.0, 3.0, -5.0);
  let v = v3d(4.0, -2.0, -1.0);
  assert-equal(u * v, 3.0);
end;

define test test-squared ()
  let v = v3d(2.0, 2.0, 2.0);
  assert-equal(squared(v), 12.0);
end;

define test test-cross-product ()
  let u = v3d(3.0, -3.0, 1.0);
  let v = v3d(4.0, 9.0, 2.0);
  let r = v3d(-15.0, -2.0, 39.0);
  assert-equal(cross-product(u, v), r);
end;

define test test-normalize ()
  let v1 = v3d(3.0, 1.0, 2.0);
  assert-equal(normalize(v1), unitize(v1));
  assert-true(similar(magnitude(normalize(v1)), 1.0));
end;

run-test-application();
