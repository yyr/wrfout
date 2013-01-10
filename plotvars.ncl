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
          \ ; varname, plotname_prefix, unit, low, high, int
          (/"HGT", "hgt", "m", "0", "2000", "100" /), \
          (/"HGT", "hgt", "m", "0", "2000", "100" /) \
          /)
  return(vars2d)
end

;;; plotvars.ncl ends here
