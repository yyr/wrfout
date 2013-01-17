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
