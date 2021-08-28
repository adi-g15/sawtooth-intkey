FROM gitpod/workspace-full

RUN sudo apt update && sudo apt install libzmq3-dev protobuf-compiler libsecp256k1-dev -y

RUN pip install sawtooth_sdk cbor

RUN sudo mkdir -p /var/log/sawtooth/ && sudo chown -R gitpod /var/log/sawtooth

