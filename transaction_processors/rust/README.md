## Starting the Rust intkey tp

Install `libzmq3-dev`, `protobuf-compiler` packages on ubuntu, or `zmq` and `protobuf` on Arch.

```sh
cargo run -- -C tcp://localhost:4004
```

### Changes made
> Can see with `diff` command too

```diff
diff --color -u ../sawtooth-sdk-rust/examples/intkey_rust/src/handler.rs rust/src/handler.rs
--- ../sawtooth-sdk-rust/examples/intkey_rust/src/handler.rs	2021-08-03 13:23:54.281728682 +0000
+++ rust/src/handler.rs	2021-08-03 15:17:47.259890769 +0000
@@ -223,7 +223,18 @@
             Some(m) => m.clone(),
             None => BTreeMap::new(),
         };
-        map.insert(Key::Text(Text::Text(String::from(name))), Value::U32(value));
+        // EDITED here: https://docs.rs/cbor-codec/0.7.0/cbor/value/enum.Value.html
+        use chrono::{offset::Utc,DateTime,TimeZone};
+        let mut value_map: BTreeMap<Key,Value> = BTreeMap::new();
+        value_map.insert(
+            Key::Text(Text::Text("value".to_string())),
+            Value::U32(value)
+            );
+        value_map.insert(
+            Key::Text(Text::Text("date".to_string())),
+            Value::Text(Text::Text(Utc::now().to_rfc2822()))
+            );
+        map.insert(Key::Text(Text::Text(String::from(name))), Value::Map(value_map));
 
         let mut e = GenericEncoder::new(Cursor::new(Vec::new()));
         e.value(&Value::Map(map))
diff --color -u ../sawtooth-sdk-rust/examples/intkey_rust/src/lib.rs rust/src/lib.rs
--- ../sawtooth-sdk-rust/examples/intkey_rust/src/lib.rs	2021-08-03 13:23:54.281728682 +0000
+++ rust/src/lib.rs	2021-08-03 15:17:04.401094933 +0000
@@ -20,5 +20,6 @@
 extern crate log;
 extern crate log4rs;
 extern crate sawtooth_sdk;
+extern crate chrono;
 
 pub mod handler;
diff --color -u ../sawtooth-sdk-rust/examples/intkey_rust/src/main.rs rust/src/main.rs
--- ../sawtooth-sdk-rust/examples/intkey_rust/src/main.rs	2021-08-03 13:23:54.281728682 +0000
+++ rust/src/main.rs	2021-08-03 15:24:29.438510134 +0000
@@ -23,6 +23,7 @@
 extern crate log;
 extern crate log4rs;
 extern crate sawtooth_sdk;
+extern crate chrono;
 
 mod handler;
 
```
