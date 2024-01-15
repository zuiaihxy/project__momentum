%b部分的内容
%Every K months, sort stocks into five groups based on previous 
% K months' return and hold this position for K months. What is 
% the average equal-weighted return spread between high and low 
% previous stock returns portfolios for K = 1; 3; 6; 12; 24. Do 
% you find that momentum exists in Chinese stock markets?

load('return_m.mat');

% num_obs is the number of observatiosn in the sample 

[G,jdate]=findgroups(return_monthly.date);
num_obs=length(jdate);

% jdate is another index for indexing the dataset 

return_monthly.jdate=G;

frequency=[1,3,6,12,24];
%frequency=[3];

mom_old=table();

tic 

% for five strategies: change the interior and index outputs by i
% if you want to run the five strategies by one click 

for i=frequency
        
    % We need frequency(i) points before and after for this strategy
    for j=[i: num_obs-i]
        % pick up previous frequency(i) months returns and need an index for
        % selection for relevant observation
         temp_date=[floor(j/i)*i-i+1:floor(j/i)*i-i+i];
         start_date=j+1;
         % furthermore, this date is updated every i months
   
        % this returns the relevent index for picking up returns 
        index_i=(return_monthly.jdate==temp_date);
       %  creates a composite index where the sample condition is met 
        index=logical(sum(index_i,2));
        mom_sample=return_monthly(index,1:end);

       [G,code]=findgroups(mom_sample.code);
       pr_return=splitapply(@(x)sum(x),mom_sample.return_m,G);
       pr_return_table=table(code,pr_return);
       % merge it back to mom_smaple to enhance the vector of previous
       % return
       
       index_r=(return_monthly.jdate==start_date);
       mom_r=return_monthly(index_r,1:end);

       mom_sample1=outerjoin(mom_r,pr_return_table,'Keys',{'code'},'MergeKeys',true,'Type','left');
       
       return_full=vertcat(mom_old, mom_sample1);
       
       mom_old=return_full;
        
    end
% Create percentiles functions

for k=20:20:80
   eval(['prctile_',num2str(k),'=','@(input)prctile(input,k)',';']);
end

% Calcualte percentiles

for x=20:20:80
                eval(['b','=','prctile_',num2str(x),'(return_full.pr_return)',';']);
                eval(['return_full.mom',num2str(x),'=','b*ones(size(return_full,1),1)',';']);
end

return_full.mom_label=rowfun(@mom_bucket,return_full(:,{'pr_return','mom20','mom40','mom60'...
                ,'mom80'}),'OutputFormat','cell');
            
return_full.ew=ones(size(return_full,1),1);        
            
            
[G,jdate,mom_label]=findgroups(return_full.date, return_full.mom_label);

ewret=splitapply(@wavg,return_full(:,{'return_m','ew'}),G);

ewret_table=table(jdate,mom_label,ewret);

mom_factors=unstack(ewret_table(:,{'ewret','jdate','mom_label'}),'ewret','mom_label');

A=nanmean(table2array(mom_factors(:,2)))*100;

E=nanmean(table2array(mom_factors(:,6)))*100;

fprintf('The K is %4.0f \n',i)

fprintf('The average return for the low previous return group is %4.3f percent per month \n',A)

fprintf('The average return for the high previous return group is %4.3f percent per month \n',E)
end

toc


