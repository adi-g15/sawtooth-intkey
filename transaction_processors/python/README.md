## Starting the C++ intkey tp

### Install deps

```sh
pip install sawtooth_sdk
```

> If still using old versions as default, use "pip3" instead

### Running the tp

```sh
python main.py -C tcp://localhost:4004
```

> _If you get an error stating /var/log/sawtooth/koinaam doesn't exist, create the /var/log/sawtooth directory or whatever is mentioned_

> Again, if using python2 as default, use "python3" instead

> If faced some problem, create an issue in issues :D

### Changes made
> Can see with `diff` command too

```diff
diff --color sawtooth-sdk-python/examples/intkey_python/sawtooth_intkey/processor/handler.py transaction_processors/python/handler.py
20c20
< 
---
> import datetime
177c177,180
<     updated[name] = value
---
>     value_dict = {}
>     value_dict['value'] = value;
>     value_dict['date'] = datetime.datetime.now().strftime("%A, %d %b %Y");
>     updated[name] = value_dict;
diff --color sawtooth-sdk-python/examples/intkey_python/sawtooth_intkey/processor/main.py transaction_processors/python/main.py
100d99
< 
Common subdirectories: sawtooth-sdk-python/examples/intkey_python/sawtooth_intkey/processor/__pycache__ and transaction_processors/python/__pycache__
Only in transaction_processors/python: README.md
```
