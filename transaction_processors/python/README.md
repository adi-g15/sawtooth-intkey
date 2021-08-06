## Starting the Python intkey tp

### Install deps

```sh
apt install libsecp256k1-dev -y
pip install sawtooth_sdk cbor
```

> If still using old versions as default, use "pip3" instead

### Running the tp

> On linux, first create the directory '/var/log/sawtooth/'

```sh
python main.py -vv -C tcp://localhost:4004
```

> _If you get an error stating /var/log/sawtooth/koinaam doesn't exist, create the /var/log/sawtooth directory or whatever is mentioned_

> Again, if using python2 as default, use "python3" instead

> If faced some problem, create an issue in issues :D

### Changes made
> Can see with `diff` command too

```diff
diff /workspace/sawtooth-intkey/sawtooth-sdk-python/examples/intkey_python/sawtooth_intkey/processor/handler.py ./handler.py
20c20
< 
---
> import datetime
177c177,180
<     updated[name] = value
---
>     updated[name] = {
>         'value': value
>         'date': datetime.datetime.now().strftime("%A, %d %b %Y")
>     }
diff /workspace/sawtooth-intkey/sawtooth-sdk-python/examples/intkey_python/sawtooth_intkey/processor/main.py ./main.py
20c20
< from sawtooth_intkey.processor.handler import IntkeyTransactionHandler
---
> from handler import IntkeyTransactionHandler
98a99,100
> 
> main()
```
