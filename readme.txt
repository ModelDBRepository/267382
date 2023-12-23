

The zip file contains the files used to perform numerical simulation
and bifurcation studies of large networks of Izhikevich neurons and of the corresponding mean field models derived in our paper:

Liang Chen, Sue Ann Campbell, Exact mean-field models for spiking neural networks with adaptation, preprint: https://arxiv.org/abs/2203.08341, Submitted to Journal of Computational Neuroscience


The files are organized in order of appearance of figures in the paper. Nnumerical simulations of the network and mean-field models are performed by MATLAB (R2022a). Bifurcation is realized through combination of XPPAUT and MATLAB. The model file is *.ode, use XPPAUT to generate *.dat, then run plotxppaut4p4.m (developed by Ting-Hao Hsu) to obtain the figure in MATLAB.


1pop_TimeSeries_MATLAB: the network of Izhikevich neurons and its corresponding mean-field model

2pop_TimeSeries_MATLAB: the two-population network of Izhikevich neurons and its corresponding mean-field model

Parameter values are from 
1. [NicolaCampbell2013bif]: Bifurcation of large networks of two-dimensional integrate and fire neurons
2. [NicolaCampbell2013heter]: Mean-field models for heterogeneous networks of two-dimensional integrate and fire neurons

One population is strongly adapting, the other is weakly adapting
