function [] = create_randomwalk()
rw = []
final = []
fileID = fopen('temp8.txt','w');
n = "NaN";
subsequence_len = 256;
for j = 1 : 2
    for i = 1 : 5
        r1 = randn(2372,1);
        r2 = randn(2372,1);
        Fs = 256; 
        t = linspace(0,1-1/Fs,Fs);
        f = 1;
        a = 4;
        y = a*sin(2*pi*f*t);
        y = abs(y);
        y = transpose(y);
        r1_end = r1(end);
        y = y + r1_end;
        y_end = y(end);
        r2 = r2 + y_end;
        rw = vertcat(r1,y,r2);
        final = [final rw];
    end
end
if j == 2
            y = abs(y);
end
fileID = fopen('temp8.txt','w');
fprintf(fileID,'%d\n',final);
        if i<4
            fprintf(fileID,'%f\n',n);
        end
fclose(fileID);
  