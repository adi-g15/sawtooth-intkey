## Starting the Javascript intkey tp

### Install deps

```sh
yarn	# or npm install
```

### Running the tp

```sh
yarn start tcp://localhost:4004
```

### Changes made
> Can see with `diff` command too

```diff
Only in transaction_processors/javascript: .gitignore
diff --color -u sawtooth-sdk-javascript/examples/intkey-javascript/handler.js transaction_processors/javascript/handler.js
--- sawtooth-sdk-javascript/examples/intkey-javascript/handler.js	2021-08-03 13:23:28.458442682 +0000
+++ transaction_processors/javascript/handler.js	2021-08-03 14:07:20.976560298 +0000
@@ -51,9 +51,11 @@
   let entries = {
     [address]: cbor.encode(stateValue)
   }
+  console.log({entries});
   return context.setState(entries)
 }
 
+// It is passed state of the address, by the Promise, read code in the caller
 const _applySet = (context, address, name, value) => (possibleAddressValues) => {
   let stateValueRep = possibleAddressValues[address]
 
@@ -73,8 +75,10 @@
     stateValue = {}
   }
 
-  stateValue[name] = value
+  console.log({stateValue});
+  stateValue[name] = {value,date: (new Date().toDateString())}	// storing date as well
 
+  console.log({stateValue});
   return _setEntry(context, address, stateValue)
 }
 
Only in transaction_processors/javascript: node_modules
diff --color -u sawtooth-sdk-javascript/examples/intkey-javascript/package.json transaction_processors/javascript/package.json
--- sawtooth-sdk-javascript/examples/intkey-javascript/package.json	2021-08-03 13:23:28.458442682 +0000
+++ transaction_processors/javascript/package.json	2021-08-03 13:51:51.938280808 +0000
@@ -11,6 +11,6 @@
   "license": "Apache-2.0",
   "dependencies": {
     "cbor": "^3.0.0",
-    "sawtooth-sdk": "file:../../"
+    "sawtooth-sdk": "^1.0.5"
   }
 }
Only in transaction_processors/javascript: README.md
Common subdirectories: sawtooth-sdk-javascript/examples/intkey-javascript/tests and transaction_processors/javascript/tests
Only in transaction_processors/javascript: yarn-error.log
Only in transaction_processors/javascript: yarn.lock
```
