; Description:
;

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

;;; wo_utils.ncl ends here
