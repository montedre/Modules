#version 450
#define _Irr
#define _EnvCol
#define _Deferred
#define _CSM
#define _RTGI
#define _VoxelCones5
#define _VoxelAOvar
#define _IndPos
#define _SMAA
#define _Veloc
#define _SSAO
#define _gbuffer2
#include "compiled.inc"
in vec3 pos;
in vec3 nor;
out vec3 voxpositionGeom;
uniform mat4 W;
void main() {
	voxpositionGeom = vec3(W * vec4(pos, 1.0)) / voxelgiHalfExtents;
}
