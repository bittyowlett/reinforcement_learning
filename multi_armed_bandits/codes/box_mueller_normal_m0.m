% BOX MUELLER Method for generating N(0,1) random variable

function [y1, y2]= box_mueller_normal_m0
     u1 = rand;
     u2 = rand;
     a = (-2.*log(u1)).^0.5 ;
     b = 2*pi*u2 ;
     
     y1 = a.*sin(b);  
     y2 = a.*cos(b);
end
    
    
    