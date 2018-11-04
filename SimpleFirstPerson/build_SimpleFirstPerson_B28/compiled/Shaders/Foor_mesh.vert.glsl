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
in vec3 nor;
out vec3 wnormal;
out vec4 wvpposition;
out vec4 prevwvpposition;
uniform mat3 N;
uniform mat4 WVP;
uniform mat4 prevWVP;
void main() {
    vec4 spos = vec4(pos, 1.0);
	wnormal = normalize(N * nor);
	gl_Position = WVP * spos;
	wvpposition = gl_Position;
	prevwvpposition = prevWVP * spos;
}
