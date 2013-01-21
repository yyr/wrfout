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
          \ ; varname, plotname_prefix, title,    scale,  unit,   low,   high,   interval, color scheme(?)
          (/"HGT",      "hgt",       "Terrain Height", "1",    "m",    "0",   "2000", "100"  /), \
          (/"SST",      "sst",       "SST",            "1",    "K",    "250", "280",  "1"    /), \
          (/"T2",       "t2",        "Temp at 2m",     "1",    "K",    "250", "280",  "1"    /), \
          (/"OLR",      "olr",       "l/w (out)",      "1",    "K",    "10",  "300",  "30"   /), \
          (/"SWDOWN",   "swdown",    "s/w (down)",     "1",    "K",    "10",  "300",  "30"   /), \
          (/"PSFC",     "psfc",      "sfc pressure",   ".01",  "hPa",  "960", "1030", "2"   /), \
          (/"LANDMASK", "landmask",  "Land mask",      "1",    "",     "0",   "1",    ".1"   /), \
          (/"SEAICE",   "seaice",    "Sea Ice flag",   "1",    "",     "0",   "1",    ".1"   /), \
          (/"SNOWC",    "snowc",     "snowc cover",    "1",    "",     "0",   "1",    ".1"   /), \
          (/"VEGFRA",   "vegfra",    "Vegitation",     "1",    "",     "0",   "1",    ".1"   /), \
          (/"PBLH",     "pblh",      "PHL Height",     "1",    "m",    "200", "2000", "50"  /), \
          (/"SNOWH",    "snowh",     "Snow depth",     "1",    "m",    "0",   "50",   "2"  /), \
          ; Below field is dummy, Just keep it that way.. \
          (/ "x",      "x",      "x",              "x",   "x",    "x",   "x",    "x"    /)  \
          /)
  return(vars2d)
end

;;; plotvars.ncl ends here
