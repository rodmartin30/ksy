meta:
  id: smbios
  endian: le
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
  strings:
    seq:
      - id: string
        type: strz
        encoding: UTF-8
        include: true
        consume: false
  bios_information:
    seq:
      - id: length
        type: u1
      - id: handle_index
        type: u2
      - id: vendor_index
        type: u1
      - id: bios_version
        type: u1
      - id: bios_starting_address_segment
        type: u2
      - id: bios_release_date_index
        type: u1
      - id: bios_rom_size
        type: u1
      - id: bios_characteristics
        type: u8
      - id: bios_characteristics_ext_bytes
        size: length - 0x12
      - id: strings_array
        type: strings
        repeat: until
        repeat-until: _.string.length == 1 and strings_array.size > 1
    instances:
      handle:
        value: strings_array[handle_index - 1]
        if: handle_index > 0
      vendor:
        value: strings_array[vendor_index - 1]
        if: vendor_index > 0
      bios_release_date:
        value: strings_array[bios_release_date_index - 1]
        if: bios_release_date_index > 0
  system_information:
    seq:
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
      - id: strings_array
        type: strings
        repeat: until
        repeat-until: _.string.length == 1 and strings_array.size > 1
  portable_battery:
    seq:
      - id: type
        type: u1
      - id: length
        type: u1
      - id: handle
        type: u2
      - id: location
        type: u1
      - id: manufacturer
        type: u1
      - id: manufacture_date
        type: u1
      - id: serial_number
        type: u1
      - id: device_name
        type: u1
      - id: device_chemistry
        type: u1
      - id: design_capacity
        type: u2
      - id: design_voltaje
        type: u2
      - id: sbs_version_number
        type: u1
      - id: maximum_error_in_battery_data
        type: u1
      - id: sbds_serial_number
        type: u2
      - id: dbds_manufacture_date
        type: u2
      - id: sbds_device_chemistry
        type: u1
      - id: design_capacity_multiplier
        type: u1
      - id: oem_specific
        type: u4
      - id: strings_array
        type: strings
        repeat: until
        repeat-until: _.string.length == 1 and strings_array.size > 1
  skipper:  
    seq:
      - id: length
        type: u1
      - id: rest
        size: length - 2
      - id: strings_array
        type: strings
        repeat: until
        repeat-until: _.string.length == 1 and strings_array.size > 1
   
