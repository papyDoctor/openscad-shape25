$fn=90;
 
//Example:
//points = [[0,0], [80,0], [40,25], [50,50], [0,50]];
//rayons = [5, 10, 9, 7, 20 ];
//e = 5;
//shape25(points, rayons, e);

module shape25(points, radiuses, thickness) {
    
    // Calculate the arc that is tangent to two lines: calculate the center point and
    // the start/end angles relatives to the line y=0
    // ptB is the common point of the two lines
    function arc(ptA, ptB, ptC, r) =

           let( dxAB = ptA[0]-ptB[0], 
                dyAB = ptA[1]-ptB[1],
                dxBC = ptC[0]-ptB[0], 
                dyBC = ptC[1]-ptB[1],
                
                angAB0 = atan2(dyAB, dxAB),
                angBC0 = atan2(dyBC, dxBC),
                signCross = sign(cross([dxAB, dyAB, 0],[dxBC, dyBC, 0])[2]),

                DA = signCross > 0 ?  0 : -180,
                angABC = (angAB0 + angBC0) / 2,
                
                d = -( (r / sin( (angAB0 - angBC0 + 2*DA) / 2 )) ),

                Dx = d * cos(angABC) + ptB[0], 
                Dy = d * sin(angABC) + ptB[1]
                )
            [Dx, Dy, signCross, angAB0, angBC0];

    pts = concat(points, [points[0]], [points[1]]);
    r = concat(radiuses, [radiuses[0]], [radiuses[1]]);

    union() {
        
        difference() {
            
            linear_extrude(thickness)
                polygon(points=pts);
            
            // DIFFERENCE
            for(i = [0 : len(pts)-3]) {

                C =  arc(pts[i], pts[i+1], pts[i+2], r[i+1]);
                
                if (C[2] < 0)
                translate([C[0], C[1], 0]) {

                    DA=0;
                    aout =20;
                    e=0.1;
                    h=sqrt( (pts[i+1][0] - C[0]) * (pts[i+1][0] - C[0]) +
                            (pts[i+1][1] - C[1]) * (pts[i+1][1] - C[1]) );

                    biss = abs(C[4]-C[3]) > 180  ? (C[3]+C[4])/2 : (C[3]+C[4])/2 + 180;
                    DB2 = abs(C[4]-C[3]);

// Place a # just before the translate (eg #translate ...) to see what's behind
                    translate([0, 0, -0.1])
                        rotate([ 0, 0, biss - (90-DB2/2) ])
                            rotate_extrude(angle = 2*(90-DB2/2), $fn = 90)
                                translate([r[i+1], 0, 0])
                                    square([h-r[i+1], thickness+0.2]);
                }
            }
        }
        
        // UNION
        for(i = [0 : len(pts)-3]) {

            C =  arc(pts[i], pts[i+1], pts[i+2], r[i+1]);

            if (C[2] >= 0)
            translate([C[0], C[1], 0]) {

                DA=0;
                aout =20;
                e=0.1;
                h=sqrt( (pts[i+1][0] - C[0]) * (pts[i+1][0] - C[0]) +
                        (pts[i+1][1] - C[1]) * (pts[i+1][1] - C[1]) );

                biss = abs(C[4]-C[3]) > 180  ? (C[3]+C[4])/2 : (C[3]+C[4])/2 + 180;
                DB2 = abs(C[4]-C[3]);

// Place a # just before the translate (eg #translate ...) to see what's behind
                translate([0, 0, 0])
                    rotate([ 0, 0, biss - (90-DB2/2) ])
                        rotate_extrude(angle = 2*(90-DB2/2), $fn = 90)
                            translate([r[i+1], 0, 0])
                                square([h-r[i+1], thickness]);
            }
        }        
    }
}