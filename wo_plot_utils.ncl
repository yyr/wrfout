load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
;_____________________________________________________________________________
; procedure: draw_plot2d
; Doc:
;_____________________________________________________________________________
undef("draw_plot2d")
procedure draw_plot2d(fh:file,res:logical, \
        vname:string,vprefix:string,vltitle:string,vscale:numeric, \
        vunits:string,vlow:float,vhigh:float,vinterval:float)
local fh,res,type,vname, vprefix,vltitle, vunits, vlow, vhigh, vinterval


begin
  print("process: " + vname)

  var=fh->$vname$
  out = "wo_" + vprefix
  wks=gsn_open_wks(res@woGraphicType,out)

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
  res@lbTitleOn = False

  if (isatt(res,"woDebug") .and. res@woDebug ) then
    printVarInfo(var,"Variable Info")
    printVarSummary(res)
  end if

  wo_delete_att(res)
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
