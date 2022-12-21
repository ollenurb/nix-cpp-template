#include <iostream>
#include <memory>
#include "./another.hpp"

int main(int argc, char ** argv) {
    std::cout << "Hello, world!" << std::endl;
    Another another;
    another.do_something();
    return 0;
}
