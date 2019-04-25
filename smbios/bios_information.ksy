meta:
  id: smbios
  endian: le
seq:
  - id: table_0
    type: bios_information
types:
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
  strings:
    seq:
      - id: string
        terminator: 0
        include: true
        consume: false
