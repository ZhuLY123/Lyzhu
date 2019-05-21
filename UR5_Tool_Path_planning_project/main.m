
A=[];
for i = 1:1:22800
    T_goat = [1 0 0 B(i,1); 0 1 0 B(i,2); 0 0 1 B(i,3); 0 0 0 1];
    
    eval(['A', num2str(i), '=' ,'NiJie(T_goat)']);
    
    eval(['A=[A;A',num2str(i),'];']);
    
end
    