function [ array_with_no_nans ] = Convert_Nans_to_Average( array_with_nans )
%Convert_nans_to_average this function converts a NAN to the average of the
%value before it and the value after it
array_with_no_nans = array_with_nans;

if isnan(array_with_no_nans(1))
    array_with_no_nans(1) = 1;
end

if isnan(array_with_no_nans(end))
    index = numel(array_with_no_nans) - 1;
    while(isnan(array_with_no_nans(index)))
        index = index - 1;
    end
    array_with_no_nans(index+1:end) = array_with_no_nans(index);
end

for index = 2:(numel(array_with_no_nans)-1)
    if(isnan(array_with_no_nans(index)))
        nonNanIndex = index;
        while(isnan(array_with_no_nans(nonNanIndex)))
            nonNanIndex = nonNanIndex + 1;
        end
        array_with_no_nans(index:nonNanIndex-1) = (array_with_no_nans(index-1) + array_with_no_nans(nonNanIndex))/2;
    end
end

end