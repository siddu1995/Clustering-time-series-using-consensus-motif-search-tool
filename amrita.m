datafile = fopen('sample1.txt','w'); 
n = "NaN" ;
for i = 1 : 10
    sample_2 = cumsum(normrnd(0,1,[1000,1])); % random walk 1
    fs = 512;                    % Sampling frequency (samples per second)
    dt = 1/fs;                   % seconds per sampl
    t = linspace(0,1-1/fs,fs);     % seconds
    F = 1;                      % Sine wave frequency (hertz)
    data = 9*sin(2*pi*F*t);
    data = data + sample_2(end);
    data = transpose(data);
    sample_3 = cumsum(normrnd(0,1,[1000,1]));
    sample_3 = data(end) + sample_3;
    sample = vertcat(sample_2, data, sample_3);
    fprintf(datafile,'%d\n',sample);
    if i~=10
        fprintf(datafile,'%f\n',n);
    end
end

fclose(datafile);
