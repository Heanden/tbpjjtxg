clc;clear all;close all;
s=imread('qx (3).png');%����ͼƬ
[x,y,z]=size(s);%���㳤��

x=round(y/1080*x);%�������ݣ���������
y=1080;

s=imresize(s,[x y]);%����

if s(x,y,1)>256 || s(x,y,2)>256 || s(x,y,3)>256
    s=uint8(double(s)/65535*255);
end%�����Ƿ�Ϊunit16

bw=zeros(x,y);%��ʼ���ڰ�
bwlo=zeros();
for i=2:x
    for j=2:y
        if (s(i,j,1)>=220 && s(i,j,1)<=240)
            if (s(i,j,2)>=220 && s(i,j,2)<=240)
                if (s(i,j,3)>=220 && s(i,j,3)<=240)
                    bw(i,j)=1;
                end
            end
        end
    end
end

bw=logical(bw);
%{
for i=1:x
    for j=1:y
        if bw(i,j) == 1
            if bw

    %}

imshow(bw);
%imwrite(bw,'D:\Github\tbpjjtxg\qx (3)f.jpg');