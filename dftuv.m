function [U,V]=dftuv(M,N)
    u=single(0:(M-1));
 
    v=single(0:(N-1));
    idx=find(u>M/2);
    u(idx)=u(idx)-M;
    idy=find(v>N/2);
       disp(u);
    v(idy)=v(idy)-N;
    [U,V]=meshgrid(u,v);

