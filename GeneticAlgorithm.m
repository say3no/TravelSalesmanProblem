% Befor use this repository, you have to add the path at once.
p = path;
pathAssets = strcat(pwd,'/assets/');
path(path,pathAssets);

clc;
close all;
clear;

%% --- start measure
start_time = cputime;
allvars = whos;
memused1 = sum([allvars.bytes]);

%% --- Create cities and map
load('usborder.mat','x','y','xx','yy');
map.nStops = 100; % you can use any number, but the problem size scales as N^2
[map.distMap, map.lon, map.lat] = initCities(map.nStops);

%% --- params of Genetic Algorithm
numOfAgents = 10;
agents = zeros(numOfAgents,map.nStops+1);
genotype = 'Permutation';

% how to kill agents
kill.type ='Truncation';% Only had implemented 'Truncation'
kill.rate = 0.7;

% how decide parents or mutant
select.type = 'Roulette'; % Only had implemented 'Roulette'

% how method of crossover
crossover.type = 'One-point'; % Only had implemented 'One-point'
crossover.border = map.nStops * 0.3;
crossover.rate = 0.88;
crossover.parents = 2;

% mutationRate = 1 - crossoverRate;
generations = 1000;

%% --- search
tour = 1:map.nStops;
cost = map.nStops + 1;

for i = 1:numOfAgents
  agents(i,tour) =  getRandomTour(map.nStops);
  agents(i,cost) = getTotalDist(agents(i,tour),map.distMap);
end

doPlot = 1;
[bestTour bestCost agents] = doGeneticAlgorithm(map,agents,kill,select,crossover,generations,1);


%% --- end measure
allvars = whos;
memused2 = sum([allvars.bytes]);
memcost = memused2 - memused1;
end_time = cputime;
exec_time = end_time - start_time;
fprintf('\ntime taken = %f\t', exec_time);
fprintf('\nmemeory cost = %f\t', memcost);

%% --- visualize
if doPlot == 1
  % bestTour
  figure('Name','Best Tour','NumberTitle','off')
  plot(x,y,'Color','red'); % draw the outside border
  hold on
  plot(map.lon,map.lat,'*b')
  drawTourPath(map.lon,map.lat,bestTour);
  hold off
end
bestCost