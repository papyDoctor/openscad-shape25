# openscad-shape25
An OpenScad libray that add curved chamfers (concave and convex) to polygons.

This library create polygon and add any curved chamfers to it, there is two modules:


## shape25(points, radiuses, thickness)
  - points: vector of 2D points, points that form the polygon
  - radiuses: vector of points, radiuses of the chamfers
  - thickness: real positive, height of extrusion

## hshape25(points, radiuses, thickness, thicknessWall)
  - points: vector of 2D points, points that form the polygon
  - radiuses: vector of points, radiuses of the chamfers
  - thickness: real positive, height of extrusion
  - thicknessWall: real positive, thickness of the hollow shape (absolutely constant when mathematically possible)

### Constrains:
  - Draw the shape conter-clockwise
  - Fillets must not enter in conflict (keep always a small edge between)



### Example:
- See the lib file and the examples folder
