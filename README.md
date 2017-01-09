# light-energy-distribution-among-photoreceptors

**Distribution of Photon Energy among a Population of Interleaved Photoreceptors**

**AUTHORS:** Peyvandi, S.<sup>1</sup>, Ekroll, V.<sup>2</sup>, and Gilchrist, A.<sup>1</sup>

1- Department of Psychology, Rutgers, The State University of New Jersey, Newark, New Jersey 07102, USA <br>
2- Laboratory of Experimental Psychology, University of Leuven (KU Leuven), Belgium

## Background
The actual number of photons absorbed in a photoreceptor cell varies with Poisson fluctuation when the cell is exposed to a photon flux of a particular wavelength. When an array of photoreceptors is exposed to multi-wavelength light energy, this photon fluctuation introduces a spatial variation in absorption by a population of cells. We propose a model to characterize such spatial variation in absorption by the cells. Our model suggests that identical cells within a cone class (L-, M-, or S-cone) exposed to uniform stimulating light absorb different levels of light energy. Due to such spatial variation, a visual stimulation produces a distribution of responses within the cone excitation space. This MATLAB code shows the distribution of cone excitations for each of the 25 MacAdam (1942) color stimuli in the MacLeod-Boynton (1979) cone excitation space. The distribution of cone excitations represented within the Judd-Vos modified CIE 1931 chromaticity space (Vos, 1978) closely resemble those of the magnified chromaticity scatterings obtained by MacAdam (1942) for the variability of color matches.

## Introduction to the code
This is a repository for estimating the histogram of absorbed light energy by individual like-type cells of a particular class (e.g. L-, M-, S-cones).  


### Prerequisites
You need MATLAB program installed. You may need to have "Psychtoolbox-3" functions installed (see [psychtoolbox](http://psychtoolbox.org/)).

Note : estimation of the pupil area from the stimulus luminance, in FIGURE_1_DEMO_MacAdam_Excitations_plt.m, calls a function from Psychtoolbox. 

```
[~ , pupil_area, ~] = PupilDiameterFromLum(stimulus_luminance)
```

## Distribution of light energy among cone cells (cone excitations)

In the *Code_File_1* folder, open and run *FIGURE_1_DEMO_MacAdam_Excitations_plt.m*. The required functions and data are all within the same folder. 

### Notes
In this code, FWHM is the Full width at half maximum of the three Gaussian primaries, used to match the 25 MacAdam (1942) colors, centered at the wavelengths specified in lambda_prim. 

```
FWHM = 65; lambda_prim = [450, 530, 655];
```
### Plots
The function *macLeod_boynton_chromaticity()* plots points within the MacLeod-Boynton (1979) excitation space.

```
macLeod_boynton_chromaticity([10, 5, 4], 0.001); (0.001 defines the size of a point within the plot).
```
The function *CIE_Judd_chromaticity()* plots points within the Judd-Vos modified CIE 1931 chromaticity space (Vos, 1978).

```
CIE_Judd_chromaticity([0.35 0.45 0.2], 0.01)
```

## License
This project is released under the terms of the [MIT open-source license](https://github.com/peyvandi/light-energy-distribution-among-photoreceptors/blob/master/LICENSE).