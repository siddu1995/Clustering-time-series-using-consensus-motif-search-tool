function [] = create_randomwalk()
data = []
fileID = fopen('exp_noise.txt','w');
n = "NaN";
noise = 0.1047*randn(20003,1);%Gaussian, mean 0, std 0.1047, frequency continuous
data = textread('exp.txt')
for i = 1 : 20003
    if ~ischar(data(i))
        data(i) = data(i)+noise(i);
        fprintf(fileID,'%d\n',data(i));
    else
        fprintf(fileID,'%f\n',n);
    end
end
fclose(fileID);
end