meta:
  id: system_information
  endian: le
  imports:
    - strings
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

