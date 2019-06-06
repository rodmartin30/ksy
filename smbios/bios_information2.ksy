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
            'type_enum::table2': skipper
            'type_enum::table3': system_enclosure_or_chassis
            'type_enum::table4': skipper
            'type_enum::table5': skipper
            'type_enum::table6': skipper
            'type_enum::table7': skipper
            'type_enum::table8': skipper
            'type_enum::table9': skipper
            'type_enum::table10': skipper
            'type_enum::table11': skipper
            'type_enum::table12': skipper
            'type_enum::table13': skipper
            'type_enum::table14': skipper
            'type_enum::table15': skipper
            'type_enum::table16': skipper
            'type_enum::table17': skipper
            'type_enum::table18': skipper
            'type_enum::table19': skipper
            'type_enum::table20': skipper
            'type_enum::table21': skipper
            'type_enum::table22': skipper
            'type_enum::table23': skipper
            'type_enum::table24': skipper
            'type_enum::table25': skipper
            'type_enum::table26': skipper
            'type_enum::table27': skipper
            'type_enum::table28': skipper
            'type_enum::table29': skipper
            'type_enum::table30': skipper
            'type_enum::table31': skipper
            'type_enum::table32': skipper
            'type_enum::table33': skipper
            'type_enum::table34': skipper
            'type_enum::table35': skipper
            'type_enum::table36': skipper
            'type_enum::table37': skipper
            'type_enum::table38': skipper
            'type_enum::table39': skipper
            'type_enum::table40': skipper
            'type_enum::table41': skipper
            'type_enum::table42': skipper
            'type_enum::table127': skipper
            'type_enum::table136': skipper
            'type_enum::table221': skipper
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
        0x04: table4
        0x05: table5
        0x06: table6
        0x07: table7
        0x08: table8
        0x09: table9
        0x0a: table10
        0x0b: table11
        0x0c: table12
        0x0d: table13
        0x0e: table14
        0x0f: table15
        0x10: table16
        0x11: table17
        0x12: table18
        0x13: table19
        0x14: table20
        0x15: table21
        0x16: table22
        0x17: table23
        0x18: table24
        0x19: table25
        0x1a: table26
        0x1b: table27
        0x1c: table28
        0x1d: table29
        0x1e: table30
        0x1f: table31
        0x20: table32
        0x21: table33
        0x22: table34
        0x23: table35
        0x24: table36
        0x25: table37
        0x26: table38
        0x27: table39
        0x28: table40
        0x29: table41
        0x30: table42
        0x7f: table127
        0x88: table136
        0xdd: table221
        
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
   
