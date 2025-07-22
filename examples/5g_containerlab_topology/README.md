# 5G Standalone (5G SA) with _Open5GS_ and _UERANSIM_

## Scenario diagram

![](resources/5g-sa_open5gs_ueransim.drawio.png)

**Roaming is not supported yet.**

## Deploying the scenario

```
$ cd scripts/
$ ./deploy.sh
```
# Editing gNB and UE Configuration

You can edit the configuration files for gNB and UE by accessing their respective Docker containers. Follow these steps:

## Steps to Edit Configuration

1. **Enter the container**:
   Use the following command to access the gNB or UE container:
   ```bash
   sudo docker exec -it <container_name> bash
   
### For gNB:
- Open and edit the `gnb.yml` file.
- Adjust the **location** of the gNB by modifying the `phyLocation` parameter in the YAML files.
- Configure the following parameters for Wi-Fi settings:
  - `wifi`
  - `sessionIP`
  - `nextHop`
  - `UeInterface`
  - `nextHopInterface`

### For UE:
- Open and edit the `ue.yml` file.
- Add all the IP addresses of gNBs that the UE might connect with in the `gnbSearchList` parameter.
- Define an array of `(x, y, z)` coordinates for the `phyLocation` parameter, as currently done.
- Ensure the movement pattern is set to **linear**.
- Specify the velocity of the UE in meters per second (m/s).
- Set `wifi` to `true` when using Wi-Fi.
- Declare the following additional parameters:
  - **`staticIP`**: Specifies the IP address of the UE.
  - **`Interface`**: Specifies the interface through which the UE is connected.



> **Note:** Wi-Fi configuration is applicable only when there is **no 5G core network**.



## Starting gNB and UEs

In different terminal tabs or windows:

### gNB

```
$ cd scripts/
$ ./start-gnb.sh
```

### UE 1

```
$ cd scripts/
$ ./start-ue1.sh
```

### UE 2

```
$ cd scripts/
$ ./start-ue2.sh
```

## Using SSH for UE's 

Open a new terminal tab or window and execute the following:

```
$ ssh -X root@clab-ueransim-ue1
```
(for UE 1)

```
$ ssh -X root@clab-ueransim-ue2
```
(for UE 2)

Password is `gprsumts`.

## Destroying the scenario

```
$ cd scripts/
$ ./destroy.sh
```
