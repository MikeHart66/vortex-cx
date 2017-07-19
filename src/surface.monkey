Strict

Private
Import brl.databuffer
Import vortex.src.material
Import vortex.src.renderer

Public
Class Surface Final
Public
	Function Create:Surface(mat:Material = Null)
		Local surf:Surface = New Surface
		surf.mMaterial = surf.Material.Create()	'I need to call the function as surf.Material because the compiler is not capable of finding the correct context
		If mat Then surf.mMaterial.Set(mat); surf.mMaterial.Delegate = mat.Delegate
		surf.mIndices = New DataBuffer(INC * 2, True)
		surf.mVertices = New DataBuffer(INC * VERTEX_SIZE, True)
		surf.mNumIndices = 0
		surf.mNumVertices = 0
		surf.mVertexBuffer = Renderer.CreateVertexBuffer(0)
		surf.mIndexBuffer = Renderer.CreateIndexBuffer(0)
		surf.mStatus = STATUS_OK
		Return surf
	End
	
	Function Create:Surface(other:Surface)
		Local surf:Surface = Surface.Create(other.mMaterial)
		surf.Set(other)
		Return surf
	End

	Method Free:Void(freeTextures:Bool = False)
		mIndices.Discard()
		mVertices.Discard()
		Renderer.FreeBuffer(mIndexBuffer)
		Renderer.FreeBuffer(mVertexBuffer)
		If freeTextures Then mMaterial.FreeTextures()
	End
	
	Method Set:Void(other:Surface)
		If Self = other Then Return
		mStatus = STATUS_V_DIRTY | STATUS_I_DIRTY
		If mNumIndices <> other.mNumIndices Then mStatus |= STATUS_I_RESIZED
		If mNumVertices <> other.mNumVertices Then mStatus |= STATUS_V_RESIZED
		mMaterial.Set(other.mMaterial)
		If mIndices.Length <> other.mIndices.Length
			mIndices.Discard()
			mIndices = New DataBuffer(other.mIndices.Length, True)
		End
		other.mIndices.CopyBytes(0, mIndices, 0, mIndices.Length)
		If mVertices.Length <> other.mVertices.Length
			mVertices.Discard()
			mVertices = New DataBuffer(other.mVertices.Length, True)
		End
		other.mVertices.CopyBytes(0, mVertices, 0, mVertices.Length)
		mNumIndices = other.mNumIndices
		mNumVertices = other.mNumVertices
		Rebuild()
	End

	Method Material:Material() Property
		Return mMaterial
	End

	Method AddTriangle:Int(v0:Int, v1:Int, v2:Int)
		'Create new buffer if current is too short
		If mIndices.Length() < (mNumIndices + 3) * 2
			'Copy old buffer into new one
			Local buf:DataBuffer = New DataBuffer(mIndices.Length() + INC*2)
			mIndices.CopyBytes(0, buf, 0, mIndices.Length())
			mIndices.Discard()
			mIndices = buf
		End

		'Copy new index data
		mIndices.PokeShort(mNumIndices * 2, v0)
		mIndices.PokeShort(mNumIndices * 2 + 2, v1)
		mIndices.PokeShort(mNumIndices * 2 + 4, v2)
		mNumIndices += 3
		
		'Update status
		mStatus |= STATUS_I_DIRTY | STATUS_I_RESIZED
		
		Return NumTriangles-1
	End

	Method NumTriangles:Int() Property
		Return mNumIndices / 3
	End

	Method SetTriangleVertices:Void(index:Int, v0:Int, v1:Int, v2:Int)
		mIndices.PokeShort(index * 6, v0)
		mIndices.PokeShort(index * 6 + 2, v1)
		mIndices.PokeShort(index * 6 + 4, v2)
		mStatus |= STATUS_I_DIRTY
	End

	Method GetTriangleV0:Int(index:Int)
		Return mIndices.PeekShort(index*6)
	End

	Method GetTriangleV1:Int(index:Int)
		Return mIndices.PeekShort(index*6 + 2)
	End

	Method GetTriangleV2:Int(index:Int)
		Return mIndices.PeekShort(index*6 + 4)
	End

	Method AddVertex:Int(x:Float, y:Float, z:Float, nx:Float, ny:Float, nz:Float, r:Float, g:Float, b:Float, a:Float, u0:Float, v0:Float)
		'Create new buffer if current is too short
		If mVertices.Length() < (NumVertices + 1) * VERTEX_SIZE
			'Copy old buffer into new one
			Local buf:DataBuffer = New DataBuffer(mVertices.Length() + INC*VERTEX_SIZE)
			mVertices.CopyBytes(0, buf, 0, mVertices.Length())
			mVertices.Discard()
			mVertices = buf
		End

		'Copy new vertex data
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE, x)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 4, y)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 8, z)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 12, nx)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 16, ny)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 20, nz)
		'mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 24, 1)
		'mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 28, 0)
		'mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 32, 0)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 36, r)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 40, g)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 44, b)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 48, a)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 52, u0)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 56, v0)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 60, u0)
		mVertices.PokeFloat(mNumVertices * VERTEX_SIZE + 64, v0)
		mNumVertices += 1
		
		'Update status
		mStatus |= STATUS_V_DIRTY | STATUS_V_RESIZED

		Return NumVertices-1
	End

	Method NumVertices:Int() Property
		Return mNumVertices
	End

	Method SetVertexPosition:Void(index:Int, x:Float, y:Float, z:Float)
		mVertices.PokeFloat(index * VERTEX_SIZE + POS_OFFSET, x)
		mVertices.PokeFloat(index * VERTEX_SIZE + POS_OFFSET + 4, y)
		mVertices.PokeFloat(index * VERTEX_SIZE + POS_OFFSET + 8, z)
		mStatus |= STATUS_V_DIRTY
	End

	Method SetVertexNormal:Void(index:Int, nx:Float, ny:Float, nz:Float)
		mVertices.PokeFloat(index * VERTEX_SIZE + NORMAL_OFFSET, nx)
		mVertices.PokeFloat(index * VERTEX_SIZE + NORMAL_OFFSET + 4, ny)
		mVertices.PokeFloat(index * VERTEX_SIZE + NORMAL_OFFSET + 8, nz)
		mStatus |= STATUS_V_DIRTY
	End
	
	Method SetVertexTangent:Void(index:Int, tx:Float, ty:Float, tz:Float)
		mVertices.PokeFloat(index * VERTEX_SIZE + TANGENT_OFFSET, tx)
		mVertices.PokeFloat(index * VERTEX_SIZE + TANGENT_OFFSET + 4, ty)
		mVertices.PokeFloat(index * VERTEX_SIZE + TANGENT_OFFSET + 8, tz)
		mStatus |= STATUS_V_DIRTY
	End

	Method SetVertexColor:Void(index:Int, r:Float, g:Float, b:Float, a:Float)
		mVertices.PokeFloat(index * VERTEX_SIZE + COLOR_OFFSET, r)
		mVertices.PokeFloat(index * VERTEX_SIZE + COLOR_OFFSET + 4, g)
		mVertices.PokeFloat(index * VERTEX_SIZE + COLOR_OFFSET + 8, b)
		mVertices.PokeFloat(index * VERTEX_SIZE + COLOR_OFFSET + 12, a)
		mStatus |= STATUS_V_DIRTY
	End

	Method SetVertexTexCoords:Void(index:Int, u:Float, v:Float, set:Int = 0)
		If set = 0
			mVertices.PokeFloat(index * VERTEX_SIZE + TEX0_OFFSET, u)
			mVertices.PokeFloat(index * VERTEX_SIZE + TEX0_OFFSET + 4, v)
		Else
			mVertices.PokeFloat(index * VERTEX_SIZE + TEX1_OFFSET, u)
			mVertices.PokeFloat(index * VERTEX_SIZE + TEX1_OFFSET + 4, v)

		End
		mStatus |= STATUS_V_DIRTY
	End
	
	Method SetVertexBone:Void(vertex:Int, index:Int, bone:Int, weight:Float)
		'WebGL does not support int attributes, so storing it as a float is a trick I am using
		mVertices.PokeFloat(vertex * VERTEX_SIZE + BONEINDICES_OFFSET + index * 4, bone)
		mVertices.PokeFloat(vertex * VERTEX_SIZE + BONEWEIGHTS_OFFSET + index * 4, weight)
		mStatus |= STATUS_V_DIRTY
	End

	Method GetVertexX:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + POS_OFFSET)
	End

	Method GetVertexY:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + POS_OFFSET + 4)
	End

	Method GetVertexZ:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + POS_OFFSET + 8)
	End

	Method GetVertexNX:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + NORMAL_OFFSET)
	End

	Method GetVertexNY:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + NORMAL_OFFSET + 4)
	End

	Method GetVertexNZ:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + NORMAL_OFFSET + 8)
	End
	
	Method GetVertexTX:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + TANGENT_OFFSET)
	End
	
	Method GetVertexTY:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + TANGENT_OFFSET + 4)
	End
	
	Method GetVertexTZ:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + TANGENT_OFFSET + 8)
	End

	Method GetVertexRed:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + COLOR_OFFSET)
	End

	Method GetVertexGreen:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + COLOR_OFFSET + 4)
	End

	Method GetVertexBlue:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + COLOR_OFFSET + 8)
	End

	Method GetVertexAlpha:Float(index:Int)
		Return mVertices.PeekFloat(index*VERTEX_SIZE + COLOR_OFFSET + 12)
	End

	Method GetVertexU:Float(index:Int, set:Int = 0)
		If set = 0
			Return mVertices.PeekFloat(index*VERTEX_SIZE + TEX0_OFFSET)
		Else
			Return mVertices.PeekFloat(index*VERTEX_SIZE + TEX1_OFFSET)
		End
	End

	Method GetVertexV:Float(index:Int, set:Int = 0)
		If set = 0
			Return mVertices.PeekFloat(index*VERTEX_SIZE + TEX0_OFFSET + 4)
		Else
			Return mVertices.PeekFloat(index*VERTEX_SIZE + TEX1_OFFSET + 4)
		End
	End
	
	Method GetVertexBoneIndex:Int(vertex:Int, index:Int)
		Return mVertices.PeekFloat(vertex * VERTEX_SIZE + BONEINDICES_OFFSET + index * 4)
	End
	
	Method GetVertexBoneWeight:Float(vertex:Int, index:Int)
		Return mVertices.PeekFloat(vertex * VERTEX_SIZE + BONEWEIGHTS_OFFSET + index * 4)
	End
	
	Method Translate:Void(x:Float, y:Float, z:Float, rebuild:Bool = True)
		For Local i:Int = 0 Until NumVertices
			SetVertexPosition(i, GetVertexX(i) + x, GetVertexY(i) + y, GetVertexZ(i) + z)
		Next
		If rebuild Then Rebuild()
	End

	Method Rotate:Void(pitch:Float, yaw:Float, roll:Float, rebuild:Bool = True)
		mTempQuat.SetEuler(pitch, yaw, roll)
		mTempQuat.CalcAxis()
		mTempMat.Rotate(mTempQuat.Angle(), mTempQuat.ResultVector())
		For Local i:Int = 0 Until NumVertices
			mTempMat.Mul(GetVertexX(i), GetVertexY(i), GetVertexZ(i), 1)
			SetVertexPosition(i, mTempMat.ResultVector().X, mTempMat.ResultVector().Y, mTempMat.ResultVector().Z)
			'TODO: Set normals
			'mat.Mul(SurfaceVertexNX(surf, i), SurfaceVertexNY(surf, i), SurfaceVertexNZ(surf, i), 0)
			'SetSurfaceVertexNormal(surf, i, mTempMat.ResultVector().X, mTempMat.ResultVector().Y, mTempMat.ResultVector().Z)
		Next
		If rebuild Then Rebuild()
	End

	Method Scale:Void(x:Float, y:Float, z:Float, rebuild:Bool = True)
		For Local i:Int = 0 Until NumVertices
			SetVertexPosition(i, GetVertexX(i) * x, GetVertexY(i) * y, GetVertexZ(i) * z)
		Next
		If rebuild Then Rebuild()
	End

	Method Flip:Void(rebuild:Bool = True)
		'For Local i:Int = 0 Until NumSurfaceVertices(surf)
			'TODO: Set normals
			'SetSurfaceVertexNormal(surf, i, -SurfaceVertexNX(surf, i), -SurfaceVertexNY(surf, i), -SurfaceVertexNZ(surf, i))
		'Next
		For Local i:Int = 0 Until NumVertices
			SetTriangleVertices(i, GetTriangleV2( i), GetTriangleV1(i), GetTriangleV0(i))
		Next
		If rebuild Then Rebuild()
	End

	Method SetColor:Void(r:Float, g:Float, b:Float, a:Float, rebuild:Bool = True)
		For Local i:Int = 0 Until NumVertices
			SetVertexColor(i, r, g, b, a)
		Next
		If rebuild Then Rebuild()
	End

	Method Rebuild:Void()
		If mStatus & STATUS_I_RESIZED Then Renderer.ResizeIndexBuffer(mIndexBuffer, mNumIndices * 2)
		If mStatus & STATUS_I_DIRTY Then Renderer.SetIndexBufferData(mIndexBuffer, 0, mNumIndices * 2, mIndices)
		If mStatus & STATUS_V_RESIZED Then Renderer.ResizeVertexBuffer(mVertexBuffer, mNumVertices * VERTEX_SIZE)
		If mStatus & STATUS_V_DIRTY Then Renderer.SetVertexBufferData(mVertexBuffer, 0, mNumVertices * VERTEX_SIZE, mVertices)
		mStatus = STATUS_OK
	End
	
	Method Draw:Void()
		Renderer.DrawBuffers(mVertexBuffer, mIndexBuffer, mNumIndices, POS_OFFSET, NORMAL_OFFSET, TANGENT_OFFSET, COLOR_OFFSET, TEX0_OFFSET, TEX1_OFFSET, BONEINDICES_OFFSET, BONEWEIGHTS_OFFSET, VERTEX_SIZE)
	End
Private
	Method New()
	End

	Const POS_OFFSET:Int = 0			'12 bytes
	Const NORMAL_OFFSET:Int = 12		'12 bytes
	Const TANGENT_OFFSET:Int = 24		'12 bytes
	Const COLOR_OFFSET:Int = 36			'16 bytes
	Const TEX0_OFFSET:Int = 52			'8 bytes
	Const TEX1_OFFSET:Int = 60			'8 bytes
	Const BONEINDICES_OFFSET:Int = 68	'16 bytes
	Const BONEWEIGHTS_OFFSET:Int = 84	'16 bytes
	Const VERTEX_SIZE:Int = 100
	Const INC:Int = 128
	
	Const STATUS_OK			: Int = 0
	Const STATUS_V_DIRTY	: Int = 1
	Const STATUS_V_RESIZED	: Int = 2
	Const STATUS_I_DIRTY	: Int = 4
	Const STATUS_I_RESIZED	: Int = 8

	Field mMaterial		: Material
	Field mIndices		: DataBuffer
	Field mVertices		: DataBuffer
	Field mNumIndices	: Int
	Field mNumVertices	: Int
	Field mIndexBuffer	: Int
	Field mVertexBuffer	: Int
	Field mStatus		: Int
	Global mTempMatrix	: Mat4 = Mat4.Create()
	Global mTempQuat	: Quat = Quat.Create()
End
