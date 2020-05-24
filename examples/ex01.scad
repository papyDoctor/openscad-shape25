include <../openscad-shape25.scad>

//***********************
//**************  Data for the box *******************
//***********************
L = 70; // Length
l = 40; // Length
h = 20;  // Width
e = 2;  // Base and walls thickness (without ORing)
diamORing = 1;	// 0 if no ORing
ORingFill = 0.7;	// Slot depth in % of ORing diameter

// Data for screw
M0 = 3;      // Bolt metric, >= e
Insert = 1;	 // If use of insert, set Insert = 1;
			 // if not, set Insert = 0.
Clearance = 1.1;	// Minimum 1

//***********************
//************* Calculations, do not touch  
//************* unless you know what you do ;)
//***********************
eTap = e + diamORing; // Tap thickness
M = Insert == 1 ? M0 + 1.1 : M0;	// Works with M3, for other ... ?

widthPilar = 2*M*Clearance + 2*diamORing;
distEmbaseScrew = M*Clearance; 		// Dist center hole from external wall

r = M*Clearance;  	// Radius for edges

wSO = widthPilar;	// Dist internal edge from external wall
rSO = r/2;			// Radius of internal edge

ptsBodyExt = [
		[0,	0],
		[L,	0],
		[L,	l],
		[0,	l]
	  ];
rsBodyExt = [ r, r, r, r ];	  

thk = e + 2*diamORing;
ptsBodyInt = [
		[wSO,	wSO],
		[wSO,	thk],
		[L-wSO,	thk],
		[L-wSO,	wSO],
		[L-thk,	wSO],
		[L-thk,	l-wSO],
		[L-wSO,	l-wSO],
		[L-wSO,	l-thk],
		[wSO,	l-thk],
		[wSO,	l-wSO],	
		[thk,	l-wSO],
		[thk,	wSO]		
	  ];

rSOa = 2*rSO;
rSOb = rSO;
rsBodyInt = [ 	rSOa, rSOb, rSOb, rSOa, rSOb, rSOb,
				rSOa, rSOb, rSOb, rSOa, rSOb, rSOb ];

tmp = widthPilar - 2*diamORing;
tmp2 = e+diamORing/2;
ptsJoint = [
		[L/2,		tmp2],
		[L-tmp,		tmp2],
		[L-tmp,		tmp],
		[L-tmp2,	tmp],
		[L-tmp2,	l-tmp],
		[L-tmp,		l-tmp],
		[L-tmp,		l-tmp2],
		[tmp,		l-tmp2],
		[tmp,		l-tmp],
		[tmp2,		l-tmp],
		[tmp2,		tmp],
		[tmp,		tmp],
		[tmp,		tmp2],
		[L/2-0.00001,	tmp2],
	  ];  
rtmp = rSOb*1.5;
rtmp2 = rSOa/1.5;
rsJoint = [ 0, rtmp, rtmp2, rtmp, rtmp, rtmp2, rtmp,
			rtmp, rtmp2, rtmp, rtmp, rtmp2, rtmp, 0 ];

//************* Body ***************
// Base
color("AntiqueWhite", 1.0 )
	shape25(ptsBodyExt, rsBodyExt, e);

// Walls
translate([0, 0, e]) {
	difference() {
		
		color("AntiqueWhite", 1.0 )
			shape25(ptsBodyExt, rsBodyExt, h);
		
		translate([0, 0, -0.01])
			color("Red", 1.0 )
				shape25(ptsBodyInt, rsBodyInt, h+0.02);
		
		screwEmbaseBody();
		
	//ORing space
	if (diamORing != 0)
		translate([0, 0, h-diamORing*ORingFill])
		oshape25(ptsJoint, rsJoint, diamORing, diamORing*ORingFill+0.01);
	}
}	
	


//************* Tap ***************
translate([0, -l-10, 0]) {
	difference() {
		//Tap
		color("AntiqueWhite", 1.0 )
			shape25(ptsBodyExt, rsBodyExt, eTap);
		
		screwEmbaseTap();
	}
}

//*****  Embase for screw in the body *******
module screwEmbaseBody() {
	
	for (i=[distEmbaseScrew,L-distEmbaseScrew])
		for (j=[distEmbaseScrew,l-distEmbaseScrew])
			translate([i, j, -0.01])	
				cylinder(r=M/2, h+0.02);
}

//*****  Embase for screw in the tap *******
module screwEmbaseTap() {
	
	for (i=[distEmbaseScrew,L-distEmbaseScrew])
		for (j=[distEmbaseScrew,l-distEmbaseScrew])
			translate([i, j, -0.01]) {
				cylinder(r=M0/2+0.1, h+0.02);
				translate([0, 0, eTap/3])
				cylinder(r2=M0+0.1,r1=M0/2+0.1, 2*eTap/3+0.02);
			}
}

	