function [] = monitor(data, mode)

size = length(data);
results(1) = 0;
resultsindex = 1;
flag = false;
oneslength = 0;
for i = 1:1:size
    if data(i) == mode
        flag=true;
        oneslength = oneslength + 1 ;
    else
        if flag==true
        flag=false;
        results(resultsindex) = oneslength;
        resultsindex = resultsindex + 1;
        oneslength = 0;
        end
    end
end
if flag==true
    results(resultsindex) = oneslength;
end

maxlen = max(results);
if maxlen ~=0
    bins = 1:1:maxlen;
    hist(results, bins);
    xlabel(['d³ugoœæ ciagu ' num2str(mode)]);
    ylabel('liczba wyst¹pieñ');
else
    hist(results, 0);
    xlabel([num2str(mode) ' nie wyst¹pi³o w zestawie danych']);
end
    
end