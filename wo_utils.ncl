;_____________________________________________________________________________
; procedure: psplit
; Doc:
;_____________________________________________________________________________
undef("psplit")
procedure psplit(pref:string)
local pref

begin
  system("psplit " + pref + "* " + pref )
  return
end

;_____________________________________________________________________________
; procedure: make_animation
; Doc: uses external imagemagick convert, program.
;_____________________________________________________________________________
undef("make_animation")
procedure make_animation(prefix:string,type:string)

begin

  if (  type .eq. "ps" ) then
    print("Splitting PostScript File..")
    psplit(prefix)
  end if

  system("convert -verbose -delay 41 -loop 0 -density 50 " \
          + prefix +"*"+ type + " " + prefix + ".gif")
  return
end

;_____________________________________________________________________________
; procedure: wo_delete_att
; Doc:
;_____________________________________________________________________________
undef("wo_delete_att")
procedure wo_delete_att(res_in:logical)

begin
  wo_att_list = (/ "woDebug", \
          "woGraphicType", \
          "woGraphicPrefix", \
          "woXxx" /)

  do at = 0, dim_len0(wo_att_list) - 1 , 1   ;; att
    if (isatt(res_in,wo_att_list(at)) ) then
      delete(res_in@$wo_att_list(at)$)
    end if
  end do
  return
end
