# Custom intkey

> in **C++, Python, JavaScript and Rust**

Just adds a date field, as mentioned by Utkarsh :D.

Also, stores ref to those language repositories, find the original intkey in examples/ directory in each of them.

## Using the custom transaction processors

1. Setup the sawtooth docker node, using the docker-compose.yaml file at the root of this repo, use this command:
```sh
docker-compose up
```

> If stopped, and then want to restart, first do `docker-compose down`

2. Read the respective intkey's README.md in the `transaction_processors/` directory, to start the tp

3. Get into the `sawtooth-shell-default` container to use the already provided `intkey` client command, use this:
```sh
# In another terminal
docker exec -it sawtooth-shell-default bash
# Now, Inside the container
intkey set var 15 --url http://rest-api:8008	# or whatever intkey command

sawtooth state list --url http://rest-api:8008

# You will see that instead of a simple integer value, actually an object also containing "date" has been stored.
```

