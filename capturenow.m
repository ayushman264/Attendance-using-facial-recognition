function []=capturenow
try close figure 1;end;
vid=videoinput('winvideo',1,'YUY2_640x480');
global capcha
while (1==1)
    preview(vid);
    choice=menu('Press button to Capture',...
                  'Capture Image',...
				  'Save',...
		          'Exit');
    if (choice ==1)
        capcha=capture(vid);
    end
	
	if (choice ==2)
		saveimage(capcha);
    end
     
    if (choice == 3)
        delete(vid);
        clc;
        close all;
        return;
    end    
end
