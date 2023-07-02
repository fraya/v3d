***************
The v3d library
***************

.. current-library:: v3d
.. current-module:: v3d

.. contents::
   :depth: 3

.. _v3:

``<v3>`` class
===============

The class ``<v3>`` has three dimensions ``x``, ``y`` and ``z`` of
type :drm:`<float>`.

Creation with ``make``
~~~~~~~~~~~~~~~~~~~~~~

To create a vector use keywords:

.. code-block:: dylan

  let v = make(<v3>, x: 1.0, y: 2.0, z: 3.0);
  format-out("%=\n", v);
  // v3(1.0, 2.0, 3.0)

In case that a keyword is not used, the dimension is initialized to
``0.0``.

Creation with ``v3d``
~~~~~~~~~~~~~~~~~~~~~

.. function:: v3d

   Short form to create a ``v3d``.

   :signature: v3d *x* *y* *z* => (v)

   :parameter x: Dimension ``x``. An instance of :drm:`<float>`
   :parameter y: Dimension ``y``. An instance of :drm:`<float>`
   :parameter z: Dimension ``z``. An instance of :drm:`<float>`
   :value v: An instance of :class:`v3d`

   :description:

   The code is shorter but less flexible, all parameters must be
   passed and the order is important.

   :example:

   .. code-block:: dylan

     let v = v3d(1.0, 2.0, 3.0);
     format-out("%=\n", v);
     // v3(1.0, 2.0, 3.0)



Dimension accessors (``x``, ``y`` and ``z``)
============================================

Dimensions ``x``, ``y`` and ``z`` can be accessed by ``v-x``, ``v-y``
and ``v-z`` respectively.

.. method:: v-x
   :specializer: <v3>

   Returns the ``x`` dimension of a :class:`v3d`.

   :signature: v-x *v* => (x)

   :parameter v: An instance of :class:`<v3>`
   :value x: An instance of :drm:`<float>`

   :example:

   .. code-block:: dylan

     let u = make(<v3>, x: 1.0, y: 2.0, z: 3.0);
     format-out("x = %=\n", u.v-x);
     // prints 'x = 1.0'

.. method:: v-y
   :specializer: <v3>

   Returns the ``y`` dimension of a :class:`v3d`.

   :signature: v-y *v* => (y)

   :parameter v: An instance of :class:`<v3>`
   :value y: An instance of :drm:`<float>`

   :example:

   .. code-block:: dylan

     let u = make(<v3>, x: 1.0, y: 2.0, z: 3.0);
     format-out("y = %=\n", u.v-y);
     // prints 'y = 2.0'

.. method:: v-z
   :specializer: <v3>

   Returns the ``z`` dimension of a :class:`v3d`.

   :signature: v-z *v* => (z)

   :parameter v: An instance of :class:`<v3>`
   :value z: An instance of :drm:`<float>`

   :example:

   .. code-block:: dylan

     let u = make(<v3>, x: 1.0, y: 2.0, z: 3.0);
     format-out("z = %=\n", u.v-z);
     // prints 'z = 3.0'

.. _v3-zero:

Vector zero (``$v3-zero``)
==========================

``$v3-zero`` is a constant for a vector with ``0.0`` in coordinates
``x``, ``y`` and ``z``.

Infix operations
================

Equals (``=``)
~~~~~~~~~~~~~~

.. method:: =
   :specializer: <v3>, <v3>

   Check if two vectors are equal.

   :signature: \= *a* *b* => (equal?)

   :parameter a: An instance of :class:`<v3>`.
   :parameter b: An instance of :class:`<v3>`.
   :value equal?: An instance of :drm:`<boolean>`.
   :example:

   .. code-block:: dylan

     let v1 = v3d(1.0, 1.0, 1.0);
     let v2 = v3d(2.0, 2.0, 2.0);
     let result = if (v1 = v2) "equals" else "different" end;
     format-out("%s\n", result);
     // different

Addition (``+``)
~~~~~~~~~~~~~~~~

.. method:: +
   :specializer: <v3>, <v3>

   Adds two vectors.

   :signature: \+ *a* *b* => (sum)

   :parameter a: An instance of :class:`<v3>`.
   :parameter b: An instance of :class:`<v3>`.
   :value sum: An instance of :class:`<v3>`.
   :example:

   .. code-block:: dylan

     let v1 = v3d(1.0, 1.0, 1.0);
     let v2 = v3d(2.0, 2.0, 2.0);
     let v3 = v1 + v2;
     format-out("%=\n", v3);
     // v3(3.0, 3.0, 3.0)


Substraction (``-``)
~~~~~~~~~~~~~~~~~~~~

.. method:: -
   :specializer: <v3>, <v3>

   Substract two vectors.

   :signature: \- *a* *b* => (difference)

   :parameter a: An instance of :class:`<v3>`.
   :parameter b: An instance of :class:`<v3>`.
   :value difference: An instance of :class:`<v3>`.
   :example:

   .. code-block:: dylan

     let v1 = v3d(2.0, 2.0, 2.0);
     let v2 = v3d(1.0, 1.0, 1.0);
     let v3 = v1 - v2;
     format-out("%=\n", v3);
     // v3(1.0, 1.0, 1.0)


Negative (``-``)
~~~~~~~~~~~~~~~~~~

.. method:: -
   :specializer: <v3>

   Substract two vectors.

   :signature: \- *a* => (negated)

   :parameter a: An instance of :class:`<v3>`.
   :value negated: An instance of :class:`<v3>`.
   :example:

   .. code-block:: dylan

     let v1 = v3d(2.0, 2.0, 2.0);
     let v2 = -v1;
     format-out("%=\n", v2);
     // v3(-2.0, -2.0, -2.0)


Product (``*``)
~~~~~~~~~~~~~~~

.. method:: *
   :specializer: <v3>, <v3>

   Product of two vectors.

   :signature: * *a* *b* => (product)

   :parameter a: An instance of :class:`<v3>`.
   :parameter b: An instance of :class:`<v3>`.
   :value product: An instance of :drm:`<float>`.
   :example:

   .. code-block:: dylan

     let v1 = v3d(2.0, 2.0, 2.0);
     let v2 = v3d(2.0, 2.0, 2.0);
     let v3 = v1 * v2;
     format-out("%=\n", v3);
     // 12.0


Scalar multiplication (``*``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. method:: *
   :specializer: <v3>, <number>

   Product scalar of a vector by a number.

   Let *v = (x1, y1, z1)* and let *k* be scalar. The scalar
   multiplication of *kv = (kx1, ky1, kz1)*.

   :signature: * *a* *n* => (product)

   :parameter a: An instance of :class:`<v3>`.
   :parameter n: An instance of :drm:`<number>`.
   :value product: An instance of :class:`<v3>`.
   :example:

   .. code-block:: dylan

     let v1 = v3d(1.0, 1.0, 1.0);
     let v2 = v1 * 2;
     format-out("%=\n", v2);
     // v3(2.0, 2.0, 2.0)


Division (``/``)
~~~~~~~~~~~~~~~~~~~~~~

.. method:: /
   :specializer: <v3>, <number>

   Divide a vector by a number.

   :signature: * *a* *n* => (division)

   :parameter a: An instance of :class:`<v3>`.
   :parameter n: An instance of :drm:`<number>`.
   :value division: An instance of :drm:`<float>`.
   :example:

   .. code-block:: dylan

     let v1 = v3d(3.0, 3.0, 3.0);
     let v2 = v1 / 3;
     format-out("%=\n", v2);
     // v3(1.0, 1.0, 1.0)


