function value = mom_bucket_5(mom, mom20,mom40,mom60,mom80)
%从上到下按照收益率从小到大排列
if mom<mom20
    value='A';
elseif mom>=mom20 & mom<mom40
    value='B';
elseif mom>=mom40 & mom<mom60
    value='C';
elseif mom>=mom60 & mom<mom80
    value='D';
elseif mom>=mom80 
    value='E';
else 
    value='J';
end
