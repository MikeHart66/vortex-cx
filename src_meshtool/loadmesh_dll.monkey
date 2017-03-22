Strict

Private

Import brl.process
Import lib
Import vortex

Global _LoadMeshFunc:Int
Global _DeleteMeshFunc:Int
Global _NumSurfacesFunc:Int
Global _MaterialBlendFunc:Int
Global _MaterialTextureNameFunc:Int
Global _MaterialRedFunc:Int
Global _MaterialGreenFunc:Int
Global _MaterialBlueFunc:Int
Global _MaterialOpacityFunc:Int
Global _MaterialShininessFunc:Int
Global _MaterialCullingFunc:Int
Global _MaterialDepthWriteFunc:Int
Global _NumIndicesFunc:Int
Global _GetIndexFunc:Int
Global _NumVerticesFunc:Int
Global _VertexXFunc:Int
Global _VertexYFunc:Int
Global _VertexZFunc:Int
Global _VertexNXFunc:Int
Global _VertexNYFunc:Int
Global _VertexNZFunc:Int
Global _VertexTXFunc:Int
Global _VertexTYFunc:Int
Global _VertexTZFunc:Int
Global _VertexU0Func:Int
Global _VertexV0Func:Int
Global _VertexBoneFunc:Int
Global _VertexWeightFunc:Int
Global _NumFramesFunc:Int
Global _NumBonesFunc:Int
Global _BoneNameFunc:Int
Global _BoneParentIndexFunc:Int
Global _BoneInvPoseMatrixElemFunc:Int
Global _BoneNumPositionKeysFunc:Int
Global _BoneNumRotationKeysFunc:Int
Global _BoneNumScaleKeysFunc:Int
Global _BonePositionKeyFrameFunc:Int
Global _BonePositionKeyXFunc:Int
Global _BonePositionKeyYFunc:Int
Global _BonePositionKeyZFunc:Int
Global _BoneRotationKeyFrameFunc:Int
Global _BoneRotationKeyWFunc:Int
Global _BoneRotationKeyXFunc:Int
Global _BoneRotationKeyYFunc:Int
Global _BoneRotationKeyZFunc:Int
Global _BoneScaleKeyFrameFunc:Int
Global _BoneScaleKeyXFunc:Int
Global _BoneScaleKeyYFunc:Int
Global _BoneScaleKeyZFunc:Int

Function DeleteMesh:Void(meshPtr:Int)
	PushLibInt(meshPtr)
	CallVoidFunction(_DeleteMeshFunc)
End

Function NumSurfaces:Int(meshPtr:Int)
	PushLibInt(meshPtr)
	Return CallIntFunction(_NumSurfacesFunc)
End

Function MaterialBlend:Int(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallIntFunction(_MaterialBlendFunc)
End

Function MaterialTextureName:String(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallStringFunction(_MaterialTextureNameFunc)
End

Function MaterialRed:Float(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallFloatFunction(_MaterialRedFunc)
End

Function MaterialGreen:Float(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallFloatFunction(_MaterialGreenFunc)
End

Function MaterialBlue:Float(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallFloatFunction(_MaterialBlueFunc)
End

Function MaterialOpacity:Float(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallFloatFunction(_MaterialOpacityFunc)
End

Function MaterialShininess:Float(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallFloatFunction(_MaterialShininessFunc)
End

Function MaterialCulling:Bool(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return Bool(CallIntFunction(_MaterialCullingFunc))
End

Function MaterialDepthWrite:Bool(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return Bool(CallIntFunction(_MaterialDepthWriteFunc))
End

Function NumIndices:Int(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallIntFunction(_NumIndicesFunc)
End

Function GetIndex:Int(meshPtr:Int, surfIndex:Int, indexNumber:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(indexNumber)
	Return CallIntFunction(_GetIndexFunc)
End

Function NumVertices:Int(meshPtr:Int, surfIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	Return CallIntFunction(_NumVerticesFunc)
End

Function VertexX:Float(meshPtr:int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexXFunc)
End

Function VertexY:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexYFunc)
End

Function VertexZ:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexZFunc)
End

Function VertexNX:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexNXFunc)
End

Function VertexNY:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexNYFunc)
End

Function VertexNZ:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexNZFunc)
End

Function VertexTX:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexTXFunc)
End

Function VertexTY:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexTYFunc)
End

Function VertexTZ:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexTZFunc)
End

Function VertexU0:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexU0Func)
End

Function VertexV0:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	Return CallFloatFunction(_VertexV0Func)
End

Function VertexBone:Int(meshPtr:Int, surfIndex:Int, vertexIndex:Int, boneIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	PushLibInt(boneIndex)
	Return CallIntFunction(_VertexBoneFunc)
End

Function VertexWeight:Float(meshPtr:Int, surfIndex:Int, vertexIndex:Int, weightIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(surfIndex)
	PushLibInt(vertexIndex)
	PushLibInt(weightIndex)
	Return CallFloatFunction(_VertexWeightFunc)
End

Function NumFrames:Int(meshPtr:Int)
	PushLibInt(meshPtr)
	Return CallIntFunction(_NumFramesFunc)
End

Function NumBones:Int(meshPtr:Int)
	PushLibInt(meshPtr)
	Return CallIntFunction(_NumBonesFunc)
End

Function BoneName:String(meshPtr:Int, boneIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	Return CallStringFunction(_BoneNameFunc)
End

Function BoneParentIndex:Int(meshPtr:Int, boneIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	Return CallIntFunction(_BoneParentIndexFunc)
End

Function BoneInvPoseMatrixElem:Float(meshPtr:Int, boneIndex:Int, elemIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(elemIndex)
	Return CallFloatFunction(_BoneInvPoseMatrixElemFunc)
End

Function BoneNumPositionKeys:Int(meshPtr:Int, boneIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	Return CallIntFunction(_BoneNumPositionKeysFunc)
End

Function BoneNumRotationKeys:Int(meshPtr:Int, boneIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	Return CallIntFunction(_BoneNumRotationKeysFunc)
End

Function BoneNumScaleKeys:Int(meshPtr:Int, boneIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	Return CallIntFunction(_BoneNumScaleKeysFunc)
End

Function BonePositionKeyFrame:Int(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallIntFunction(_BonePositionKeyFrameFunc)
End

Function BonePositionKeyX:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BonePositionKeyXFunc)
End

Function BonePositionKeyY:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BonePositionKeyYFunc)
End

Function BonePositionKeyZ:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BonePositionKeyZFunc)
End

Function BoneRotationKeyFrame:Int(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallIntFunction(_BoneRotationKeyFrameFunc)
End

Function BoneRotationKeyW:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BoneRotationKeyWFunc)
End

Function BoneRotationKeyX:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BoneRotationKeyXFunc)
End

Function BoneRotationKeyY:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BoneRotationKeyYFunc)
End

Function BoneRotationKeyZ:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BoneRotationKeyZFunc)
End

Function BoneScaleKeyFrame:Int(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallIntFunction(_BoneScaleKeyFrameFunc)
End

Function BoneScaleKeyX:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BoneScaleKeyXFunc)
End

Function BoneScaleKeyY:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BoneScaleKeyYFunc)
End

Function BoneScaleKeyZ:Float(meshPtr:Int, boneIndex:Int, keyIndex:Int)
	PushLibInt(meshPtr)
	PushLibInt(boneIndex)
	PushLibInt(keyIndex)
	Return CallFloatFunction(_BoneScaleKeyZFunc)
End

Public

Function InitMeshLoader:Bool(libname:String)
	Local path:String = CurrentDir() + "/data/"
	Local lib:Int = LoadLib(path + libname)
	If lib = 0
		path = CurrentDir() + "/meshtool.data/"
		lib = LoadLib(path + libname)
	End
	If lib <> 0
		_LoadMeshFunc = LibFunction(lib, "LoadMesh@4")
		If _LoadMeshFunc = 0 Then Return False
		_DeleteMeshFunc = LibFunction(lib, "DeleteMesh@4")
		If _DeleteMeshFunc = 0 Then Return False
		_NumSurfacesFunc = LibFunction(lib, "NumSurfaces@4")
		If _NumSurfacesFunc = 0 Then Return False
		_MaterialBlendFunc = LibFunction(lib, "MaterialBlend@8")
		If _MaterialBlendFunc = 0 Then Return False
		_MaterialTextureNameFunc = LibFunction(lib, "MaterialTextureName@8")
		If _MaterialTextureNameFunc = 0 Then Return False
		_MaterialRedFunc = LibFunction(lib, "MaterialRed@8")
		If _MaterialRedFunc = 0 Then Return False
		_MaterialGreenFunc = LibFunction(lib, "MaterialGreen@8")
		If _MaterialGreenFunc = 0 Then Return False
		_MaterialBlueFunc = LibFunction(lib, "MaterialBlue@8")
		If _MaterialBlueFunc = 0 Then Return False
		_MaterialOpacityFunc = LibFunction(lib, "MaterialOpacity@8")
		If _MaterialOpacityFunc = 0 Then Return False
		_MaterialShininessFunc = LibFunction(lib, "MaterialShininess@8")
		If _MaterialShininessFunc = 0 Then Return False
		_MaterialCullingFunc = LibFunction(lib, "MaterialCulling@8")
		If _MaterialCullingFunc = 0 Then Return False
		_MaterialDepthWriteFunc = LibFunction(lib, "MaterialDepthWrite@8")
		If _MaterialDepthWriteFunc = 0 Then Return False
		_NumIndicesFunc = LibFunction(lib, "NumIndices@8")
		If _NumIndicesFunc = 0 Then Return False
		_GetIndexFunc = LibFunction(lib, "GetIndex@12")
		If _GetIndexFunc = 0 Then Return False
		_NumVerticesFunc = LibFunction(lib, "NumVertices@8")
		If _NumVerticesFunc = 0 Then Return False
		_VertexXFunc = LibFunction(lib, "VertexX@12")
		If _VertexXFunc = 0 Then Return False
		_VertexYFunc = LibFunction(lib, "VertexY@12")
		If _VertexYFunc = 0 Then Return False
		_VertexZFunc = LibFunction(lib, "VertexZ@12")
		If _VertexZFunc = 0 Then Return False
		_VertexNXFunc = LibFunction(lib, "VertexNX@12")
		If _VertexNXFunc = 0 Then Return False
		_VertexNYFunc = LibFunction(lib, "VertexNY@12")
		If _VertexNYFunc = 0 Then Return False
		_VertexNZFunc = LibFunction(lib, "VertexNZ@12")
		If _VertexNZFunc = 0 Then Return False
		_VertexTXFunc = LibFunction(lib, "VertexTX@12")
		If _VertexTXFunc = 0 Then Return False
		_VertexTYFunc = LibFunction(lib, "VertexTY@12")
		If _VertexTYFunc = 0 Then Return False
		_VertexTZFunc = LibFunction(lib, "VertexTZ@12")
		If _VertexTZFunc = 0 Then Return False
		_VertexU0Func = LibFunction(lib, "VertexU0@12")
		If _VertexU0Func = 0 Then Return False
		_VertexV0Func = LibFunction(lib, "VertexV0@12")
		If _VertexV0Func = 0 Then Return False
		_VertexBoneFunc = LibFunction(lib, "VertexBone@16")
		If _VertexBoneFunc = 0 Then Return False
		_VertexWeightFunc = LibFunction(lib, "VertexWeight@16")
		If _VertexWeightFunc = 0 Then Return False
		_NumFramesFunc = LibFunction(lib, "NumFrames@4")
		If _NumFramesFunc = 0 Then Return False
		_NumBonesFunc = LibFunction(lib, "NumBones@4")
		If _NumBonesFunc = 0 Then Return False
		_BoneNameFunc = LibFunction(lib, "BoneName@8")
		If _BoneNameFunc = 0 Then Return False
		_BoneParentIndexFunc = LibFunction(lib, "BoneParentIndex@8")
		If _BoneParentIndexFunc = 0 Then Return False
		_BoneInvPoseMatrixElemFunc = LibFunction(lib, "BoneInvPoseMatrixElem@12")
		If _BoneInvPoseMatrixElemFunc = 0 Then Return False
		_BoneNumPositionKeysFunc = LibFunction(lib, "BoneNumPositionKeys@8")
		If _BoneNumPositionKeysFunc = 0 Then Return False
		_BoneNumRotationKeysFunc = LibFunction(lib, "BoneNumRotationKeys@8")
		If _BoneNumRotationKeysFunc = 0 Then Return False
		_BoneNumScaleKeysFunc = LibFunction(lib, "BoneNumScaleKeys@8")
		If _BoneNumScaleKeysFunc = 0 Then Return False
		_BonePositionKeyFrameFunc = LibFunction(lib, "BonePositionKeyFrame@12")
		If _BonePositionKeyFrameFunc = 0 Then Return False
		_BonePositionKeyXFunc = LibFunction(lib, "BonePositionKeyX@12")
		If _BonePositionKeyXFunc = 0 Then Return False
		_BonePositionKeyYFunc = LibFunction(lib, "BonePositionKeyY@12")
		If _BonePositionKeyYFunc = 0 Then Return False
		_BonePositionKeyZFunc = LibFunction(lib, "BonePositionKeyZ@12")
		If _BonePositionKeyZFunc = 0 Then Return False
		_BoneRotationKeyFrameFunc = LibFunction(lib, "BoneRotationKeyFrame@12")
		If _BoneRotationKeyFrameFunc = 0 Then Return False
		_BoneRotationKeyWFunc = LibFunction(lib, "BoneRotationKeyW@12")
		If _BoneRotationKeyWFunc = 0 Then Return False
		_BoneRotationKeyXFunc = LibFunction(lib, "BoneRotationKeyX@12")
		If _BoneRotationKeyXFunc = 0 Then Return False
		_BoneRotationKeyYFunc = LibFunction(lib, "BoneRotationKeyY@12")
		If _BoneRotationKeyYFunc = 0 Then Return False
		_BoneRotationKeyZFunc = LibFunction(lib, "BoneRotationKeyZ@12")
		If _BoneRotationKeyZFunc = 0 Then Return False
		_BoneScaleKeyFrameFunc = LibFunction(lib, "BoneScaleKeyFrame@12")
		If _BoneScaleKeyFrameFunc = 0 Then Return False
		_BoneScaleKeyXFunc = LibFunction(lib, "BoneScaleKeyX@12")
		If _BoneScaleKeyXFunc = 0 Then Return False
		_BoneScaleKeyYFunc = LibFunction(lib, "BoneScaleKeyY@12")
		If _BoneScaleKeyYFunc = 0 Then Return False
		_BoneScaleKeyZFunc = LibFunction(lib, "BoneScaleKeyZ@12")
		If _BoneScaleKeyZFunc = 0 Then Return False
		Return True
	Else
		Return False
	End
End

Function LoadMesh:Mesh(filename:String)
	Local mesh:Mesh = Null
	
	'Try to load using dll
	Local meshPtr:Int
	PushLibString(filename)
	meshPtr = CallIntFunction(_LoadMeshFunc)
	
	'If it fails, load with Vortex
	If Not meshPtr
		Return Cache.GetMesh(filename)
	'Otherwise, build mesh
	Else
		'Create mesh
		Local mesh:Mesh = Mesh.Create(filename)
		
		'Add surfaces
		For Local s:Int = 0 Until NumSurfaces(meshPtr)
			Local surf:Surface = Surface.Create()
			
			Local mat:Material = surf.Material
			mat.BlendMode = MaterialBlend(meshPtr, s)
			mat.DiffuseTexture = Cache.GetTexture(MaterialTextureName(meshPtr, s))
			mat.DiffuseRed = MaterialRed(meshPtr, s)
			mat.DiffuseGreen = MaterialGreen(meshPtr, s)
			mat.DiffuseBlue = MaterialBlue(meshPtr, s)
			mat.Opacity = MaterialOpacity(meshPtr, s)
			
			For Local i:Int = 0 Until NumIndices(meshPtr, s) Step 3
				surf.AddTriangle(GetIndex(meshPtr, s, i), GetIndex(meshPtr, s, i+1), GetIndex(meshPtr, s, i+2))
			Next
			For Local v:Int = 0 Until NumVertices(meshPtr, s)
				surf.AddVertex(VertexX(meshPtr, s, v), VertexY(meshPtr, s, v), VertexZ(meshPtr, s, v), VertexNX(meshPtr, s, v), VertexNY(meshPtr, s, v), VertexNZ(meshPtr, s, v), 1, 1, 1, 1, VertexU0(meshPtr, s, v), VertexV0(meshPtr, s, v))
				surf.SetVertexBone(v, 0, VertexBone(meshPtr, s, v, 0), VertexWeight(meshPtr, s, v, 0))
				surf.SetVertexBone(v, 1, VertexBone(meshPtr, s, v, 1), VertexWeight(meshPtr, s, v, 1))
				surf.SetVertexBone(v, 2, VertexBone(meshPtr, s, v, 2), VertexWeight(meshPtr, s, v, 2))
				surf.SetVertexBone(v, 3, VertexBone(meshPtr, s, v, 3), VertexWeight(meshPtr, s, v, 3))
			Next
			
			mesh.AddSurface(surf)
		Next
		
		'Set last frame
		mesh.LastFrame = NumFrames(meshPtr)
		
		'Add bones
		For Local b:Int = 0 Until NumBones(meshPtr)
			Local bone:Bone = Bone.Create(BoneName(meshPtr, b), BoneParentIndex(meshPtr, b))
			Local s:String = ""
			For Local m:Int = 0 Until 16
				bone.InversePoseMatrix.M[m] = BoneInvPoseMatrixElem(meshPtr, b, m)
			Next
			For Local p:Int = 0 Until BoneNumPositionKeys(meshPtr, b)
				bone.AddPositionKey(BonePositionKeyFrame(meshPtr, b, p), BonePositionKeyX(meshPtr, b, p), BonePositionKeyY(meshPtr, b, p), BonePositionKeyZ(meshPtr, b, p))
			Next
			For Local r:Int = 0 Until BoneNumRotationKeys(meshPtr, b)
				bone.AddRotationKey(BoneRotationKeyFrame(meshPtr, b, r), BoneRotationKeyW(meshPtr, b, r), BoneRotationKeyX(meshPtr, b, r), BoneRotationKeyY(meshPtr, b, r), BoneRotationKeyZ(meshPtr, b, r))
			Next
			For Local s:Int = 0 Until BoneNumScaleKeys(meshPtr, b)
				bone.AddScaleKey(BoneScaleKeyFrame(meshPtr, b, s), BoneScaleKeyX(meshPtr, b, s), BoneScaleKeyY(meshPtr, b, s), BoneScaleKeyZ(meshPtr, b, s))
			Next
			mesh.AddBone(bone)
		End
		
		DeleteMesh(meshPtr)
		Return mesh
	End
End