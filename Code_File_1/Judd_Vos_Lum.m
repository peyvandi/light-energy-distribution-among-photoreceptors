%  Vos modified Judd Luminance (cd/m2) of spectral data, 
%  by : Shahram PEYVANDI
%  Affiliation : Rutgers, The State University of New Jersey-Newark
%                Visual Perception Lab
%                Department of Psychology
%                101 Warren Street, Smith Hall, Rm 355
%  DATE : 2/2/2015
%  Last UPDATE : 10/3/2016
%  potential bugs : none identified
%  Usuage : [Luminance_Judd, XYZ_Judd, xyz_Judd] = Judd_Vos_Lum(Spectra, wlinf, wlinc, wlsup)
%  Spectra : (lambda*N) matrix of N spectral radiance functions of surface color stimuli, unit : W/sr m^2 nm 
%  wlinf : lower wavelength limit, unit : nanometer
%  wlsup : upper wavelength limit, unit : nanometer
%  wlinc : wavelength interval, unit : nanometer

function [Luminance_Judd, XYZ_Judd, xyz_Judd] = Judd_Vos_Lum(Spectra, wlinf, wlinc, wlsup)
% % Spectra is a (Lambda*n) column vector for n = 1 sample or matrix whose n columns are the spectra
load('Judd_Vos_CMFs.mat');
if nargin == 4
	in = max(wlinf, Judd_Vos.Wavelength(1));
    out = min(wlsup, Judd_Vos.Wavelength(end));
elseif nargin < 4
    disp('not enough input')
    return
end

xyz_judd = interp1(Judd_Vos.Wavelength, Judd_Vos.CMFs, in:wlinc:out)'; xyz_judd(isnan(xyz_judd)) = 0; clear Judd_Vos
Spectra = interp1(wlinf:wlinc:wlsup, Spectra, (in:wlinc:out)');

XYZ_Judd = xyz_judd*Spectra; 
xyz_Judd = XYZ_Judd./(ones(3,1)*sum(XYZ_Judd));

Luminance_Judd = 683.002*wlinc*xyz_judd(2,:)*Spectra; clear xyz_judd
XYZ_Judd = XYZ_Judd.*repmat(Luminance_Judd./XYZ_Judd(2,:),3,1);




