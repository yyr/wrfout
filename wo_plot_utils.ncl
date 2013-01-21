load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
;_____________________________________________________________________________
; procedure: draw_plot2d
; Doc:
;_____________________________________________________________________________
undef("draw_plot2d")
procedure draw_plot2d(fh:file,res_in:logical,type:string, \
        vname:string,vprefix:string,vltitle:string,vscale:numeric, \
        vunits:string,vlow:float,vhigh:float,vinterval:float)
local fh,res_in,type,vname, vprefix,vltitle, vunits, vlow, vhigh, vinterval

begin
  print("process: " + vname)

  var=fh->$vname$
  out = "wo_" + vprefix
  wks=gsn_open_wks(type,out)

  res = res_in
  res@cnFillOn = True
  res@cnLevelSelectionMode = "ManualLevels"
  res@cnMinLevelValF  = vlow
  res@cnMaxLevelValF  = vhigh
  res@cnLevelSpacingF = vinterval
  res@gsnLeftString   = vltitle
  res@lbLabelStride   = 3

  res = wrf_map_resources(fh,res)
  res = set_lb_resources(var(0,:,:),res)
  delete_attrs(res)

  if (isatt(res,"woDebug") .and. res@woDebug ) then
    printVarSummary(var)
    printVarSummary(res)
  end if

  do ti = 0, dim_len0(var) - 1, 1   ;; time loop
    ; res@gsnCenterString  = "MSLP      fhr="+nt
    print("Working on: " + ti)
    var_ti = var(ti,:,:)
    if ( vscale .ne. 1 ) then
      var_ti = var_ti * vscale
      var_ti@units = vunits
    end if
    plot = gsn_csm_contour_map(wks,var_ti,res)
  end do
  return
end
