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
            'type_enum::table3': system_enclosure_or_chassis
            'type_enum::table22': portable_battery
            _: skipper
      - id: strings
        type: strings
        repeat: until
        repeat-until: _.string == [0] and strings.size > 1
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
        terminator: 0
        include: true
        consume: false
  bios_information:
    seq:
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
  system_enclosure_or_chassis:
    seq:
      - id: length
        type: u1
      - id: handle
        type: u2
      - id: manufacturer
        type: u1
      - id: type2
        type: u1
      - id: version
        type: u1
      - id: serial_number
        type: u1
      - id: asset_tag_number
        type: u1
      - id: boot_up_state
        type: u1
      - id: power_supply_state
        type: u1
      - id: thermal_state
        type: u1
      - id: security_status
        type: u1
      - id: oem_defined
        type: u4
      - id: height
        type: u1
      - id: number_of_power_cords
        type: u1
      - id: contained_element_count
        type: u1
      - id: contained_element_record_length
        type: u1
      - id: contained_elements
        size: contained_element_count * contained_element_record_length
      - id: sku_number
        type: u1
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
  skipper:  
    seq:
      - id: length
        type: u1
      - id: rest
        size: length - 2
   
