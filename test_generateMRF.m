clc;clear;close all;
addpath('./Functions');
x = (1:128)';
y = (1:128)';
order = 1;
Element = constructElements(x,y,0,order);
%%
Mset=[1 2 3];
Chain_length=100;
beta = [2 -0.5 2 -0.5]'; % beta is a column vector
MC_ini = zeros(length(x)*length(y),1);
Element = FixElement(Element,MC_ini);
Element = CalculateU(Element,zeros(1,length(Mset)));
Element = detectNeighborDirection(Element,2);
MC_simulated = SimulateMRF(Element,MC_ini,Mset,Chain_length,beta);
plotField(Element,MC_simulated(:,Chain_length));