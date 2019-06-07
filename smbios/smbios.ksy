meta:
  id: smbios
  endian: le
  imports:
    - bios_information
    - system_information
    - portable_battery
    - skipper
    - strings
seq:
  - id: tables
    type: table
    repeat: eos
types:
  table:
    seq:
      - id: type
        type: u1
        enum: type_enum
      - id: table
        type:
          switch-on: type
          cases:
            'type_enum::table0': bios_information
            'type_enum::table1': system_information
            'type_enum::table22': portable_battery
            _: skipper
    enums:
      type_enum:
        0x00: table0
        0x01: table1
        0x02: table2
        0x03: table3
        0x16: table22

