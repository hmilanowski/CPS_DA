functions {
    vector gamma (vector y, vector theta, real[] x_r, int[] x_i) {
        vector[2] gammas;
        gammas[1] = inv_gamma_cdf(theta[1], exp(y[1]), exp(y[2])) - 0.01;
        gammas[2] = 0.99 - inv_gamma_cdf(theta[2], exp(y[1]), exp(y[2]));

        return gammas;
    }
}

data {
    real lower_bound;
    real upper_bound;
    real alpha_guess;
    real beta_guess;
}

transformed data {
    vector[2] y;
    real x_r[0];
    int x_i[0];
    vector[2] theta = [lower_bound, upper_bound]';

    vector[2] y_guess = [log(alpha_guess), log(beta_guess)]';
    y = algebra_solver(gamma, y_guess, theta, x_r, x_i);
}

generated quantities {
    real alpha = exp(y[1]);
    real beta = exp(y[2]);
}