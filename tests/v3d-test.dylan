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
  let v1 = make(<v3>, x: 1.0, y: 1.0, z: 1.0);
  let v2 = make(<v3>, x: 2.0, y: 2.0, z: 2.0);
  let v3 = make(<v3>, x: 3.0, y: 3.0, z: 3.0);
  assert-equal(v1 + v2, v3);
end;

define test test-negated ()
  let v = make(<v3>, x: 1.0, y: 2.0, z: 3.0);
  let r = make(<v3>, x: -1.0, y: -2.0, z: -3.0);
  assert-equal(-v, r);
end;

define test test-commutativity ()
  let u = make(<v3>, x: 1.0, y: 2.0, z: 3.0);
  let v = make(<v3>, x: 4.0, y: 5.0, z: 6.0);
  assert-equal(u + v, v + u);
end;

define test test-inverse-element-of-addition ()
  let v = make(<v3>, x: 1.0, y: 2.0, z: 3.0);
  assert-equal(v + (-v), $v3-zero);
end;

define test test-minus ()
  let v1 = make(<v3>, x: 1.0, y: 1.0, z: 1.0);
  let v2 = make(<v3>, x: 2.0, y: 2.0, z: 2.0);
  assert-equal(v2 - v1, v1);
end;

define test test-scalar ()
  let v1 = make(<v3>, x: 2.0, y: 2.0, z: 2.0);
  let v2 = make(<v3>, x: 6.0, y: 6.0, z: 6.0);
  assert-equal(v1 * 3, v2);
end;

define test test-identity-scalar ()
  let v1 = make(<v3>, x: 2.0, y: 2.0, z: 2.0);
  assert-equal(v1 * 1.0, v1);
end;

define test test-div ()
  let v1 = make(<v3>, x: 6.0, y: 6.0, z: 6.0);
  let v2 = make(<v3>, x: 3.0, y: 3.0, z: 3.0);
  assert-equal(v1 / 2, v2);
end;

define test test-magnitude ()
  let v = make(<v3>, x: 0.0, y: 3.0, z: 4.0);
  assert-equal(magnitude(v), 5.0);
  let u = make(<v3>, x: 2.0, y: 3.0, z: 4.0);
  assert-equal(magnitude(u), sqrt(29.0));
end;

define test test-dot-product ()
  let u = make(<v3>, x: 1.0, y: 3.0, z: -5.0);
  let v = make(<v3>, x: 4.0, y: -2.0, z: -1.0);
  assert-equal(u * v, 3.0);
end;

define test test-squared ()
  let v = make(<v3>, x: 2.0, y: 2.0, z: 2.0);
  assert-equal(squared(v), 12.0);
end;

define test test-cross-product ()
  let u = make(<v3>, x: 3.0, y: -3.0, z: 1.0);
  let v = make(<v3>, x: 4.0, y: 9.0, z: 2.0);
  let r = make(<v3>, x: -15.0, y: -2.0, z: 39.0);
  assert-equal(cross-product(u, v), r);
end;

define test test-normalize ()
  let u = make(<v3>, x: 3.0, y: 1.0, z: 2.0);
  let v = make(<v3>, x: 0.8017837, y: 0.2672612, z: 0.5345224);
  let n = normalize(u);
  assert-equal(n, v);
end;

run-test-application();
