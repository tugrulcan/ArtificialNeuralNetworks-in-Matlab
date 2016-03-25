  function DataGeneratorforPavianiFunction()
    x_matris = [];
    results = [];
    
    for i=1: 1000 %10 * 1000 matrice
        x = (2.001) +  rand(1,10)*(9.999 - 2.001);
        results = [results ; pavianiFunction(x)];
        x_matris = [x_matris; x];
    end
    min(results)
    save dataPavianiFunc.mat results x_matris
    disp('The data have been generated.')
end
