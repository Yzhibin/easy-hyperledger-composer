FABRIC_CARD=$1

docker run \
--rm \
-v /var/run/docker.sock:/var/run/docker.sock \
--env GOPATH=/opt/gopath \
--env CORE_VM_ENDPOINT=unix:///host/var/run/docker.sock \
--env CORE_LOGGING_LEVEL=DEBUG \
--env CORE_PEER_ID=networkStarter \
--env CORE_PEER_ADDRESS=peer0.org1.example.com:7051 \
--env CORE_PEER_LOCALMSPID=Org1MSP \
--env CORE_CHAINCODE_STARTUPTIMEOUT=2400s \
--env CORE_CHAINCODE_EXECUTETIMEOUT=2400s \
--env FABRIC_VERSION=hlfv1 \
--env FABRIC_CARD=$FABRIC_CARD \
--name networkStarter \
-v Crypto:/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ \
-v Scripts:/opt/gopath/src/github.com/hyperledger/fabric/peer/scripts/ \
-v Channel:/opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts \
-v composer_cred:/opt/cred \
network-starter reset_fabric