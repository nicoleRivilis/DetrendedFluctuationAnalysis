DetrendedFluctuationAnalysis
============================
This set of functions was designed for use with the MIT-BIH Polysomnography data available for free online via PhysioNet.

The algorithms are inspired by the paper, “Detrended fluctuation analysis of EEG in sleep apnea using MIT/BIH polysomnography data” published in Computers in Biology and Medicine in 2002 by Jong-Min LL, Dae-Jin Kim, In-Young Kim, Kwang-Suk Park, and Sun I. Kim. The work was a collaboration between the departments of biomedical engineering in the colleges of medicine at Hangyang University Haengdang-dong, Seongdong-ku, Seoul, and Seoul National University.

The goal of the project is the reproduce the results from this paper as closely as possible. To do so, several functions were created in the MATLAB language (which you must have installed to run them).

function [scalingExp, L, F] = DFA(timeSeries)
Given a one-dimensional time series, which may be nonlinear and/or non-stationary, this function uses detrended fluctuation analysis to find the scaling exponent that best fits the given time series. It also outputs the vector L of window sizes used and corresponding fluctuation for easy plotting. 

function y = brownNoise(N)
Generates normalized brown noise, which is the integral of white noise. The input N dictates the length of the time series generated. If for some reason you do not want it normalized you may comment out that line of code. 

function y = pinkNoise(N)
Similar to brownNoise, pinkNoise creates randomized pink noise (noise proportional to 1/f) of length N. 

function makeFig1(lengthseries)
This function was purely designed to reproduce figure 1 in the original paper. The figure generated demonstrates that the DFA function works properly and outputs the expected results for three different types of noise. The input lengthseries determines the length of the randomly generated noise. The noise generated is different every time and so if poor results are given on the first try, try a few more times to see if they change. Ideally the scaling exponents for white, pink, and brown noise should be 0.5, 1.0, and 1.5 respectively. Due to the random nature of the test data, do not expect perfect results. THIS FUNCTION DEPENDS ON THE THREE OTHER FUNCTIONS (DFA, BROWNNOISE, AND PINKNOISE)

function cleanEEG = EEGdenoise(EEG, ECG)
Subtracts ECG signal from EEG and plots results to match Figure 2.For purposes of matching the figure, xlim is set from 0 to 600 but the user can easily change this manually. Note: this does NOT follow the paper’s method, which states: During 60 ms before and after the R-wave peak point, we calculate the difference of maximum and minimum value of the ECG and the EEG respectively. ECG channel of polysomnography data is divided by mean difference, and rescaled to the EEG.
