CXXFLAGS = `pkg-config --cflags opencv` -Wall -std=c++14 -g
LDFLAGS = `pkg-config --libs opencv`

all:
	$(CXX) -o lifegame30 lifegame30.cpp $(CXXFLAGS) $(LDFLAGS)

.PHONY: clean
clean:
	rm -f *.o *~
