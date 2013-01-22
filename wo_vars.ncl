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
          \ ; varname, plotname_prefix, title,         scale,  unit,   low,   high,   interval, color scheme(?)
          (/"HGT",      "hgt",       "Terrain Height", "1",    "m",    "0",   "2000", "100"  /), \
          (/"SST",      "sst",       "SST",            "1",    "K",    "250", "280",  "1"    /), \
          (/"T2",       "t2",        "Temp at 2m",     "1",    "K",    "250", "280",  "1"    /), \
          (/"PSFC",     "psfc",      "sfc pressure",   ".01",  "hPa",  "960", "1030", "2"   /), \
          (/"LANDMASK", "landmask",  "Land mask",      "1",    "",     "0",   "1",    ".1"   /), \
          (/"SEAICE",   "seaice",    "Sea Ice flag",   "1",    "",     "0",   "1",    ".1"   /), \
          (/"SNOWC",    "snowc",     "Snow cover",     "1",    "",     "0",   "1",    ".1"   /), \
          (/"VEGFRA",   "vegfra",    "Vegitation",     "1",    "",     "0",   "1",    ".1"   /), \
          (/"PBLH",     "pblh",      "PHL Height",     "1",    "m",    "200", "2000", "50"  /), \
          (/"SNOWH",    "snowh",     "Snow depth",     "1",    "m",    "0",   "50",   "2"  /), \
          (/"TH2",      "th2",       "Pot temp at 2m", "1",    "K",    "240", "280",  "1"    /), \
          (/"TMN",      "tmn",       "Soil temp",      "1",    "K",    "250", "290",  "1"    /), \
          (/"TSK",      "tsk",       "Sur skin temp",  "1",    "K",    "250", "290",  "1"    /), \
          (/"RAINC",    "ranic",     "Cumulus prec",   "1",    "mm",    "0",   "30", "1"  /), \
          (/"QFX",      "qfx",       "Moist flux(up)", "1000", "g m-2 s-1", "-.1",  ".1",  ".01"   /), \
          (/"OLR",      "olr",       "l/w (out)",      "1",    "K",    "10",  "300",  "30"   /), \
          (/"SWDOWN",   "swdown",    "s/w (down)",     "1",    "K",    "10",  "300",  "30"   /), \
          (/"HFX",      "hfx",       "Heat flux(up)",  "1",    "K",    "10",  "300",  "30"   /), \
          ; Below field is dummy, Just keep it that way.. \
          (/ "x",      "x",      "x",              "x",   "x",    "x",   "x",    "x"    /)  \
          /)
  return(vars2d)
end

;;; plotvars.ncl ends here
