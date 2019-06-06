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
    type: system_enclosure_or_chassis
  - id: table_3to21
    type: skipper
    repeat: expr
    repeat-expr: 18
  - id: table_22
    type: portable_battery
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
  system_enclosure_or_chassis:
    seq:
      - id: type
        contents: [0x03]
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
      - id: strings
        type: strings
        repeat: until
        repeat-until: _.string == [0]
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
