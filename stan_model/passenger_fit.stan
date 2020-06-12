data {
    int N; //Number of our samples from data
    int passenger_deaths[N]; //Deaths per year from data
}

parameters{
    real<lower=0> lambda;
}

model {
    lambda ~ normal(900,200);
    passenger_deaths ~ poisson(lambda);
}

generated quantities {
    int passenger_death = poisson_rng(lambda);
}