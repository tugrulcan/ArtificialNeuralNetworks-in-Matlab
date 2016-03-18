function y = pavianiProblem(x)
toplamSembolSonuc = 0.000;   
    for i= 1:10
            a1 = power((log(x(i) - 2)),2);
            a2 = power((log(10-x(i))),2);
            toplamSembolSonuc = toplamSembolSonuc + a1 + a2;
    end
carpimSembolSonuc= 1.000;
    for i= 1:10
        carpimSembolSonuc= carpimSembolSonuc * x(i);
    end
    
    carpimSembolSonuc = power(carpimSembolSonuc, (0.2) );
    
    y = toplamSembolSonuc - carpimSembolSonuc ;
    
end
