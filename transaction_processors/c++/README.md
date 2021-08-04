## Starting the C++ intkey tp

Install `crytopp`, `zmq`, `log4cxx`, `protobuf` libraries, as stated in the CMakeLists.txt

### Building

```sh
cmake -B build
cmake --build build
```

### Running the tp

```sh
./build/intkey-cpp-tp -C tcp://localhost:4004
```

