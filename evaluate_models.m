function AICc = evaluate_models(nLL, k, n)
   m = length(nLL);         
   AICc = zeros(m, 1);      
   for i = 1:m
       this_nLL = nLL(i);   
       AIC  = 2*k + 2*this_nLL;
       AICc(i) = AIC + (2*k*(k+1)) ./ (n - k - 1);
   end
end

