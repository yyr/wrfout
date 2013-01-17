;_____________________________________________________________________________
; procedure: draw_plot2d
; Doc:
;_____________________________________________________________________________
undef("draw_plot2d")
procedure draw_plot2d(fh:file,vname:string,vprefix:string,vunits:string, \
        vlow:float,vhigh:float,vinterval:float)
local vname, vprefix, vunits, vlow, vhigh, vinterval

begin
  xlat = fh->XLAT(0,:,:)
  xlon = fh->XLONG(0,:,:)


  return
end
