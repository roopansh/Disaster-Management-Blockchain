# Natural Disaster Management using Distributed(Blockchain) Medical Records

## Motivation
The healthcare system comprises of many different actors (hospital, doctor, patient..) and the process of receiving care usually involves most of them. This leads to fragmentation of the information. In a large scale natural disaster, providing healthcare becomes even more important. Coordination is problematic which leads to consequences in the medical response where immediate care can be the difference between life and death. Accessing vital information about patients is often difficult.

In the event of a natural disaster, it is vital that the inhabitants can access their medical information quickly and share it with caregivers. Absence of a robust infrastructure that provides access to the information will undermine attempts to construct a reliable plan to handle the disaster and its consequences on the public health.

## Idea
We plan to build and deploy a blockchain for storing the medical records using the Azure Blockchain Workbench. The blockchain will involve a smart contract that handles creating, retrieving, updating and deleting medical records and a RESTful API to interact with peers in the network. Hospitals, disaster response organization and Ministry of Health will all operate on a common channel in which they share information between each other. All together will create, retrieve, update and delete medical records. A simple chaincode will be run on validating peers that handles the medical records.

## How it is useful
1) During a disaster, peers may go offline. While the peer was offline, the blockchain may have been updated several times and the ledger is outdated for that peer. The log for the peer will be checked when it comes back online and get synced up with the rest of the network.
2) During a disaster, there are a lot of organisation trying to help. The consensus process of involving new members and getting them up to date on medical information and coordinating the new members can be achieved using blockchain.
3) During a disaster, many hospitals are non-functional. The blockchain can tolerate upto a high level of drop-off in the network participation.
4) After the disaster, there is a high flow of information, which is best suited for a blockchain.

## Challenges
1) Any information system that collects data from multiple systems should have policies and procedures defined to prevent the identity of medical systems from being disclosed to any outside parties, or the public, without consent. A permissioned blockchain is best suited because medical information such as patient records are confidential.
2) Initally, we were planning to use the Hyperledger Fabric, but it's not compatible with the Azure Blockchain Workbench. Hence, we will be using the Ethereum based implementation for the purpose of this hackathon. Ethereum uses Proof of Stake consensus and is permissioned blockchain.

## Team - MAR
#### Indian Institute of Technology Guwahati
###### Abhishek Goyal
###### Mahim Goyal
###### Roopansh Bansal
