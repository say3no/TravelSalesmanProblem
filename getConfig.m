function conf = getConfig( method , nStops)
  conf.randset = 1;
  %% TabuSearch
  if strcmp(method,'TabuSearch')
    conf.times = 499; % 探索の回数
    conf.timesNeighbor = 30; % 近傍探索の回数
    conf.sizeTabuList = conf.times * 0.4; % sizeTabuList < nStops * ( nStops -1 ) * 1/2
  end

  %% Simulated Annealing
  if strcmp(method,'SimulatedAnnealing')
    conf.temperature = 4000;
    conf.cool_coefficient = 0.935;
    conf.timesNeighbor = 30;
  end

  %% Guided Local Search
  if strcmp(method,'TabuSearch')
    conf.times = 499; % 探索の回数
    conf.timesNeighbor = 30; % 近傍探索の回数
    conf.sizeTabuList = conf.times * 0.4; % sizeTabuList < nStops * ( nStops -1 ) * 1/2
  end

  %% Genetic Algorithm
  if strcmp(method,'GeneticAlgorithm')
    conf.population = nStops*10;
    conf.genotype = 'Permutation';
    conf.kill.type ='Truncation';% Only had implemented 'Truncation'
    conf.kill.rate = 0.8;
    conf.select.type = 'Roulette'; % Only had implemented 'Roulette'
    conf.crossover.type = 'One-point'; % Only had implemented 'One-point'
    conf.crossover.border = nStops * 0.5;
    conf.crossover.rate = 0.98;
    conf.crossover.parents = 2;
    % mutationRate = 1 - crossoverRate;
    conf.generations = 1000;
  end

  %% Ant Colony Optimization
  if strcmp(method,'AntColonyOptimization')
    %% --- params of Ants
    conf.population = nStops * 10; % agent is 🐜
    conf.gobackTimes = 199;
    conf.evaporationRate = 0.90;
    conf.acidQuantity = 10;
    conf.heurisPow = 4;
    conf.acidPow = 1;
  end

  %% adaptive Two Layered Hybrid Algorithm
  if strcmp(method,'a-TLHA')
    conf.local = getConfig('TabuSearch' , nStops);
    conf.ga = getConfig('GeneticAlgorithm' , nStops);
  end
end
