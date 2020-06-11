data {
    vector[2] mu;       // location
    matrix[2,2] sigma;  // scale
    real eta;           // location
}

generated quantities {
    vector[2] result = multi_normal_rng(mu,sigma);
    matrix[2, 2] correl_matrix = lkj_corr_cholesky_rng(2, eta);
}