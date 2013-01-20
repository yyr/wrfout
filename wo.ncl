load "$NCL_LIB/yagUtils.ncl"
load "$WRFOUT/wo_utils.ncl"
load "$WRFOUT/wo_plot.ncl"

begin
  fin = set_inputfile()
  type = "ps"
  out_prefix="wo_"

  plot2d(fin,type)

  print("** Wrfout is done its job **")
end
