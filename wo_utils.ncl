load "$WRFOUT/plotvars.ncl"

;_____________________________________________________________________________
; procedure: psplit
; Doc:
;_____________________________________________________________________________
undef("psplit")
procedure psplit(fnameRprefix:string)
local fnameRprefix

begin
  system("psplit " + fnameRprefix + "* " + "fnameRprefix")
  return
end


;_____________________________________________________________________________
; procedure: make_animation
; Doc: uses external imagemagick convert, program.
;_____________________________________________________________________________
undef("make_animation")
procedure make_animation(prefix:string,type:string)

begin

  if (  type = "ps" ) then
    psplit(prefix)
  end if

  system("convert -verbose -delay 41 -loop 0 -density 50 " \
          + prefix +"*"+ type + " " + prefix + ".gif")
  return
end

;_____________________________________________________________________________
; procedure: plot2d
; Doc:
;_____________________________________________________________________________
undef("plot2d")
procedure plot2d(fh:file)
local plot

begin
  vars = plot_vars2d()
  printVarSummary(vars)

  do lv = 0, dim_len0(vars) - 2, 1   ;; list of plot variables

    ; varname, plotname_prefix, unit, low, high, interval
    var = vars(lv,:)
    vname = var(0)
    vprefix = var(1)
    vunits =  var(2)
    vlow = stringtofloat(var(3))
    vhigh = stringtofloat(var(4))
    vinterval = stringtofloat(var(5))

    draw_plot2d(fh,vname,vprefix,vunits,vlow,vhigh,vinterval)

    print(vname)
    printVarSummary(var)
  end do
  return
end


;;; wo_utils.ncl ends here
