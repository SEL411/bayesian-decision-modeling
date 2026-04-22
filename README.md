# Bayesian Decision Modeling

This repository documents my implementation and analysis of Bayesian decision modeling, completed as part of a structured assignment during a research internship.

The project includes:

* Analytical derivation of Bayesian inference
* Parameter estimation using Maximum Likelihood Estimation (MLE)
* Model evaluation using AICc

---

## 📐 Bayesian Inference

We assume:

$$
p(S) = \mathcal{N}(\mu, \sigma^2), \quad p(x|S) = \mathcal{N}(S, \sigma_0^2)
$$

Using Bayes’ rule:

$$
p(S|x) \propto p(x|S)p(S)
$$

By combining the exponents and completing the square, the posterior becomes:

$$
p(S|x) = \mathcal{N}(\mu_p, \sigma_p^2)
$$

where

$$
\sigma_p^2 = \left( \frac{1}{\sigma^2} + \frac{1}{\sigma_0^2} \right)^{-1}
$$

$$
\mu_p = \sigma_p^2 \left( \frac{\mu}{\sigma^2} + \frac{x}{\sigma_0^2} \right)
$$

This derivation was completed analytically as part of the assignment.

---

## ⚙️ Model Fitting

The goal was to recover three parameters used to generate the data:

* sensory noise (σ)
* bias (μ)
* lapse rate (γ)

Following the assignment instructions, I:

* Loaded experimental data (`dm_data.mat`)
* Modified the provided MATLAB script (`prob_3.m`) to make it executable
* Implemented Maximum Likelihood Estimation using Bayesian Adaptive Direct Search (BADS)
* Used inverse binomial sampling to approximate likelihood values

The likelihood function was computed using the provided simulator (`psycho_gen.m`).

Estimated parameters:

* σ ≈ 0.1152
* μ ≈ 0.5240
* γ ≈ 0.0287

---

## 📊 Model Evaluation

To evaluate predictive performance, I computed the Akaike Information Criterion corrected for sample size (AICc).

Based on negative log-likelihood values from candidate models:

* Fixed model
* Value model
* World model
* Hybrid model

I:

* Implemented the AICc computation in `evaluate_models.m`
* Applied the function to each model
* Reproduced the comparison figure based on AICc values

The formulas used are:

$$
AIC = 2k + 2 \cdot nLL
$$

$$
AICc = AIC + \frac{2k(k+1)}{n - k - 1}
$$

Lower AICc values indicate better model fit.

The figure below shows ΔAICc values relative to the best-performing model.

![AICc Comparison](images/figure_aicc.png)

---

## 📂 Contents

* `prob_3.m` — model fitting (modified script)
* `prob_4.m` — model evaluation
* `evaluate_models.m` — AICc computation function

---

## 📝 Notes

* This work follows the assignment on Bayesian decision modeling and model evaluation 
* The implementation is based on provided lab code, which I modified for execution and analysis
* Original datasets and proprietary materials are not included
