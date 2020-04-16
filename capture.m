function [capcha]= capture(vid)
    capcha=getsnapshot(vid);
    capcha=ycbcr2rgb(capcha);
    capcha=rgb2gray(capcha);
    capcha=imresize(capcha,[128,128])
    imshow(capcha);
end

