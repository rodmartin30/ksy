meta:
  id: smbios
  endian: le
seq:
  - id: anchor_str
    contents: '_SM3_'
  - id: entry_point_checksum
    type: u1
  - id: entry_point_length
    tpye: u1
  - id: major_version
    type: u1
  - id: minor_version
    type: u1
  - id: docrev
    type: u1
  - id: entry_point_revision
    type: u1
  - id: reserved
    type: u1
  - id: structure_table_max_size
    type: u4
  - id: structure_table_address
    type: u8
  
