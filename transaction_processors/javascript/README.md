## Starting the Javascript intkey tp

### Install deps

```sh
apt install libsecp256k1-dev -y
yarn	# or npm install
```

### Running the tp

```sh
yarn start tcp://localhost:4004
```

### Changes made
> Can see with `diff` command too

```diff
diff /workspace/sawtooth-intkey/sawtooth-sdk-javascript/examples/intkey/handler.js ./handler.js
53a54
>   console.log({entries});
56a58
> // It is passed state of the address, by the Promise, read code in the caller
76c78,79
<   stateValue[name] = value
---
>   console.log({stateValue});
>   stateValue[name] = {value,date: (new Date().toDateString())}	// storing date as well
77a81
>   console.log({stateValue});
diff /workspace/sawtooth-intkey/sawtooth-sdk-javascript/examples/intkey/package.json ./package.json
14c14
<     "sawtooth-sdk": "file:../../"
---
>     "sawtooth-sdk": "^1.0.5"
```
