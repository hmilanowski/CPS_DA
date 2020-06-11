data {
    real alpha;
    real mu;
    real phi;
}

generated quantities {
    real neg_bin_con = neg_binomial_rng(alpha, alpha/mu);
    real neg_bin_dis = neg_binomial_2_rng(mu, phi);

    real poisson_con = poisson_rng(mu);
}