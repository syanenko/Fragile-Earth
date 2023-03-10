#version 3.8;
global_settings { assumed_gamma 1 }

#declare luminosity = 0.8;
#include "playground.inc"
#include "colormaps.inc"

//
// Axis for debugging
//
// axis (1,0.5,1,0.008)

//
// Perspective camera
//
camp (2.1,1.5,2.1,0,-0.42,0,45)

//
// Colormaps
//
#declare jet = make_colormap (jet, 0, 0);
#declare hot = make_colormap (hot, 0, 0);
#declare hsv = make_colormap (hsv, 0, 0);


// Animation state
#declare state = (abs(clock-1));

//
// Header
//
text {
  ttf "Arial.ttf" "Global warming influence" 0.02, 0
  pigment {  gradient y
             color_map {hot}
             translate y * 0.6
             scale 3 }
  scale 0.2
  rotate <25,-135,0>
  translate <-0.7,-0.56,-2.3>
}

//
// Year
//
#declare year = 2000 + state * 17.24;
#debug concat("----- Year: ", str(year,4,3), "\n")
#declare year_text = str(year, 4, 0);

text {
  ttf "Arial.ttf" year_text 0.02, 0

  pigment {  gradient y
             color_map {jet}
             translate -y * state * 0.20
             scale 2 }
  
  scale 0.13
  rotate <30,-135,0>
  translate <-0.7,-1.24,1>
}


//
// Earth
//
intersection{
              
  // Sphere
  sphere{0,0.5 translate <0.50,-0.01,0.5>
    pigment {  gradient y
               color_map {hsv}
               translate -y*0.12
               scale 2 }}

  #debug concat("----- Clock: ", str(clock,3,1), "\n")
  
  // Height field
  height_field{
  
    function 500,500 { pattern { bozo scale 0.08 } }
    smooth
    pigment {  gradient y
               color_map {hsv}
               translate -y * 0.81
               scale 0.8 }
    
    translate y * clock
    scale y * 0.45
  }
  
  scale 1.0
}
