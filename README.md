# openscad-shape25
An OpenScad library that create 2D5 shapes

## shape25(points, radiuses, height)
Create a shape with rounded corners
  - points: vector of 2D points, points that form the underlying polygon
  - radiuses: vector of points, radiuses of the rounded corners
  - height: real positive, height of extrusion

## hshape25(points, radiuses, thickness, height)
Create a hollow shape with rounded corners
  - points: vector of 2D points, points that form the underlying polygon
  - radiuses: vector of points, radiuses of the rounded corners
  - thickness: real positive, thickness of the hollow shape (absolutely constant when mathematically possible)
  - height: real positive, height of extrusion

## oshape25(points, radiuses, thickness, height)
Create an open shape (wire) with rounded corners
  - points: vector of 2D points, points that form the underlying broken lines
  - radiuses: vector of points, radiuses of the rounded corners
  - thickness: real positive, thickness of the line
  - height: real positive, height of extrusion

### Constrains:
  - Draw the shape conter-clockwise (not necessary for oshape25)
  - Fillets must not enter in conflict (keep always a small edge between)

### Example:
- See the lib file and the examples folder
