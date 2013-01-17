; Created: Monday, January  7 2013

;_____________________________________________________________________________
; Function: plot_vars2d
; Doc:
;_____________________________________________________________________________
undef("plot_vars2d")
function plot_vars2d()
local vars2d

begin
  vars2d = (/ \
          \ ; varname, plotname_prefix, unit, low, high, interval
          (/"HGT", "hgt", "m", "0", "2000", "100" /), \
          (/"x", "x", "x", "x", "x", "x" /) \
          /)
  return(vars2d)
end

;;; plotvars.ncl ends here
