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
in vec3 pos;
uniform mat4 LWVP;
void main() {
vec4 spos = vec4(pos, 1.0);
	gl_Position = LWVP * spos;
}
