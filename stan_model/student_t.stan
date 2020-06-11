data {
    real nu;    //degrees of freedom
    real mu;    //location
    real sigma; //scale sigma
}

generated quantities {
    real y = student_t_rng(nu, mu, sigma);
}