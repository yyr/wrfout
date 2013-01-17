load "$NCL_LIB/yagUtils.ncl"
load "$WRFOUT/wo_utils.ncl"
load "$WRFOUT/plotvars.ncl"

begin

  a = set_inputfile()
  type = "png"

  print("** All tests are done **")

end
