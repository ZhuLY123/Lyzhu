tottheta=dlmread('tottheta');
itheta_index=dlmread('itheta_index');
itheta_index_num=size(itheta_index,1); %3076
thetas=[tottheta(5,:)];
for i=2:itheta_index_num
    front=sum(itheta_index(1:i-1));
    dis=sum(abs(diff([thetas(i-1,:);tottheta(front+1,:)])));
    thetas(i,:)=tottheta(front+1,:);
    for j=2:itheta_index(i)
        line=front+j;
        diff1=sum(abs(diff([thetas(i-1,:);tottheta(line,:)])));
        if diff1<dis
            dis=diff1;
            thetas(i,:)=tottheta(line,:);
        end
    end
end

dlmwrite('thetas_3',thetas);

            