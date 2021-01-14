||| Represents shapes
data Shape = ||| A triangle, with its base length and height
             Triangle Double Double
           | ||| A Rectangle, with its length and height
             Rectangle Double Double
           | ||| A Sphere, with its radius
             Circle Double
%name Shape shape, shape1, shape2
data Picture = Primitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double Picture
%name Picture pic, pic1, pic2

rectangle : Picture
rectangle = Primitive (Rectangle 20 10)
circle : Picture
circle = Primitive (Circle 5)
triangle : Picture
triangle = Primitive (Triangle 10 10)

testPicture : Picture
testPicture = Combine (Translate 5 5 rectangle)
               (Combine (Translate 35 5 circle)
               (Translate 15 25 triangle))

area : Shape -> Double
area (Triangle x y) = 0.5 * x * y
area (Rectangle x y) = x * y
area (Circle x) = pi * x * x

pictureArea : Picture -> Double
pictureArea (Primitive shape) = area shape
pictureArea (Combine pic pic1) = pictureArea pic + pictureArea pic1
pictureArea (Rotate x pic) = pictureArea pic
pictureArea (Translate x y pic) = pictureArea pic
