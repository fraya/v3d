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

define test test-addition ()
  let v1 = v3(1.0, 1.0, 1.0);
  let v2 = v3(2.0, 2.0, 2.0);
  let v3 = v3(3.0, 3.0, 3.0);

  assert-equal(v1 + v2, v3,
	       "Addition of vectors");
  assert-equal(v1 + v2, v2 + v1,
	       "Addition is commutative");
  assert-equal((v1 + v2) + v3, v1 + (v2 + v3),
	       "Addition is associative");
  assert-equal($v3-zero + v1, v1,
	       "0 is and additive identity");
  assert-equal($v3-zero, v1 + (-v1),
	       "Additive inverses exists");
end;

define test test-minus ()
  let v1 = v3(1.0, 1.0, 1.0);
  let v2 = v3(2.0, 2.0, 2.0);
  assert-equal(v2 - v1, v1);
end;

define test test-scalar ()
  let v1 = v3(2.0, 2.0, 2.0);
  let v2 = v3(6.0, 6.0, 6.0);
  let a = 2.0;
  let b = 3.0;

  assert-equal(v1 * 3.0, v2,
	       "Scalar multiplication");
  assert-equal(v1 * 1.0, v1,
	       "1 is a multiplicative identity");
  assert-equal((a * b) * v1, a * (b * v1),
	       "Scalar multiplication is associative");
  assert-equal(a * (v1 + v2), a * v1 + a * v2,
	       "Scalar multiplication distributes over vector addition");
  assert-equal((a + b) * v1, a * v1 + b * v1,
	       "Scalar multiplication distributes over scalar addition");
end;

define test test-div ()
  let v1 = v3(6.0, 6.0, 6.0);
  let v2 = v3(3.0, 3.0, 3.0);
  assert-equal(v1 / 2.0, v2);
end;

define test test-magnitude ()
  let v = v3(0.0, 3.0, 4.0);
  assert-equal(magnitude(v), 5.0);
  let u = v3(2.0, 3.0, 4.0);
  assert-equal(magnitude(u), sqrt(29.0));
end;

define test test-dot-product ()
  let u = v3(1.0, 3.0, -5.0);
  let v = v3(4.0, -2.0, -1.0);
  assert-equal(u * v, 3.0);
end;

define test test-squared ()
  let v = v3(2.0, 2.0, 2.0);
  assert-equal(squared(v), 12.0);
end;

define test test-cross-product ()
  let u = v3(3.0, -3.0, 1.0);
  let v = v3(4.0, 9.0, 2.0);
  let r = v3(-15.0, -2.0, 39.0);
  assert-equal(cross-product(u, v), r);
end;

define test test-normalize ()
  let v1 = v3(3.0, 1.0, 2.0);
  assert-true(similar(magnitude(normalize(v1)), 1.0));
end;

define test test-distance ()
  let v = v3(1.0, 0.0, 5.0);
  let w = v3(0.0, 2.0, 4.0);
  assert-equal(sqrt(6.0), distance(v, w));
end;

run-test-application();
