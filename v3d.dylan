Module:     v3d
Synopsis:   Three dimension vector
Author:     Fernando Raya
Copyright:  (c) 2020
License:    See LICENSE file

define method similar
   (x :: <real>, y :: <real>, #key epsilon = 0.00001 )
   => (equal? :: <boolean>)
  abs(x - y) < epsilon
end;

define sealed class <v3> (<object>)
  slot v3-x :: <real> = 0.0, init-keyword: x:, setter: #f;
  slot v3-y :: <real> = 0.0, init-keyword: y:, setter: #f;
  slot v3-z :: <real> = 0.0, init-keyword: z:, setter: #f;
end class <v3>;

define method print-object
    (v :: <v3>, s :: <stream>) => ()
  format(s, "(x: %=, y: %=, z: %=)", v.v3-x, v.v3-y, v.v3-z)
end;

define constant $v3-zero 
  = make(<v3>);

define method \=
    (a :: <v3>, b :: <v3>) => (equal? :: <boolean>)
  similar(a.v3-x, b.v3-x) & similar(a.v3-y, b.v3-y) & similar(a.v3-z, b.v3-z)
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

