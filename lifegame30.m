function [] = lifegame30()
    camera = webcam();
    kernel = [1, 1, 1;
              1, 0, 1;
              1, 1, 1];
    lifegame = [];
    
    while isempty(find(lifegame~=0, 1))
        lifegame = edge(rgb2gray(snapshot(camera)), 'Canny');
    end

    while 1
        imshow(lifegame,'Border','tight');
        alive_count = conv2(lifegame, kernel, 'same');
        lifegame = (alive_count == 3) | (lifegame & (alive_count == 2));
    end
end
