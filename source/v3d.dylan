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

define macro v3-vector-definer
  { define v3-vector ?:name (?type:name) end }
    => { let klass = "<" ## ?name ## ">";
	 
	 define constant "<" ## ?name ## ">" = limited(<vector>, of: ?type, size: 3);

         define inline function ?name ## "-x" (v :: "<" ## ?name ## ">") => (x :: ?type) v[0] end;
         define inline function ?name ## "-y" (v :: "<" ## ?name ## ">") => (y :: ?type) v[1] end;
         define inline function ?name ## "-z" (v :: "<" ## ?name ## ">") => (z :: ?type) v[2] end;

         define function ?name 
             (x :: ?type, y :: ?type, z :: ?type) => (v :: "<" ## ?name ## ">")
           let v = make("<" ## ?name ## ">", fill: as(?type, 0));
           v[0] := x; v[1] := y; v[2] := z;
           v
         end;

        define constant "$" ## ?name ## "-zero"
           = ?name(as(?type, 0), as(?type, 0), as(?type, 0));
 
         define function ?name ## "-add"
             (a :: "<" ## ?name ## ">", b :: "<" ## ?name ## ">") => (sum :: "<" ## ?name ## ">")
             ?name(a.?name ## "-x" + b.?name ## "-x",
                   a.?name ## "-y" + b.?name ## "-y",
                   a.?name ## "-z" + b.?name ## "-z")
         end;

         define method ?name ## "-negative"
             (p :: "<" ## ?name ## ">") => (negated :: "<" ## ?name ## ">")
	     ?name(-p.?name ## "-x", -p.?name ## "-y", -p.?name ## "-z")
         end;
  }
end macro v3-vector-definer;

define v3-vector v3f (<float>) end;

// define method \=
//     (a :: <v3>, b :: <v3>) => (equal? :: <boolean>)
//   similar(a.v-x, b.v-x) & similar(a.v-y, b.v-y) & similar(a.v-z, b.v-z)
// end;

// define method \+
//     (a :: <v3>, b :: <v3>) => (sum :: <v3>)
//   v3(a.v-x + b.v-x, a.v-y + b.v-y, a.v-z + b.v-z)  
// end;

// define method \-
//     (a :: <v3>, b :: <v3>) => (difference :: <v3>)
//   v3(a.v-x - b.v-x, a.v-y - b.v-y, a.v-z - b.v-z)
// end;

// define method negative
//     (p :: <v3>) => (negated :: <v3>)
//   v3(-p.v-x, -p.v-y, -p.v-z)
// end;

// define method \*
//     (p :: <v3>, n :: <float>) => (product :: <v3>)
//   v3(p.v-x * n, p.v-y * n, p.v-z * n)
// end;

// define method \*
//     (n :: <float>, p :: <v3>) => (producto :: <v3>)
//   p * n
// end;

// define method \/
//     (p :: <v3>, n :: <float>) => (division :: <v3>)
//   v3(p.v-x / n, p.v-y / n, p.v-z / n)
// end;

// define method \*
//     (a :: <v3>, b :: <v3>) => (n :: <float>)
//   (a.v-x * b.v-x) + (a.v-y * b.v-y) + (a.v-z * b.v-z)
// end;

// define function squared
//     (v :: <v3>) => (n :: <float>)
//   v * v
// end;

// define function magnitude
//     (v :: <v3>) => (n :: <float>)
//   sqrt(squared(v))
// end;

// define function cross-product
//     (a :: <v3>, b :: <v3>) => (result :: <v3>)
//   v3(a.v-y * b.v-z - a.v-z * b.v-y,
//      a.v-z * b.v-x - a.v-x * b.v-z,
//      a.v-x * b.v-y - a.v-y * b.v-x)
// end;

// define function unit?
//     (v :: <v3>) => (is-unit :: <boolean>)
//   magnitude(v) = 1.0
// end;

// define method zero?
//     (v :: <v3>) => (zero? :: <boolean>)
//   v.v-x.zero? & v.v-y.zero? & v.v-z.zero?
// end;

// define function normalize
//     (v :: <v3>) => (normalized :: <v3>)
//   v / magnitude(v)
// end;

// define function distance
//     (a :: <v3>, b :: <v3>) => (n :: <float>)
//   magnitude(a - b)
// end;

