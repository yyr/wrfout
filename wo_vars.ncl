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
          \ ; varname, plotname_prefix, title,     unit, low,   high,   interval, color scheme(?)
          (/"HGT",    "hgt",    "Terrain Height",  "m",  "0",   "2000", "100"  /), \
          (/"SST",    "sst",    "SST",             "K",  "250", "280",  "1"    /), \
          (/"T2",     "t2",     "Temp at 2m",      "K",  "250", "280",  "1"    /), \
          (/"OLR",    "olr",    "l/w (out)",       "K",  "10",  "300",  "30"   /), \
          (/"SWDOWN", "swdown", "s/w (down)",      "K",  "10",  "300",  "30"  /), \
          \ ; Below is dummy, Just keep it
          (/ "x",      "x",      "x",               "x", "x", "x", "x" /) \
          /)
  return(vars2d)
end

;;; plotvars.ncl ends here
