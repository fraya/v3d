Module:     v3d
Synopsis:   Three dimension vector
Author:     Fernando Raya
Copyright:  (c) 2020
License:    See LICENSE file

// https://how-to.fandom.com/wiki/Howto_compare_floating_point_numbers_in_the_C_programming_language
// define method assert-equal-float
//   (x :: <float>, y :: <float>, #key epsilon = 0.00001 )
//   => (equal? :: <boolean>)
//   ((x - epsilon) < y) & ((x + epsilon) > y)
// end;

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
define method assert-equal-float
  (x :: <float>, y :: <real>, #key max-ulps = 3.0d0)
  => (result :: <boolean>)
  if (y.zero?)
    abs(x) < scale-float(max-ulps, 1 - float-digits(x));
  else
    let (x-sig, x-exp, x-sign) = decode-float(x);
    let scaled-diff = abs(scale-float(x, - x-exp) - scale-float(y, - x-exp));
    let ulp-diff = scale-float(scaled-diff, float-digits(x) - 1);

    ulp-diff < max-ulps;
  end if;
end;

define sealed class <v3d> (<object>)
  constant slot x :: <float>,
    init-keyword: x:;
  constant slot y :: <float>,
    init-keyword: y:;
  constant slot z :: <float>,
    init-keyword: z:;
end class <v3d>;

define method make
  (type == <v3d>, #rest args, #key x, y, z)
  => (v :: <v3d>)
  apply(next-method,
	<v3d>,
	x: as(<float>, x),
	y: as(<float>, y),
	z: as(<float>, z),
	args)
end;	  

define method print-object
  (v :: <v3d>, s :: <stream>)
  => ()
  format(s, "(x: %=, y: %=, z: %=)", v.x, v.y, v.z)
end;

define constant $v3d-zero 
  = make(<v3d>, x: 0, y: 0, z: 0);

define method \=
  (a :: <v3d>, b :: <v3d>)
  => (equal? :: <boolean>)
  //a.x = b.x & a.y = b.y & a.z = b.z
   assert-equal-float(a.x, b.x)
 & assert-equal-float(a.y, b.y)
 & assert-equal-float(a.z, b.z)
end;

define method \+
  (a :: <v3d>, b :: <v3d>)
  => (sum :: <v3d>)
  make(<v3d>,
       x: a.x + b.x,
       y: a.y + b.y,
       z: a.z + b.z)  
end;

define method \-
  (a :: <v3d>, b :: <v3d>)
  => (difference :: <v3d>)
  make(<v3d>,
       x: a.x - b.x,
       y: a.y - b.y,
       z: a.z - b.z)
end;

define method negative
  (p :: <v3d>)
  => (negated :: <v3d>)
  make(<v3d>,
       x: -p.x,
       y: -p.y,
       z: -p.z)
end;

define method \*
  (p :: <v3d>, n :: <number>)
  => (product :: <v3d>)
  make(<v3d>,
       x: p.x * n,
       y: p.y * n,
       z: p.z * n)
end;

define method \/
  (p :: <v3d>, n :: <number>)
  => (division :: <v3d>)
  make(<v3d>,
       x: p.x / n,
       y: p.y / n,
       z: p.z / n)
end;

define method dot-product
  (a :: <v3d>, b :: <v3d>)
  => (n :: <float>)
  as(<float>, (a.x * b.x) + (a.y * b.y) + (a.z * b.z))
end;

define method squared
  (v :: <v3d>)
  => (n :: <float>)
  dot-product(v, v)
end;

define method magnitude
  (v :: <v3d>)
  => (n :: <float>)
  sqrt(squared(v))
end;

define method cross-product
  (a :: <v3d>, b :: <v3d>)
  => (result :: <v3d>)
  make(<v3d>,
       x: a.y * b.z - a.z * b.y,
       y: a.z * b.x - a.x * b.z,
       z: a.x * b.y - a.y * b.x)
end;

define method unit?
  (v :: <v3d>)
  => (is-unit :: <boolean>)
  magnitude(v) = 1.0
end;

define method zero?
  (v :: <v3d>)
  => (zero? :: <boolean>)
    v.x.zero?
  & v.y.zero?
  & v.z.zero?
end;

define method normalize
  (v :: <v3d>)
  => (normalized :: <v3d>)
  v / magnitude(v)
end;

define method unitize
  (v :: <v3d>)
  => (unit :: <v3d>)
  normalize(v)
end;

define method distance
  (a :: <v3d>, b :: <v3d>)
  => (n :: <number>)
  magnitude(a - b)
end;

