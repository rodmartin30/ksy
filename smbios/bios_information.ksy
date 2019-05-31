meta:
  id: smbios
  endian: le
seq:
  - id: table_0
    type: bios_information
  - id: table_1
    type: system_information
  - id: table_2
    type: skipper
  - id: table_3
    type: skipper
  - id: table_4
    type: skipper
    repeat: expr
    repeat-expr: 18
  - id: table_22
    size: 1
types:
  strings:
    seq:
      - id: string
        terminator: 0
        include: true
        consume: false
  bios_information:
    seq:
      - id: type
        type: u1
      - id: length
        type: u1
      - id: handle
        type: u2
      - id: vendor
        type: u1
      - id: bios_version
        type: u1
      - id: bios_starting_address_segment
        type: u2
      - id: bios_release_date
        type: u1
      - id: bios_rom_size
        type: u1
      - id: bios_characteristics
        type: u8
      - id: bios_characteristics_ext_bytes
        size: length - 0x12
      - id: strings
        type: strings
        repeat: until
        repeat-until: _.string == [0]
  system_information:
    seq:
      - id: type
        type: u1
      - id: length
        type: u1
      - id: handle
        type: u2
      - id: manufacturer
        type: u1
      - id: product_name
        type: u1
      - id: version
        type: u1
      - id: serial_number
        type: u1
      - id: uuid
        size: 16
      - id: wake_up_type
        type: u1
      - id: sku_number
        type: u1
      - id: family
        type: u1
      - id: strings
        type: strings
        repeat: until
        repeat-until: _.string == [0]
  skipper:  
    seq:
      - id: type
        type: u1
      - id: length
        type: u1
      - id: rest
        size: length - 2
      - id: strings
        type: strings
        repeat: until
        repeat-until: _.string == [0]
    

