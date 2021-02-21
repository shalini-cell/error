function [i]=f()
    for a=1:1000
        for b=1:1000
            i=2;
        end
    end
timeit(f)