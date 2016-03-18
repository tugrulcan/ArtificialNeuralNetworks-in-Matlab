function y = pavianiFunction(x)
totalSigmaResult = 0.000;   
    for i= 1:10
            a1 = power((log(x(i) - 2)),2);
            a2 = power((log(10-x(i))),2);
            totalSigmaResult = totalSigmaResult + a1 + a2;
    end
totalCapitalPiResult= 1.000;
    for i= 1:10
        totalCapitalPiResult= totalCapitalPiResult * x(i);
    end
    
    totalCapitalPiResult = power(totalCapitalPiResult, (0.2) );
    
    y = totalSigmaResult - totalCapitalPiResult ;
    
end
