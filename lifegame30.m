function [] = lifegame30()
camera = webcam();
kernel = [1, 1, 1;
          1, 0, 1;
          1, 1, 1];
lifegame = [];
uicontrol('Style', 'pushbutton', 'String', 'Start', 'Callback', @newgame);
ax = axes;

while 1
    imshow(lifegame, 'parent', ax);
    drawnow();
    alive_count = conv2(double(lifegame), kernel, 'same');
    lifegame = (alive_count == 3) | (lifegame & (alive_count == 2));
end

    function newgame(~, ~)
        lifegame = edge(rgb2gray(snapshot(camera)), 'Canny');
    end
end
