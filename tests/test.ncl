load "$WRFOUT/tests/test_header.ncl"

begin

  a = set_inputfile()
  out = "wo_swdown"
  type = "ps"

  print(out + " " + type )
  make_animation(out, type)

  print("** All tests are done **")
end
