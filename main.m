clc; clear; close all;

%%%%%%%%%%?????%%%%%%%%%%%%%%%%%
lk0 = imread('\pic\0.png');
lk1 = imread('\pic\1.png');
lk2 = imread('\pic\2.png');
lk3 = imread('\pic\3.png');
lk4 = imread('\pic\4.png');
lk5 = imread('\pic\5.png');
lk6 = imread('\pic\6.png');
lk7 = imread('\pic\7.png');
lk8 = imread('\pic\8.png');
lk9 = imread('\pic\9.png');
%%%%%%%%%%?????%%%%%%%%%%%%%%%%%

s = imread('\pic\qx (4).png');
mulu = imread('\pic\mulu.png');
[x, y, z] = size(s);

%x=round(x/y*1080);
%y=1080;

%s=imresize(s,[x y]);

if s(x, y, 1) > 256 || s(x, y, 2) > 256 || s(x, y, 3) > 256
    s = uint8(double(s) / 65535 * 255);
end

sf = s;
bw = zeros(x, y);
bw2 = bw;

for i = 2:x

    for j = 2:y

        if (s(i, j, 1) >= 220 && s(i, j, 1) <= 240)

            if (s(i, j, 2) >= 220 && s(i, j, 2) <= 240)

                if (s(i, j, 3) >= 220 && s(i, j, 3) <= 240)
                    bw(i, j) = 1;
                end

            end

        end

    end

end

locco = 1;
bw = logical(bw);
bw2 = logical(bw2);
bw3 = bw2;

for i = 21:x - 21

    for j = 21:y - 21

        if bw(i, j) == 1

            if bw(i + 20, j) == 1 && bw(i - 20, j) == 1 && bw(i, j + 20) == 1 && bw(i, j - 20) == 1

                if bw(i + 2, j) == 1 && bw(i - 2, j) == 1 && bw(i, j + 2) == 1 && bw(i, j - 2) == 1
                    bw2(i, j) = 1;
                end

            end

        end

    end

end

for i = 21:x - 21

    for j = 21:y - 21

        if bw2(i, j) == 1
            bw2(i - 1, j) = 0;
            bw2(i, j + 1) = 0;
            bw2(i - 1, j + 1) = 0;
        end

    end

end

for i = 21:x - 21

    for j = 21:y - 21

        if bw2(i, j) == 1
            loc(locco, 1) = j; %??1
            loc(locco, 2) = i; %??2
            locco = locco + 1;
        end

    end

end

[le, ~] = size(loc);
lekmin = loc(1, 1);
lekmax = loc(1, 1);
lecmax = loc(1, 2);
lecmin = loc(1, 2);

for i = 1:locco - 1

    if loc(i, 1) >= lekmax
        lekmax = loc(i, 1);
    end

    if loc(i, 2) >= lecmax
        lecmax = loc(i, 2);
    end

    if loc(i, 1) <= lekmin
        lekmin = loc(i, 1);
    end

    if loc(i, 2) <= lecmin
        lecmin = loc(i, 2);
    end

end

cc = round((lecmax - lecmin) / 6);
kk = round((lekmax - lekmin) / 8);
ccc = round((lecmax - lecmin) / 12);
kkk = round((lekmax - lekmin) / 16);
ccn = round(2 * ccc * 0.6);
kkn = round(2 * kkk * 0.13333);
cenco = 1;

lk0 = imresize(lk0,[ccn kkn]);
lk1 = imresize(lk1,[ccn kkn]);
lk2 = imresize(lk2,[ccn kkn]);
lk3 = imresize(lk3,[ccn kkn]);
lk4 = imresize(lk4,[ccn kkn]);
lk5 = imresize(lk5,[ccn kkn]);
lk6 = imresize(lk6,[ccn kkn]);
lk7 = imresize(lk7,[ccn kkn]);
lk8 = imresize(lk8,[ccn kkn]);
lk9 = imresize(lk9,[ccn kkn]);
llkk = lk0;

for i = 1:le
    cen(cenco, 1) = loc(i, 1) + kk + kkk;
    cen(cenco, 2) = loc(i, 2) + cc - 2 + ccc;
    cen(cenco, 3) = cenco;
    cenco = cenco + 1;
    cen(cenco, 1) = loc(i, 1) + kk - kkk;
    cen(cenco, 2) = loc(i, 2) + cc - 2 - ccc;
    cen(cenco, 3) = cenco;
    cenco = cenco + 1;
end
cencco = 1;


%{
nuloc = 1;

for i = 1:le
    nen(nuloc, 1) = loc(i, 1) + kk + kkk;
    nen(nuloc, 2) = loc(i, 2) + cc - 1 + ccc;
    nen(nuloc, 3) = nuloc;
    nuloc = nuloc + 1;
    nen(nuloc, 1) = loc(i, 1) + kk - kkk;
    nen(nuloc, 2) = loc(i, 2) + cc - 1 - ccc;
    nen(nuloc, 3) = nuloc;
    nuloc = nuloc + 1;
end

%}

fenc = 1;
team = 1;

for i = 2:2:40

    for j = cen(i, 1):cen(i - 1, 1)

        for k = cen(i, 2):cen(i - 1, 2)
            fen(fenc, 1) = j;
            fen(fenc, 2) = k;
            fen(fenc, 3) = team;
            fenc = fenc + 1;
        end

    end

    team = team + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:100
    %imshow(mulu);
    muluc=input('请输入要调整的区块：');
    if muluc<1 || muluc==5 || muluc==10 || muluc==15 || muluc>20
        fprintf("错误！")
    else
        cfnum=input('请输入需要改成的数字：');
        cfstr=num2str(cfnum);
        [~,sizecfnum]=size(cfstr);
        kkn=kkn*sizecfnum/2;
        ccn=ccn/2;
        
        for ij = 1:le
            cnen(cencco, 1) = loc(ij, 1) + kk + kkn;
            cnen(cencco, 2) = loc(ij, 2) + cc - 4 + ccn;
            cnen(cencco, 3) = cencco;
            cencco = cencco + 1;
            cnen(cencco, 1) = loc(ij, 1) + kk - kkn+1;
            cnen(cencco, 2) = loc(ij, 2) + cc - 4 - ccn+1;
            cnen(cencco, 3) = cencco;
            cencco = cencco + 1;
        end
        fnenc = 1;
        team = 1;
        for ij = 2:2:40
            for jj = cnen(ij, 1):cnen(ij - 1, 1)
                for kj = cnen(ij, 2):cnen(ij - 1, 2)
                    fnen(fnenc, 1) = jj;
                    fnen(fnenc, 2) = kj;
                    fnen(fnenc, 3) = team;
                    fnenc = fnenc + 1;
                end
            end
            team = team + 1;
        end
        for team = 1:size(fen)
            if fen(team, 3)==muluc
                sf(fen(team, 2), fen(team, 1), :) = 255;
            end
        end
        for ii=1:sizecfnum
            if cfstr(ii) == '1'
                llkk = lk1;
            elseif cfstr(ii) == '2'
                llkk = lk2;
            elseif cfstr(ii) == '3'
                llkk = lk3;
            elseif cfstr(ii) == '4'
                llkk = lk4;
            elseif cfstr(ii) == '5'
                llkk = lk5;
            elseif cfstr(ii) == '6'
                llkk = lk6;
            elseif cfstr(ii) == '7'
                llkk = lk7;
            elseif cfstr(ii) == '8'
                llkk = lk8;
            elseif cfstr(ii) == '9'
                llkk = lk9;
            else
                llkk = lk0;
            end
            
            for team = 1:size(fnen)
                if fnen(team, 3)==muluc
                    if team-(muluc-1)*48-floor((team-(muluc-1)*48)/ccn/2)*ccn*2 == 0
                        sf(fnen(team, 2), fnen(team, 1)+(ii-1)*kkn*2/sizecfnum, :) = llkk((team-(muluc-1)*48)/ccn/2,ceil((team-(muluc-1)*48)/ccn/2), :);
                    else
                        sf(fnen(team, 2), fnen(team, 1)+(ii-1)*kkn*2/sizecfnum, :) = llkk((team-(muluc-1)*48)-floor((team-(muluc-1)*48)/ccn/2)*ccn*2,ceil((team-(muluc-1)*48)/ccn/2), :);
                    end
                end
            end
            
        end
       
                
    end
    close all;
    outc=input('是否要退出');
    if outc==1
        break;
    end
end


%imshow(bw3);
%imwrite(bw3, 'D:\desktop\pic\f3.png');
imwrite(sf, '\pic\sf.jpg');
%imwrite(bw, 'D:\desktop\pic\f.jpg');