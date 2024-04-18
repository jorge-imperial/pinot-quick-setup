# pinot-quick-setup
Installs [Apache Pinot](https://docs.pinot.apache.org/) on a local host, set up a cluster and run.


From the [Apache Pinot manual installation guide](https://docs.pinot.apache.org/basics/getting-started/running-pinot-locally)

As of April 18 2024, there are three binary versions available. You can download them manually from these links. Decompress them into the `pinot-quick-setup` directory.

- [Apache Pinot 0.12.1](https://downloads.apache.org/pinot/apache-pinot-0.12.1/apache-pinot-0.12.1-bin.tar.gz)
- [Apache Pinot 1.0.0](https://downloads.apache.org/pinot/apache-pinot-1.0.0/apache-pinot-1.0.0-bin.tar.gz)
- [Apache Pinot 1.1.0](https://downloads.apache.org/pinot/apache-pinot-1.1.0/apache-pinot-1.1.0-bin.tar.gz)


Alternatively, these can be downloaded on the command line using `wget` or `curl`:

```bash
# Change to the top level directory
cd pinot-quick-setup
PINOT_VERSION=1.0.0  #set to the Pinot version you decide to use
wget https://downloads.apache.org/pinot/apache-pinot-$PINOT_VERSION/apache-pinot-$PINOT_VERSION-bin.tar.gz
# Uncompress
tar xf apache-pinot-$PINOT_VERSION-bin.tar.gz
```

Create a symbolic link `apache-pinot` to the versioned directory.
```bash
ln -s apache-pinot-$PINOT_VERSION-bin apache-pinot
```

Make sure you have Java version 11.0 installed as the default and run the following script to start a cluster. 

```
chmod +x run-pinot.sh
./run-pinot.sh
```
You will start a Pinot cluster consisting on

- Zookeeper running locally listening on port 2181
- Two Pinot Controllers on ports 9001 and 9002.
- Two Pinot Servers listening on ports 8001 and 8002.
- Kafka Plugin listening on port 9876.
- One Minion listening on port 9514.

The logs for each component will be written to files ending in `.log`, and the PID of each will be written to files ending in `.pid`
