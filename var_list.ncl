; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: var_list.ncl
; Created: Monday, January  7 2013
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>


;_____________________________________________________________________________
; Function: plot_vars2d
; Doc:
;
;_____________________________________________________________________________
undef("plot_vars2d")
function plot_vars2d()
local vars2d

begin
  vars2d = (/ \
          (/"SEAICE"/), \
          (/"QSNOW"/) \
          /)
  return(vars2d)
end

;;; var_list.ncl ends here
