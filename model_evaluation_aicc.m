
clear all; 
load('nll_candidmodels.mat'); 

% Configuration
n      = 5096;
num_k  = [6,9,5,2,1];   
NP     = size(nll_pop,1);

% Extract columns for each model
World_model_nll_column  = nll_pop(:,1);
Hybrid_model_nll_column  = nll_pop(:,2);
Value_model_nll_column  = nll_pop(:,3);
Fixed_model_nll_column = nll_pop(:,4);

% Compute AICc values
AICc_all = nan(NP,5);
AICc_all(:,1) = evaluate_models(World_model_nll_column,  num_k(1), n); 
AICc_all(:,2) = evaluate_models(Hybrid_model_nll_column, num_k(2), n); 
AICc_all(:,3) = evaluate_models(Value_model_nll_column,  num_k(3), n); 
AICc_all(:,4) = evaluate_models(Fixed_model_nll_column,  num_k(4), n);
AICc_all(:,5) = evaluate_models(nll_pop(:,5),            num_k(5), n); 

% Compute AICc values
AICc_base = AICc_all(:,5);       
Delta = AICc_all - AICc_all(:,5);
World_AICc_Delta_col  = -(AICc_all(:,1) - AICc_base);
Hybrid_AICc_Delta_col = -(AICc_all(:,2) - AICc_base);
Value_AICc_Delta_col  = -(AICc_all(:,3) - AICc_base);
Fixed_AICc_Delta_col  = -(AICc_all(:,4) - AICc_base);

% Summary statistics and plotting
order = [1 2 3 4];
plotLabels = {'Fixed','Value','World','Hybrid'};

mu  = [mean(Fixed_AICc_Delta_col), mean(Value_AICc_Delta_col), ...
       mean(World_AICc_Delta_col), mean(Hybrid_AICc_Delta_col)];

sem = [std(Fixed_AICc_Delta_col)/sqrt(NP), std(Value_AICc_Delta_col)/sqrt(NP), ...
       std(World_AICc_Delta_col)/sqrt(NP), std(Hybrid_AICc_Delta_col)/sqrt(NP)];

figure('Color','w','Position',[200 200 600 400]);
bar(mu); hold on

errorbar(1:numel(order), mu, sem, 'k','linestyle','none','linewidth',1.2);
set(gca,'XTick',1:4,'XTickLabel',plotLabels,'FontSize',12,'FontWeight','bold');
ylabel('\DeltaAICc','FontSize',13,'FontWeight','bold','Color','k');
xlabel('Model','FontSize',12,'FontWeight','bold');
box off; hold off;

% (1) nll: negative log-likelihoods (row: 30 subjects, columns: models); For descriptions of models, refer to Lee et al. (2023)
    % col 1: World
    % col 2: Hybrid
    % col 3: Value
    % col 4: Fixed
    % col 5: Base
% (2) num_k: # of paramaeters for each model
% (3) dataP: datapoints (i.e. # of valid choice trials for each individual); this is needed to calculated corrected AIC (AICc)

% Write a function named "evaluate_models". You may want to evaluate them using Bayesian Information Criteria (BIC) as well. 
%[ aicc, bic ] = evaluate_models(nll_pop, dataP);


