# kong
## Dependencies
![dependencies](kong-timetracker.png)




## PlantUML code
```
@startuml

top to bottom direction
Component kong  #yellow
Component Grafana #9090ff
Component "timetracker-ui" #9090ff
Component konga #9090ff
Component postgres #f09090
Component mongodb #f09090
Component timetracker #90f090


[Grafana]       <--#  [prometheus]       : :9090
[Grafana]       <--#  [loki]             : :3100
[loki]          <--#  [loki-router]      : :30500\n:30501
[loki-router]   <--   [kong]             : http-log Plugin
[konga]         ---#  [kong]             : :8001
[prometheus]    <--   [kong]             : prometheus Plugin
[kong]          ---#   [postgres]         : :5432

[timetracker-ui]----# [kong]             : :8000
[kong]          --#   [timetracker]      : :30030 30433 (service)
[timetracker]   --#   [mongodb]          : :27017

[bootstrap]     -->   [kong]             : startup
[decK]          -->   [kong]             : startup

@enduml

```
[-- Link --](https://www.planttext.com/?text=XPC_RuCm4CLtVufJMDh1aXCIfOcgAbA73bswKmO2XbW1dsMELltsDN_I64HI1f3ytk_U-OpPeQR4KbELZ14Q88GZ4c45cR8o9OMQlM9bK4jDS4PT00G_iYpnsrj_iqcUw0I2dTY9FFUK1QbAaatIixIyKOiPIrjq3ZLOKs5b3K4kMj6JAeTWTfnHlBYsPAip5WtznT0_pvm7096nwCmdsTGNOG_xhjuDeCIpkYpz0U5IE60YUG2ts92qyHKG6o4-TVTTigd7aUuTjKEPHfs832-nW8-oAPHcdIcvkdWVEeVkdqIRDTdndQohSvJcsVeqDyNXc68_RhCELsxkuyEFUSVSR53CP7GHNXb_Z28K48fr6C93BUsNIkKZctg72iCF4uyYLrkntBekZuXKEyR4G-ZBhQdqTyMmA9Ff-wZFVn5sa3fpr-mN)