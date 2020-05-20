<../papyDoctorOSCADLib.scad>

rext=3;

pts = [
            [0,0], [50,10], [100,0], [100,30], [0,80]
      ];
rs = [rext,rext+150,rext, rext+2,rext+4];
thick = 2;


pts2 = [
            [4,5], [50,15], [95,5], [95,27], [4,73]
      ];
rs2 = [rext,rext+150,rext, rext+2,rext+2];
thick2 = 4;
      
shape25(pts, rs, thick);

difference() {
shape25(pts, rs, thick+30);
shape25(pts2, rs2, thick2+40);
}