load "$WRFOUT/wo_vars.ncl"
load "$WRFOUT/wo_plot_utils.ncl"

;_____________________________________________________________________________
; procedure: plot2d
; Doc:
;_____________________________________________________________________________
undef("plot2d")
procedure plot2d(fh:file,type:string)
local plot

begin
  res = True

  ; wo resources
  res@woDebug = False

  print("2d Plotting Started..")
  vars = plot_vars2d()

  res@gsnMaximize     = True
  res@gsnSpreadColors = True                 ; use full range of color map
  res@mpDataBaseVersion = "HighRes"
  res@tfDoNDCOverlay = True

  do lv = 0, dim_len0(vars) - 2, 1   ;; list of plot variables

    ; varname, plotname_prefix, unit, low, high, interval
    var       = vars(lv,:)
    vname     = var(0)
    vprefix   = var(1)
    vltitle   = var(2)
    vscale    = stringtofloat(var(3))
    vunits    = var(4)
    vlow      = stringtofloat(var(5))
    vhigh     = stringtofloat(var(6))
    vinterval = stringtofloat(var(7))

    draw_plot2d(fh,res,type,vname,vprefix,vltitle,vscale,vunits,vlow,vhigh,vinterval)

  end do
  return
end

;;; wo_utils.ncl ends here
