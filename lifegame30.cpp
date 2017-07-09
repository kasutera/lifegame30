#include <opencv2/opencv.hpp>
#include <opencv2/highgui/highgui.hpp>

int main (void) {
    cv::VideoCapture camera (0);
    cv::Mat alive_kernel = (cv::Mat_<double> (3, 3) << 
                        1, 1, 1,
                        1, 0, 1,
                        1, 1, 1);
    cv::Mat lifegame (960, 1280, CV_8UC1, cv::Scalar (0));
    cv::Mat camera_img, alive_count;

    while (1) {
        switch (cv::waitKey (1)) {
            case 'n':
                camera >> camera_img;
                cv::Canny (camera_img, lifegame, 100, 150);
                break;
            case 'q': 
                exit (0);
        }
        cv::imshow ("LifeGame", lifegame);

        lifegame &= 1;
        cv::filter2D (lifegame, alive_count, -1, alive_kernel);
        lifegame = (alive_count == 3) | ((lifegame == 1) & (alive_count == 2));
    }
} 
