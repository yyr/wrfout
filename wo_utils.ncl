load "$WRFOUT/plotvars.ncl"

;_____________________________________________________________________________
; procedure: make_animation
; Doc: uses external imagemagick convert, program.
;_____________________________________________________________________________
undef("make_animation")
procedure make_animation(prefix:string,pfix:string)

begin
  system("convert -verbose -delay 41 -loop 0 -density 50 " \
          + prefix +"*"+ pfix + " " + prefix + ".gif")

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

  do lv = 0, dim_len0(vars) - 1, 1   ;; list of plot variables
    var = vars(lv,:)
    vname = var(0)
    print(vname)
    printVarSummary(var)
  end do
  return
end


;;; wo_utils.ncl ends here
