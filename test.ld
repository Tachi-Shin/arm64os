OUTPUT_ARCH( "aarch64" )
ENTRY( _start )
MEMORY
{
  ram (wxa!ri) : ORIGIN = 0x4000000, LENGTH = 128M
}
SECTIONS
{
  .text : {
    PROVIDE(_text_start = .);
    _stext = .;
    *(.reset)
    *(.text .text.*)
    PROVIDE(_text_end = .);
  } >ram AT>ram
 _etext = .;
  .rodata : {
    PROVIDE(_rodata_start = .);
    *(.rodata .rodata.*)
    *(.note.* )
    PROVIDE(_rodata_end = .);
  } >ram AT>ram
  .data : {
    . = ALIGN(4096);
    PROVIDE(_data_start = .);
    *(.data .data.*)
  } >ram AT>ram
  .sdata : {
    *(.sdata .sdata.*)
    PROVIDE(_data_end = .);
  } >ram AT>ram
  .sbss : {
    . = ALIGN(16);
    PROVIDE(_bss_start = .);
    *(.sbss .sbss.*)
  } >ram AT>ram
  .bss :{
    *(.bss .bss.*)
    . = ALIGN(16);
    PROVIDE(_bss_end = .);
  } >ram AT>ram
  .stack :{
    . = ALIGN(16);
    PROVIDE(_stack_start = .);
    . = . + 4096;
    PROVIDE(_stack_end = .);
  } >ram AT>ram
}
