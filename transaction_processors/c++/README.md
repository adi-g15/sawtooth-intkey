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

### Changes made
> Can see with `diff` command too

```diff
Only in transaction_processors/c++: address_mapper.o
Only in transaction_processors/c++: build
Only in transaction_processors/c++: .gitignore
diff --color -u sawtooth-sdk-cxx/examples/intkey_cxx/int_key_transaction_processor.cpp transaction_processors/c++/int_key_transaction_processor.cpp
--- sawtooth-sdk-cxx/examples/intkey_cxx/int_key_transaction_processor.cpp	2021-08-03 13:25:51.552106411 +0000
+++ transaction_processors/c++/int_key_transaction_processor.cpp	2021-08-03 15:24:10.215807654 +0000
@@ -172,7 +172,21 @@
             }
         }
 
-        state_value_map[name] = value;
+	// EDITED here
+	time_t rawtime;
+  	struct tm * timeinfo;
+ 	char buffer[80];
+
+  	time (&rawtime);
+  	timeinfo = localtime(&rawtime);
+
+  	strftime(buffer,sizeof(buffer),"%d-%m-%Y %H:%M:%S",timeinfo);
+  	std::string date_str(buffer);
+        
+	state_value_map[name] = {
+		{std::string("value"), std::to_string(value)},
+		{std::string("date"), date_str}
+	};
 
         // encode the value map back to cbor for storage.
         std::vector<std::uint8_t> state_value_rep_vec = json::to_cbor(state_value_map);
Only in transaction_processors/c++: int_key_transaction_processor.o
Only in transaction_processors/c++: Makefile
Only in transaction_processors/c++: README.md

```
