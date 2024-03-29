# project__momentum

Momentum and reversal refer to the phenomena that previous stock returns can predict future returns. Theoratically, the momentum is an anomoly in stock market, if we actually assume that everyone is rational.

---
把老师的要求粘贴到下面啦：

> In this project, you are required to collaborate on several tasks using github: Momentum and reversal refer to the phenomena that previous stock returns can predict future returns. This question explores whether these phenomena exist in Chinese stock markets. The dataset return_monthly.xlsx contains monthly stock returns in percentage terms for Chinese Stocks. And the dataset me_lag.xlsx includes lagged market capitalization for each stock.
>
> - First, read the datasets return_monthly.xlsx and me_lag.xlsx into MATLAB and reshape them into the long-table formats as you have seen in class. Then merge these two datesets and drop observations with missing lagged market capitalization. The output of your code should be similar to return_m.mat . **You may or may not build on the code provided in momentum_class.m .** ==*感觉第一步就把老师的路径一改应该就可以运行了（x）*==
> - Every K months, sort stocks into five groups based on previous K months' return and hold this position for K months. What is the average equal-weighted return spread between high and low previous stock returns portfolios for K = 1; 3; 6; 12; 24. Do you find that momentum exists in Chinese stock markets?
> - Use the principal component analysis for the equal-weighted return of five portfolios created by sorting on previous K = 3 months' return. How do you interpret the first and second factor from the PCA in economic terms? You may explore whether these factors are useful to explain portfolios sorted by previous stock returns. Also compare PCA factors to the factor MOM defined as the difference in equal-weighted return between the high previous stock returns portfolio and low previous stock returns portfolio.
> Hint: (b) can be divided to two steps, the first one is to create a new dataset with previous K=frequency months return, the second one is portfolio analysis.
