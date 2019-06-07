meta:
  id: skipper
  endian: le
  imports:
    - strings
seq:
  - id: length
    type: u1
  - id: rest
    size: length - 2
  - id: strings_array
    type: strings
    repeat: until
    repeat-until: _.string.length == 1 and strings_array.size > 1
