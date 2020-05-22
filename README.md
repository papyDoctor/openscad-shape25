# openscad-shape25
An OpenScad libray that add curved chamfers (concave and convex) to polygons.
## shape25(points, radiuses, thickness)
Draw a 2D5 polygon based on 2D vector ***points*** whose corners are rounded with 1D vector ***radiuses***, the shape height is defined by the real positive ***thickness***
  - points: vector of 2D points, points that form the polygon
  - radiuses: vector of points, radiuses of the chamfers
  - thickness: real positive, height of extrusion

## hshape25(points, radiuses, thickness, thicknessWall)
Draw a 2D5 hollow polygon based on 2D vector ***points*** whose corners are rounded with 1D vector ***radiuses***, the shape height is defined by the real positive ***thickness***, the wall thickness id defined by the real positive ***thicknessWall***
  - points: vector of 2D points, points that form the polygon
  - radiuses: vector of points, radiuses of the chamfers
  - thickness: real positive, height of extrusion
  - thicknessWall: real positive, thickness of the hollow shape (absolutely constant when mathematically possible)
### Constrains:
  - Draw the shape conter-clockwise
  - Fillets must not enter in conflict (keep always a small edge between)
### Example:
- See the lib file and the examples folder
