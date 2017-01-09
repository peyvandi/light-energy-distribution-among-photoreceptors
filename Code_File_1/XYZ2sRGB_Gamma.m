
%  XYZ to sRGB 
%  by : Shahram PEYVANDI
%  Affiliation : Rutgers, The State University of New Jersey-Newark
%                Visual Perception Lab
%                Department of Psychology
%                101 Warren Street, Smith Hall, Rm 355
%  DATE : 2/1/2014
%  Last UPDATE : 10/3/2016
%  potential bugs : none identified
%  Usuage : sRGBout = XYZ2sRGB_Gamma(XYZ, Gamma)
%  XYZ : (3*N) tristimulus values of N color stimuli
%  Gamma no Less than 1.96. Proposed Gamma = 2.4

function sRGBout = XYZ2sRGB_Gamma(XYZ, Gamma)
    % See IEC_61966-2-1.pdf
    if size(XYZ,1) ~= 3
        XYZ = XYZ';
    end
% % % % Forward transformation from 1931 CIE XYZ to sRGB (Eqn 6 in IEC_61966-2-1.pdf).
    M = [3.2406255 -1.537208 -0.4986286
        -0.9689307 1.8757561 0.0415175
        0.0557101 -0.2040211 1.0569959];
    sRGB = M*XYZ; clear XYZ
    l = 12.92*sRGB.*(sRGB<=0.0031308);
    u = (1.055*((sRGB.*(sRGB > 0.0031308)).^(1/Gamma))) - 0.055;
    sRGBout = max(l,0) + max(u,0); clear l u sRGB
end

     
         