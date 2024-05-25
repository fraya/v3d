Module:     v3d-impl
Synopsis:   Three dimension vector
Author:     Fernando Raya
Copyright:  (c) 2020
License:    See LICENSE file

define method similar
    (x :: <float>, y :: <float>, #key epsilon = 0.00001 )
 => (equal? :: <boolean>)
  abs(x - y) < epsilon
end;

define sealed class <v3> (<object>)
  slot v-x :: <float> = 0.0, init-keyword: x:, setter: #f;
  slot v-y :: <float> = 0.0, init-keyword: y:, setter: #f;
  slot v-z :: <float> = 0.0, init-keyword: z:, setter: #f;
end class <v3>;

define inline function v3
    (x :: <float>, y :: <float>, z :: <float>)
 => (v :: <v3>)
  make(<v3>, x: x, y: y, z: z)
end;

define method print-object
    (v :: <v3>, s :: <stream>) => ()
  format(s, "(%=, %=, %=)", v.v-x, v.v-y, v.v-z)
end;

define constant $v3-zero 
  = v3(0.0, 0.0, 0.0);

define sealed domain \= (<v3>, <v3>);
define sealed domain \+ (<v3>, <v3>);
define sealed domain \- (<v3>, <v3>);
define sealed domain negative (<v3>);
define sealed domain \* (<v3>, <v3>);
define sealed domain \* (<v3>, <float>);
define sealed domain \* (<float>, <v3>);
define sealed domain \/ (<v3>, <float>);
define sealed domain zero? (<v3>);

define method \=
    (a :: <v3>, b :: <v3>) => (equal? :: <boolean>)
  similar(a.v-x, b.v-x) & similar(a.v-y, b.v-y) & similar(a.v-z, b.v-z)
end;

define method \+
    (a :: <v3>, b :: <v3>) => (sum :: <v3>)
  v3(a.v-x + b.v-x, a.v-y + b.v-y, a.v-z + b.v-z)  
end;

define method \-
    (a :: <v3>, b :: <v3>) => (difference :: <v3>)
  v3(a.v-x - b.v-x, a.v-y - b.v-y, a.v-z - b.v-z)
end;

define method negative
    (p :: <v3>) => (negated :: <v3>)
  v3(-p.v-x, -p.v-y, -p.v-z)
end;

define method \*
    (p :: <v3>, n :: <float>) => (product :: <v3>)
  v3(p.v-x * n, p.v-y * n, p.v-z * n)
end;

define method \*
    (n :: <float>, p :: <v3>) => (producto :: <v3>)
  p * n
end;

define method \/
    (p :: <v3>, n :: <float>) => (division :: <v3>)
  v3(p.v-x / n, p.v-y / n, p.v-z / n)
end;

define method \*
    (a :: <v3>, b :: <v3>) => (n :: <float>)
  (a.v-x * b.v-x) + (a.v-y * b.v-y) + (a.v-z * b.v-z)
end;

define function squared
    (v :: <v3>) => (n :: <float>)
  v * v
end;

define function magnitude
    (v :: <v3>) => (n :: <float>)
  sqrt(squared(v))
end;

define function cross-product
    (a :: <v3>, b :: <v3>) => (result :: <v3>)
  v3(a.v-y * b.v-z - a.v-z * b.v-y,
     a.v-z * b.v-x - a.v-x * b.v-z,
     a.v-x * b.v-y - a.v-y * b.v-x)
end;

define function unit?
    (v :: <v3>) => (is-unit :: <boolean>)
  magnitude(v) = 1.0
end;

define method zero?
    (v :: <v3>) => (zero? :: <boolean>)
  v.v-x.zero? & v.v-y.zero? & v.v-z.zero?
end;

define function normalize
    (v :: <v3>) => (normalized :: <v3>)
  v / magnitude(v)
end;

define function distance
    (a :: <v3>, b :: <v3>) => (n :: <float>)
  magnitude(a - b)
end;

