Strict

Private
Import brl.databuffer
Import vortex.src.renderer

Public
Class Texture Final
Public
	Function Create:Texture(buffer:DataBuffer, width:Int, height:Int, filter:Int = Renderer.FILTER_NONE)
		Local tex:Texture = New Texture
		tex.mHandle = Renderer.GenTexture(buffer, width, height, filter)
		tex.mWidth = width
		tex.mHeight = height
		tex.mIsCubic = False
		Return tex
	End
	
	Function Load:Texture(filename:String, filter:Int = Renderer.FILTER_TRILINEAR)
		Local handle:Int = Renderer.LoadTexture(filename, mSizeArr, filter)
		If mSizeArr[0] > 0
			Local tex:Texture = New Texture
			tex.mFilename = filename
			tex.mHandle = handle
			tex.mWidth = mSizeArr[0]
			tex.mHeight = mSizeArr[1]
			tex.mIsCubic = False
			Return tex
		Else
			Return Null
		End
	End
	
	Function Load:Texture(left:String, right:String, front:String, back:String, top:String, bottom:String, filter:Int = Renderer.FILTER_TRILINEAR)
		Local handle:Int = Renderer.LoadCubicTexture(left, right, front, back, top, bottom, mSizeArr, filter)
		If mSizeArr[0] > 0
			Local tex:Texture = New Texture
			tex.mFilename = left + "," + right + "," + front + "," + back + "," + top + "," + bottom
			tex.mHandle = handle
			tex.mWidth = mSizeArr[0]
			tex.mHeight = mSizeArr[1]
			tex.mIsCubic = True
			Return tex
		Else
			Return Null
		End
	End

	Method Free:Void()
		Renderer.FreeTexture(mHandle)
	End

	Method Filename:String() Property
		Return mFilename
	End

	Method Handle:Int() Property
		Return mHandle
	End

	Method Width:Int() Property
		Return mWidth
	End

	Method Height:Int() Property
		Return mHeight
	End
	
	Method Cubic:Bool() Property
		Return mIsCubic
	End

	Method Draw:Void(x:Float, y:Float, width:Float = 0, height:Float = 0, rectx:Float = 0, recty:Float = 0, rectwidth:Float = 0, rectheight:Float = 0)
		If rectwidth = 0 Then rectwidth = Width
		If rectheight = 0 Then rectheight = Height
		If width = 0 Then width = rectwidth
		If height = 0 Then height = rectheight

		'Calculate texcoords in 0..1 range, independently from frame
		Local u0:Float = rectx / Width
		Local v0:Float = recty / Height
		Local u1:Float = (rectx + rectwidth) / Width
		Local v1:Float = (recty + rectheight) / Height

		'Render
		Renderer.SetTextures(mHandle, 0, 0, 0, False)
		Renderer.DrawRectEx(x, y, width, height, u0, v0, u1, v1)
		Renderer.SetTextures(0, 0, 0, 0, False)
	End
Private
	Method New()
	End

	Field mFilename	: String
	Field mHandle	: Int
	Field mWidth	: Int
	Field mHeight	: Int
	Field mIsCubic	: Bool
	Global mSizeArr	: Int[2]
End
