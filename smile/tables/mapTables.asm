
// -------------- MAP TABLES --------------


Map_LO:
.byte <(MAPS_ADDRESS + (MAP_SIZE * 0))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 1))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 2))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 3))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 4))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 5))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 6))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 7))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 8))
.byte <(MAPS_ADDRESS + (MAP_SIZE * 9))

Map_HI:
.byte >(MAPS_ADDRESS + (MAP_SIZE * 0))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 1))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 2))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 3))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 4))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 5))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 6))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 7))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 8))
.byte >(MAPS_ADDRESS + (MAP_SIZE * 9))
