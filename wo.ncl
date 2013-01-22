load "$NCL_LIB/yagUtils.ncl"
load "$WRFOUT/wo_utils.ncl"
load "$WRFOUT/wo_plot.ncl"

begin
  fin = set_inputfile()
  res = True

  ; wo resources
  res@woGraphicType = "ps"
  res@woDebug = False
  res@woGraphicPrefix = "wo_"

  plot2d(fin,res)

  print("** Wrfout is done its job **")
end
