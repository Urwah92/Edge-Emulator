# Edge Emulation Platform

This project is an **Edge Network Emulation Platform** built on top of [Containerlab](https://containerlab.dev/). It enables users to emulate realistic networking and Kubernetes-based edge computing environments for development, testing, and research purposes.

The platform extends Containerlab with support for:

- K3s lightweight Kubernetes clusters
- KWOK (Kubernetes Without Kubelet)
- LIQO (multi-cluster federation for Kubernetes)
- 5G Standalone (SA)

## Features
- **Kubernetes Edge Integration**  
  Prebuilt container images containing:
  - K3s clusters
  - KWOK for simulating workloads
  - LIQO for dynamic workload offloading between clusters

- **5G Standalone (SA) Network Emulation** 

  The platform includes a fully containerized 5G SA network using:
  
  - **Open5GS** for the 5G Core (AMF, SMF, UPF, etc.)
  - **UERANSIM** for simulating the RAN (gNB) and user equipment (UE)
  
  Additional capabilities include:
  
  - **UE mobility simulation** between cells
  - **Xn-based handover** between gNBs for continuity during movement
  
  This enables testing and research into MEC applications, core interaction, and mobility-driven scenarios.


- **Automated Setup Script**

  A ready-to-use script `start.sh` is provided to automate environment provisioning. It will:
  - Install all required tools: Docker, Containerlab, Wireshark
  - Pull and configure Arista vEOS image and image containing K3s cluster + KWOK + LIQO environments  
  - Deploy a basic 2-node Arista L2/L3 topology

## Installation

To set up the platform, run the following command:

```bash
./start.sh
```


## Resources
- Containerlab
- K3s by Rancher
- KWOK 
- LIQO
- Open5GS
- UERANSIM
