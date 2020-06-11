data {
    int<lower=0> N;    //Number of dim
    vector[N] mu;      //location vector
    matrix[N,N] sig;   //covariance matrix
}

parameters {
    vector[N] y;
}

model {
    y ~ multi_normal(mu, sig);
}