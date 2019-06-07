meta:
  id: portable_battery
  endian: le
  imports:
    - strings
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

