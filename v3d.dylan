Module:     v3d
Synopsis:   Three dimension vector
Author:     Fernando Raya
Copyright:  (c) 2020
License:    See LICENSE file

define method assert-equal-float
   (x :: <real>, y :: <real>, #key epsilon = 0.00001 )
   => (equal? :: <boolean>)
  abs(x - y) < epsilon
end;

// // https://floating-point-gui.de/errors/comparison/
// define method assert-equal-float
//   (x :: <float>, y :: <float>, #key epsilon = 0.00001)
//   => (equal? :: <boolean>)
//   let abs-x = abs(x);
//   let abs-y = abs(y);
//   let diff  = abs(x - y);

//   if (x == y)
//     // handles infinities
//     #t
//   elseif (zero?(x) | zero?(y) | (abs-x + abs-y < float.min-normal))
//     diff < (epsilon * float.min-normal)
//   else
//     diff / min((abs-x + abs-y), float.max-value) < epsilon
//   end if;
// end;

// // https://github.com/dylan-lang/testworks/issues/69
// define method assert-equal-float
//   (x :: <real>, y :: <real>, #key max-ulps = 3.0d0)
//   => (result :: <boolean>)
//   if (y.zero?)
//     abs(x) < scale-float(max-ulps, 1 - float-digits(x));
//   else
//     let (x-sig, x-exp, x-sign) = decode-float(x);
//     let scaled-diff = abs(scale-float(x, - x-exp) - scale-float(y, - x-exp));
//     let ulp-diff = scale-float(scaled-diff, float-digits(x) - 1);

//     ulp-diff < max-ulps;
//   end if;
// end;

define sealed class <v3> (<object>)
  slot v3-x :: <real> = 0.0, init-keyword: x:, setter: #f;
  slot v3-y :: <real> = 0.0, init-keyword: y:, setter: #f;
  slot v3-z :: <real> = 0.0, init-keyword: z:, setter: #f;
end class <v3>;

define method print-object
    (v :: <v3>, s :: <stream>) => ()
  format(s, "(x: %=, y: %=, z: %=)", v.v3-x, v.v3-y, v.v3-z)
end;

define constant $v3d-zero 
  = make(<v3>);

define method \=
    (a :: <v3>, b :: <v3>) => (equal? :: <boolean>)
  // a.v3-x = b.v3-x & a.v3-y = b.v3-y & a.v3-z = b.v3-z
  assert-equal-float(a.v3-x, b.v3-x)
    & assert-equal-float(a.v3-y, b.v3-y)
    & assert-equal-float(a.v3-z, b.v3-z)
end;

define method \+
    (a :: <v3>, b :: <v3>) => (sum :: <v3>)
  make(<v3>,
       x: a.v3-x + b.v3-x,
       y: a.v3-y + b.v3-y,
       z: a.v3-z + b.v3-z)  
end;

define method \-
    (a :: <v3>, b :: <v3>) => (difference :: <v3>)
  make(<v3>,
       x: a.v3-x - b.v3-x,
       y: a.v3-y - b.v3-y,
       z: a.v3-z - b.v3-z)
end;

define method negative
    (p :: <v3>) => (negated :: <v3>)
  make(<v3>,
       x: -p.v3-x,
       y: -p.v3-y,
       z: -p.v3-z)
end;

define method \*
    (p :: <v3>, n :: <number>) => (product :: <v3>)
  make(<v3>,
       x: p.v3-x * n,
       y: p.v3-y * n,
       z: p.v3-z * n)
end;

define method \/
    (p :: <v3>, n :: <number>) => (division :: <v3>)
  make(<v3>,
       x: p.v3-x / n,
       y: p.v3-y / n,
       z: p.v3-z / n)
end;

define method dot-product
    (a :: <v3>, b :: <v3>) => (n :: <float>)
  as(<float>, (a.v3-x * b.v3-x) + (a.v3-y * b.v3-y) + (a.v3-z * b.v3-z))
end;

define method squared
    (v :: <v3>) => (n :: <float>)
  dot-product(v, v)
end;

define method magnitude
    (v :: <v3>) => (n :: <float>)
  sqrt(squared(v))
end;

define method cross-product
    (a :: <v3>, b :: <v3>) => (result :: <v3>)
  make(<v3>,
       x: a.v3-y * b.v3-z - a.v3-z * b.v3-y,
       y: a.v3-z * b.v3-x - a.v3-x * b.v3-z,
       z: a.v3-x * b.v3-y - a.v3-y * b.v3-x)
end;

define method unit?
    (v :: <v3>) => (is-unit :: <boolean>)
  magnitude(v) = 1.0
end;

define method zero?
    (v :: <v3>) => (zero? :: <boolean>)
  v.v3-x.zero? & v.v3-y.zero? & v.v3-z.zero?
end;

define method normalize
    (v :: <v3>) => (normalized :: <v3>)
  v / magnitude(v)
end;

define method unitize
    (v :: <v3>) => (unit :: <v3>)
  normalize(v)
end;

define method distance
    (a :: <v3>, b :: <v3>) => (n :: <number>)
  magnitude(a - b)
end;

