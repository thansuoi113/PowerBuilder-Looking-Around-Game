$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_1 from commandbutton within w_main
end type
type rb_4 from radiobutton within w_main
end type
type rb_3 from radiobutton within w_main
end type
type cbx_1 from checkbox within w_main
end type
type rb_2 from radiobutton within w_main
end type
type rb_1 from radiobutton within w_main
end type
type st_4 from statictext within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type cb_reopen from commandbutton within w_main
end type
type cb_start from commandbutton within w_main
end type
type p_1 from picture within w_main
end type
type p_model from picture within w_main
end type
type r_box from rectangle within w_main
end type
type st_1 from statictext within w_main
end type
type gb_1 from groupbox within w_main
end type
type gb_2 from groupbox within w_main
end type
type ov_3 from oval within w_main
end type
type ov_1 from oval within w_main
end type
type ov_2 from oval within w_main
end type
end forward

global type w_main from window
integer width = 1861
integer height = 1376
boolean titlebar = true
string title = "looking around"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
rb_4 rb_4
rb_3 rb_3
cbx_1 cbx_1
rb_2 rb_2
rb_1 rb_1
st_4 st_4
st_3 st_3
st_2 st_2
cb_reopen cb_reopen
cb_start cb_start
p_1 p_1
p_model p_model
r_box r_box
st_1 st_1
gb_1 gb_1
gb_2 gb_2
ov_3 ov_3
ov_1 ov_1
ov_2 ov_2
end type
global w_main w_main

type variables
//Record the multiple, the maximum level
Dec ii_multiple,ii_multiple_max = 12
//Store dynamically generated controls and clear them
picture ii_any_picture[], ii_any_null[]
//countdown
String is_timer = '5'
//God's perspective - record coordinates
Long il_subscript
//blood volume
Long il_hp = 3

end variables

forward prototypes
public function integer wf_random (integer ai_bound)
public subroutine wf_deleteobject ()
public subroutine wf_draw_new ()
end prototypes

public function integer wf_random (integer ai_bound);Int i
Int li_number

li_number = Rand(ai_bound)

Return li_number

end function

public subroutine wf_deleteobject ();Long li_i

For li_i = UpperBound(ii_any_picture) To 1 Step -1
	CloseUserObject(ii_any_picture[li_i])
Next

end subroutine

public subroutine wf_draw_new ();picture lp_pic
Int li_x = 0,li_y = 0,li_i
Int li_for_x, li_for_y
Decimal li_box_width,li_box_height,li_model_width,li_model_height
Int li_line,li_column
Int li_coordinates_x, li_coordinates_y

For li_i = UpperBound(ii_any_picture) To 1 Step -1
	CloseUserObject(ii_any_picture[li_i])
Next

// clear the array
ii_any_picture = ii_any_null
st_1.Text = is_timer


li_x = r_box.X
li_y = r_box.Y
li_box_width = r_box.Width
li_box_height = r_box.Height

// redefine the content image size
li_model_width = li_box_width /ii_multiple
li_model_height = li_box_height /ii_multiple

li_line = li_box_height /li_model_height //line
li_column = li_box_width /li_model_width //column

li_coordinates_x = wf_random(li_column) //coordinate 1
li_coordinates_y = wf_random(li_line) //coordinate 2

For li_for_y = 1 To li_line
	For li_for_x = 1 To li_column
		lp_pic = Create Using "p_model"
		If li_for_y = li_coordinates_y And li_coordinates_x = li_for_x Then
			//right CheckOut
			lp_pic.PictureName = 'right.bmp'
			lp_pic.Tag = '1'
			il_subscript = UpperBound(ii_any_picture) +1
		End If
		lp_pic.Width = li_model_width //Set properties
		lp_pic.Height = li_model_height
		lp_pic.Enabled = True
		This.OpenUserObject(lp_pic,""+String(li_for_x)+"", li_x,li_y)
		
		li_x+= li_model_width
		ii_any_picture[UpperBound(ii_any_picture) + 1] = lp_pic
	Next
	li_y+= li_model_height
	li_x = r_box.X
Next
//Redraw border width and height;
//r_box.width=li_column *li_model_width
//r_box.height=li_line * li_model_height

end subroutine

on w_main.create
this.cb_1=create cb_1
this.rb_4=create rb_4
this.rb_3=create rb_3
this.cbx_1=create cbx_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.cb_reopen=create cb_reopen
this.cb_start=create cb_start
this.p_1=create p_1
this.p_model=create p_model
this.r_box=create r_box
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.ov_3=create ov_3
this.ov_1=create ov_1
this.ov_2=create ov_2
this.Control[]={this.cb_1,&
this.rb_4,&
this.rb_3,&
this.cbx_1,&
this.rb_2,&
this.rb_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.cb_reopen,&
this.cb_start,&
this.p_1,&
this.p_model,&
this.r_box,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.ov_3,&
this.ov_1,&
this.ov_2}
end on

on w_main.destroy
destroy(this.cb_1)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.cbx_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_reopen)
destroy(this.cb_start)
destroy(this.p_1)
destroy(this.p_model)
destroy(this.r_box)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.ov_3)
destroy(this.ov_1)
destroy(this.ov_2)
end on

event timer;Long ll_num
String ls_score
ll_num = Long(st_1.Text)
If ll_num = 0 Then
	ls_score = st_4.Text
	Timer(0)
	cb_start.Enabled = True
	MessageBox("Tips", "Game Over; Score:" +ls_score)
	cb_reopen.TriggerEvent( Clicked!)
Else
	st_1.Text = String(ll_num -1)
End If



end event

event open;Randomize(0)
end event

type cb_1 from commandbutton within w_main
integer x = 1326
integer y = 864
integer width = 457
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Tips"
end type

event clicked;If Upperbound(ii_any_picture) < 1 Then Return
ii_any_picture[il_subscript].Invert = True

end event

type rb_4 from radiobutton within w_main
integer x = 1248
integer y = 1124
integer width = 384
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "unlimited"
end type

type rb_3 from radiobutton within w_main
integer x = 786
integer y = 1124
integer width = 384
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "12 levels"
boolean checked = true
end type

type cbx_1 from checkbox within w_main
boolean visible = false
integer x = 2336
integer y = 912
integer width = 352
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "God's perspective"
end type

type rb_2 from radiobutton within w_main
integer x = 320
integer y = 1124
integer width = 384
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "unlimited"
end type

type rb_1 from radiobutton within w_main
integer x = 50
integer y = 1124
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "time"
boolean checked = true
end type

type st_4 from statictext within w_main
integer x = 1504
integer y = 176
integer width = 242
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "0"
boolean border = true
boolean focusrectangle = false
end type

type st_3 from statictext within w_main
integer x = 1312
integer y = 184
integer width = 206
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Score:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 1335
integer y = 268
integer width = 178
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "time:"
boolean focusrectangle = false
end type

type cb_reopen from commandbutton within w_main
integer x = 1326
integer y = 716
integer width = 457
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Refresh"
end type

event clicked;ii_multiple = 2

r_box.Width = 1200
r_box.Height = 1000

If rb_1.Checked Then
	st_1.Text = is_timer
Else
	is_timer = 'none'
	st_1.Text = is_timer
End If

st_4.Text = '0'

wf_deleteobject()
ii_any_picture = ii_any_null
Timer(0)

cb_start.Enabled = True
rb_1.Enabled = True
rb_2.Enabled = True
rb_3.Enabled = True
rb_4.Enabled = True

ov_1.FillColor = RGB(255,0,0)
ov_2.FillColor = RGB(255,0,0)
ov_3.FillColor = RGB(255,0,0)
il_hp = 3

end event

type cb_start from commandbutton within w_main
integer x = 1326
integer y = 568
integer width = 457
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;cb_reopen.TriggerEvent(Clicked!)
wf_draw_new()
If rb_1.Checked Then
	Timer(1)
End If
cb_start.Enabled = False
rb_1.Enabled = False
rb_2.Enabled = False
rb_3.Enabled = False
rb_4.Enabled = False



end event

type p_1 from picture within w_main
string tag = "0"
integer x = 1563
integer y = 372
integer width = 201
integer height = 160
boolean enabled = false
string picturename = "right.bmp"
boolean border = true
boolean focusrectangle = false
end type

event clicked;String ls_tag
ls_tag = This.Tag
MessageBox("",ls_tag)

end event

type p_model from picture within w_main
string tag = "0"
integer x = 1335
integer y = 372
integer width = 201
integer height = 160
boolean enabled = false
string picturename = "left.bmp"
boolean border = true
boolean focusrectangle = false
end type

event clicked;String ls_tag
Int li_i

ls_tag = This.Tag
If ls_tag = '1' Then
	st_4.Text = String(Long(st_4.Text) + ((Long(st_1.Text) * 10) ))
	ii_multiple = ii_multiple+1
	
	If rb_3.Checked Then
		If ii_multiple > ii_multiple_max Then
			MessageBox("Tips", "Game Over; Score: "+st_4.Text)
			cb_reopen.TriggerEvent(Clicked!)
			Return
		End If
	Else
		If ii_multiple > ii_multiple_max Then
			ii_multiple = ii_multiple_max
		End If
	End If
	
	wf_draw_new()
Else
	il_hp = il_hp -1
	
	If il_hp = 2 Then
		ov_3.FillColor = RGB(255,255,255)
	ElseIf il_hp = 1 Then
		ov_2.FillColor = RGB(255,255,255)
	Else
		ov_1.FillColor = RGB(255,255,255)
	End If
	
	If il_hp = 0 Then
		MessageBox("Tips", "Game Over; Score: "+st_4.Text)
		cb_reopen.TriggerEvent(Clicked!)
		Return
	End If
	// messagebox("",il_hp)
End If

end event

type r_box from rectangle within w_main
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer width = 1202
integer height = 1000
end type

type st_1 from statictext within w_main
integer x = 1504
integer y = 256
integer width = 242
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "0"
boolean border = true
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_main
integer y = 1036
integer width = 713
integer height = 196
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
string text = "time"
end type

type gb_2 from groupbox within w_main
integer x = 741
integer y = 1036
integer width = 1029
integer height = 196
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
string text = "level"
end type

type ov_3 from oval within w_main
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 255
integer x = 1664
integer y = 80
integer width = 55
integer height = 48
end type

type ov_1 from oval within w_main
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 255
integer x = 1390
integer y = 80
integer width = 55
integer height = 48
end type

type ov_2 from oval within w_main
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 255
integer x = 1527
integer y = 80
integer width = 55
integer height = 48
end type

