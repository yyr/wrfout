load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
;_____________________________________________________________________________
; procedure: draw_plot2d
; Doc:
;_____________________________________________________________________________
undef("draw_plot2d")
procedure draw_plot2d(fh:file,res_in:logical,type:string, \
        vname:string,vprefix:string,vunits:string, \
        vlow:float,vhigh:float,vinterval:float)
local fh,res_in,type,vname, vprefix, vunits, vlow, vhigh, vinterval

begin
  print("process: " + vname)

  var=fh->$vname$
  wks=gsn_open_wks(type,"wo")

  res = res_in
  res@cnFillOn = True
  res@cnMinLevelValF  = vlow
  res@cnMaxLevelValF  = vhigh
  res@cnLevelSpacingF = vinterval
  res@lbLabelStride   = 4
  res@gsnLeftString   = ""
  ; res@gsnCenterString  = "MSLP      fhr="+nt

  if (isatt(res,"woDebug")) then
    printVarSummary(var)
    printVarSummary(res)
  end if

  do ti = 0, dim_len0(var) - 1, 1   ;; time loop
    print("ti: " + ti)
    plot = gsn_contour(wks,var(ti,:,:),res)
  end do

  return
end
