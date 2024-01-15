%% PCA and MOM factor

% Let us illusrate this for $K=3$

mom_pca=table2array(mom_factors(:,2:6));

[coefMatrix score latnt tsquared explainedVar]=pca(array_data);

factors=mom_pca*coefMatrix(:,1:5);

plot(coefMatrix(:,1:3),'-x');
legend('First','Second','Third')


mom=mom_pca(:,5)-mom_pca(:,1);


corr(factors(:,1),mom)

corr(factors(:,2),mom)

corr(factors(:,3),mom)

corr(factors(:,4),mom)

corr(factors(:,5),mom)
