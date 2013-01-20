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
  print("2d Plotting Started..")
  vars = plot_vars2d()

  lat2d = fh->XLAT(0,:,:)
  lon2d = fh->XLONG(0,:,:)

  lat2d@units = "degree_north"
  lon2d@units = "degree_east"
  nlat = dimsizes(lat2d(:,0))
  nlon = dimsizes(lon2d(0,:))

  res = True
  res@gsnMaximize     = True
  res@gsnSpreadColors = True                 ; use full range of color map
  res@mpDataBaseVersion = "HighRes"

  res = set_mp_wrf_map_resources(fh,res)

  do lv = 0, dim_len0(vars) - 2, 1   ;; list of plot variables

    ; varname, plotname_prefix, unit, low, high, interval
    var = vars(lv,:)
    vname = var(0)
    vprefix = var(1)
    vunits =  var(2)
    vlow = stringtofloat(var(3))
    vhigh = stringtofloat(var(4))
    vinterval = stringtofloat(var(5))

    draw_plot2d(fh,res,type,vname,vprefix,vunits,vlow,vhigh,vinterval)

  end do
  return
end

;;; wo_utils.ncl ends here
