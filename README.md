# openscad-shape25
An OpenScad libray that add fillets (concave and convex) to polygons.

This libray create polygon and add any filets to it, there is one module: **shape25(points, radiuses, thickness)**

### Example:
>points = [[0,0], [80,0], [40,25], [50,50], [0,50]];
>
>radiuses = [5, 10, 9, 7, 20 ];
>
>th = 5;
>
>shape25(points, radiuses, th);

### Constrains
  - Draw the shape conter-clockwise
  - Fillets must not enter in conflict (keep always a small edge between)
