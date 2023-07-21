
% initial range 
%simple
a_range = [ -10, 10, -10,  10];
%a_range = [-1,1,-1,1];

tic

min_length = (a_range(2)-a_range(1))/2; 
for i = 1:length(a_range)/2
    l(i) = (a_range(2*i)-a_range(2*i-1))/2;
    if l(i) < min_length
        min_length = l(i);
    end
end

fprintf("Start searching:\n");
display(a_range);

val = mytry(a_range);
fprintf("Minimum: %f\n", val);

count = 0;
max_count  = 20;

while min_length > 0.2 && count <= max_count    
    count = count + 1;

    % bisect the range
    cut = 1;    
    max_length = (a_range(2)-a_range(1))/2;
    for i = 1:length(a_range)/2
        l(i) = (a_range(2*i)-a_range(2*i-1))/2;
        if l(i) > max_length
            cut = i;
            max_length = l(i);
        end
    end
    
    fprintf("================Count:%d================\n",count);
    fprintf("Cut:%d\n",cut);

    if a_range(2*cut)-a_range(2*cut-1) < min_length
        min_length = (a_range(2*cut)-a_range(2*cut-1))/2;
    end
    
    % test left side
    fprintf("Trying left interval\n");
    left_range = a_range;
    left_range(2*cut) = left_range(2*cut) - l(cut);
    display(left_range);
    left_val = mytry(left_range); 
    
    % test right side
    fprintf("Trying right interval\n");
    right_range = a_range;
    right_range(2*cut-1) = right_range(2*cut-1) + l(cut);
    display(right_range);
    right_val = mytry(right_range); 
    
    fprintf("left: %f\n", left_val);
    fprintf("right: %f\n", right_val);
    if left_val >= 900 && right_val >= 900
        fprintf("No improvement, minimum: %f\n", val);
        break
    end
    if left_val >= 900
        left_val = val;
    end
    if right_val >= 900
        right_val = val;
    end

    if val-(left_val+right_val)/2 <= 0.1
        fprintf("No improvement, minimum: %f\n", val);
        break
    end

    if left_val <= right_val
        val = left_val;
        a_range = left_range;
        fprintf("Choose left, minimum: %f\n", val);
    else
        val = right_val;
        a_range = right_range;
        fprintf("Choose right, minimum: %f\n", val);
    end
    
end
fprintf("Stop searching:\n");
toc