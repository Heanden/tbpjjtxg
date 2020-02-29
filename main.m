clc; clear; close all;

%%%%%%%%%%×Ö·û¿â%%%%%%%%%%%%%%%%%
lk0 = imread('D:\desktop\pic\0.png');
lk1 = imread('D:\desktop\pic\1.png');
lk2 = imread('D:\desktop\pic\2.png');
lk3 = imread('D:\desktop\pic\3.png');
lk4 = imread('D:\desktop\pic\4.png');
lk5 = imread('D:\desktop\pic\5.png');
%lk6 = imread('D:\desktop\pic\6.png');
lk7 = imread('D:\desktop\pic\7.png');
%lk8 = imread('D:\desktop\pic\8.png');
lk9 = imread('D:\desktop\pic\9.png');
%%%%%%%%%%×Ö·û¿â%%%%%%%%%%%%%%%%%

s = imread('D:\desktop\pic\qx (3).png');
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
    ccn = round(2 * ccc *06);
    kkn = round(2 * kkk * 0.13333);
    cenco = 1;

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

    for team = 1:size(fen)
        bw3(fen(team, 2), fen(team, 1)) = 1;
        sf(fen(team, 2), fen(team, 1), :) = 255;
    end

    

    imshow(bw3);
    imwrite(bw3, 'D:\desktop\pic\f3.png');
    imwrite(sf, 'D:\desktop\pic\sf2.jpg');
    imwrite(bw, 'D:\desktop\pic\f.jpg');
