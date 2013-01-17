load "$NCL_LIB/yagUtils.ncl"
load "$WRFOUT/wo_utils.ncl"

begin

  fin = set_inputfile()
  type = "ps"
  out_prefix="wo_"

  plot2d(fin)

  print("wrfout.ncl is done")
end
