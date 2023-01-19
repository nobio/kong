# kong
## Dependencies
![dependencies](kong-timetracker.png)




## PlantUML code
```@startuml

top to bottom direction
Component kong  #yellow
Component Grafana #9090ff
Component "jaeger-frontend" #9090ff
Component "timetracker-ui" #9090ff
Component konga #9090ff
Component postgres #f09090
Component mongodb #f09090
Component timetracker #90f090
Actor     user #11dd11

[user]              -->   [Grafana]          : :80 (http)
[user]              -->   [timetracker-ui]   : :994 (https)
[user]              -->   [konga]            : :8001 (http)
[Grafana]           <--#  [prometheus]       : :9090
[Grafana]           <--#  [loki]             : :3100
[loki]              <--#  [loki-router]      : :30500\n:30501
[loki-router]       <--   [kong]             : http-log Plugin
[konga]             ---#  [kong]             : :8001
[prometheus]        <--   [kong]             : prometheus Plugin
[kong]              ---#  [postgres]         : :5432
[user]              -->   [jaeger-frontend]  : :16686 (http)
[jaeger-frontend]   -->   [jaeger-api]  
[jaeger-api]        -->   [jaeger-collector]
[jaeger-collector]  <--   [kong]             : 9411

[timetracker-ui]    ----# [kong]             : :8000
[kong]              --#   [timetracker]      : :30030 30433 (service)
[timetracker]       --#   [mongodb]          : :27017

[bootstrap]         -->   [kong]             : startup
[decK]              -->   [kong]             : startup

@enduml
```
[--  Model bei Planttext --](https://www.planttext.com/?text=XPC_RuCm4CLtVufJMDh1aXCIfOcgAbA73bswKmO2XbW1dsMELltsDN_I64HI1f3ytk_U-OpPeQR4KbELZ14Q88GZ4c45cR8o9OMQlM9bK4jDS4PT00G_iYpnsrj_iqcUw0I2dTY9FFUK1QbAaatIixIyKOiPIrjq3ZLOKs5b3K4kMj6JAeTWTfnHlBYsPAip5WtznT0_pvm7096nwCmdsTGNOG_xhjuDeCIpkYpz0U5IE60YUG2ts92qyHKG6o4-TVTTigd7aUuTjKEPHfs832-nW8-oAPHcdIcvkdWVEeVkdqIRDTdndQohSvJcsVeqDyNXc68_RhCELsxkuyEFUSVSR53CP7GHNXb_Z28K48fr6C93BUsNIkKZctg72iCF4uyYLrkntBekZuXKEyR4G-ZBhQdqTyMmA9Ff-wZFVn5sa3fpr-mN)

[-- Model bei PlantUML --](https://www.plantuml.com/plantuml/uml/ZPCzRxCm4CVt-nIdi3pFWEI4H6cYgehKeKENxfI1W24euBFCqQhVlZWXuef8LHOa_rz-vemFBQUEkwO6OBB8X4TYfWRpokcCApBmJ8qbemtZcKo967pfkgPFiVxYqY8rAGOxjLD58PG5LurcbsPdxSAkMWYBB9sBMcgvTBh5e51U55BJHoW_pYW2vokz3W3niC44hyzZ60Q8iNNKkq-wQs_27lU-y5wWfdCrB8s1QAaK26aQ21rrh5qo1jH6gNTpUIzXwkcJY1ZxgKnH9sORrbJYMzsLbO6BAHrTeOVEH_SFohFa5__E6fsIrjicD8nlvvH8t6OThG3YdwUVX3vpVuDgXk4HiaQEKKKA8xME8lpNQlTHPVe_JBotXk6FIL0YLrkrt0B4Ho9k-unD1kZJlQbSBuk5EDVPgn3_4863Dhc_Pzy0)
